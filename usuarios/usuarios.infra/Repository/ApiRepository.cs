using Microsoft.EntityFrameworkCore;
using Org.BouncyCastle.Crypto.Generators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using usuarios.core.interfaces;
using usuarios.core;
using usuarios.infra.Context;
using usuarios.infra.Data.Modelos;

namespace usuarios.infra.Repository
{
    public class ApiRepository<T> : IRepository<T> where T : class
    {
        private readonly login_tiinduxContext _context;

        public ApiRepository(login_tiinduxContext context)
        {
            _context = context;
        }


        public  int ObtenerUsuariosPorLogin(T entity)
        {
            int idusuario = 0;
            PropertyInfo userProperty = typeof(T).GetProperty("usuario");
            PropertyInfo passwordProperty = typeof(T).GetProperty("pw");

            string correo = (string)userProperty.GetValue(entity, null);

            var usuarios = _context.Usuarios
                                    .Where(x => x.CorreoElectronico == correo)
                                    .ToList();

            if (usuarios.Count() > 0)
            {
                string pwLogin = (string)passwordProperty.GetValue(entity, null);
                bool respuesta = BCrypt.Net.BCrypt.Verify(pwLogin, usuarios[0].Contraseña);

                if (respuesta)
                {
                    return usuarios[0].UsuarioId;
                }
            }

            // Retorna una lista vacía si no hay usuarios o si la autenticación falló
            return idusuario;
        }
        public async Task<ApiResponse<string>> Create(T entity, string password)
        {
            try
            {
                PropertyInfo passwordProperty = typeof(T).GetProperty("Contraseña");

                if (passwordProperty != null)
                {
                    string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password);
                    passwordProperty.SetValue(entity, hashedPassword);
                }

                _context.Set<T>().Add(entity);
                await _context.SaveChangesAsync();

                return new ApiResponse<string>
                {
                    Estado = new Estado { Codigo = "200", Mensaje = "OK", Descripcion = "Transacción exitosa" },
                    Data = "Registro creado exitosamente"
                };
            }
            catch (Exception ex)
            {
                return new ApiResponse<string>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        public async Task<ApiResponse<string>> Delete(int id)
        {
            try
            {
                var existingEntity = await _context.Set<T>().FindAsync(id);

                if (existingEntity == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "No encontrado", Descripcion = $"ID {id} no encontrado" },
                        Data = null
                    };
                }

                _context.Set<T>().Remove(existingEntity);
                await _context.SaveChangesAsync();

                return new ApiResponse<string>
                {
                    Estado = new Estado { Codigo = "200", Mensaje = "OK", Descripcion = "Transacción exitosa" },
                    Data = "Entidad eliminada exitosamente"
                };
            }
            catch (Exception ex)
            {
                return new ApiResponse<string>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }

        public async Task<ApiResponse<IEnumerable<T>>> GetAll()
        {
            try
            {
                var data = await _context.Set<T>().ToListAsync();
                return new ApiResponse<IEnumerable<T>>
                {
                    Estado = new Estado { Codigo = "200", Mensaje = "OK", Descripcion = "Transacción exitosa" },
                    Data = data
                };
            }
            catch (Exception ex)
            {
                return new ApiResponse<IEnumerable<T>>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.Message },
                    Data = null
                };
            }
        }

        public async Task<ApiResponse<T>> GetById(int id)
        {
            try
            {
                var data = await _context.Set<T>().FindAsync(id);
                return new ApiResponse<T>
                {
                    Estado = new Estado { Codigo = "200", Mensaje = "OK", Descripcion = "Transacción exitosa" },
                    Data = data
                };
            }
            catch (Exception ex)
            {
                return new ApiResponse<T>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.Message },
                    Data = null
                };
            }
        }

        public async Task<ApiResponse<string>> Update(int id, T entity)
        {
            try
            {

                //PropertyInfo passwordProperty = typeof(T).GetProperty("Contraseña");

                //if (passwordProperty != null)
                //{
                //    Object valorPw = passwordProperty.GetValue(entity);
                //    string hashedPassword = BCrypt.Net.BCrypt.HashPassword(valorPw.ToString());
                //    passwordProperty.SetValue(entity, hashedPassword);
                //}

                var existingEntity = await _context.Set<T>().FindAsync(id);


                if (existingEntity == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "No encontrado", Descripcion = $"ID {id} no encontrado" },
                        Data = null
                    };
                }

                _context.Entry(existingEntity).CurrentValues.SetValues(entity);
                await _context.SaveChangesAsync();

                return new ApiResponse<string>
                {
                    Estado = new Estado { Codigo = "200", Mensaje = "OK", Descripcion = "Transacción exitosa" },
                    Data = "Entidad actualizada exitosamente"
                };
            }
            catch (Exception ex)
            {
                return new ApiResponse<string>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


    }
}
