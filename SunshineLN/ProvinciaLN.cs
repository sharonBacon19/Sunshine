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
    public class ProvinciaLN
    {
        public static List<Provincia> ObtenerTodos()
        {
            List<Provincia> lista = new List<Provincia>();
            DataSet ds = ProvinciaDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Provincia registro = new Provincia();
                registro.codProvincia = Convert.ToInt16(fila["COD_PROVINCIA"]);
                registro.dscCortaProvincia = Convert.ToString(fila["DSC_CORTA_PROVINCIA"]);
                registro.dscProvincia = Convert.ToString(fila["DSC_PROVINCIA"]);
                registro.logActivo = Convert.ToByte(fila["LOG_ACTIVO"]);
                
                lista.Add(registro);
            }
            return lista;
        }

        public static Provincia Obtener(int idProvincia)
        {
            List<Provincia> lista = new List<Provincia>();
            lista = ProvinciaLN.ObtenerTodos();
            Provincia pro = new Provincia();
            pro = (lista.Find(elemento => elemento.codProvincia == idProvincia));
            return pro;
        }
    }
}
