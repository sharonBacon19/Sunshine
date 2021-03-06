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
    public class CuponLN
    {
        public static List<Cupon> ObtenerTodos()
        {
            List<Cupon> lista = new List<Cupon>();
            DataSet ds = CuponDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Cupon registro = new Cupon();
                registro.id = Convert.ToInt16(fila["ID"]);
                registro.nombre = Convert.ToString(fila["NOMBRE"]);
                registro.descripcion = Convert.ToString(fila["DESCRIPCION"]);
                registro.estado = Convert.ToInt32(fila["ESTADO"]);
                registro.descuento = Convert.ToInt32(fila["DESCUENTO"]);
                registro.nivel = NivelLN.Obtener(Convert.ToInt16(fila["IDNIVEL"]));
                registro.Imagen = Convert.ToString(fila["IMAGEN"]);

                lista.Add(registro);
            }
            return lista;
        }

        public static List<Cupon> CuponPorNivel(int idNIvel)
        {
            List<Cupon> lista = CuponLN.ObtenerTodos();
            List<Cupon> c = lista.Where(x => x.nivel.id == idNIvel).ToList();
            return c;
        }

        public static Cupon Obtener(int idCupon)
        {
            List<Cupon> lista = new List<Cupon>();
            lista = CuponLN.ObtenerTodos();
            Cupon cu = new Cupon();
            cu = (lista.Find(elemento => elemento.id == idCupon));
            return cu;
        }
    }
}
