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
    internal class RolesConfig : IEntityTypeConfiguration<Role>
    {
        void IEntityTypeConfiguration<Role>.Configure(EntityTypeBuilder<Role> entity)
        {

            entity.HasKey(e => e.RolId)
                .HasName("PRIMARY");

            entity.ToTable("Roles");

            entity.HasIndex(e => e.EmpresaId, "EmpresaID");

            entity.Property(e => e.RolId).HasColumnName("RolID");
            entity.Property(e => e.ColorId).HasColumnName("ColorId");

            entity.Property(e => e.Descripcion).HasMaxLength(255);

            entity.Property(e => e.EmpresaId).HasColumnName("EmpresaID");

            entity.Property(e => e.Estado)
                .IsRequired()
                .HasDefaultValueSql("'1'");

            entity.Property(e => e.Nombre).HasMaxLength(50);

            entity.HasOne(d => d.Empresa)
                .WithMany(p => p.Roles)
                .HasForeignKey(d => d.EmpresaId)
                .HasConstraintName("roles_ibfk_1");

            entity.HasMany(d => d.Permisos)
                .WithMany(p => p.Rols)
                .UsingEntity<Dictionary<string, object>>(
                    "Rolespermiso",
                    l => l.HasOne<Permiso>().WithMany().HasForeignKey("PermisoId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("rolespermisos_ibfk_2"),
                    r => r.HasOne<Role>().WithMany().HasForeignKey("RolId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("rolespermisos_ibfk_1"),
                    j =>
                    {
                        j.HasKey("RolId", "PermisoId").HasName("PRIMARY").HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

                        j.ToTable("rolespermisos");

                        j.HasIndex(new[] { "PermisoId" }, "PermisoID");

                        j.IndexerProperty<int>("RolId").HasColumnName("RolID");

                        j.IndexerProperty<int>("PermisoId").HasColumnName("PermisoID");
                    });

        }
    }
}
