using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace usuarios.infra.Data.Modelos
{
    public class AccionObjetivo
    {
        public int Id { get; set; }
        public int IdObjetivo { get; set; }
        public int IdUsuario { get; set; }
        public string Descripcion { get; set; }
        public int Calificacion { get; set; }
        public string Evidencia { get; set; }
        public int IdEstado { get; set; }
        public string Comentarios { get; set; }
        public DateTime FechaAccion { get; set; }
    }
}
