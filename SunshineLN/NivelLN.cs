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
    public class NivelLN
    {
        public static List<Nivel> ObtenerTodos()
        {
            List<Nivel> lista = new List<Nivel>();
            DataSet ds = NivelDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Nivel registro = new Nivel();
                registro.id = Convert.ToInt16(fila["ID"]);
                registro.nombre = Convert.ToString(fila["NOMBRE"]);
                registro.descripcion = Convert.ToString(fila["DESCRIPCION"]);
                registro.montoMeta = Convert.ToInt32(fila["MONTOMETA"]);
                registro.Imagen = Convert.ToString(fila["IMAGEN"]);

                lista.Add(registro);
            }
            return lista;
        }

        public static Nivel Obtener(int idNivel)
        {
            List<Nivel> lista = new List<Nivel>();
            lista = NivelLN.ObtenerTodos();
            Nivel ni = new Nivel();
            ni = (lista.Find(elemento => elemento.id == idNivel));
            return ni;
        }
    }
}
