using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using usuarios.infra.Data.Modelos;

namespace usuarios.api.Dto
{
    public class AccionesObjetivosDto
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
