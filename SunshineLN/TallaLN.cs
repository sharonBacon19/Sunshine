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
    public class TallaLN
    {
            public static List<Talla> ObtenerTodos()
            {
                List<Talla> lista = new List<Talla>();
                DataSet ds = TallaDatos.SeleccionarTodos();

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    Talla registro = new Talla();
                    registro.id = Convert.ToInt16(fila["ID"]);
                    registro.tipoTalla = Convert.ToString(fila["TIPOTALLA"]);
                    registro.estado = Convert.ToInt16(fila["ESTADO"]);
                    lista.Add(registro);
                }
                return lista;
            }

            public static Talla Obtener(int idTalla)
            {
                List<Talla> lista = new List<Talla>();
                lista = TallaLN.ObtenerTodos();
                Talla tP = new Talla();
                tP = (lista.Find(elemento => elemento.id == idTalla));
                return tP;
            }
        }
}
