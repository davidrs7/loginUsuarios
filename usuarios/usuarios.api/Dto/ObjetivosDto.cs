using System.ComponentModel.DataAnnotations;

namespace usuarios.api.Dto
{
    public class ObjetivosDto
    { 
        public int Id { get; set; }
         
        public string Titulo { get; set; }

        public string Descripcion { get; set; }
         
        public double Peso { get; set; }
         
        public DateTime FechaInicio { get; set; }
         
        public DateTime FechaFin { get; set; }
         
        public bool Estado { get; set; }
    }
}
