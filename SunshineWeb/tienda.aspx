<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="tienda.aspx.cs" Inherits="SunshineWeb.tienda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                    <h5 class="card-title"><%#: Item.descripcion %></h5>
                   <asp:Label ID="precio" Text="Precio: " runat="server"> <p class="card-text"><%# Eval("precio","{0:0}Colones")%></p></asp:Label>
					<asp:Label ID="talla" Text="Tallas: " runat="server"><h5 class="card-title"><%#: Item.talla %></h5></asp:Label>     
                    
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
</asp:Content>
