using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace WebAdminHra.Controllers
{
    public class SesionController : Controller
    {
        public List<Dominio.usp_MenuLstResult> listaMenu()
        {
            var menu = JsonConvert.DeserializeObject<List<Dominio.usp_MenuLstResult>>(HttpContext.Session.GetString("Menu"));
            return menu;
        }
    }
}
