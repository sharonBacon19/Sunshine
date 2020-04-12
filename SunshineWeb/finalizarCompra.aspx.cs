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
        private static Producto producto = new Producto();

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
            imgCupon.Visible = true;
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

        private int Subtotal2()
        {
            int Subtotal = 0;
            List<DetPedido> lista = (List<DetPedido>)Session["lista"];
            foreach (DetPedido det in lista)
            {
                if(det.producto.id != producto.id)
                {
                    Subtotal += det.producto.precio * det.cantidad;
                }
                
            }
            return Subtotal;
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            //verificar si hay cliente
            Cliente cliente = (Cliente)Session["cliente"];
            if (cliente != null)
            {
                // si hay cliente hace lo siguiente

                //agarra cupon (SUCAR COMO AGREGAR ITEM SIN VALOR DE SELECCIONE)
                Cupon cupon = CuponLN.Obtener(Convert.ToInt16(ddlCupon.SelectedValue));  
                

                //se busca el nivel del cliente
                ClienteNivel clienteNivel = ClienteNivelLN.ObtenerClienteNivel(cliente.identificacion);

                //se inserta el cambio en el canje, se pregunta primero si agarró algún cupon
                if(cupon != null)
                {
                    //se va a ser el canje sólo si escogió un producto

                    if (producto != null)
                    {
                        Canje canje = new Canje
                        {
                            cliente = cliente,
                            cupon = cupon,
                            producto = producto //el que cliente escogío
                        };
                        CanjeLN.Insertar(canje);
                    }                   
                }
                

                //ACERCA DE LOS NIVELES
                if(clienteNivel.nivel.nombre == "Bronce")
                {
                    // esta suma es acerca del monto que se compró + el monto meta LO QUE SE BUSCA ES ACTUALIZAR EL MONTO ACTUAL DEL CLIENTE NIVEL
                    int suma = clienteNivel.montoActual + Subtotal();
                    clienteNivel.montoActual = suma;

                    //subir de nivel y asignar cupon
                    if (clienteNivel.nivel.montoMeta < clienteNivel.montoActual)
                    {               
                        Nivel nivel = NivelLN.Obtener(2);
                        ClienteNivel clienteNIvel = new ClienteNivel
                        {
                            cliente = cliente,
                            montoActual = Subtotal(),
                            nivel = nivel
                        };
                        //insertar nivel
                        ClienteNivelLN.Insertar(clienteNIvel);                      
                    }
                }
                else
                {
                    if (clienteNivel.nivel.nombre == "Plata")
                    {
                        // esta suma es acerca del monto que se compró + el monto meta LO QUE SE BUSCA ES ACTUALIZAR EL MONTO ACTUAL DEL CLIENTE NIVEL
                        int suma = clienteNivel.montoActual + Subtotal();
                        clienteNivel.montoActual = suma;
                        //subir de nivel y asignar cupon
                        if (clienteNivel.nivel.montoMeta < clienteNivel.montoActual)
                            {
                                Nivel nivel = NivelLN.Obtener(3);
                                ClienteNivel clienteNIvel = new ClienteNivel
                                    {
                                    cliente = cliente,
                                    montoActual = Subtotal(),
                                    nivel = nivel
                                    };
                            //insertar nivel
                            ClienteNivelLN.Insertar(clienteNIvel);
                        }                        
                    }
                    else
                    {
                        if (clienteNivel.nivel.nombre == "Oro")
                        {
                            // esta suma es acerca del monto que se compró + el monto meta LO QUE SE BUSCA ES ACTUALIZAR EL MONTO ACTUAL DEL CLIENTE NIVEL
                            int suma = clienteNivel.montoActual + Subtotal();
                            clienteNivel.montoActual = suma;
                            //subir de nivel y asignar cupon
                            if (clienteNivel.nivel.montoMeta <clienteNivel.montoActual)
                            {
                                Nivel nivel = NivelLN.Obtener(4);
                                ClienteNivel clienteNIvel = new ClienteNivel
                                {
                                    cliente = cliente,
                                    montoActual = Subtotal(),
                                    nivel = nivel
                                };
                                //insertar nivel
                                ClienteNivelLN.Insertar(clienteNIvel);
                            }
                        }                        
                    }
                }



                //sacar total
                int descuento = 0;
                 descuento = cupon.descuento / 100;

                int total = 0;
                total = Subtotal2() + (producto.precio - descuento);

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

                lblMensaje.Text = "¡Compra exitosa, gracias por preferirnos!";

               //limpiar la lista
                List<DetPedido> lista11 = new List<DetPedido>();
                Session["lista"] = lista11;
            }
            else
            {
                lblMensaje.Text = "Debe ingresar para continuar con la finalización de la compra";
            }
        }

        protected void btnAplicar_Command(object sender, CommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            producto = ProductoLN.Obtener(id);

            lblProdNombre.Visible = true;
            prodIm.Visible = true;
            lblProdNombre.Text = producto.nombre;
            prodIm.ImageUrl = producto.imagen;
        }
    }    
}