using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using usuarios.infra.Data.Modelos;

namespace usuarios.infra.Data.ConfigTablas
{
    internal class ObjetivoConfig : IEntityTypeConfiguration<Objetivo>
    {
        void IEntityTypeConfiguration<Objetivo>.Configure(EntityTypeBuilder<Objetivo> entity)
        {
            entity.ToTable("Objetivos");
            entity.HasKey(o => o.Id);
            entity.Property(e => e.Titulo).HasMaxLength(255);
            entity.Property(e => e.IdUsuario).HasMaxLength(255);
            entity.Property(e => e.Descripcion).HasMaxLength(255);
            entity.Property(e => e.Peso).HasColumnName("Peso");
            entity.Property(e => e.FechaInicio).HasColumnType("datetime");
            entity.Property(e => e.FechaFin).HasColumnType("datetime");
            entity.Property(e => e.Estado).HasColumnName("Estado");

        }
    }
}
