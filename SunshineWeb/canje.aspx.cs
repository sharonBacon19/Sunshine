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
    public partial class canje : System.Web.UI.Page
    {
        Cliente cliente = new Cliente();
        ClienteNivel cN = new ClienteNivel();
        List<Canje> lista = new List<Canje>();

        protected void Page_Load(object sender, EventArgs e)
        {
            string id;
            if (!String.IsNullOrEmpty(Request.QueryString["id"]))
            {
                id = Convert.ToString(Request.QueryString["id"]);

                cliente = ClienteLN.ObtenerPorIdentificacion(id);

                if (listaCanjes() != null)
                {
                    listaCanjes();
                }
                else
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "Aún no realiza canjes";
                }

                lblNombreCliente.Text = cliente.nombreCompleto;
                cN = ClienteNivelLN.Obtener(cliente.identificacion);
                lblNivelCliente.Text = cN.nivel.nombre;
                imagenNivel.ImageUrl += cN.nivel.Imagen;
            }
        }

        public List<Canje> listaCanjes()
        {
            lista = CanjeLN.CanjePorCliente(cliente.identificacion);
            grvListado.DataSource = lista;
            grvListado.DataBind();
            return lista;
        }
    }
}