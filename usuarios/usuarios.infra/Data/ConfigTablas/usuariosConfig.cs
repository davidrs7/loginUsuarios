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
    internal class usuariosConfig : IEntityTypeConfiguration<Usuario>
    {
        void IEntityTypeConfiguration<Usuario>.Configure(EntityTypeBuilder<Usuario> entity)
        {

            entity.ToTable("Usuarios");

            entity.HasIndex(e => e.CargoId, "CargoID");

            entity.HasIndex(e => e.EmpresaId, "EmpresaID");

            entity.HasIndex(e => e.JefeId, "JefeId");

            entity.HasIndex(e => e.RolId, "RolID");

            entity.HasIndex(e => e.SexoId, "SexoId");

            entity.HasIndex(e => e.TipoDocumento, "TipoDocumento");

            entity.Property(e => e.UsuarioId).HasColumnName("UsuarioID");

            entity.Property(e => e.CargoId).HasColumnName("CargoID");

            entity.Property(e => e.Contraseña).HasMaxLength(255);

            entity.Property(e => e.CorreoElectronico).HasMaxLength(100);

            entity.Property(e => e.Direccion).HasMaxLength(100);

            entity.Property(e => e.EmpresaId).HasColumnName("EmpresaID");

            entity.Property(e => e.Estado)
                .IsRequired()
                .HasDefaultValueSql("'1'");

            entity.Property(e => e.FechaCreacion).HasColumnType("datetime");

            entity.Property(e => e.FechaNacimiento).HasColumnType("datetime");

            entity.Property(e => e.Nombre).HasMaxLength(100);

            entity.Property(e => e.NumDocumento).HasMaxLength(50);

            entity.Property(e => e.RolId).HasColumnName("RolID");

            entity.Property(e => e.Telefono).HasMaxLength(20);

            entity.HasOne(d => d.Cargo)
                .WithMany(p => p.Usuarios)
                .HasForeignKey(d => d.CargoId)
                .HasConstraintName("usuarios_ibfk_2");

            entity.HasOne(d => d.Empresa)
                .WithMany(p => p.Usuarios)
                .HasForeignKey(d => d.EmpresaId)
                .HasConstraintName("usuarios_ibfk_3");

            entity.HasOne(d => d.Jefe)
                .WithMany(p => p.InverseJefe)
                .HasForeignKey(d => d.JefeId)
                .HasConstraintName("usuarios_ibfk_4");

            entity.HasOne(d => d.Rol)
                .WithMany(p => p.Usuarios)
                .HasForeignKey(d => d.RolId)
                .HasConstraintName("usuarios_ibfk_1");

            entity.HasOne(d => d.Sexo)
                .WithMany(p => p.Usuarios)
                .HasForeignKey(d => d.SexoId)
                .HasConstraintName("usuarios_ibfk_5");

            entity.HasOne(d => d.TipoDocumentoNavigation)
                .WithMany(p => p.Usuarios)
                .HasForeignKey(d => d.TipoDocumento)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("usuarios_ibfk_6");

            entity.HasMany(d => d.Permisos)
                .WithMany(p => p.Usuarios)
                .UsingEntity<Dictionary<string, object>>(
                    "Usuariospermiso",
                    l => l.HasOne<Permiso>().WithMany().HasForeignKey("PermisoId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("usuariospermisos_ibfk_2"),
                    r => r.HasOne<Usuario>().WithMany().HasForeignKey("UsuarioId").HasConstraintName("usuariospermisos_ibfk_1"),
                    j =>
                    {
                        j.HasKey("UsuarioId", "PermisoId").HasName("PRIMARY").HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

                        j.ToTable("usuariospermisos");

                        j.HasIndex(new[] { "PermisoId" }, "PermisoID");

                        j.IndexerProperty<int>("UsuarioId").HasColumnName("UsuarioID");

                        j.IndexerProperty<int>("PermisoId").HasColumnName("PermisoID");
                    });

        }
    }
}