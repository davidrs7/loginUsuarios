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
    internal class EstadoAccionConfig : IEntityTypeConfiguration<EstadoAccion>
    {
        void IEntityTypeConfiguration<EstadoAccion>.Configure(EntityTypeBuilder<EstadoAccion> entity)
        {
            entity.ToTable("estadosacciones");
            entity.HasKey(e => e.Id);
            entity.Property(e => e.Estado); 
        }
    }
}
