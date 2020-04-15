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
    public partial class productoVistaCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ddlTalla.DataSource = TallaLN.ObtenerTodos();
                ddlTalla.DataTextField = "tipoTalla";
                ddlTalla.DataValueField = "id";
                ddlTalla.DataBind();

                ddlColor.DataSource = ColorLN.ObtenerTodos();
                ddlColor.DataTextField = "tipoColor";
                ddlColor.DataValueField = "id";
                ddlColor.DataBind();

                int idproducto;
                //Obtener una variable Query String
                if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    if (Int32.TryParse(Request.QueryString["id"], out idproducto))
                    {
                        //Seleccionar actividad
                        //ddlActividad.SelectedValue = idActividad.ToString();
                        Producto pro = producto1(idproducto);
                        ImgPr.ImageUrl = pro.imagen;
                        Image1.ImageUrl = pro.imagen;
                        lblNombre.Text = pro.nombre;
                        
                        lblPrecio.Text =Convert.ToString(pro.precio);
                        lblDescripcion.Text = pro.descripcion;
                    }
                }
            }
        }

        private Producto producto1(int idProducto)
        {

            return ProductoLN.Obtener(idProducto);
        }
        private static List<DetPedido> dets = new List<DetPedido>();

        protected void btnAddCarrito_Click(object sender, EventArgs e)
        {
            try
            {
                int idproducto;

                //Obtener una variable Query String
                if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    if (Int32.TryParse(Request.QueryString["id"], out idproducto))
                    {
                        //Seleccionar actividad
                        //ddlActividad.SelectedValue = idActividad.ToString();
                        Producto producto = producto1(idproducto);

                        int idDet = new Random().Next(1, 1000);

                        DetPedido det = new DetPedido
                        {
                            cantidad = Convert.ToInt16(txtCantidad.Text),
                            color = ColorLN.Obtener(Convert.ToInt16(ddlColor.SelectedValue)),
                            fechaPedido = DateTime.Now,
                            producto = producto,
                            talla = TallaLN.Obtener(Convert.ToInt16(ddlTalla.SelectedValue)),
                            subtotal = producto.precio,
                            id = idDet
                        };

                        dets.Add(det);
                        lblMensaje.Text = "Se agregó al carrito de compras";
                    }
                }
                Session["lista"] = dets;


            }
            catch (Exception e1)
            {
                lblMensaje.Text = "Ha ocurrido un problema " + e1.Message;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("tiendaCliente.aspx");
        }
    }
}
