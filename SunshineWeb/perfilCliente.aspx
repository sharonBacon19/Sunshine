<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="perfilCliente.aspx.cs" Inherits="SunshineWeb.perfilCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-header">
	    <div class="container">
		    <div class="row">
			    <div class="col-md-12">
				    <div class="content">
					    <h1 class="page-name">Mi Perfil</h1>
				    </div>
			    </div>
		    </div>
	    </div>
    </section>
	<section class="user-dashboard page-wrapper">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <ul class="list-inline dashboard-menu text-center">
                <li><a class="active"  href="perfilCliente.aspx">Mi Perfil</a></li>
              
              <li><a href="dashboard.html">Mis Compras</a></li>
              <li><a  href="carrito.aspx">Mi Carrito</a></li>
              
              
            </ul>
            <div class="dashboard-wrapper dashboard-user-profile">
              <div class="media">
                <div class="pull-left text-center" href="#">
                  <img class="media-object user-img" src="images/imagenes/diamante.png" alt="Image">
                  <span style="font-weight:600">Nivel: </span><asp:Label ID="lblNivel" runat="server" Text="Diamante"></asp:Label>
                </div>
                <div class="media-body">
                  
                    <div class="user-profile-list">
                        <span>Nombre:</span>
                        <asp:Label ID="lblnombre" runat="server" Text="NombreCompleto" Font-Bold="false"></asp:Label> <br /><br />
                        <span>Identificación:</span>
                        <asp:Label ID="lblIdentificacion" runat="server" Text="Identificación" Font-Bold="false"/> <br /><br />
                        <span>Email:</span>
                            <asp:Label ID="lblEmail" runat="server" Text="Email" Font-Bold="false"></asp:Label> <br /><br />
                        <span>Fecha de nacimiento:</span> 
                            <asp:Label ID="lblFechaNacimiento" runat="server" Text="FechaNacimiento" Font-Bold="false"></asp:Label> <br /><br />
                    </div>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-12">
              <div class="content">
					    <h3 class="page-name">Mi progreso</h3>
				    </div>
              <%-- INFORMACIÓN DE NIVELES --%>
          </div>
        </div>
      </div>
    </section>
</asp:Content>
