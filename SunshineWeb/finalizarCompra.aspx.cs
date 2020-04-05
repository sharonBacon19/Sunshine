using SunshineEntidades;
using SunshineLN;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SunshineWeb
{
    public partial class finalizarCompra : System.Web.UI.Page
    {
        private List<Cupon> listaCupones;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                listadoDetPedido();

                Cliente cliente = (Cliente)Session["cliente"];
                if (cliente != null)
                {
                    listaCupones = new List<Cupon>();
                    List<ClienteCupon> lista = ClienteCuponLN.ClientePorCupon(cliente.identificacion);
                    foreach (ClienteCupon cC in lista)
                    {
                        Cupon cupon = CuponLN.Obtener(cC.cupon.id);
                        listaCupones.Add(cupon);
                    }

                    ddlCupon.DataSource = listaCupones;
                    ddlCupon.DataTextField = "Nombre";
                    ddlCupon.DataValueField = "ID";
                    ddlCupon.DataBind();

                    txtNombre.Text = cliente.nombreCompleto;

                    Direccion direc = DireccionLN.DireccionPorCliente(cliente.identificacion);

                    txtProvinica.Text = direc.provincia.dscProvincia;
                    txtCodigoPostal.Text = direc.codigo_postal;
                    txtOtrasSennas.Text = direc.otrassennas;
                    txtTarjeta.Text = cliente.tarjetaCredito;

                    ddlCupon_SelectedIndexChanged(null, null);

                    txtSubTotal.Text = Convert.ToString(Subtotal());
                }
                else
                {
                    ddlCupon.Visible = false;
                    imgCupon.Visible = false;
                }  
            }
        }

        protected void ddlCupon_SelectedIndexChanged(object sender, EventArgs e)
        {
            Cupon cupon = CuponLN.Obtener(Convert.ToInt16(ddlCupon.SelectedValue));
            imgCupon.ImageUrl = cupon.Imagen;
        }

        private void listadoDetPedido()
        {
            List<DetPedido> lista = (List<DetPedido>)Session["lista"];
            grvListado.DataSource = lista;
            grvListado.DataBind();
        }

        private int Subtotal()
        {
            int Subtotal = 0;
            List<DetPedido> lista = (List<DetPedido>)Session["lista"];

            foreach (DetPedido det in lista)
            {
                Subtotal += det.producto.precio * det.cantidad;
            }
            return Subtotal;
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {

        }
    }
}