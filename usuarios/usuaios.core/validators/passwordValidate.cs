using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace usuarios.core.validators
{
    [AttributeUsage(AttributeTargets.Property | AttributeTargets.Field | AttributeTargets.Parameter, AllowMultiple = false)]
    public class passwordValidate : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value == null)
            {
                return ValidationResult.Success;   
            }

            string password = value.ToString();
             
            if (password.Length < 5 || password.Length > 10)
            {
                return new ValidationResult("La longitud de la contraseña debe estar entre 5 y 10 caracteres");
            }
             
            return ValidationResult.Success;
        }

        public ApiResponse<string> GetApiResponse(ValidationResult validationResult)
        {
            return new ApiResponse<string>
            {
                Estado = new Estado { Codigo = "400", Mensaje = "Error de validación", Descripcion = validationResult.ErrorMessage },
                Data = null
            };
        }
    }
}
