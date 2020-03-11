using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineEntidades
{
    public class EncaPedido
    {
        public int id { set; get; }
        public Cliente cliente{ set; get; }
        public int total { set; get; }
        public DetPedido detPedido { set; get; }

        public EncaPedido()
        {
            detPedido = new DetPedido();
            cliente = new Cliente();
        }
    }
}
