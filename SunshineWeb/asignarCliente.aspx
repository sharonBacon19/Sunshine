<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="asignarCliente.aspx.cs" Inherits="SunshineWeb.asignarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sunshine | Asignar Cupón </title>
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-header">
	    <div class="container">
		    <div class="row">
			    <div class="col-md-12">
				    <div class="content">
					    <h1 class="page-name">Asignar cupón</h1>
				    </div>
			    </div>
		    </div>
	    </div>
    </section>
    <div class="page-wrapper">
  <div class="checkout shopping">
    <div class="container">
          <div class="row">
                
                   
                     

                    <div class="col-md-6">

                        <%--<div class="media">--%>
                            <br />
                            <h4 class="widget-title">Información del cliente</h4>
                        <div class="pull-left text-center" >

                            <asp:Image ID="imagenNivel" runat="server" Width="100" Height="110" alt="Imagen nivel" />
                            <br />
                                
                                   
                        </div>
                        <div class="media-body">
                  
                            <div class="user-profile-list">
                                <br />
                                   
                                <span style="font-weight:600">Nivel: </span><asp:Label ID="lblNivelCliente" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                <span style="font-weight:600">Nombre:</span>
                                <asp:Label ID="lblNombreCliente" Font-Bold="False" runat="server"></asp:Label>
                            </div>
                       <%-- </div>--%>
                        </div>

                         
                      <br />
                        <div class="block">
                            <h4 class="widget-title">Cupones</h4>
                            <div class="media product-card">
                                <a class="pull-left" >
                                    <asp:Image id="imgCupon" Width="150px" Height="150px" runat="server" Visible ="false"></asp:Image>
                                </a>
                                <div class="media-body">                            
                                    <h4 class="media-heading">Elija el cupón a asignar</h4>
                                    <asp:DropDownList ID="ddlCupon" class="form-control" runat="server" OnSelectedIndexChanged="ddlCupon_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>                                
                                </div>
                            </div>
                            <br />
                            <asp:Button ID="btnVolver" CssClass="btn btn-main btn-default" runat="server" OnClick="btnVolver_Click" Text="Volver" />
                            <asp:Button ID="btnAsignar" CssClass="btn btn-main btn-default" runat="server" OnClick="btnAsignar_Click" Text="Asignar Cupón" />

                        </div>
                         
                    </div>
                     
                      
                    <div class="col-md-6">
                    <div class="block">
                      
                         <h4 class="widget-title">Cupones actuales</h4>
                      
                      <asp:GridView ID="grvListado" Width="100%" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" HeaderStyle-Height="100%" 
                            RowStyle-HorizontalAlign="Center" RowStyle-BorderColor="white" RowStyle-BorderStyle="None"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderStyle="None" HeaderStyle-BorderColor="Transparent" 
                            BorderColor="Transparent" CellPadding="50" CellSpacing="50" Height="100%" 
                            runat="server" AutoGenerateColumns="false">
                             <Columns>           
                                  <asp:TemplateField HeaderText="Cupón">
                                     <ItemTemplate>
                                         <asp:Image ID="imagen" runat="server" ImageUrl='<%# Eval("cupon.Imagen") %>' Width="100" Height="100" />
                                     <ItemStyle BorderStyle="Groove" HorizontalAlign="Center" width="200" 
                                        Height="100" Wrap="True"/>
                                     </ItemTemplate>
                                      </asp:TemplateField>
                                <asp:BoundField ControlStyle-BorderColor="Transparent" DataField="cupon.nombre" HeaderText="Nombre"/>
                                <asp:BoundField ControlStyle-BorderColor="Transparent" DataField="estadoS" HeaderText="Estado"/>
                             </Columns>
                           <HeaderStyle/>
                        </asp:GridView> 
                        </div>

                      
                      <br />
                      <br />
                      <br />

                     

                  </div>
                  </div>
                
                </div>
            </div>
        </div>
      
   
</asp:Content>