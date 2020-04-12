using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineEntidades
{
    public class Canje
    {
        public int id { set; get; }
        public Cliente cliente { set; get; }
        public Cupon cupon { set; get; }
        public Producto producto { set; get; }

        public Canje()
        {
            cliente = new Cliente();
            cupon = new Cupon();
            producto = new Producto();
        }
    }
}
