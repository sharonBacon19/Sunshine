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
    public class CanjeDatos
    {
        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListaCanje");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "canje");
            return ds;
        }

        public static void Insertar(Canje canje)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("Insertar_Canje");
            comando.CommandType = CommandType.StoredProcedure;
            //Parámetros
            comando.Parameters.AddWithValue("@IDPRODUCTO", canje.producto.id);
            comando.Parameters.AddWithValue("@IDCLIENTECUPON", canje.clienteCupon.id);
            db.ExecuteNonQuery(comando);
        }
    }
}
