using System;
using System.Collections.Generic;

namespace usuarios.infra.Data.Modelos
{
    public partial class Permiso
    {
        public Permiso()
        {
            Rols = new HashSet<Role>();
            Usuarios = new HashSet<Usuario>();
        }

        public int PermisoId { get; set; }
        public string Nombre { get; set; } = null!;
        public string? Descripcion { get; set; }
        public string? RutaAngular { get; set; }
        public bool? Estado { get; set; }

        public virtual ICollection<Role> Rols { get; set; }
        public virtual ICollection<Usuario> Usuarios { get; set; }
    }
}
