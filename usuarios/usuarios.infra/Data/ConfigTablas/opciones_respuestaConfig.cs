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
    internal class opciones_respuestaConfig : IEntityTypeConfiguration<opciones_respuesta>
    {
        void IEntityTypeConfiguration<opciones_respuesta>.Configure(EntityTypeBuilder<opciones_respuesta> entity)
        {
            entity.ToTable("opciones_respuesta");
            entity.HasKey(e => e.id);
            entity.Property(e => e.id_pregunta).HasColumnName("id_pregunta");
            entity.Property(e => e.descripcion).HasColumnName("descripcion");
            entity.Property(e => e.estado).HasColumnType("estado");
            entity.Property(e => e.peso).HasColumnType("peso");
        }
    }
}
