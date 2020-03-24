using SunshineEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SunshineWeb
{
    public partial class carrito : System.Web.UI.Page
    {
        private static List<DetPedido> lista = new List<DetPedido>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               txtSubTotal.Text = Convert.ToString(total());
                lista = (List<DetPedido>)Session["lista"];
            }

        }

       
        public List<DetPedido> listaProducto_GetData()
        {
            lista = (List<DetPedido>)Session["lista"];
            return lista;
        }

        private int total()
        {
            int total = 0;
            lista = listaProducto_GetData();

            foreach (DetPedido det in lista)
            {
                total += det.producto.precio * det.cantidad;
            }
            return total;
        }

        protected void btnQuitar_Command(object sender, CommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            lista = (List<DetPedido>)Session["lista"];

            foreach (DetPedido det in lista)
            {
               if(det.producto.id == id)
                {
                    lista.Remove(det);
                    Session["lista"] = lista;
                    break;
                }
            }
            Response.Redirect("carrito.aspx");
        }
    }
}