using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineEntidades
{
    public class ClienteCupon
    {
        public int id { set; get; }
        public Cliente cliente { set; get; }
        public Cupon cupon { set; get; }
        public int codigoQR { set; get; }

        public ClienteCupon()
        {
            cliente = new Cliente();
            cupon = new Cupon();
    }
}
