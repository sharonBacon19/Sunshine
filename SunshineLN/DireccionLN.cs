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
    public class DireccionLN
    {
        public static List<Direccion> ObtenerTodos()
        {
            List<Direccion> lista = new List<Direccion>();
            DataSet ds = DireccionDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Direccion registro = new Direccion();
                registro.id = Convert.ToInt16(fila["ID"]);
                registro.provincia = ProvinciaLN.Obtener(Convert.ToInt16(fila["COD_PROVINCIA"]));
                registro.otrassennas = Convert.ToString(fila["OTRASSENNAS"]);
                registro.codigo_postal = Convert.ToString(fila["CODIGO_POSTAL"]);
                registro.cliente = ClienteLN.ObtenerPorIdentificacion(Convert.ToString(fila["IDCLIENTE"]));

                lista.Add(registro);
            }
            return lista;
        }

        public static Direccion DireccionPorCliente(String identificacion)
        {
            List<Direccion> lista = new List<Direccion>();
            lista = DireccionLN.ObtenerTodos();
            Direccion dire = new Direccion();
            dire = (lista.Find(elemento => elemento.cliente.identificacion == identificacion));
            return dire;
        }

        public static void Insertar(Direccion direccion)
        {
            DireccionDatos.Insertar(direccion);
        }
    }
}
