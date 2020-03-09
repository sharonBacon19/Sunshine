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
    public class ClienteDatos
    {
        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListaCliente");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "cliente");
            return ds;
        }

        public static void Insertar(Cliente cliente)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("Insertar_Cliente");
            comando.CommandType = CommandType.StoredProcedure;
            //Parámetros
            comando.Parameters.AddWithValue("@NOMBRECOMPLETO", cliente.nombreCompleto);
            comando.Parameters.AddWithValue("@FECHANACIMIENTO", cliente.fechaNacimiento);
            comando.Parameters.AddWithValue("@IDENTIFICACION", cliente.identificacion);
            comando.Parameters.AddWithValue("@IDTIPOIDENTIFICACION", cliente.tipoIdentificacion.id);
            comando.Parameters.AddWithValue("@TARJETACREDITO", cliente.tarjetaCredito);
            comando.Parameters.AddWithValue("@IDUSUARIO", cliente.usuario.id);
            db.ExecuteNonQuery(comando);
        }
    }
}
