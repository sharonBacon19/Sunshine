using Gma.QrCodeNet.Encoding;
using Gma.QrCodeNet.Encoding.Windows.Render;
using SunshineEntidades;
using SunshineLN;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SunshineWeb
{

    public partial class asignarCliente : System.Web.UI.Page
    {
        Cliente cliente = new Cliente();
        ClienteNivel cN = new ClienteNivel();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id;
                if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    id = Convert.ToString(Request.QueryString["id"]);

                    cliente = ClienteLN.ObtenerPorIdentificacion(id);
                    listaCupon();

                    lblNombreCliente.Text = cliente.nombreCompleto;

                    cN = ClienteNivelLN.Obtener(cliente.identificacion);
                    lblNivelCliente.Text = cN.nivel.nombre;
                    imagenNivel.ImageUrl += cN.nivel.Imagen;

                    ddlCupon.DataSource = CuponLN.ObtenerTodos();
                    ddlCupon.DataTextField = "Nombre";
                    ddlCupon.DataValueField = "ID";
                    ddlCupon.DataBind();

                    ddlCupon_SelectedIndexChanged(null, null);
                }
            }
        }

        private void listaCupon()
        {
            grvListado.DataSource = ClienteCuponLN.ClienteCuponActivo(cliente.identificacion);
            grvListado.DataBind();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("listaCliente.aspx");
        }

        protected void ddlCupon_SelectedIndexChanged(object sender, EventArgs e)
        {
            Cupon cupon = CuponLN.Obtener(Convert.ToInt16(ddlCupon.SelectedValue));
            imgCupon.Visible = true;
            imgCupon.ImageUrl = cupon.Imagen;
        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            int select = ddlCupon.SelectedIndex;
            //si el cupon tiene nivel inferior o igual al del cliente busque
            if (select <= cN.nivel.id)
            {//existe el ClienteCupon con esa identificacion? Si no, entonces inserte
                if (ClienteCuponLN.ExisteCupon(cliente.identificacion))
                {
                    lblMensaje.Text = "El cliente ya tiene ese cupón asignado";
                    lblMensaje.CssClass += "alert-danger";
                    lblMensaje.Visible = true;
                }
                else
                {
                    ClienteCupon cC = new ClienteCupon
                    {
                        cliente = ClienteLN.ObtenerPorIdentificacion(cliente.identificacion),
                        codigoQR = qr(),
                        cupon = CuponLN.Obtener(1),
                        estado = 1
                    };
                    ClienteCuponLN.Insertar(cC);

                    lblMensaje.Text = "Se ha asignado el cupón con exito";
                    lblMensaje.CssClass += "alert-success";
                    lblMensaje.Visible = true;
                }
            }
            else
            {
                lblMensaje.Text = "No se puede asignar un cupón superior al nivel del cliente";
                lblMensaje.CssClass += "alert-warning";
                lblMensaje.Visible = true;
            }

            

            
        }

        public int qr()
        {
            QrEncoder qrEncoder = new QrEncoder(ErrorCorrectionLevel.H);
            QrCode qrCode = new QrCode();
            String rambon = (new Random().Next(1, 1000)).ToString();
            qrEncoder.TryEncode(rambon, out qrCode);

            GraphicsRenderer renderer = new GraphicsRenderer(new FixedCodeSize(400, QuietZoneModules.Zero), Brushes.Black, Brushes.White);

            MemoryStream ms = new MemoryStream();

            renderer.WriteToStream(qrCode.Matrix, ImageFormat.Png, ms);
            var imageTemporal = new Bitmap(ms);
            return Convert.ToInt32(qrCode.GetHashCode());
        }
    }
}