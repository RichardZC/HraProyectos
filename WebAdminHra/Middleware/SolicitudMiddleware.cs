namespace WebAdminHra.Middleware
{
    public class SolicitudMiddleware
    {
        private readonly RequestDelegate _next;
        public SolicitudMiddleware(RequestDelegate next)
        {
            _next = next;
        }
        public async Task Invoke(HttpContext context) {

            var controller = context.Request.RouteValues["controller"] as string;
            var action = context.Request.RouteValues["action"] as string;

            if (controller == "Seguridad")
            {
                await _next(context);
                return;
            }
            string menujson = context.Session.GetString("Menu");
            if (menujson==null)
            {
                var url = context.Request.PathBase + "/Seguridad/Index";
                context.Response.Redirect(url,true);
                return;
            }
            await _next(context);
        }
    }
}
