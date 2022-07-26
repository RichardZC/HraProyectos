using AspNetCore.Reporting;
using Dominio;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using System.Net.Mime;
using WebAdminHra.Models;

namespace WebAdminHra.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly HRAContext context;
        private readonly IWebHostEnvironment webHostEnvironment;

        public HomeController(ILogger<HomeController> logger, HRAContext context, IWebHostEnvironment webHostEnvironment)
        {
            _logger = logger;
            this.context = context;
            this.webHostEnvironment = webHostEnvironment;
        }

        public IActionResult Index()
        {
            //var mensaje = Helper.Encriptar.EncriptaMD5("Clave123456");
            //var men2 = Helper.Encriptar.DesencriptaMD5(mensaje);
            return View();
        }

        public async Task<JsonResult> BuscarPersona(string term)
        {
            var qry = (from p in context.Persona
                       where p.Activo && (p.NombreCompleto.Contains(term) || p.NumeroDocumento.Contains(term))
                       orderby p.NombreCompleto
                       select new ItemAutocomplete
                       {
                           id = p.PersonaId,
                           value = p.NumeroDocumento + " " + p.NombreCompleto 
                       }).Take(10);

            return Json(await qry.ToListAsync());
        }
        public class ItemAutocomplete
        {
            public int id { get; set; }
            public string value { get; set; }
        }

        public async Task<IActionResult> ReportePersona()
        {
            System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);

            var lista = await context.Persona.Select(x => new Dto.ReportePersonaDto
            {
                PersonaId = x.PersonaId,
                NombreCompleto = x.NombreCompleto,
                Celular = x.Celular
            }).ToListAsync();

            var path = $"{this.webHostEnvironment.WebRootPath}\\Reportes\\rptPersona.rdlc"; 
            //var path = @"D:\temp\rptPersona.rdlc";
            LocalReport localReport = new LocalReport(path);
            localReport.AddDataSource("dsPersona", lista);

            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("Fecha", DateTime.Now.ToString());

            //var result = localReport.Execute(RenderType.Pdf, 1, parameters);
            //return File(result.MainStream, "application/pdf");

            var result = localReport.Execute(RenderType.Pdf, 1, parameters);
            return File(result.MainStream, MediaTypeNames.Application.Octet, "demo.pdf");

            //var result = localReport.Execute(RenderType.Excel, 1, parameters);
            //return File(result.MainStream, MediaTypeNames.Application.Octet, "demo.xls");

            //var result = localReport.Execute(RenderType.Word, 1, parameters);
            //return File(result.MainStream, MediaTypeNames.Application.Octet, "demo.doc");
        }
        public async Task<IActionResult> ReportePersona2()
        {
            System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);

            var lista = await context.Procedures.usp_ReportePersonaAsync();
            //var lista = await context.Persona.Select(x => new Dto.ReportePersonaDto
            //{
            //    PersonaId = x.PersonaId,
            //    NombreCompleto = x.NombreCompleto,
            //    Celular = x.Celular
            //}).ToListAsync();

            var path = $"{this.webHostEnvironment.WebRootPath}\\Reportes\\rptPersona.rdl";
            //var path = @"D:\temp\rptPersona.rdl";
            LocalReport localReport = new LocalReport(path);
            localReport.AddDataSource("dsPersona", lista);

            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("Fecha", DateTime.Now.ToString());

            var result = localReport.Execute(RenderType.Pdf, 1, parameters);
            return File(result.MainStream, "application/pdf");

            //var result = localReport.Execute(RenderType.Pdf, 1, parameters);
            //return File(result.MainStream, MediaTypeNames.Application.Octet, "demo.pdf");

            //var result = localReport.Execute(RenderType.Excel, 1, parameters);
            //return File(result.MainStream, MediaTypeNames.Application.Octet, "demo.xls");

            //var result = localReport.Execute(RenderType.Word, 1, parameters);
            //return File(result.MainStream, MediaTypeNames.Application.Octet, "demo.doc");


        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}