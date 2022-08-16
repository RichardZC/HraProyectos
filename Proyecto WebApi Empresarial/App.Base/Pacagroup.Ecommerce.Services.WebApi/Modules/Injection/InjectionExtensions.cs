using Microsoft.Extensions.DependencyInjection;
using Empresa.Ecommerce.Transversal.Common;
using Empresa.Ecommerce.Infrastructure.Data;
using Empresa.Ecommerce.Infrastructure.Repository;
using Empresa.Ecommerce.Application.Interface;
using Empresa.Ecommerce.Application.Main;
using Empresa.Ecommerce.Domain.Interface;
using Empresa.Ecommerce.Domain.Core;
using Empresa.Ecommerce.Infrastructure.Interface;
using Empresa.Ecommerce.Transversal.Logging;
using Microsoft.Extensions.Configuration;

namespace Empresa.Ecommerce.Services.WebApi.Modules.Injection
{
    public static class InjectionExtensions
    {
        public static IServiceCollection AddInjection(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddSingleton<IConfiguration>(configuration);
            services.AddSingleton<IConnectionFactory, ConnectionFactory>();
            services.AddScoped<ICustomersApplication, CustomersApplication>();
            services.AddScoped<ICustomersDomain, CustomersDomain>();
            services.AddScoped<ICustomersRepository, CustomersRepository>();
            services.AddScoped<IUsersApplication, UsersApplication>();
            services.AddScoped<IUsersDomain, UsersDomain>();
            services.AddScoped<IUsersRepository, UsersRepository>();
            services.AddScoped(typeof(IAppLogger<>), typeof(LoggerAdapter<>));

            return services;
        }
    }
}
