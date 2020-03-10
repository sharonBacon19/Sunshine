using SunshineEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineDatos
{
    public class DireccionDatos
    {
        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListaDireccion");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "direccion");
            return ds;
        }

        public static void Insertar(Direccion direccion)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("Insertar_Direccion");
            comando.CommandType = CommandType.StoredProcedure;
            //Parámetros
            comando.Parameters.AddWithValue("@COD_PROVINCIA", direccion.provincia.codProvincia);
            comando.Parameters.AddWithValue("@OTRASSENNAS", direccion.otrassennas);
            comando.Parameters.AddWithValue("@CODIGO_POSTAL", direccion.codigo_postal);
            comando.Parameters.AddWithValue("@IDCLIENTE", direccion.cliente.id);
            db.ExecuteNonQuery(comando);
        }
    }
}
