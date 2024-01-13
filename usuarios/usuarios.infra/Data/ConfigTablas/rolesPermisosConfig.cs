using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using usuarios.infra.Data.Modelos;

namespace usuarios.infra.Data.ConfigTablas
{
    internal class rolesPermisosConfig : IEntityTypeConfiguration<rolesPermisos>
    {
        void IEntityTypeConfiguration<rolesPermisos>.Configure(EntityTypeBuilder<rolesPermisos> entity)
        {
            entity.ToTable("RolesPermisos");
            entity.HasKey(e => e.rolPermisoId);
            entity.Property(e => e.RolID);
            entity.Property(e => e.PermisoID);
        }
    }
}
