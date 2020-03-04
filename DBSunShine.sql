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

create table Canton
(
COD_PROVINCIA FLOAT not null,
COD_CANTON FLOAT NOT NULL,
DSC_CANTON NVARCHAR(255),
LOG_ACTIVO FLOAT not null
)

Alter table Canton add constraint PK_Canton primary key (COD_PROVINCIA, COD_CANTON);

create table Usuario
(
ID int identity not null,
TIPOUSUARIO nvarchar(20) not null,
EMAIL nvarchar(50) not null,
CONTRASENNA NVARCHAR(50) NOT NULL,
NOMBREUSUARIO nvarchar(20) not null,
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
ID int identity not null,
NOMBRECOMPLETO nvarchar(50) not null,
FECHANACIMIENTO datetime not null,
IDENTIFICACIÓN nvarchar(15) not null,
IDTIPOIDENTIFICACION int not null,
TARJETACREDITO nvarchar(20) not null,
IDUSUARIO INT NOT NULL
)
Alter table Cliente add constraint PK_Cliente primary key (Id);
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
Imagen nvarchar(255) not null

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
IDCLIENTE int not null,
TOTAL int not null,
IDDETPEDIDO int not null
)
Alter table EncaPedido add constraint PK_EncaPedido primary key (Id);
Alter table EncaPedido add constraint FK_EncaPedido_DetPedido foreign key (IdDetPedido) references DetPedido (Id);
Alter table EncaPedido add constraint Fk_EncaPedido_Cliente foreign key (IDCLIENTE) references Cliente (id);

create table Nivel
(
ID int identity not null,
NOMBRE nvarchar(20) not null,
DESCRIPCION nvarchar(50) not null,
MONTOMETA INT not null
)
Alter table Nivel add constraint PK_Nivel primary key (Id);

create table ClienteNivel
(
ID int identity not null,
IDCLIENTE int not null,
MONTOACTUAL int not null,
IDNIVEL int not null
)
Alter table ClienteNivel add constraint PK_ClienteNivel primary key (Id);
Alter table ClienteNivel add constraint FK_ClienteNivel_Cliente foreign key (IdCliente) references Cliente (Id);
Alter table ClienteNivel add constraint FK_ClienteNivel_Nivel foreign key (IdNivel) references Nivel (Id);

create table Cupon
(
ID int identity not null,
NOMBRE nvarchar(25) not null,
DESCRIPCION nvarchar(100) not null,
ESTADO bit not null,
DESCUENTO INT not null,
IDNIVEL int not null
)
Alter table Cupon add constraint PK_Cupon primary key (Id);
Alter Table Cupon add constraint FK_Cupon_Nivel foreign key (IdNivel) references Nivel (Id);

create table ClienteCupon
(
ID INT IDENTITY NOT NULL,
IDCLIENTE INT NOT NULL,
IDCUPON INT NOT NULL,
CODIGO_QR NVARCHAR(255) NOT NULL
)
Alter table ClienteCupon add constraint PK_ClienteCupon primary key (id);
Alter table clienteCupon add constraint FK_ClienteCupon_Cliente foreign key (IDCLIENTE) references Cliente (id);
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
COD_CANTON FLOAT NOT NULL,
OTRASSENNAS NVARCHAR(300) NOT NULL,
CODIGO_POSTAL NVARCHAR(10) NOT NULL,
IDCLIENTE INT NOT NULL
)
Alter table Direccion add constraint PK_Direccion primary key (id);
Alter table Direccion add constraint FK_Direccion_Provincia foreign key (COD_PROVINCIA) references Provincia (COD_PROVINCIA);
Alter table Direccion add constraint FK_Direccion_Cliente foreign key (IDCLIENTE) references Cliente (id);

--la llave para conton es compuesta... entonces, no pude hacer la llave foranea
Alter table Direccion add constraint FK_Direccion_Canton foreign key (COD_CANTON, COD_PROVINCIA) references Canton;