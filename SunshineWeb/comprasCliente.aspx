<%@ Page Language="C#" MasterPageFile="~/VistaCliente.Master" AutoEventWireup="true" CodeBehind="comprasCliente.aspx.cs" Inherits="SunshineWeb.comprasCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sunshine | Mis Compras </title>
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-header">
	    <div class="container">
		    <div class="row">
			    <div class="col-md-12">
				    <div class="content">
					    <h1 class="page-name">Mis Compras</h1>
				    </div>
			    </div>
		    </div>
	    </div>
    </section>
    <div class="page-wrapper">
  <div class="cart shopping">
    <div class="container">
          <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <ul class="list-inline dashboard-menu text-center">
                <li><a "  href="perfilCliente.aspx">Mi Perfil</a></li>
              
              <li><a class="active" href="comprasCliente.aspx">Mis Compras</a></li>
              <li><a href="carritoCliente.aspx">Mi Carrito</a></li>       
            </ul>
                  <div class="block">
                      <br />
                    <div class="product-list"> 
                         <asp:GridView ID="grvListado" Width="100%" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" HeaderStyle-Height="100%" 
                            RowStyle-HorizontalAlign="Center" RowStyle-BorderColor="white" RowStyle-BorderStyle="None"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderStyle="None" HeaderStyle-BorderColor="Transparent" 
                            BorderColor="Transparent" CellPadding="50" CellSpacing="50" AlternatingRowStyle-BackColor="#f0f0f0" Height="100%" 
                            runat="server" AutoGenerateColumns="false">
                             <Columns>
                               <asp:TemplateField HeaderText="Producto">
                                     <ItemTemplate>
                                         <asp:Image ID="imagen" runat="server" ImageUrl='<%# Eval("detPedido.producto.Imagen") %>' Width="100" Height="100" />
                                     <ItemStyle BorderStyle="Groove" HorizontalAlign="Center" width="200" 
                                        Height="100" Wrap="True"/>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                <asp:BoundField ControlStyle-BorderColor="Transparent" DataField="total" HeaderText="total de la compra" DataFormatString="{0:0}"/>                               
                             </Columns>
                           <HeaderStyle/>
                        </asp:GridView> 

                        <br />
                        <br />
                        <div class="form-group col-md-4">
                        <asp:Label ID="lblTotal" runat="server" Text="Total de las compras"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtTotal" class="form-control col-md-4" runat="server" Text="" ReadOnly="true"></asp:TextBox>

                        </div>
                        
                        <br />
                    </div>
                  </div>
                </div>
            </div>
        </div>
        </div>
    </div> 
</asp:Content>