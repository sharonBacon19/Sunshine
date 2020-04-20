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
                    cN = ClienteNivelLN.Obtener(cliente.identificacion);

                    Session["clienteCanje"] = ClienteLN.ObtenerPorIdentificacion(id);

                    lblNombreCliente.Text = cliente.nombreCompleto;                    
                    lblNivelCliente.Text = cN.nivel.nombre;
                    imagenNivel.ImageUrl += cN.nivel.Imagen;

                    ddlCupon.DataSource = CuponLN.ObtenerTodos();
                    ddlCupon.DataTextField = "Nombre";
                    ddlCupon.DataValueField = "ID";
                    ddlCupon.DataBind();

                    listaCupon();
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
            lblMensaje.Text = "";
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

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            Cupon cupon = CuponLN.Obtener(Convert.ToInt16(ddlCupon.SelectedValue));
            Cliente cl = (Cliente)Session["clienteCanje"];
            ClienteNivel cn = ClienteNivelLN.Obtener(cl.identificacion);

            if (ClienteCuponLN.ExisteCupon(cupon, cl.identificacion))
            {
                lblMensaje.Text = "";
                lblMensaje.Visible = true;
                lblMensaje.Text = "Cupón ya ha sido asígnado";
            }
            else
            {
                if (cn.nivel.id < cupon.nivel.id)
                {
                    lblMensaje.Text = "";
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "Cupón no puede ser asígnado";
                }
                else
                {
                    ClienteCupon cc = new ClienteCupon
                    {
                        cliente = cl,
                        codigoQR = qr(),
                        cupon = cupon,
                        estado = 1,
                        estadoS = "Sin usar",
                    };
                    ClienteCuponLN.Insertar(cc);
                    lblMensaje.Text = "";
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "Cupón se ha asígnado";
                    listaCupon();
                }
            }

        }
    }
}