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
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SunshineWeb
{
    public partial class crearCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlTipoIdentificacion.DataSource = TipoIdentificacionLN.ObtenerTodos();
                ddlTipoIdentificacion.DataTextField = "TIPO";
                ddlTipoIdentificacion.DataValueField = "ID";
                ddlTipoIdentificacion.DataBind();

                ddlProvincia.DataSource = ProvinciaLN.ObtenerTodos();
                ddlProvincia.DataTextField = "dscProvincia";
                ddlProvincia.DataValueField = "codProvincia";
                ddlProvincia.DataBind();
            }
        }

        protected void btnSignin_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usu = new Usuario
                {
                    tipoUsuario = "Cliente",
                    contrasenna = Convert.ToString(txtContrasenna.Text),
                    email = Convert.ToString(txtEmail.Text),
                    estado = 1,
                };

                Usuario usua = UsuarioLN.ObtenerPorEmail(usu.email);
                if (usua != null)
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "el email ingresado ya existe, intente con otro";
                }
                else
                {
                    UsuarioLN.Insertar(usu);
                    TipoIdentificacion tipo = TipoIdentificacionLN.Obtener(Convert.ToInt16(ddlTipoIdentificacion.SelectedValue));
                    Cliente cliente = new Cliente
                    {
                        fechaNacimiento = Convert.ToDateTime(txtFecha.Text),
                        identificacion = Convert.ToString(txtIdentificacion.Text),
                        nombreCompleto = Convert.ToString(txtNombre.Text),
                        tarjetaCredito = Convert.ToString(txtTarjetaCredito.Text),
                        tipoIdentificacion = tipo,
                        usuario = UsuarioLN.ObtenerPorContrasenna(usu.contrasenna)
                    };

                    Cliente clien = ClienteLN.ObtenerPorIdentificacion(cliente.identificacion);
                    if (clien != null)
                    {
                        lblMensaje.Visible = true;
                        lblMensaje.Text = "Ya existe un cliente con este número de céudla";
                    }
                    else
                    {
                        ClienteLN.Insertar(cliente);

                        Provincia provincia = ProvinciaLN.Obtener(Convert.ToInt16(ddlProvincia.SelectedValue));
                        Direccion direccion = new Direccion
                        {
                            provincia = provincia,
                            codigo_postal = Convert.ToString(txtCodigo.Text),
                            otrassennas = Convert.ToString(txtOtras.Text),
                            cliente = cliente
                        };
                        DireccionLN.Insertar(direccion);


                        ClienteNivel cN = new ClienteNivel
                        {
                            cliente = ClienteLN.ObtenerPorIdentificacion(cliente.identificacion),
                            montoActual = 0,
                            nivel = NivelLN.Obtener(1)
                        };
                        ClienteNivelLN.Insertar(cN);

                        ClienteCupon cC = new ClienteCupon
                        {
                            cliente = ClienteLN.ObtenerPorIdentificacion(cliente.identificacion),
                            codigoQR = qr(),
                            cupon = CuponLN.Obtener(1),
                            estado = 1
                        };

                        ClienteCuponLN.Insertar(cC);

                        lblMensaje.Visible = true;
                        lblMensaje.Text = "Registro exitoso, ya puede ingresar a la tienda";
                        limpiarCampos();
                    }
                }
            }
            catch (Exception e1)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Ha ocurrido un problema  " + e1.Message;
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

        public void limpiarCampos()
        {
            txtCodigo.Text = "";
            txtContrasenna.Text = "";
            txtEmail.Text = "";
            txtFecha.Text = "";
            txtIdentificacion.Text = "";
            txtNombre.Text = "";
            txtOtras.Text = "";
            txtTarjetaCredito.Text = "";
            ddlProvincia.SelectedIndex = 0;
            ddlTipoIdentificacion.SelectedIndex = 0;
        }
    }
}