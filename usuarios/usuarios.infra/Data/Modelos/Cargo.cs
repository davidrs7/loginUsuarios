using System;
using System.Collections.Generic;

namespace usuarios.infra.Data.Modelos
{
    public partial class Cargo
    {
        public Cargo()
        {
            Usuarios = new HashSet<Usuario>();
        }

        public int CargoId { get; set; }
        public string Nombre { get; set; } = null!;
        public string? Descripcion { get; set; }
        public int? EmpresaId { get; set; }
        public bool? Estado { get; set; }

        public virtual Empresa? Empresa { get; set; }
        public virtual ICollection<Usuario> Usuarios { get; set; }
    }
}
