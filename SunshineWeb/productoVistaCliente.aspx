<%@ Page Language="C#" MasterPageFile="~/VistaCliente.Master" AutoEventWireup="true" CodeBehind="productoVistaCliente.aspx.cs" Inherits="SunshineWeb.productoVistaCliente" %>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<section class="single-product">
	<div class="container">
		<div class="row mt-20">
			<div class="col-md-5">
				<div class="single-product-slider">
					<div id='carousel-custom' class='carousel slide' data-ride='carousel'>
						<div class='carousel-outer'>
							<div class='carousel-inner '>
								<div class='item active'>
									<asp:Image ID="ImgPr" ImageUrl="" runat="server"  Width="400" Height="400"/>
								</div>							
								
						</div>							
						</div>
						<ol class='carousel-indicators mCustomScrollbar meartlab'>
							<li data-target='#carousel-custom' data-slide-to='0' class='active'>
								<asp:Image ID="Image1" ImageUrl="" runat="server"  Width="75" Height="75"/>
							</li>							
						</ol>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<div class="single-product-details">
					<asp:Label ID="lblNombre" runat="server" Text="" CssClass="h2"></asp:Label>
					<br />
					<br />
					
					<asp:Label ID="lblPrecio" runat="server" Text="" CssClass="h3"></asp:Label>
					<br /><br />
					<br />
					<asp:Label ID="lblDescripcion" runat="server" Text="" CssClass="product-description mt-20"></asp:Label>
					<br />
					<br />
					<br />
					
					<div class="color-swatches">
						<span>Color:</span>
						<asp:DropDownList ID="ddlColor" runat="server">
						</asp:DropDownList>
					</div>
					<div class="product-size">
						<span>Talla:</span>
						<asp:DropDownList ID="ddlTalla" runat="server">
						</asp:DropDownList>
					</div>
					<div class="product-quantity">
						<span>Cantidad:</span>
						<div class="product-quantity-slider ">							
							<asp:TextBox ID="txtCantidad" Text="1" TextMode="Number"  runat="server"></asp:TextBox>
						</div>
					</div>
					<br />
					<asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
					<br /><br />
					<br /><br />
					<asp:Button ID="btnAddCarrito" runat="server" CssClass="btn btn-main btn-large" Text="Agregar al Carrito" OnClick="btnAddCarrito_Click"/>
					<asp:Button ID="btnVolver" runat="server" CssClass="btn btn-main btn-medium" Text="Volver" OnClick="btnVolver_Click"/>
				</div>
			</div>
		</div>
		
	</div>
   </section>
</asp:Content>