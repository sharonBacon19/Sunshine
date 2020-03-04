using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineEntidades
{
    public class Canton
    {
        public Provincia provincia { set; get; }
        public float codCanton { set; get; }
        public string dscCanton{ set; get; }
        public float logActivo{ set; get; }

        public Canton()
        {
            provincia = new Provincia();
        }
}
}
