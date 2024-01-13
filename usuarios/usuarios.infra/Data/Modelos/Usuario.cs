using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace usuarios.infra.Data.Modelos
{
    public partial class Usuario
    {
        public Usuario()
        {
            InverseJefe = new HashSet<Usuario>();
            JerarquiaJeves = new HashSet<Jerarquia>();
            JerarquiaSubordinados = new HashSet<Jerarquia>();
            Sesiones = new HashSet<Sesione>();
            Permisos = new HashSet<Permiso>();
        }

        public int UsuarioId { get; set; }
        public string Nombre { get; set; } = null!;
        public int TipoDocumento { get; set; }
        public string NumDocumento { get; set; } = null!;
        public string CorreoElectronico { get; set; } = null!;
        public string Contraseña { get; set; } = null!;
        public string Telefono { get; set; } = null!;
        public string Direccion { get; set; } = null!;
        public DateTime FechaNacimiento { get; set; }
        public DateTime FechaCreacion { get; set; }
        public int? SexoId { get; set; }
        public int? JefeId { get; set; }
        public int? RolId { get; set; }
        public int? CargoId { get; set; }
        public int? EmpresaId { get; set; }
        public int? UsuarioIdOpcional { get; set; }
        public bool? Estado { get; set; }

        public virtual Cargo? Cargo { get; set; }
        public virtual Empresa? Empresa { get; set; }
        [JsonIgnore]

        public virtual Usuario? Jefe { get; set; }
        public virtual Role? Rol { get; set; }
        public virtual Sexo? Sexo { get; set; }
        public virtual Tiposdocumento TipoDocumentoNavigation { get; set; } = null!;
        [JsonIgnore]
        public virtual ICollection<Usuario> InverseJefe { get; set; }
        public virtual ICollection<Jerarquia> JerarquiaJeves { get; set; }
        public virtual ICollection<Jerarquia> JerarquiaSubordinados { get; set; }
        public virtual ICollection<Sesione> Sesiones { get; set; }

        public virtual ICollection<Permiso> Permisos { get; set; }
    }
}
