using Dominio;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace WebAdminHra.Controllers
{
    public class UsuarioController : Controller
    {
        private readonly HRAContext context;
        public UsuarioController(HRAContext context)
        {
            this.context = context;
        }
        public async Task<IActionResult> Index()
        {
            var usuarios = await context.Usuario.Include(x => x.Persona).ToListAsync();

            return View(usuarios);
        }
        public async Task<IActionResult> Crear(int id = 0)
        {
            var obj = new Usuario();
            if (id > 0)
                obj = await context.Usuario.FindAsync(id);
            return View(obj);
        }

    }
}
