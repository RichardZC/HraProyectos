using Empresa.Ecommerce.Application.DTO;
using Empresa.Ecommerce.Transversal.Common;

namespace Empresa.Ecommerce.Application.Interface
{
    public interface IUsersApplication
    {
        Response<UsersDto> Authenticate(string username, string password);
    }
}
