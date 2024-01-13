using System;
using System.Collections.Generic;

namespace usuarios.infra.Data.Modelos
{
    public partial class Empresa
    {
        public Empresa()
        {
            Cargos = new HashSet<Cargo>();
            Roles = new HashSet<Role>();
            Usuarios = new HashSet<Usuario>();
        }

        public int EmpresaId { get; set; }
        public string Nombre { get; set; } = null!;
        public bool? Estado { get; set; }

        public virtual ICollection<Cargo> Cargos { get; set; }
        public virtual ICollection<Role> Roles { get; set; }
        public virtual ICollection<Usuario> Usuarios { get; set; }
    }
}
