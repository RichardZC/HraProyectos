using Dominio;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAdminHra.Dto;
using System.Linq.Dynamic.Core;

namespace WebAdminHra.Controllers
{
    public class UsuarioController : Controller
    {
        private readonly HRAContext context;
        public UsuarioController(HRAContext context)
        {
            this.context = context;
        }
        public async Task<IActionResult> Index(string buscar = "")
        {
            IQueryable<Usuario> qry = context.Usuario.Include(x => x.Persona);
            if (!string.IsNullOrWhiteSpace(buscar))
                qry = qry.Where(x => x.Persona.NombreCompleto.Contains(buscar));

            var usuarios = await qry.ToListAsync();

            return View(usuarios);
        }
        [HttpPost]
        public async Task<JsonResult> ListaUsuarios()
        {
            int NroPeticion = Convert.ToInt32(Request.Form["draw"].FirstOrDefault() ?? "0");
            int CantidadRegistros = Convert.ToInt32(Request.Form["length"].FirstOrDefault() ?? "0");
            int OmitirRegistros = Convert.ToInt32(Request.Form["start"].FirstOrDefault() ?? "0");
            string ValorBuscado = Request.Form["search[value]"].FirstOrDefault() ?? "";
            var sortColumn = Request.Form["columns[" + Request.Form["order[0][column]"].FirstOrDefault() + "][name]"].FirstOrDefault();
            var sortColumnDirection = Request.Form["order[0][dir]"].FirstOrDefault();

            IQueryable<Usuario> qry = context.Usuario.Include(x => x.Persona);
            int TotalRegistros = qry.Count();

            if (!string.IsNullOrEmpty(sortColumn) && !string.IsNullOrEmpty(sortColumnDirection))
                qry = qry.OrderBy(sortColumn + " " + sortColumnDirection);
            if (!string.IsNullOrEmpty(ValorBuscado))
                qry = qry.Where(x => string.Concat(x.Nombre, x.Persona.NombreCompleto).Contains(ValorBuscado));
            
            int TotalRegistrosFiltrados = qry.Count();
            var lista = await qry.Skip(OmitirRegistros).Take(CantidadRegistros).ToListAsync();
                        
            return Json(new
            {
                draw = NroPeticion,
                recordsTotal = TotalRegistros,
                recordsFiltered = TotalRegistrosFiltrados,
                data = lista.Select(x => new
                {
                    UsuarioId = x.UsuarioId,
                    Usuario = x.Nombre,
                    NombreCompleto = x.Persona.NombreCompleto,
                    Dni = x.Persona.NumeroDocumento,
                    Celular = x.Persona.Celular,
                    Estado = x.Estado ? "ACTIVO" : "INACTIVO"
                })
            });

            //var usuarios = await context.Usuario.Include(x => x.Persona).ToListAsync();
            //return Json(new
            //{
            //    data = usuarios.Select(x => new
            //    {
            //        UsuarioId = x.UsuarioId,
            //        Usuario = x.Nombre,
            //        NombreCompleto= x.Persona.NombreCompleto,
            //        Dni = x.Persona.NumeroDocumento,
            //        Celular = x.Persona.Celular,
            //        Estado = x.Estado?"ACTIVO":"INACTIVO"
            //    })
            //});
        }
        public async Task<IActionResult> Crear(int id = 0)
        {
            var obj = new Usuario() { UsuarioId = 0, Estado = true, Persona = new Persona() };
            var roles = new List<Models.ItemCheckBox>();
            if (id > 0)
            {
                obj = await context.Usuario.Include(x => x.Persona).FirstOrDefaultAsync(x => x.UsuarioId == id);

                var rolesSeleccionados = await context.UsuarioRol.Where(x => x.UsuarioId == id).ToListAsync();

                var rolesbd = await context.Rol.ToListAsync();

                roles = rolesbd.Select(x => new Models.ItemCheckBox
                {
                    Id = x.RolId,
                    Denominacion = x.Denominacion,
                    EsSeleccionado = rolesSeleccionados.Any(y => y.RolId == x.RolId)
                }).ToList();
            }

            return View(new Dto.UsuarioCreacionDto
            {
                UsuarioId = obj.UsuarioId,
                NombreUsuario = obj.Nombre,
                Contraseña = Helper.Encriptar.DesencriptaMD5(obj.Clave),
                Paterno = obj.Persona.ApePaterno,
                Materno = obj.Persona.ApeMaterno,
                Nombres = obj.Persona.Nombre,
                Celular = obj.Persona.Celular,
                Dni = obj.Persona.NumeroDocumento,
                Sexo = obj.Persona.Sexo,
                Estado = obj.Estado,
                Roles = roles
            });
        }
        [HttpPost]
        public async Task<IActionResult> Guardar(UsuarioCreacionDto usuario)
        {
            var u = new Usuario() { Persona = new Persona() { Activo = true } };

            if (usuario.UsuarioId > 0)
            {
                u = await context.Usuario.Include(x => x.Persona).FirstOrDefaultAsync(x => x.UsuarioId == usuario.UsuarioId);
            }

            u.Nombre = usuario.NombreUsuario.ToUpper();
            u.Clave = Helper.Encriptar.EncriptaMD5(usuario.Contraseña);
            u.Estado = usuario.Estado;

            u.Persona.ApePaterno = usuario.Paterno.ToUpper();
            u.Persona.ApeMaterno = usuario.Materno.ToUpper();
            u.Persona.Nombre = usuario.Nombres.ToUpper();
            u.Persona.NombreCompleto = u.Persona.ApePaterno + " " + u.Persona.ApeMaterno + " " + u.Persona.Nombre;
            u.Persona.Celular = usuario.Celular;
            u.Persona.Sexo = usuario.Sexo;
            u.Persona.NumeroDocumento = usuario.Dni;

            if (usuario.UsuarioId == 0)
                context.Usuario.Add(u);
            else
                context.Usuario.Update(u);

            await context.SaveChangesAsync();

            return RedirectToAction("Index");
        }

        [HttpPost]
        public async Task<IActionResult> GuardarRol(int UsuarioId, List<Models.ItemCheckBox> roles)
        {
            //elimina roles
            var rol = await context.UsuarioRol.Where(x => x.UsuarioId == UsuarioId).ToListAsync();
            context.UsuarioRol.RemoveRange(rol);
            await context.SaveChangesAsync();

            // crea roles
            var r = roles.Where(x => x.EsSeleccionado)
                        .Select(x => new UsuarioRol() { UsuarioId = UsuarioId, RolId = x.Id });
            context.UsuarioRol.AddRange(r);
            await context.SaveChangesAsync();

            return RedirectToAction("Index");
        }
    }
}
