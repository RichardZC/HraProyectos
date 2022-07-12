using Dominio;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace WebAdminHra.Controllers
{
    public class RolController : Controller
    {
        private readonly HRAContext context;
        public RolController(HRAContext context)
        {
            this.context = context;
        }
        public async Task<IActionResult> Index(string buscar = "")
        {
            IQueryable<Rol> qry = context.Rol;
            if (!string.IsNullOrWhiteSpace(buscar))
                qry = qry.Where(x => x.Denominacion.Contains(buscar));

            var roles = await qry.ToListAsync();

            return View(roles);
        }
        public async Task<IActionResult> Crear(int id = 0)
        {
            var obj = new Rol() { Estado = true };
            var menus = new List<Models.ItemCheckBox>();

            if (id > 0) { 
                obj = await context.Rol.FirstOrDefaultAsync(x => x.RolId == id);
                var menusSeleccionados = await context.RolMenu.Where(x => x.RolId == id).ToListAsync();
                var menusbd = await context.Menu.Where(x => x.IndPadre == false).ToListAsync();

                menus = menusbd.Select(x => new Models.ItemCheckBox
                {
                    Id = x.MenuId,
                    Denominacion = x.Modulo + "/" + x.Denominacion,
                    EsSeleccionado = menusSeleccionados.Any(y => y.MenuId == x.MenuId)
                }).OrderBy(x => x.Denominacion).ToList();
            }

            return View(new Dto.RolCreacionDto
            {
                RolId = obj!.RolId,
                Denominacion = obj.Denominacion,
                Estado= obj.Estado,
                Menus= menus
            });
        }
        [HttpPost]
        public async Task<IActionResult> Guardar(Dto.RolCreacionDto rol)
        {

            if (rol.RolId == 0)
                context.Rol.Add(new Rol { Denominacion = rol.Denominacion, Estado = rol.Estado });
            else
                context.Rol.Update(new Rol { RolId = rol.RolId, Denominacion = rol.Denominacion, Estado = rol.Estado });

            await context.SaveChangesAsync();

            return RedirectToAction("Index");
        }
        [HttpPost]
        public async Task<IActionResult> GuardarMenu(int RolId, List<Models.ItemCheckBox> menus)
        {
            
            var rol = await context.RolMenu.Where(x => x.RolId == RolId).ToListAsync();
            context.RolMenu.RemoveRange(rol);
            await context.SaveChangesAsync();


            var r = menus.Where(x => x.EsSeleccionado)
                        .Select(x => new RolMenu() { RolId = RolId, MenuId = x.Id });
            context.RolMenu.AddRange(r);
            await context.SaveChangesAsync();

            return RedirectToAction("Index");
        }
    }
}
