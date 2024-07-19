using System;
using System.Collections.Generic;

namespace usuarios.infra.Data.Modelos
{
    public partial class Role
    {
        public Role()
        {
            Usuarios = new HashSet<Usuario>();
            Permisos = new HashSet<Permiso>();
        }

        public int RolId { get; set; }
        public string Nombre { get; set; } = null!;
        public string? Descripcion { get; set; }

        public int? ColorId { get; set; }

        public int? EmpresaId { get; set; }
        public bool? Estado { get; set; }

        public virtual Empresa? Empresa { get; set; }
        public virtual ICollection<Usuario> Usuarios { get; set; }

        public virtual ICollection<Permiso> Permisos { get; set; }
    }
}
