using SunshineEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SunshineWeb
{
    public partial class carritoCliente : System.Web.UI.Page
    {
        private static List<DetPedido> lista = new List<DetPedido>();
        protected void Page_Load(object sender, EventArgs e)
        {
            
                if (!IsPostBack)
                {
                    lista = (List<DetPedido>)Session["lista"];

                    if (lista != null)
                    {
                        txtSubTotal.Text = Convert.ToString(total());
                        lista = (List<DetPedido>)Session["lista"];
                    }
                    else
                    {
                        lblMensaje.Visible = true;
                        lblMensaje.Text = "No hay compras aún";
                        btnComprar.Visible = false;
                    }
                }
            
        }

        public List<DetPedido> listaProducto()
        {
            lista = (List<DetPedido>)Session["lista"];
            grvListado.DataSource = lista;
            grvListado.DataBind();
            return lista;
        }

        private int total()
        {
            int total = 0;
            lista = listaProducto();

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
                if (det.producto.id == id)
                {
                    lista.Remove(det);
                    Session["lista"] = lista;
                    break;
                }
            }
            Response.Redirect("carrito.aspx");
        }

        protected void btnComprar_Command(object sender, CommandEventArgs e)
        {
            if ((Cliente)Session["cliente"] != null)
            {
                Response.Redirect("finalizarCompra.aspx");
            }
            else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Debe iniciar sesión para poder comprar";
                Response.Redirect("carrito.aspx");
            }
        }
    }
}