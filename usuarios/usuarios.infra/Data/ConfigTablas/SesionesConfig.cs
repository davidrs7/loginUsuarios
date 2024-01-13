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
    internal class SesionesConfig : IEntityTypeConfiguration<Sesione>
    {
        void IEntityTypeConfiguration<Sesione>.Configure(EntityTypeBuilder<Sesione> entity)
        {
            entity.HasKey(e => e.SesionId)
                .HasName("PRIMARY");

            entity.ToTable("sesiones");

            entity.HasIndex(e => e.UsuarioId, "UsuarioID");

            entity.Property(e => e.SesionId).HasColumnName("SesionID");

            entity.Property(e => e.Estado)
                .IsRequired()
                .HasDefaultValueSql("'1'");

            entity.Property(e => e.FechaFin).HasColumnType("datetime");

            entity.Property(e => e.FechaInicio).HasColumnType("datetime");

            entity.Property(e => e.Token).HasMaxLength(255);

            entity.Property(e => e.UsuarioId).HasColumnName("UsuarioID");

            entity.HasOne(d => d.Usuario)
                .WithMany(p => p.Sesiones)
                .HasForeignKey(d => d.UsuarioId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("sesiones_ibfk_1");

        }
    }
}
