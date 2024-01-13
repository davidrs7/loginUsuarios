using System;
using System.Collections.Generic;

namespace usuarios.infra.Data.Modelos
{
    public partial class Tiposdocumento
    {
        public Tiposdocumento()
        {
            Usuarios = new HashSet<Usuario>();
        }

        public int TipoDocumento { get; set; }
        public string Descripcion { get; set; } = null!;
        public bool? Estado { get; set; }

        public virtual ICollection<Usuario> Usuarios { get; set; }
    }
}
