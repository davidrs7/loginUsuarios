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
    internal class JerarquiaConfig : IEntityTypeConfiguration<Jerarquia>
    {
        void IEntityTypeConfiguration<Jerarquia>.Configure(EntityTypeBuilder<Jerarquia> entity)
        {

            entity.ToTable("jerarquias");

            entity.HasIndex(e => e.JefeId, "JefeID");

            entity.HasIndex(e => e.SubordinadoId, "SubordinadoID");

            entity.Property(e => e.JerarquiaId).HasColumnName("JerarquiaID");

            entity.Property(e => e.JefeId).HasColumnName("JefeID");

            entity.Property(e => e.SubordinadoId).HasColumnName("SubordinadoID");

            entity.HasOne(d => d.Jefe)
                .WithMany(p => p.JerarquiaJeves)
                .HasForeignKey(d => d.JefeId)
                .HasConstraintName("jerarquias_ibfk_1");

            entity.HasOne(d => d.Subordinado)
                .WithMany(p => p.JerarquiaSubordinados)
                .HasForeignKey(d => d.SubordinadoId)
                .HasConstraintName("jerarquias_ibfk_2");
        }
    }
}
