using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineEntidades
{
    public class Cliente 
    {
        public string nombreCompleto { set; get; }
        public DateTime fechaNacimiento { set; get; }
        public string identificacion { set; get; }
        public string tarjetaCredito { set; get; }
        public Usuario usuario { set; get; }
        public TipoIdentificacion tipoIdentificacion { set; get; }


        public Cliente()
        {
            usuario = new Usuario();
            tipoIdentificacion = new TipoIdentificacion();
        }
    }
}
