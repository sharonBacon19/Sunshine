using SunshineEntidades;
using SunshineLN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SunshineWeb
{
    public partial class comprasCliente : System.Web.UI.Page
    {
        private static List<EncaPedido> lista;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cliente cliente = (Cliente)Session["cliente"];
                lista = EncaPedidoLN.EncaPedidoPorCliente(cliente.identificacion);

                if (lista != null)
                {
                    listaEnca();
                    txtTotal.Text = total().ToString(); 
                }
                else
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "No hay compras aún";
                }
                
            }
        }

        public List<EncaPedido> listaEnca()
        {
            grvListado.DataSource = lista;
            grvListado.DataBind();
            return lista;
        }

        private int total()
        {
            int total = 0;
            foreach (EncaPedido enca in lista)
            {
                total += enca.detPedido.producto.precio * enca.detPedido.cantidad;
            }
            return total;
        }
    }
}