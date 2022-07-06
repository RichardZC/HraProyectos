using Dominio;

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
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
