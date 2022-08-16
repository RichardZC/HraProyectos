using System;
using System.Collections.Generic;
using System.Text;
using Empresa.Ecommerce.Domain.Entity;
using System.Threading.Tasks;

namespace Empresa.Ecommerce.Domain.Interface
{
    public interface ICustomersDomain
    {

        #region Métodos Asíncronos
        Task<bool> InsertAsync(Customers customer);
        Task<bool> UpdateAsync(Customers customer);
        Task<bool> DeleteAsync(string customerId);

        Task<Customers> GetAsync(string customerId);
        Task<IEnumerable<Customers>> GetAllAsync();
        #endregion
    }
}
