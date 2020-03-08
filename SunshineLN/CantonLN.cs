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
    public class CantonLN
    {
        public static List<Canton> ObtenerTodos()
        {
            List<Canton> lista = new List<Canton>();
            DataSet ds = CantonDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Canton registro = new Canton();
                registro.codCanton = Convert.ToInt16(fila["COD_CANTON"]);
                registro.provincia.codProvincia = Convert.ToInt16(fila["COD_PROVINCIA"]);
                registro.dscCanton = Convert.ToString(fila["DSC_CANTON"]);
                registro.logActivo = (float) Convert.ToDouble(fila["LOG_ACTIVO"]);
                
                lista.Add(registro);
            }
            return lista;
        }
        public static Canton Obtener(float idCanton, float idprovincia)
        {
            List<Canton> lista = new List<Canton>();
            lista = CantonLN.ObtenerTodos();
            Canton canton = new Canton();
            canton = (lista.Find(elemento => elemento.codCanton == idCanton && elemento.provincia.codProvincia == idprovincia));
            return canton;
        }

        public static List<Canton> CantonPorProvincia(float codProvincia)
        {
            List<Canton> lista = CantonLN.ObtenerTodos();
            List<Canton> canton = lista.Where(x => x.provincia.codProvincia == codProvincia).ToList();
            return canton;
        }
    }
}
