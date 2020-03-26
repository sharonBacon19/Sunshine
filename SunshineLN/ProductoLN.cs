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
    public class ProductoLN
    {
        public static List<Producto> ObtenerTodos(string idGenero, string idTipoPrenda)
        {
            List<Producto> lista = new List<Producto>();
            DataSet ds = ProductoDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                if(Convert.ToString(fila["IDGENERO"]).Equals(idGenero) || idGenero.Equals(""))
                {
                    if (Convert.ToString(fila["IDTIPOPRENDA"]).Equals(idTipoPrenda) || idTipoPrenda.Equals(""))
                    {
                        Producto registro = new Producto();
                        registro.id = Convert.ToInt16(fila["ID"]);
                        registro.nombre = Convert.ToString(fila["NOMBRE"]);
                        registro.descripcion = Convert.ToString(fila["DESCRIPCION"]);
                        registro.precio = Convert.ToInt32(fila["PRECIO"]);
                        registro.genero = GeneroLN.Obtener(Convert.ToInt16(fila["IDGENERO"]));
                        registro.tipoPrenda = TipoPrendaLN.Obtener(Convert.ToInt16(fila["IDTIPOPRENDA"]));
                        registro.imagen = Convert.ToString(fila["IMAGEN"]);

                        lista.Add(registro);
                    }
                }               
            }
            return lista;
        }

        public static Producto Obtener(int idProducto)
        {
            List<Producto> lista = new List<Producto>();
            lista = ProductoLN.ObtenerTodos("", "");
            Producto pro = new Producto();
            pro = (lista.Find(elemento => elemento.id == idProducto));
            return pro;
        }
    }
}
