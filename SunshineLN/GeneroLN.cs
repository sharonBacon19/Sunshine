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
    public class GeneroLN
    {
        public static List<Genero> ObtenerTodos()
        {
            List<Genero> lista = new List<Genero>();
            DataSet ds = GeneroDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Genero registro = new Genero();
                registro.id = Convert.ToInt16(fila["ID"]);
                registro.nombre = Convert.ToString(fila["NOMBRE"]);
                registro.estado = Convert.ToByte(fila["ESTADO"]);

                lista.Add(registro);
            }
            return lista;
        }

        public static Genero Obtener(int idGenero)
        {
            List<Genero> lista = new List<Genero>();
            lista = GeneroLN.ObtenerTodos();
            Genero ge = new Genero();
            ge = (lista.Find(elemento => elemento.id == idGenero));
            return ge;
        }
    }
}
