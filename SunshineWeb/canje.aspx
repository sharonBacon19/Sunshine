<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="canje.aspx.cs" Inherits="SunshineWeb.canje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sunshine | Canjes </title>
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-header">
	    <div class="container">
		    <div class="row">
			    <div class="col-md-12">
				    <div class="content">
					    <h1 class="page-name">Clientes</h1>
				    </div>
			    </div>
		    </div>
	    </div>
    </section>
    <div class="page-wrapper">
  <div class="cart shopping">
    <div class="container">
         <div class="media">
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
                       </div>
                  </div>

        <br />
        <br />
          <div class="row">
                <div class="col-md-8 col-md-offset-2">
                  <div class="block">
                    <div class="product-list"> 
                       <asp:GridView ID="grvListado" Width="100%" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" HeaderStyle-Height="100%" 
                            RowStyle-HorizontalAlign="Center" RowStyle-BorderColor="white" RowStyle-BorderStyle="None"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderStyle="None" HeaderStyle-BorderColor="Transparent" 
                            BorderColor="Transparent" CellPadding="50" CellSpacing="50" AlternatingRowStyle-BackColor="#f0f0f0" Height="100%" 
                            runat="server" AutoGenerateColumns="false">
                             <Columns>
                                  <asp:TemplateField HeaderText="Producto">
                                     <ItemTemplate>
                                         <asp:Image ID="imagen" runat="server" ImageUrl='<%# Eval("producto.Imagen") %>' Width="100" Height="100" />
                                     <ItemStyle BorderStyle="Groove" HorizontalAlign="Center" width="200" 
                                        Height="100" Wrap="True"/>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Cupón utilizado">
                                     <ItemTemplate>
                                         <asp:Image ID="imagen" runat="server" ImageUrl='<%# Eval("cupon.Imagen") %>' Width="100" Height="100" />
                                     <ItemStyle BorderStyle="Groove" HorizontalAlign="Center" width="200" 
                                        Height="100" Wrap="True"/>
                                     </ItemTemplate>
                                 </asp:TemplateField>                                
                             </Columns>                          
                        </asp:GridView> 
                        <br />
                        <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                    </div>
                  </div>
                </div>
            </div>
        </div>
        </div>
    </div>   
</asp:Content>