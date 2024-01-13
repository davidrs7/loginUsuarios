using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace usuarios.infra.Data.Modelos
{
    public partial class Sesione
    {
        public int SesionId { get; set; }
        public int? UsuarioId { get; set; }
        public string Token { get; set; } = null!;
        public DateTime FechaInicio { get; set; }
        public DateTime? FechaFin { get; set; }
        public bool? Estado { get; set; }

        [JsonIgnore]
        public virtual Usuario? Usuario { get; set; }
    }
}
