using Gma.QrCodeNet.Encoding;
using Gma.QrCodeNet.Encoding.Windows.Render;
using SunshineEntidades;
using SunshineLN;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
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
                    txtTotal.Text = Convert.ToString(Subtotal());
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
            //verificar si hay cliente
            Cliente cliente = (Cliente)Session["cliente"];
            if (cliente != null)
            {
                Cupon cupon = CuponLN.Obtener(Convert.ToInt16(ddlCupon.SelectedValue));                
                ClienteNivel clienteNivel = ClienteNivelLN.ObtenerClienteNivel(cliente.identificacion);

                //se inserta el cambio en el canje
                Canje canje = new Canje
                {
                    cliente = cliente,
                    cupon = cupon
                };
                CanjeLN.Insertar(canje);

                //ACERCA DE LOS NIVELES
                if(clienteNivel.nivel.nombre == "Bronce")
                {
                    //subir de nivel y asignar cupon
                    if(clienteNivel.nivel.montoMeta < Subtotal())
                    {
                        Nivel nivel = NivelLN.Obtener(2);
                        Cupon cupon1 = CuponLN.Obtener(2);
                        ClienteNivel clienteNIvel = new ClienteNivel
                        {
                            cliente = cliente,
                            montoActual = Subtotal(),
                            nivel = nivel
                        };
                        ClienteCupon clienteCupon = new ClienteCupon
                        {
                            cliente = cliente,
                            codigoQR = qr(),
                            cupon = cupon
                        };
                        //insertar nivel y cliente
                        ClienteNivelLN.Insertar(clienteNIvel);
                        ClienteCuponLN.Insertar(clienteCupon);                        
                    }
                }
                else
                {
                    if (clienteNivel.nivel.nombre == "Plata")
                    {
                        //subir de nivel y asignar cupon
                        if (clienteNivel.nivel.montoMeta < Subtotal())
                            {
                                Nivel nivel = NivelLN.Obtener(3);
                                Cupon cupon1 = CuponLN.Obtener(3);
                                ClienteNivel clienteNIvel = new ClienteNivel
                                    {
                                    cliente = cliente,
                                    montoActual = Subtotal(),
                                    nivel = nivel
                                    };
                                 ClienteCupon clienteCupon = new ClienteCupon
                                 {
                                    cliente = cliente,
                                    codigoQR = qr(),
                                    cupon = cupon
                                 };
                            //insertar nivel y cliente
                            ClienteNivelLN.Insertar(clienteNIvel);
                            ClienteCuponLN.Insertar(clienteCupon);
                        }                        
                    }
                    else
                    {
                        if (clienteNivel.nivel.nombre == "Oro")
                        {
                            //subir de nivel y asignar cupon
                            if (clienteNivel.nivel.montoMeta < Subtotal())
                            {
                                Nivel nivel = NivelLN.Obtener(4);
                                Cupon cupon1 = CuponLN.Obtener(4);
                                ClienteNivel clienteNIvel = new ClienteNivel
                                {
                                    cliente = cliente,
                                    montoActual = Subtotal(),
                                    nivel = nivel
                                };
                                ClienteCupon clienteCupon = new ClienteCupon
                                {
                                    cliente = cliente,
                                    codigoQR = qr(),
                                    cupon = cupon
                                };
                                //insertar nivel y cliente
                                ClienteNivelLN.Insertar(clienteNIvel);
                                ClienteCuponLN.Insertar(clienteCupon);
                            }
                        }                        
                    }
                }

                //sacar total
                int descuento = 0;
                 descuento = cupon.descuento / 100;
                int total = 0;
                 total = Subtotal() - descuento;

                //lista de compras
                List<DetPedido> lista = (List<DetPedido>)Session["lista"];
                
                //se insertan los det
                    foreach (DetPedido det in lista)
                    {
                    DetPedidoLN.Insertar(det);                     
                    }

                //ahora los det de que ya existen en el enca
                foreach (DetPedido det in lista)
                {
                    DetPedido detP = DetPedidoLN.Obtener(det.id);
                    EncaPedido encaPedido = new EncaPedido
                    {
                        cliente = cliente,
                        detPedido = detP,
                        total = total
                    };
                    EncaPedidoLN.Insertar(encaPedido);
                }                


                lblMensaje.Text = "¡Compra éxitosa, gracias por preferirnos!";
                Session["lista"] = "";
            }
            else
            {
                lblMensaje.Text = "Debe ingresar para continuar con la finalización de la compra";
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