using System;
using System.Collections.Generic;

namespace usuarios.infra.Data.Modelos
{
    public partial class Jerarquia
    {
        public int JerarquiaId { get; set; }
        public int? JefeId { get; set; }
        public int? SubordinadoId { get; set; }

        public virtual Usuario? Jefe { get; set; }
        public virtual Usuario? Subordinado { get; set; }
    }
}
