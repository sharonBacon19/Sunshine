using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineEntidades
{
    public class Direccion
    {
        public int id { set; get; }

        public Provincia provincia;
        public string otrassennas { set; get; }
        public string codigo_postal {set; get;}

        public Cliente cliente;
        public Direccion()
        {
            provincia = new Provincia();
            cliente = new Cliente();
        }
    }
}
