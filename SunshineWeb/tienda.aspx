<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="tienda.aspx.cs" Inherits="SunshineWeb.tienda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Sunshine | Tienda</title>

  
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<form runat="server">--%>
   <%-- Header titulo --%>
    <section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
                    <h1 class="page-name">Tienda</h1>
                    </div>
			</div>
		</div>
	</div>
</section>

    <section class="products section">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="widget">
					<h4 class="widget-title">Ordenar por Categorías</h4>
					<div class="form-group">
                        <asp:Label ID="lblGenero" class="form-control" Text="Género" runat="server"></asp:Label>
                        <asp:DropDownList ID="ddlGenero" class="form-control" runat="server">
                            
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="lblTipoPrenda" class="form-control" Text="Tipo" runat="server"></asp:Label>
                        <asp:DropDownList ID="ddlTipoPrenda" class="form-control" runat="server">
                           
                        </asp:DropDownList>
                        </div>
                    </div>
            </div>
        </div>
     </div>
    </section>
    <br />
    <br />
<asp:ListView ID="listaProducto" runat="server"
             GroupItemCount="3"
             ItemType="SunshineEntidades.Producto"
             SelectMethod="listaProductos_GetData"
             >
             <%-- No hay datos --%>
        <EmptyDataTemplate>
            <div class="col-lg-4">
                No hay datos
            </div>
        </EmptyDataTemplate>
             <%-- Item es vacío --%>
        <EmptyItemTemplate>
            <div class="card text-center border-primary mb-4">
            </div>
        </EmptyItemTemplate>
             <%-- Fila o grupo --%>
        <GroupTemplate>
            <div class="row">
                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
            </div>
        </GroupTemplate>
             <%-- Información de cada item --%>
        <ItemTemplate>
            <div class="col-lg-4">
            <div class="card text-center border-primary mb-4">
                <div class="card-body" runat="server">
					<asp:Image ID="ImgP" class="card-title" runat="server" ImageUrl="<%#: Item.imagen%>" Width="200" Height="200"></asp:Image>
                    <h5 class="card-title"><%#: Item.nombre %></h5>
                   <asp:Button CssClass="btn btn-main mt-20" ID="btnVer" Text="Ver" runat="server" CommandArgument="<%#: Item.id%>" OnCommand="btnVer_Command"/>
                    <br /><br />
                </div>                        
            </div>
                </div>
        </ItemTemplate>
             <%-- Plantilla del contenido --%>
        <LayoutTemplate>
            <div class="container">
                <asp:PlaceHolder ID="groupPlaceHolder" runat="server"></asp:PlaceHolder>
            </div>
        </LayoutTemplate>
    </asp:ListView>
    
<%--    </form>--%></asp:Content>
