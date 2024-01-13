using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace usuarios.core
{
    public class ApiResponse<TData>
    {
        public Estado Estado { get; set; }
        public TData Data { get; set; }
    }

    public class Estado
    {
        public string Codigo { get; set; }
        public string Mensaje { get; set; }
        public string Descripcion { get; set; }
    }
}
