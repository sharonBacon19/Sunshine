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
    public partial class Singin : System.Web.UI.Page
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
            String mensaje = "";
            try
            {               
                Usuario usu = new Usuario
                {
                    tipoUsuario = "Cliente",
                    contrasenna = Convert.ToString(txtContrasenna.Text),
                    email = Convert.ToString(txtEmail.Text),
                    estado = 1,
                };

                if (!email_bien_escrito(usu.email))
                {
                    mensaje = "Email contiene un formato incorrecto";
                    
                    lblMensaje.Text = mensaje;
                    lblMensaje.Visible = true;
                }
                else
                {
                    if (contrasenna_bien_escrita(usu.contrasenna))
                    {
                        mensaje = "La contraseña contiene un formato incorrecto";
                        lblMensaje.Text = mensaje;
                        lblMensaje.Visible = true;
                    }
                }

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

                ClienteLN.Insertar(cliente);
                Provincia provincia = ProvinciaLN.Obtener(Convert.ToInt16(ddlProvincia.SelectedValue));

                if(ClienteLN.ObtenerPorIdentificacion(cliente.identificacion) != null)
                {
                    Direccion direccion = new Direccion
                     {
                        provincia = provincia,
                        codigo_postal = Convert.ToString(txtCodigo.Text),
                        otrassennas = Convert.ToString(txtOtras.Text),
                        cliente = ClienteLN.ObtenerPorIdentificacion(cliente.identificacion)
                    };
                    DireccionLN.Insertar(direccion);
                    
                }

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
                    cupon = CuponLN.Obtener(1)
                };

                ClienteCuponLN.Insertar(cC);

                Response.Redirect("login.aspx");

            }
            catch (Exception e1)
            {
                lblMensaje.Text = "Ha ocurrido un problema  " + e1.Message;
                lblMensaje.Visible = true;
            }            
        }

        private Boolean email_bien_escrito(String email)
        {
            String expresion;
            expresion = "\\w+([-+.']\\w+)@\\w+([-.]\\w+)\\.\\w+([-.]\\w+)*";
            if (Regex.IsMatch(email, expresion))
            {
                if (Regex.Replace(email, expresion, String.Empty).Length == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        private Boolean contrasenna_bien_escrita(String contrasenna)
        {
            Match matchLongitud = Regex.Match(contrasenna, @"^\w{8,15}\b");
            Match matchNumeros = Regex.Match(contrasenna, @"\d");
            Match matchMayusculas = Regex.Match(contrasenna, @"[A-Z]");

            if (!matchLongitud.Success || !matchMayusculas.Success || !matchNumeros.Success)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //método para validación de tarjeta de crédito

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