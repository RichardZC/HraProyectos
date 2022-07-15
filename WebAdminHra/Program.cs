using Dominio;
using WebAdminHra.Middleware;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddSqlServer<HRAContext>(builder.Configuration.GetConnectionString("DefaultConnection"));
builder.Services.AddAuthentication("Hra").AddCookie("Hra", config =>
{
    config.Cookie.Name = "Hra";
    config.LoginPath = "/Seguridad";
    config.AccessDeniedPath = "/Home";
    config.ExpireTimeSpan = TimeSpan.FromHours(8);
});
builder.Services.AddHttpContextAccessor();
builder.Services.AddSession(options=> {
    options.IdleTimeout = TimeSpan.FromHours(8);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();


app.UseRouting();
app.UseSession();
app.UseAuthentication();
app.UseAuthorization();

app.UseMiddleware<SolicitudMiddleware>();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
