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
    internal class respuestas_usuarioConfig : IEntityTypeConfiguration<respuestas_usuario>
    {
        void IEntityTypeConfiguration<respuestas_usuario>.Configure(EntityTypeBuilder<respuestas_usuario> entity)
        {
            entity.ToTable("Respuestas_Usuario");
            entity.HasKey(e => e.id);
            entity.Property(e => e.id_pregunta).HasColumnName("id_pregunta");
            entity.Property(e => e.id_respuesta).HasColumnName("id_respuesta");
            entity.Property(e => e.id_usuario_califica).HasColumnName("id_usuario_califica");
            entity.Property(e => e.id_usuario_calificado).HasColumnName("id_usuario_calificado");
            entity.Property(e => e.comentarios).HasColumnType("comentarios");
            entity.Property(e => e.fecha_accion).HasColumnType("datetime");
        }
    }
}
