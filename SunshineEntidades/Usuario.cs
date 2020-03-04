using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineEntidades
{
    public class Usuario
    {
        public int id { set; get; }
        public string email { set; get; }
        public string contrasenna { set; get; }
        public string tipoUsuario { set; get; }
        public string nombreUsuario { set; get; }
        public bool estado { set; get; }
        public Usuario()
        {

        }
    }
}
