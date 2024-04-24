using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using usuarios.infra.Data.Modelos;

namespace usuarios.infra.Data.ConfigTablas
{
    internal class PermisoConfig : IEntityTypeConfiguration<Permiso>
    {
        void IEntityTypeConfiguration<Permiso>.Configure(EntityTypeBuilder<Permiso> entity)
        { 
                entity.ToTable("Permisos");

                entity.Property(e => e.PermisoId).HasColumnName("PermisoID");

                entity.Property(e => e.Descripcion).HasMaxLength(255);

                entity.Property(e => e.Estado)
                    .IsRequired()
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.Nombre).HasMaxLength(50);

                entity.Property(e => e.RutaAngular).HasMaxLength(255); 
        }
    }
}
