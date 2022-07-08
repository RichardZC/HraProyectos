using Dominio;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace WebAdminHra.Controllers
{
    public class SeguridadController : Controller
    {
        private readonly HRAContext context;
        public SeguridadController(HRAContext context)
        {
            this.context = context;
        }

        public IActionResult Index(string mensaje = "")
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.Mensaje = mensaje;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Autenticar(string pUsuario, string pClave)
        {
            bool permiso;
            permiso = await AutenticaUsuario(pUsuario, pClave);

            if (permiso)
            {
                List<Claim> claims = new()
                {
                    new Claim(ClaimTypes.NameIdentifier, 1.ToString())
                };
                var identity = new ClaimsIdentity(claims, "Hra");
                var userPrincipal = new ClaimsPrincipal(new[] { identity });

                await HttpContext.SignInAsync(userPrincipal);          

            }
            else
            {
                return RedirectToAction("Index", "Seguridad", new { mensaje = "Credenciales Incorrecta!" });
            }

            return RedirectToAction("Index", "Home");
        }
        private async Task<bool> AutenticaUsuario(String user, String pass)
        {
            pass = Helper.Encriptar.EncriptaMD5(pass);
            var res = await context.Usuario.CountAsync(x => x.Nombre == user && x.Clave == pass);
            return res > 0;

            
        }

        public async Task<IActionResult> Logout()
        {
            if (User.Identity.IsAuthenticated)
            {
                await HttpContext.SignOutAsync();
            }
            return RedirectToAction("Index", "Seguridad");
        }
    }
}
