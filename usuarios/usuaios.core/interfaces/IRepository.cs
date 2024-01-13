using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks; 

namespace usuarios.core.interfaces
{
    public interface IRepository<T>
    {
        int ObtenerUsuariosPorLogin(T entity);
        Task<ApiResponse<IEnumerable<T>>> GetAll();
        Task<ApiResponse<T>> GetById(int id);
        Task<ApiResponse<string>> Create(T entity, string password);
        Task<ApiResponse<string>> Update(int id, T entity);
        Task<ApiResponse<string>> Delete(int id);
    }
}
