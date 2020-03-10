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
    public class TipoIdentificacionLN
    {
        public static List<TipoIdentificacion> ObtenerTodos()
        {
            List<TipoIdentificacion> lista = new List<TipoIdentificacion>();
            DataSet ds = TipoIdentificacionDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                TipoIdentificacion registro = new TipoIdentificacion();
                registro.id = Convert.ToInt16(fila["ID"]);
                registro.tipo = Convert.ToString(fila["TIPO"]);
                registro.estado = Convert.ToInt16(fila["ESTADO"]);
                lista.Add(registro);
            }
            return lista;
        }

        public static TipoIdentificacion Obtener(int idTipoIdentificacion)
        {
            List<TipoIdentificacion> lista = new List<TipoIdentificacion>();
            lista = TipoIdentificacionLN.ObtenerTodos();
            TipoIdentificacion tP = new TipoIdentificacion();
            tP = (lista.Find(elemento => elemento.id == idTipoIdentificacion));
            return tP;
        }
    }
}
