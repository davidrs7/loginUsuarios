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
    internal class EmpresasConfig : IEntityTypeConfiguration<Empresa>
    {
        void IEntityTypeConfiguration<Empresa>.Configure(EntityTypeBuilder<Empresa> entity) {

            entity.ToTable("Empresas");


            entity.Property(e => e.EmpresaId).HasColumnName("EmpresaID");

                entity.Property(e => e.Estado)
                    .IsRequired()
                    .HasDefaultValueSql("'1'");
                entity.Property(e => e.Nombre).HasMaxLength(100);         

        }
    }
}
