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
    internal class AccionesObjetivosConfig : IEntityTypeConfiguration<AccionObjetivo>
    {
        void IEntityTypeConfiguration<AccionObjetivo>.Configure(EntityTypeBuilder<AccionObjetivo> entity)
        {
            entity.ToTable("accionesobjetivos");
            entity.HasKey(e => e.Id);
            entity.Property(e => e.IdObjetivo).HasColumnName("IdObjetivo");
            entity.Property(e => e.IdUsuario).HasColumnName("IdUsuario");
            entity.Property(e => e.Descripcion).HasMaxLength(255);
            entity.Property(e => e.Calificacion).HasColumnName("Calificacion");
            entity.Property(e => e.Evidencia).HasMaxLength(255);
            entity.Property(e => e.IdEstado).HasColumnName("IdEstado");
            entity.Property(e => e.Comentarios).HasMaxLength(900);
            entity.Property(e => e.FechaAccion).HasColumnType("datetime"); 
        }
    }
}
