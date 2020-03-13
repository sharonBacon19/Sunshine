USE [master]
GO
/****** Object:  Database [bicicletas]    Script Date: 10/2/2020 15:01:01 ******/
CREATE DATABASE [SunShine]
 CONTAINMENT = NONE
 GO
ALTER DATABASE [SunShine] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SunShine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SunShine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SunShine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SunShine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SunShine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SunShine] SET ARITHABORT OFF 
GO
ALTER DATABASE [SunShine] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SunShine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SunShine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SunShine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SunShine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SunShine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SunShine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SunShine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SunShine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SunShine] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SunShine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SunShine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SunShine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SunShine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SunShine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SunShine] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SunShine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SunShine] SET RECOVERY FULL 
GO
ALTER DATABASE [SunShine] SET  MULTI_USER 
GO
ALTER DATABASE [SunShine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SunShine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SunShine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SunShine] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SunShine] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SunShine', N'ON'
GO
ALTER DATABASE [bicicletas] SET QUERY_STORE = OFF
GO
USE [SunShine]
GO
/****** Object:  Table [dbo].[alquilerBicicleta]    Script Date: 10/2/2020 15:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Creación de tablas
create table Genero
(
ID int identity not null,
NOMBRE nvarchar(10) not null,
ESTADO bit not null
)
Alter table Genero add constraint PK_Genero primary key (Id);

--create table Estacion
--(
--ID int identity not null,
--TIPOESTACION nvarchar(20) not null,
--ESTADO bit not null
--)
--Alter table Estacion add constraint PK_Estacion primary key (Id);

create table TipoPrenda
(
ID int identity not null,
DESCRIPCION nvarchar(20) not null,
ESTADO bit not null
)
Alter table TipoPrenda add constraint PK_TipoPrenda primary key (Id);

create table Provincia
(
COD_PROVINCIA FLOAT not null,
DSC_CORTA_PROVINCIA NVARCHAR(255) not null,
DSC_PROVINCIA NVARCHAR(255),
LOG_ACTIVO FLOAT not null
)
Alter table Provincia add constraint PK_Provincia primary key (COD_PROVINCIA);

create table Usuario
(
ID int identity not null,
TIPOUSUARIO nvarchar(20) not null,
EMAIL nvarchar(50) not null,
CONTRASENNA NVARCHAR(50) NOT NULL,
ESTADO bit not null
)
Alter table Usuario add constraint PK_Usuario primary key (Id);

create table TipoIdentificacion
(
ID int identity not null,
TIPO nvarchar(20) not null,
ESTADO bit not null
)
Alter table TipoIdentificacion add constraint PK_TipoIdentificacion primary key (Id);

create table Cliente
(
NOMBRECOMPLETO nvarchar(50) not null,
FECHANACIMIENTO datetime not null,
IDENTIFICACION nvarchar(15) not null,
IDTIPOIDENTIFICACION int not null,
TARJETACREDITO nvarchar(20) not null,
IDUSUARIO INT NOT NULL
)
Alter table Cliente add constraint PK_Cliente primary key (IDENTIFICACION);
Alter table Cliente add constraint FK_Cliente_TipoIdentificacion foreign key (IdTipoIdentificacion) references TipoIdentificacion (Id);
Alter table Cliente add constraint Fk_Cliente_USuario foreign key (idusuario) references Usuario (id);

create table Producto
(
ID int identity not null,
NOMBRE nvarchar(30) not null,
DESCRIPCION nvarchar(100) not null,
PRECIO INT not null,
TALLA nvarchar(4) not null,
IDGENERO int not null,
IDTIPOPRENDA int not null,
IMAGEN nvarchar(255) not null

)
Alter table Producto add constraint PK_Producto primary key (Id);
Alter table Producto add constraint FK_Producto_Genero foreign key (IdGenero) references Genero (Id);
Alter table Producto add constraint FK_Producto_TipoPrenda foreign key (IdTipoPrenda) references TipoPrenda (Id);

create table DetPedido
(
ID int identity not null,
CANTIDAD int not null,
IDPRODUCTO int not null,
SUBTOTAL INT not null,
FECHAPEDIDO datetime not null
)
Alter table DetPedido add constraint PK_DetPedido primary key (Id);
Alter table DetPedido add constraint FK_DetPedido_Producto foreign key (IdProducto) references Producto (Id);

create table EncaPedido
(
ID int identity not null, 
IDCLIENTE nvarchar(15) not null,
TOTAL int not null,
IDDETPEDIDO int not null
)
Alter table EncaPedido add constraint PK_EncaPedido primary key (Id);
Alter table EncaPedido add constraint FK_EncaPedido_DetPedido foreign key (IdDetPedido) references DetPedido (Id);
Alter table EncaPedido add constraint Fk_EncaPedido_Cliente foreign key (IDCLIENTE) references Cliente (IDENTIFICACION);

create table Nivel
(
ID int identity not null,
NOMBRE nvarchar(20) not null,
DESCRIPCION nvarchar(50) not null,
MONTOMETA INT not null,
IMAGEN NVARCHAR(255) NOT NULL
)
Alter table Nivel add constraint PK_Nivel primary key (Id);

create table ClienteNivel
(
ID int identity not null,
IDCLIENTE nvarchar(15) not null,
MONTOACTUAL int not null,
IDNIVEL int not null
)
Alter table ClienteNivel add constraint PK_ClienteNivel primary key (Id);
Alter table ClienteNivel add constraint FK_ClienteNivel_Cliente foreign key (IdCliente) references Cliente (IDENTIFICACION);
Alter table ClienteNivel add constraint FK_ClienteNivel_Nivel foreign key (IdNivel) references Nivel (Id);

create table Cupon
(
ID int identity not null,
NOMBRE nvarchar(25) not null,
DESCRIPCION nvarchar(100) not null,
ESTADO bit not null,
DESCUENTO INT not null,
IDNIVEL int not null,
IMAGEN nvarchar(255) not null
)
Alter table Cupon add constraint PK_Cupon primary key (Id);
Alter Table Cupon add constraint FK_Cupon_Nivel foreign key (IdNivel) references Nivel (Id);

create table ClienteCupon
(
ID INT IDENTITY NOT NULL,
IDCLIENTE nvarchar(15) NOT NULL,
IDCUPON INT NOT NULL,
CODIGO_QR int NOT NULL
)
Alter table ClienteCupon add constraint PK_ClienteCupon primary key (id);
Alter table clienteCupon add constraint FK_ClienteCupon_Cliente foreign key (IDCLIENTE) references Cliente (IDENTIFICACION);
Alter table clienteCupon add constraint FK_ClienteCupon_Cupon foreign key (IDCUPON) references Cupon (id);

create table Canje
(
ID INT IDENTITY NOT NULL,
IDPRODUCTO INT NOT NULL,
IDCLIENTECUPON INT NOT NULL
)
Alter table Canje add constraint PK_Canje primary key (id);
Alter table Canje add constraint FK_Canje_Producto foreign key (IDPRODUCTO) references Producto (Id);
ALter table Canje add constraint FK_Canje_ClienteCupon foreign key (IDCLIENTECUPON) references CLIENTECUPON (Id);

create table Direccion
(
ID INT IDENTITY NOT NULL,
COD_PROVINCIA FLOAT NOT NULL,
OTRASSENNAS NVARCHAR(300) NOT NULL,
CODIGO_POSTAL NVARCHAR(10) NOT NULL,
IDCLIENTE nvarchar(15) NOT NULL
)
Alter table Direccion add constraint PK_Direccion primary key (id);
Alter table Direccion add constraint FK_Direccion_Provincia foreign key (COD_PROVINCIA) references Provincia (COD_PROVINCIA);
Alter table Direccion add constraint FK_Direccion_Cliente foreign key (IDCLIENTE) references Cliente (IDENTIFICACION);

--procedure
create procedure [PA_ListaCanje]
as
begin
	select * from Canje
end

create procedure [PA_ListaCliente]
as
begin
	select * from Cliente
end

create procedure [PA_ListaCLienteCupon]
as
begin
	select * from ClienteCupon
end

create procedure [PA_ListaClienteNivel]
as
begin
	select * from ClienteNivel
end

create procedure [PA_ListaCupon]
as
begin
	select * from Cupon
end

create procedure [PA_ListaDetPedido]
as
begin
	select * from DetPedido
end

create procedure [PA_ListaDireccion]
as
begin
	select * from Direccion
end

create procedure [PA_ListaEncaPedido]
as
begin
	select * from EncaPedido
end

create procedure [PA_ListaGenero]
as
begin
	select * from Genero
end

create procedure [PA_ListaNivel]
as
begin
	select * from Nivel
end

create procedure [PA_ListaProducto]
as
begin
	select * from Producto
end

create procedure [PA_ListaProvincia]
as
begin
	select * from Provincia
end

create procedure [PA_ListaTipoIdentificacion]
as
begin
	select * from TipoIdentificacion
end

create procedure [PA_ListaTipoPrenda]
as
begin
	select * from TipoPrenda
end

create procedure [PA_ListaUsuario]
as
begin
	select * from Usuario
end

--procedures de insertar
CREATE Procedure Insertar_Cliente
(
 @NOMBRECOMPLETO NVARCHAR(50),
 @FECHANACIMIENTO DATETIME ,
 @IDENTIFICACION NVARCHAR(15),
 @IDTIPOIDENTIFICACION int,
 @TARJETACREDITO NVARCHAR(20),
 @IDUSUARIO INT
)
as
begin
 insert into Cliente (NOMBRECOMPLETO, FECHANACIMIENTO, IDENTIFICACION, IDTIPOIDENTIFICACION, TARJETACREDITO, IDUSUARIO)
 values (@NOMBRECOMPLETO, @FECHANACIMIENTO, @IDENTIFICACION, @IDTIPOIDENTIFICACION, @TARJETACREDITO, @IDUSUARIO)
end
GO

CREATE Procedure Insertar_DetPedido
(
 @CANTIDAD INT,
 @IDPRODUCTO INT ,
 @SUBTOTAL INT,
 @FECHAPEDIDO DATETIME
)
as
begin
 insert into DetPedido (CANTIDAD, IDPRODUCTO, SUBTOTAL, FECHAPEDIDO)
 values (@CANTIDAD, @IDPRODUCTO, @SUBTOTAL, @FECHAPEDIDO)
end
GO

CREATE Procedure Insertar_EncaPedido
(
 @IDCLIENTE nvarchar(15),
 @TOTAL INT ,
 @IDDETPEDIDO INT
)
as
begin
 insert into EncaPedido(IDCLIENTE, IDDETPEDIDO, TOTAL)
 values (@IDCLIENTE, @IDDETPEDIDO, @TOTAL)
end
GO

CREATE Procedure Insertar_Canje
(
 @IDPRODUCTO INT,
 @IDCLIENTECUPON INT
)
as
begin
 insert into Canje(IDPRODUCTO, IDCLIENTECUPON)
 values (@IDPRODUCTO, @IDCLIENTECUPON)
end
GO

CREATE Procedure Insertar_ClienteCupon
(
 @IDCLIENTE nvarchar(15),
 @IDCUPON INT ,
 @CODIGO_QR int
)
as
begin
 insert into ClienteCupon(IDCLIENTE, IDCUPON, CODIGO_QR)
 values (@IDCLIENTE, @IDCUPON, @CODIGO_QR)
end
GO

CREATE Procedure Insertar_ClienteNivel
(
 @IDCLIENTE nvarchar(15),
 @MONTOACTUAL INT,
 @IDNIVEL INT
)
as
begin
 insert into ClienteNivel(IDCLIENTE, IDNIVEL, MONTOACTUAL)
 values (@IDCLIENTE, @IDNIVEL, @MONTOACTUAL)
end
GO

CREATE Procedure Insertar_Direccion
(
 @COD_PROVINCIA FLOAT,
 @OTRASSENNAS NVARCHAR(300),
 @CODIGO_POSTAL NVARCHAR(10),
 @IDCLIENTE nvarchar(15)
)
as
begin
 insert into Direccion(COD_PROVINCIA, CODIGO_POSTAL, IDCLIENTE,OTRASSENNAS)
 values (@COD_PROVINCIA, @CODIGO_POSTAL, @IDCLIENTE, @OTRASSENNAS)
end
GO

create procedure Insertar_Usuario
(
@TIPOUSUAIO NVARCHAR(20),
@EMAIL NVARCHAR(50),
@CONSTRASENNA NVARCHAR(50),
@ESTADO BIT
)
AS
BEGIN
INSERT INTO Usuario (TIPOUSUARIO,EMAIL, CONTRASENNA, ESTADO) 
VALUES (@TIPOUSUAIO, @EMAIL, @CONSTRASENNA, @ESTADO)
END
GO

insert into TipoIdentificacion (TIPO, ESTADO) values ('Cédula', 1);
insert into TipoIdentificacion (TIPO, ESTADO) values ('Carné de refugiado', 1);
insert into TipoIdentificacion (TIPO, ESTADO) values ('Cédula de residencia', 1);
insert into TipoIdentificacion (TIPO, ESTADO) values ('Pasaporte', 1);

insert into Nivel (NOMBRE, DESCRIPCION, MONTOMETA, IMAGEN) values ('Bronce', 'Primera etapa', 0, 'images\imagenes\bronce.png');
insert into Nivel (NOMBRE, DESCRIPCION, MONTOMETA, IMAGEN) values ('Plata', 'Segunda etapa', 40000, 'images\imagenes\plata.png');
insert into Nivel (NOMBRE, DESCRIPCION, MONTOMETA, IMAGEN) values ('Oro', 'Tercera etapa', 70000, 'images\imagenes\oro.png');
insert into Nivel (NOMBRE, DESCRIPCION, MONTOMETA, IMAGEN) values ('Diamante', 'Cuarta etapa', 120000, 'images\imagenes\diamante.png');

insert into Cupon (NOMBRE, DESCRIPCION, DESCUENTO, IDNIVEL, ESTADO, IMAGEN) values ('Concha', 'Se le descontará un 10% del precio del producto', 10, 1, 1, 'images\imagenes\concha.png');
insert into Cupon (NOMBRE, DESCRIPCION, DESCUENTO, IDNIVEL, ESTADO, IMAGEN) values ('Coral', 'Se le descontará un 20% del precio del producto', 20, 2, 1, 'images\imagenes\coral.png');
insert into Cupon (NOMBRE, DESCRIPCION, DESCUENTO, IDNIVEL, ESTADO, IMAGEN) values ('Caballito', 'Se le descontará un 30% del precio del producto', 30, 3, 1, 'images\imagenes\caballito.png');
insert into Cupon (NOMBRE, DESCRIPCION, DESCUENTO, IDNIVEL, ESTADO, IMAGEN) values ('Tsunami', 'Se le descontará un 40% del precio del producto', 50, 4, 1,'images\imagenes\tsunami.png');

insert into Genero (NOMBRE, ESTADO) values ('Mujer', 1);
insert into Genero (NOMBRE, ESTADO) values ('Hombre', 1);

insert into TipoPrenda (DESCRIPCION, ESTADO) values ('Bikinis', 1);
insert into TipoPrenda (DESCRIPCION, ESTADO) values ('Pantalonetas', 1);
insert into TipoPrenda (DESCRIPCION, ESTADO) values ('Infladores', 1);
insert into TipoPrenda (DESCRIPCION, ESTADO) values ('Accesorios', 1);


insert into Producto(NOMBRE, DESCRIPCION, PRECIO, TALLA, IDGENERO, IDTIPOPRENDA,IMAGEN) 
values ('Bikini', 'Conjunto de traje de baño con diseño único', 20000, 'M, L', 1, 1, 'images\imagenes\bikini3.jpg');
insert into Producto (NOMBRE, DESCRIPCION, PRECIO, TALLA, IDGENERO, IDTIPOPRENDA,IMAGEN) 
values ('Bikini', 'Diseño de los 50, disponible sólo en el color de la imagen', 20000, 'S, M', 1, 1, 'images\imagenes\Bikini4.jpg');
insert into Producto (NOMBRE, DESCRIPCION, PRECIO, TALLA, IDGENERO, IDTIPOPRENDA,IMAGEN) 
values ('Bikini', 'Diseño de los 50, disponible sólo en el color de la imagen', 22000, 'S, M', 1, 1, 'images\imagenes\Bikini5.png');
insert into Producto (NOMBRE, DESCRIPCION, PRECIO, TALLA, IDGENERO, IDTIPOPRENDA,IMAGEN) 
values ('Bikini', 'Conjunto de 2 piezas, tela de licra', 22000, 'S, M', 1, 1, 'images\imagenes\Bikini6.jpg');
insert into Producto (NOMBRE, DESCRIPCION, PRECIO, TALLA, IDGENERO, IDTIPOPRENDA,IMAGEN) 
values ('Pantaloneta', 'Prenda con elástico y cordón para ajustar al gusto', 15000, 'M, L', 2, 2, 'images\imagenes\Bikini18.jpg');
insert into Producto (NOMBRE, DESCRIPCION, PRECIO, TALLA, IDGENERO, IDTIPOPRENDA,IMAGEN) 
values ('Short Corto', 'Short cortos, tela punto licra', 17000, 'S, M', 2, 2, 'images\imagenes\BikiniH11.jpg');
insert into Producto (NOMBRE, DESCRIPCION, PRECIO, TALLA, IDGENERO, IDTIPOPRENDA,IMAGEN) 
values ('Short Corto', 'Short cortos, tela punto licra, disponible sólo en el color de la imagen', 15000, 'M, L', 2, 2, 'images\imagenes\BikiniH14.jpg');
insert into Producto (NOMBRE, DESCRIPCION, PRECIO, TALLA, IDGENERO, IDTIPOPRENDA,IMAGEN) 
values ('Bermuda', 'Con elástico y cordón para ajustar a gusto', 12000, 'S, M', 2, 2, 'images\imagenes\BikiniH15.jpg');
insert into Producto (NOMBRE, DESCRIPCION, PRECIO, TALLA, IDGENERO, IDTIPOPRENDA,IMAGEN) 
values ('Pantaloneta', 'Con elástico, la tela es respirable', 12000, 'M, L', 2, 2, 'images\imagenes\BikiniH12.jpg');






