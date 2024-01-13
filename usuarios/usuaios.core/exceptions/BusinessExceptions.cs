using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace usuarios.core.exceptions
{
    public class BusinessExceptions : Exception
    {
        public BusinessExceptions()
        {

        }
        public BusinessExceptions(string message) : base(message)
        {

        }
    }
}
