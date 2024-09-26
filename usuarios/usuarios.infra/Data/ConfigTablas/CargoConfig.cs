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
    internal class CargoConfig : IEntityTypeConfiguration<Cargo>
    {
        void IEntityTypeConfiguration<Cargo>.Configure(EntityTypeBuilder<Cargo> entity)
        {
            entity.ToTable("cargos");
            entity.HasIndex(e => e.EmpresaId, "EmpresaID");

            entity.Property(e => e.CargoId).HasColumnName("CargoID");

            entity.Property(e => e.Descripcion).HasMaxLength(255);

            entity.Property(e => e.EmpresaId).HasColumnName("EmpresaID");

            entity.Property(e => e.Estado)
                .IsRequired()
                .HasDefaultValueSql("'1'");

            entity.Property(e => e.Nombre).HasMaxLength(50);

            entity.HasOne(d => d.Empresa)
                .WithMany(p => p.Cargos)
                .HasForeignKey(d => d.EmpresaId)
                .HasConstraintName("cargos_ibfk_1");
        }
    }
}
