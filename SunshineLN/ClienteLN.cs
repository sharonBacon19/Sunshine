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
    public class ClienteLN
    {
        public static List<Cliente> ObtenerTodos()
        {
            List<Cliente> lista = new List<Cliente>();
            DataSet ds = ClienteDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Cliente registro = new Cliente();
                registro.nombreCompleto = Convert.ToString(fila["NOMBRECOMPLETO"]);
                registro.fechaNacimiento = Convert.ToDateTime(fila["FECHANACIMIENTO"]);
                registro.identificacion = Convert.ToString(fila["IDENTIFICACION"]);
                registro.tipoIdentificacion.id = Convert.ToInt16(fila["IDTIPOIDENTIFICACION"]);
                registro.tarjetaCredito = Convert.ToString(fila["TARJETACREDITO"]);
                registro.usuario.id = Convert.ToInt16(fila["IDUSUARIO"]);

                lista.Add(registro);
            }
            return lista;
        }
        public static Cliente ObtenerPorIdentificacion(string identificacion)
        {
            List<Cliente> lista = new List<Cliente>();
            lista = ClienteLN.ObtenerTodos();
            Cliente cliente = new Cliente();
            cliente = (lista.Find(elemento => elemento.identificacion == identificacion));
            return cliente;
        }

        public static Cliente Obtener(int idCliente)
        {
            List<Cliente> lista = new List<Cliente>();
            lista = ClienteLN.ObtenerTodos();
            Cliente cliente = new Cliente();
            cliente = (lista.Find(elemento => elemento.id == idCliente));
            return cliente;
        }

        public static void Insertar(Cliente cliente)
        {
            ClienteDatos.Insertar(cliente);
        }
    }
}
