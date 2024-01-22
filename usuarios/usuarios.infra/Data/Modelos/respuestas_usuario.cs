using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace usuarios.infra.Data.Modelos
{
    public class respuestas_usuario
    {
        public int id {  get; set; }
        public int id_pregunta {  get; set; }
        public int id_respuesta {  get; set; }
        public string comentarios {  get; set; } 
        public DateTime fecha_accion {  get; set; }
    }
}
