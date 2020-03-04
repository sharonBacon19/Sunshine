using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineEntidades
{
    public class ClienteNivel
    {
        public int id { set; get; }
        public Cliente cliente{ set; get; }
        public int montoActual { set; get; }
        public Nivel nivel { set; get; }

        public ClienteNivel()
        {
            cliente = new Cliente();
            nivel = new Nivel();
        }
    }
}
