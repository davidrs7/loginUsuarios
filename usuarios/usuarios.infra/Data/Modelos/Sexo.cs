using System;
using System.Collections.Generic;

namespace usuarios.infra.Data.Modelos
{
    public partial class Sexo
    {
        public Sexo()
        {
            Usuarios = new HashSet<Usuario>();
        }

        public int SexoId { get; set; }
        public string Descripcion { get; set; } = null!;
        public bool? Estado { get; set; }

        public virtual ICollection<Usuario> Usuarios { get; set; }
    }
}
