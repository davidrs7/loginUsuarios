using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace usuarios.infra.Data.Modelos
{
    public class preguntas
    {
        public int id { get; set; }
        public int idcompetencia { get; set; }
        public string pregunta { get; set; }
        public bool estado { get; set; }
        public DateTime fecha_inicio { get; set; }
        public DateTime fecha_fin { get; set; }

    }
}
