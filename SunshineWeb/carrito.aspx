<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="carrito.aspx.cs" Inherits="SunshineWeb.carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sunshine | Carrito </title>
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
                  <div class="block">
                    <div class="product-list">
                        <asp:GridView ID="grvListado" BorderColor="White" runat="server"  CellSpacing="50" CellPadding="50" Width="100%" AutoGenerateColumns="false">
                             <Columns>
                                 <asp:TemplateField HeaderText="Producto">
                                     <ItemTemplate>
                                         <asp:Image ID="imagen" runat="server" ImageUrl='<%# Eval("producto.Imagen") %>' Width="100" Height="100" />
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                <asp:BoundField DataField="cantidad" HeaderText="Cantidad" DataFormatString="{0:0}"/>
                                <asp:BoundField DataField="producto.precio" HeaderText="Precio" DataFormatString="{0:0} c/u"/>
                                  <asp:TemplateField HeaderText="">
                                      <ItemTemplate>
                                           <asp:Button ID="btnQuitar" CssClass="btn btn-main mt-20"  Text="Quitar" runat="server" CommandArgument='<%# Eval("producto.id") %>' OnCommand="btnQuitar_Command" />
                                      </ItemTemplate>
                                  </asp:TemplateField> 
                             </Columns>
                           <HeaderStyle CssClass="table-info" />
                        </asp:GridView> 
                    </div>
                  </div>
                </div>
            </div>
        </div>
        </div>
    </div>   

    <section class="products section" style="position:center">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="widget">
					<div class="form-group">
                        <asp:Label ID="lblMensaje" Visible="false" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lblSubTotal" class="form-control" Text="SubTotal" runat="server"></asp:Label>
                        <asp:TextBox ID="txtSubTotal" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnComprar" CssClass="btn btn-main"  Text="Comprar" runat="server" OnCommand="btnComprar_Command"/>             
                    </div>
               </div>
            </div>
        </div>
     </div>
    </section>
</asp:Content>
