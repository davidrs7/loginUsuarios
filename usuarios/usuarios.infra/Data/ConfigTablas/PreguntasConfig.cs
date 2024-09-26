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
    internal class PreguntasConfig : IEntityTypeConfiguration<preguntas>
    {
        void IEntityTypeConfiguration<preguntas>.Configure(EntityTypeBuilder<preguntas> entity)
        {
            entity.ToTable("preguntas");
            entity.HasKey(e => e.id);
            entity.Property(e => e.pregunta).HasColumnName("pregunta");
            entity.Property(e => e.idcompetencia).HasColumnName("idcompetencia");
            entity.Property(e => e.estado).HasColumnName("estado");
            entity.Property(e => e.fecha_inicio).HasColumnType("datetime");
            entity.Property(e => e.fecha_fin).HasColumnType("datetime"); 
        }
    }
}
