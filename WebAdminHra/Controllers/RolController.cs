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
            if (id > 0)
                obj = await context.Rol.FirstOrDefaultAsync(x => x.RolId == id);

            return View(obj);
        }
        [HttpPost]
        public async Task<IActionResult> Guardar(Rol rol)
        {

            if (rol.RolId == 0)
                context.Rol.Add(rol);
            else
                context.Rol.Update(rol);

            await context.SaveChangesAsync();

            return RedirectToAction("Index");
        }
    }
}
