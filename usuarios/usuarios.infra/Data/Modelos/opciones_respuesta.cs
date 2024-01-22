using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace usuarios.infra.Data.Modelos
{
    public class opciones_respuesta
    {
        public int id { get; set; }
        public int id_pregunta { get; set; }
        public string descripcion { get; set; }
        public bool estado { get; set; }
        public double peso { get; set; }
    }
}
