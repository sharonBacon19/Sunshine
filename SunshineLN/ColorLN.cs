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
    public class ColorLN
    {
           public static List<Color> ObtenerTodos()
            {
                List<Color> lista = new List<Color>();
                DataSet ds = ColorDatos.SeleccionarTodos();

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    Color registro = new Color();
                    registro.id = Convert.ToInt16(fila["ID"]);
                    registro.tipoColor = Convert.ToString(fila["TIPOCOLOR"]);
                    registro.estado = Convert.ToInt16(fila["ESATDO"]);
                    lista.Add(registro);
                }
                return lista;
            }

            public static Color Obtener(int idColor)
            {
                List<Color> lista = new List<Color>();
                lista = ColorLN.ObtenerTodos();
                Color tP = new Color();
                tP = (lista.Find(elemento => elemento.id == idColor));
                return tP;
            }
        }
}
