using SunshineDatos;
using SunshineEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineLN
{
    public class TipoPrendaLN
    {
        public static List<TipoPrenda> ObtenerTodos()
        {
            List<TipoPrenda> lista = new List<TipoPrenda>();
            DataSet ds = TipoPrendaDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                TipoPrenda registro = new TipoPrenda();
                registro.id = Convert.ToInt16(fila["ID"]);
                registro.descripcion = Convert.ToString(fila["DESCRIPCION"]);
                registro.estado = Convert.ToInt16(fila["ESTADO"]);

                lista.Add(registro);
            }
            return lista;
        }

        public static TipoPrenda Obtener(int idTipoPrenda)
        {
            List<TipoPrenda> lista = new List<TipoPrenda>();
            lista = TipoPrendaLN.ObtenerTodos();
            TipoPrenda tP = new TipoPrenda();
            tP = (lista.Find(elemento => elemento.id == idTipoPrenda));
            return tP;
        }
    }
}
