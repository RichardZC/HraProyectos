using Dominio;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Transactions;
using WebAdminHra.Models;

namespace WebAdminHra.Controllers
{
    public class VentaController : Controller
    {
        private readonly HRAContext context;
        public VentaController(HRAContext context)
        {
            this.context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public JsonResult AutoCompleteProducto(string term)
        {

            List<ItemAutocomplete> autocomplete = new List<ItemAutocomplete>();
            autocomplete = context.PRODUCTO
                .Where(x => string.Concat(x.Codigo.ToUpper(), x.Descripcion.ToUpper()).Contains(term.ToUpper()))
                .Select(m => new ItemAutocomplete
                {
                    value = $"{m.Codigo} - {m.Descripcion}",
                    id = m.IdProducto
                }
                ).ToList();

            return Json(autocomplete);
        }

        [HttpGet]
        public async Task<JsonResult> ObtenerProducto(int idproducto)
        {
            var oProducto = await context.PRODUCTO.FirstOrDefaultAsync(x => x.IdProducto == idproducto);
            return Json(oProducto);
        }

        [HttpPost]
        public async Task<JsonResult> RegistrarVenta([FromBody] VENTA body)
        {
            string rpta = String.Empty;
            try
            {
                body.FechaRegistro = DateTime.Now;

                //using (var transaction = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
                //{
                //    context.VENTA.Add(body);
                //    await context.SaveChangesAsync();

                //    foreach (var item in collection)
                //    {
                //        context.DETALLE_VENTA.Add(body);
                //        await context.SaveChangesAsync();
                //    }

                //    transaction.Complete();
                //}

                context.VENTA.Add(body);
                await context.SaveChangesAsync();

                //using (var transaction = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
                //{
                //    // transaccion 1
                //    context.VENTA.Add(body);
                //    await context.SaveChangesAsync();

                //    // se va luz// excepcion

                //    //transaccion 2
                //    context.CATEGORIA.Add(new CATEGORIA { Descripcion = "Nueva categoria", FechaRegistro = DateTime.Now });
                //    await context.SaveChangesAsync();

                //    transaction.Complete();
                //}

            }
            catch (Exception ex)
            {
                rpta = ex.Message;
            }

            return Json(new { respuesta = rpta });
        }

    }
}
