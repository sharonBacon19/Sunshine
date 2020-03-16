<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="carrito.aspx.cs" Inherits="SunshineWeb.carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
          <ul class="list-inline dashboard-menu text-center">
              <li><a   href="perfilCliente.aspx">Mi Perfil</a></li>
              
              <li><a href="dashboard.html">Mis Compras</a></li>
              <li><a class="active" href="carrito.aspx">Mi Carrito</a></li>
              
              
            </ul>
        <div class="col-md-8 col-md-offset-2">

          <div class="block">
            <div class="product-list">
              <%--<form method="post" runat="server">--%>
                  <asp:GridView ID="grvListado" runat="server"
                        class="table"
                            AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="imagen" HeaderText="Producto"></asp:BoundField>
                            <asp:BoundField DataField="cantidad" HeaderText="Cantidad"></asp:BoundField>
                            <asp:BoundField DataField="precio" HeaderText="Precio"></asp:BoundField>
                            <asp:BoundField DataField="Descartar"></asp:BoundField>
                            
                        </Columns>

                       
                    </asp:GridView>

               
                    <br/>
                    <br/>
                 <a href="finalizarCompra.aspx" class="btn btn-main pull-right">Comprar</a>
              <%--</form>--%>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

    
</asp:Content>
