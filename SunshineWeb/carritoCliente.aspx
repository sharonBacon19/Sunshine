<%@ Page Language="C#" MasterPageFile="~/VistaCliente.Master" AutoEventWireup="true" CodeBehind="carritoCliente.aspx.cs" Inherits="SunshineWeb.carritoCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sunshine | Mi Carrito </title>
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-header">
	    <div class="container">
		    <div class="row">
			    <div class="col-md-12">
				    <div class="content">
					    <h1 class="page-name">Mi Carrito</h1>
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
                <li><a   href="perfilCliente.aspx">Mi Perfil</a></li>
              
              <li><a href="comprasCliente.aspx">Mis Compras</a></li>
              <li><a class="active" href="carritoCliente.aspx">Mi Carrito</a></li>       
            </ul>
                
                  <div class="block">
                    <div class="product-list"> 


                        <br />
                        <br />
                        <asp:Label ID="lblMensaje" Visible="false" runat="server" CssClass="alert alert-info alert-common alert-solid "></asp:Label>
                        <br />
                        <br />
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
                                <asp:BoundField ControlStyle-BorderColor="Transparent" DataField="cantidad" HeaderText="Cantidad" DataFormatString="{0:0}"/>
                                <asp:BoundField DataField="producto.precio" HeaderText="Precio" DataFormatString="{0:0} c/u"/>
                                  <asp:TemplateField HeaderText="">
                                      <ItemTemplate>
                                           <asp:Button ID="btnQuitar" CssClass="btn btn-main mt-20"  Text="Quitar" runat="server" CommandArgument='<%# Eval("producto.id") %>' OnCommand="btnQuitar_Command" />
                                      </ItemTemplate>
                                  </asp:TemplateField> 
                             </Columns>
                           <HeaderStyle/>
                        </asp:GridView> 


                    <div class="form-group col-md-4">
                        
                        <br />
                        <asp:Label ID="lblSubTotal"  Text="SubTotal" runat="server"></asp:Label>
                        <asp:TextBox ID="txtSubTotal" ReadOnly="true" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnComprar" CssClass="btn btn-main"  Text="Comprar" runat="server" OnCommand="btnComprar_Command"/>             
                    </div>


                    </div>
                  </div>
                  
                </div>
            </div>
        </div>
        </div>
    </div>   

    
</asp:Content>