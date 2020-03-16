﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="perfilCliente.aspx.cs" Inherits="SunshineWeb.perfilCliente" %>
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
            <%--<form runat="server"> --%>
            <div class="dashboard-wrapper dashboard-user-profile">
              <div class="media">
                <div class="pull-left text-center" >
                    <asp:Image ID="imagenNivel" runat="server"
                        class="media-object user-img" alt="Imagen nivel" />
                  
                  <span style="font-weight:600">Nivel: </span><asp:Label ID="lblNivel" runat="server"></asp:Label>
                </div>
                <div class="media-body">
                  
                    <div class="user-profile-list">
                        <span>Nombre:</span>
                        <asp:Label ID="lblNombre" runat="server"  Font-Bold="False" Width="395px"></asp:Label> <br /><br />
                        <span>Identificación:</span>
                        <asp:Label ID="lblIdentificacion" runat="server"  Font-Bold="False" Width="356px"/> <br /><br />
                        
                        <span>Fecha de nacimiento:</span> 
                            <asp:Label ID="lblFechaNacimiento" runat="server"  Font-Bold="False" Width="306px"></asp:Label> <br /><br />
                    </div>

                </div>



              </div>
            </div>

              <h3 class="page-name">Mi progreso</h3>
                    <div class="dashboard-wrapper dashboard-user-profile">
                        <div class="content">
                            <asp:Image ID="imgNiveles" CssClass="img-responsive" runat="server"/>
                        </div>
                        <div class="content">

                        </div>
                        <div class="content">
                            <asp:Image ID="imgCupones" CssClass="img-responsive" runat="server"/>
                        </div>
                      
                        
                    </div>

                <%--</form>--%>
          </div>
        </div>
      </div>
       
    </section>
</asp:Content>
