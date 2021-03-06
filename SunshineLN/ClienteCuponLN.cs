﻿using SunshineDatos;
using SunshineEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineLN
{
    public class ClienteCuponLN
    {
        public static List<ClienteCupon> ObtenerTodos()
        {
            List<ClienteCupon> lista = new List<ClienteCupon>();
            DataSet ds = ClienteCuponDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                ClienteCupon registro = new ClienteCupon();
                registro.id = Convert.ToInt16(fila["ID"]);
                registro.cliente = ClienteLN.ObtenerPorIdentificacion(Convert.ToString(fila["IDCLIENTE"]));
                registro.cupon = CuponLN.Obtener(Convert.ToInt16(fila["IDCUPON"]));
                registro.codigoQR = Convert.ToInt32(fila["CODIGO_QR"]);
                registro.estado = Convert.ToInt16(fila["ESTADO"]);

                if(Convert.ToInt16(fila["ESTADO"]) == 1)
                {
                    registro.estadoS = "Sin usar";
                }
                else
                {
                    registro.estadoS = "Usado";
                }

                lista.Add(registro);
            }
            return lista;
        }
        
        public static List<ClienteCupon> ClientePorCupon(String identificacion)
        {
            List<ClienteCupon> lista = ClienteCuponLN.ObtenerTodos();
            List<ClienteCupon> cC = lista.Where(x => x.cliente.identificacion ==  identificacion).ToList();
            return cC;
        }
        public static List<ClienteCupon> ClienteCuponActivo(String identificacion)
        {
            List<ClienteCupon> lista = ClienteCuponLN.ObtenerTodos();
            List<ClienteCupon> cC = lista.Where(x => x.cliente.identificacion == identificacion).ToList();
            List<ClienteCupon> cActivos=cC.Where(x => x.estado == 1).ToList();
            return cActivos;
        }
        
        public static bool ExisteCupon(Cupon cupon, string identificacion)
        {
            List<ClienteCupon> lista = new List<ClienteCupon>();
            lista = ClienteCuponLN.ClientePorCupon(identificacion);
            ClienteCupon cC = new ClienteCupon();
            cC = (lista.Find(elemento => elemento.cupon.nivel.id == cupon.nivel.id));

            if (cC != null)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }

        public static List<ClienteCupon> CuponPorCliente(int idCupon)
        {
            List<ClienteCupon> lista = ClienteCuponLN.ObtenerTodos();
            List<ClienteCupon> cC = lista.Where(x => x.cupon.id == idCupon).ToList();
            return cC;
        }

        public static void Insertar(ClienteCupon clienteCupon)
        {
            ClienteCuponDatos.Insertar(clienteCupon);
        }

        public static ClienteCupon Obtener(int idClienteCupon)
        {
            List<ClienteCupon> lista = new List<ClienteCupon>();
            lista = ClienteCuponLN.ObtenerTodos();
            ClienteCupon cC = new ClienteCupon();
            cC = (lista.Find(elemento => elemento.id == idClienteCupon));
            return cC;
        }

        public static void ActualizarEstado(string identificacion, int estado)
        {
            ClienteCuponDatos.actualizarEstado(identificacion, estado);
        }
    }
}
