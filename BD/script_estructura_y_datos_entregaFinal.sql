USE [master]
GO
/****** Object:  Database [AD2016]    Script Date: 11/21/2016 6:33:25 AM ******/
CREATE DATABASE [AD2016]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AD2016', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AD2016.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AD2016_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AD2016_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AD2016] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AD2016].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AD2016] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AD2016] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AD2016] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AD2016] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AD2016] SET ARITHABORT OFF 
GO
ALTER DATABASE [AD2016] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AD2016] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AD2016] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AD2016] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AD2016] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AD2016] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AD2016] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AD2016] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AD2016] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AD2016] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AD2016] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AD2016] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AD2016] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AD2016] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AD2016] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AD2016] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AD2016] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AD2016] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AD2016] SET RECOVERY FULL 
GO
ALTER DATABASE [AD2016] SET  MULTI_USER 
GO
ALTER DATABASE [AD2016] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AD2016] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AD2016] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AD2016] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AD2016', N'ON'
GO
USE [AD2016]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[TipoCliente] [char](1) NOT NULL,
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Cuit] [varchar](50) NULL,
	[RazonSocial] [varchar](50) NULL,
	[Apellido] [varchar](200) NULL,
	[Dni] [varchar](8) NULL,
	[Nombre] [varchar](100) NULL,
	[IdDireccion] [int] NULL,
	[IdCuentaCorriente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CondicionesEspecialesVehiculo]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CondicionesEspecialesVehiculo](
	[IdCondicionesEspecialesVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[IdVehiculo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCondicionesEspecialesVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Coordenada]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coordenada](
	[IdCoordenada] [int] IDENTITY(1,1) NOT NULL,
	[Latitud] [varchar](255) NOT NULL,
	[Longitud] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCoordenada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CuentaCorriente]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CuentaCorriente](
	[IdCtaCte] [int] IDENTITY(1,1) NOT NULL,
	[Credito] [float] NOT NULL,
	[FormaPago] [varchar](255) NULL,
	[LimiteCredito] [float] NOT NULL,
	[IdCliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCtaCte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direccion](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[Calle] [varchar](100) NOT NULL,
	[codigoPostal] [int] NOT NULL,
	[Localidad] [varchar](100) NOT NULL,
	[Nro] [int] NOT NULL,
	[IdPais] [int] NOT NULL,
	[IdProvincia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Encomienda]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Encomienda](
	[IdEncomienda] [int] IDENTITY(1,1) NOT NULL,
	[Alto] [float] NULL,
	[Ancho] [float] NULL,
	[ApellidoReceptor] [varchar](100) NOT NULL,
	[Apilable] [bit] NULL,
	[CantApilable] [smallint] NULL,
	[CargaGranel] [varchar](100) NULL,
	[CondicionTransporte] [varchar](50) NULL,
	[DniReceptor] [varchar](8) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaEstimadaEntrega] [datetime] NULL,
	[Fragilidad] [varchar](20) NULL,
	[IndicacionesManipulacion] [varchar](1000) NULL,
	[Internacional] [bit] NULL,
	[Largo] [float] NULL,
	[NombreReceptor] [varchar](100) NOT NULL,
	[Peso] [float] NULL,
	[Refrigerado] [bit] NULL,
	[ServicioSeguridad] [varbinary](255) NULL,
	[Tercerizado] [bit] NOT NULL,
	[TipoEncomienda] [varchar](2) NOT NULL,
	[Tratamiento] [varchar](50) NULL,
	[UnidadGranel] [varchar](25) NULL,
	[Volumen] [float] NULL,
	[VolumenGranel] [float] NULL,
	[IdCliente] [int] NOT NULL,
	[IdDireccionDestino] [int] NULL,
	[IdDireccionOrigen] [int] NULL,
	[IdSucursalActual] [int] NULL,
	[IdSucursalDestino] [int] NOT NULL,
	[IdSucursalOrigen] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEncomienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EncomiendaEnvio]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EncomiendaEnvio](
	[idEnvio] [int] NOT NULL,
	[idEncomienda] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Envio]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Envio](
	[IdEnvio] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](20) NOT NULL,
	[FechaActualizacion] [datetime] NULL,
	[FechaLlegadaEstimada] [datetime] NOT NULL,
	[FechaSalida] [datetime] NOT NULL,
	[NroTracking] [int] NULL,
	[Propio] [bit] NOT NULL,
	[IdMapaDeRuta] [int] NULL,
	[IdCoordenadaActual] [int] NOT NULL,
	[IdProveedor] [int] NULL,
	[IdSucursalDestino] [int] NULL,
	[IdSucursalOrigen] [int] NOT NULL,
	[vehiculo_IdVehiculo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEnvio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnvioHistorico]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnvioHistorico](
	[IdEnvioHistorico] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](20) NOT NULL,
	[FechaActualizacion] [datetime] NULL,
	[IdEnvio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEnvioHistorico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Factura](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[FechaVencimiento] [datetime] NOT NULL,
	[Pagada] [bit] NOT NULL,
	[TipoFactura] [varchar](1) NOT NULL,
	[IdCtaCte] [int] NULL,
	[IdEncomienda] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemFactura]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemFactura](
	[IdItemFactura] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Valor] [float] NOT NULL,
	[IdFactura] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdItemFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemManifiesto]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemManifiesto](
	[IdItemManifiesto] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[IdManifiesto] [int] NULL,
	[IdProducto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdItemManifiesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemRemito]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemRemito](
	[IdItemRemito] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[IdProducto] [int] NULL,
	[IdRemito] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdItemRemito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manifiesto]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manifiesto](
	[IdManifiesto] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IdEncomienda] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdManifiesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MapaDeRuta]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MapaDeRuta](
	[IdMapaDeRuta] [int] IDENTITY(1,1) NOT NULL,
	[CantKm] [float] NULL,
	[costo] [float] NULL,
	[Duracion] [float] NULL,
	[IdSucursalDestino] [int] NULL,
	[IdSucursalOrigen] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMapaDeRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MapaDeRutaCoordenada]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MapaDeRutaCoordenada](
	[IdMapaDeRuta] [int] NOT NULL,
	[IdCoordenada] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pais]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pais](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PlanMantenimiento]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PlanMantenimiento](
	[IdPlanMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[Comentarios] [varchar](255) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPlanMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [varchar](255) NULL,
	[CodigoProducto] [varchar](255) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Unidad] [varchar](255) NOT NULL,
	[IdCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductoEncomienda]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoEncomienda](
	[IdProductoEncomienda] [int] IDENTITY(1,1) NOT NULL,
	[cantidad] [float] NOT NULL,
	[IdEncomienda] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProductoEncomienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Activo] [varchar](1) NOT NULL,
	[Cuit] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[RazonSocial] [varchar](50) NOT NULL,
	[EsTallerOficial] [bit] NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Tipo] [char](1) NULL,
	[IdDireccion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincia](
	[IdProvincia] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[IdPais] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Remito]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Remito](
	[IdRemito] [int] IDENTITY(1,1) NOT NULL,
	[ApellidoReceptor] [varchar](100) NOT NULL,
	[CondicionTransporte] [varchar](255) NULL,
	[Conformado] [bit] NOT NULL,
	[DniReceptor] [varchar](8) NOT NULL,
	[FechaConformado] [datetime] NOT NULL,
	[FechaEstimadaEntrega] [datetime] NULL,
	[IndicacionesManipulacion] [varchar](255) NULL,
	[NombreReceptor] [varchar](100) NOT NULL,
	[IdEncomienda] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRemito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Seguro]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seguro](
	[IdSeguro] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Tarifa] [float] NULL,
	[TarifaPorKm] [float] NULL,
	[TipoSeguro] [varchar](255) NULL,
	[idProveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSeguro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServicioSeguridad]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServicioSeguridad](
	[IdServicioSeguridad] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Tarifa] [float] NULL,
	[idProveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdServicioSeguridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Telefono] [varchar](255) NULL,
	[Coordenada] [int] NULL,
	[IdDireccion] [int] NOT NULL,
	[IdGerente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TareaMantenimiento]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TareaMantenimiento](
	[Tipo] [char](1) NOT NULL,
	[IdTareaMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[Tarea] [varchar](255) NOT NULL,
	[CantidadDias] [int] NULL,
	[CantidadKilometros] [float] NULL,
	[IdPlanMantenimiento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTareaMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TareaMantenimientoRealizada]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TareaMantenimientoRealizada](
	[IdTareaMantenimientoRealizada] [int] IDENTITY(1,1) NOT NULL,
	[CantidadKilometros] [float] NULL,
	[FechaRealizada] [datetime] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[IdTareaMantenimiento] [int] NOT NULL,
	[IdVehiculo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTareaMantenimientoRealizada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TarifasCarrier]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TarifasCarrier](
	[IdTarifasCarrier] [int] IDENTITY(1,1) NOT NULL,
	[Ciudad] [varchar](255) NULL,
	[Comentarios] [varchar](255) NULL,
	[PrecioKMExtra] [float] NULL,
	[Prioridad] [varchar](255) NULL,
	[Tarifa] [float] NULL,
	[IdSucursal] [int] NULL,
	[IdPais] [int] NULL,
	[idProveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTarifasCarrier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Dni] [varchar](8) NOT NULL,
	[fechaCreacion] [datetime] NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Password] [varchar](255) NULL,
	[UltimoAcceso] [datetime] NULL,
	[usuario] [varchar](255) NULL,
	[IdRolUsuario] [int] NULL,
	[IdSucursal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioRol]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioRol](
	[Usuario] [int] NOT NULL,
	[IdRol] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 11/21/2016 6:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[IdVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[FechaIngreso] [datetime] NOT NULL,
	[Alto] [float] NULL,
	[Ancho] [float] NULL,
	[Anio] [varchar](255) NOT NULL,
	[CondicionTransporte] [varchar](50) NULL,
	[Estado] [varchar](255) NULL,
	[KmRecorridos] [float] NOT NULL,
	[Largo] [float] NULL,
	[Marca] [varchar](100) NOT NULL,
	[Modelo] [varchar](100) NOT NULL,
	[Patente] [varchar](15) NOT NULL,
	[Peso] [float] NULL,
	[Refrigerado] [bit] NULL,
	[Tara] [float] NOT NULL,
	[TemperaturaMax] [float] NULL,
	[TemperaturaMin] [float] NULL,
	[Tipo] [varchar](255) NULL,
	[Volumen] [float] NULL,
	[IdPlanMantenimiento] [int] NULL,
	[idSucursal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([TipoCliente], [IdCliente], [Email], [Estado], [Telefono], [Cuit], [RazonSocial], [Apellido], [Dni], [Nombre], [IdDireccion], [IdCuentaCorriente]) VALUES (N'p', 1, N'a@test.com', 1, N'88337777', NULL, NULL, N'A', N'12345678', N'Cliente A', 8, NULL)
INSERT [dbo].[Cliente] ([TipoCliente], [IdCliente], [Email], [Estado], [Telefono], [Cuit], [RazonSocial], [Apellido], [Dni], [Nombre], [IdDireccion], [IdCuentaCorriente]) VALUES (N'p', 2, N'b@test.com', 1, N'49882233', NULL, NULL, N'B', N'23456789', N'Cliente B', 9, NULL)
INSERT [dbo].[Cliente] ([TipoCliente], [IdCliente], [Email], [Estado], [Telefono], [Cuit], [RazonSocial], [Apellido], [Dni], [Nombre], [IdDireccion], [IdCuentaCorriente]) VALUES (N'e', 3, N'info@abc.om', 1, N'47654536', N'27555555559', N'ABC Informatica', NULL, NULL, NULL, 19, 3)
INSERT [dbo].[Cliente] ([TipoCliente], [IdCliente], [Email], [Estado], [Telefono], [Cuit], [RazonSocial], [Apellido], [Dni], [Nombre], [IdDireccion], [IdCuentaCorriente]) VALUES (N'e', 4, N'info@match.com', 1, N'43335552', N'2788887779', N'Match SR', NULL, NULL, NULL, 11, 2)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Coordenada] ON 

INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (1, N'1', N'2')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (2, N'1', N'2')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (3, N'8', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (4, N'11', N'12')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (5, N'15', N'16')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (6, N'20', N'21')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (7, N'2', N'1')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (8, N'3', N'2')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (9, N'4', N'3')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (10, N'5', N'4')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (11, N'6', N'5')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (12, N'7', N'6')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (13, N'8', N'7')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (14, N'9', N'8')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (15, N'11', N'12')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (16, N'2', N'1')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (17, N'3', N'2')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (18, N'4', N'3')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (19, N'6', N'5')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (20, N'7', N'6')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (21, N'9', N'8')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (22, N'1', N'2')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (23, N'2', N'3')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (24, N'3', N'4')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (25, N'4', N'5')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (26, N'5', N'6')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (27, N'6', N'7')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (28, N'8', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (29, N'1', N'2')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (30, N'2', N'3')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (31, N'3', N'4')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (32, N'4', N'5')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (33, N'5', N'6')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (34, N'6', N'7')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (35, N'8', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (36, N'1', N'2')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (37, N'45', N'55')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (38, N'2', N'3')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (39, N'3', N'4')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (40, N'4', N'5')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (41, N'5', N'6')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (42, N'6', N'7')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (43, N'8', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (44, N'1', N'2')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (45, N'45', N'55')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (46, N'2', N'3')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (47, N'3', N'4')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (48, N'4', N'5')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (49, N'5', N'6')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (50, N'6', N'7')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (51, N'8', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (52, N'9', N'10')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (53, N'1', N'2')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (54, N'2', N'3')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (55, N'3', N'4')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (56, N'4', N'5')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (57, N'5', N'6')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (58, N'6', N'7')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (59, N'8', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (60, N'9', N'10')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (61, N'1', N'2')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (62, N'2', N'3')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (63, N'3', N'4')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (64, N'4', N'5')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (65, N'5', N'6')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (66, N'6', N'7')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (67, N'7', N'8')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (68, N'8', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (69, N'9', N'10')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (70, N'11', N'12')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (71, N'1', N'2')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (72, N'2', N'3')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (73, N'3', N'4')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (74, N'4', N'5')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (75, N'5', N'6')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (76, N'6', N'7')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (77, N'7', N'8')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (78, N'9', N'10')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (79, N'10', N'11')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (80, N'1', N'2')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (81, N'2', N'3')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (82, N'3', N'4')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (83, N'4', N'5')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (84, N'5', N'6')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (85, N'6', N'7')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (86, N'7', N'8')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (87, N'8', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (88, N'1', N'2')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (89, N'13', N'14')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (90, N'3', N'5')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (91, N'15', N'16')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (92, N'5', N'7')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (93, N'7', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (94, N'10', N'11')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (95, N'11', N'11')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (96, N'1', N'2')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (97, N'2', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (98, N'3', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (99, N'14', N'11')
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (100, N'5', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (101, N'17', N'14')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (102, N'7', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (103, N'20', N'21')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (104, N'11', N'12')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (105, N'12', N'13')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (106, N'13', N'14')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (107, N'14', N'15')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (108, N'15', N'16')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (109, N'11', N'12')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (110, N'13', N'14')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (111, N'14', N'15')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (112, N'15', N'16')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (113, N'8', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (114, N'9', N'10')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (115, N'10', N'11')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (116, N'14', N'15')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (117, N'16', N'18')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (118, N'18', N'21')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (119, N'8', N'9')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (120, N'20', N'21')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (121, N'10', N'12')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (122, N'11', N'12')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (123, N'12', N'13')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (124, N'13', N'14')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (125, N'14', N'15')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (126, N'15', N'16')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (127, N'11', N'12')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (128, N'12', N'14')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (129, N'14', N'15')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (130, N'17', N'19')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (131, N'20', N'21')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (132, N'15', N'16')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (133, N'16', N'17')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (134, N'18', N'19')
INSERT [dbo].[Coordenada] ([IdCoordenada], [Latitud], [Longitud]) VALUES (135, N'20', N'21')
SET IDENTITY_INSERT [dbo].[Coordenada] OFF
SET IDENTITY_INSERT [dbo].[CuentaCorriente] ON 

INSERT [dbo].[CuentaCorriente] ([IdCtaCte], [Credito], [FormaPago], [LimiteCredito], [IdCliente]) VALUES (1, 0, N'Transferencia Bancaria', 10000, NULL)
INSERT [dbo].[CuentaCorriente] ([IdCtaCte], [Credito], [FormaPago], [LimiteCredito], [IdCliente]) VALUES (2, 0, N'30 dias', 20000, NULL)
INSERT [dbo].[CuentaCorriente] ([IdCtaCte], [Credito], [FormaPago], [LimiteCredito], [IdCliente]) VALUES (3, 0, N'Contado', 10000, NULL)
SET IDENTITY_INSERT [dbo].[CuentaCorriente] OFF
SET IDENTITY_INSERT [dbo].[Direccion] ON 

INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (1, N'Lima 775', 1073, N'Capital Federal', 775, 1, 6)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (2, N'Lima 775', 1073, N'Capital Federal', 0, 1, 6)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (3, N'Av Rivadavia 123', 1234, N'Capital', 0, 1, 3)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (4, N'Av Belgrano 333', 999, N'Capital', 0, 1, 4)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (5, N'Av San Martin 222', 4443, N'Capital', 0, 1, 2)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (6, N'Av San Martin 323', 883, N'Capital', 0, 1, 11)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (7, N'Uspallata 123', 1437, N'Capital', 0, 1, 11)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (8, N'Pichincha 1050', 1219, N'Capital Federal', 0, 1, 1)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (9, N'Uspallata 1223', 1437, N'Capital Federal', 0, 1, 1)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (11, N'Av Rivadavia 999', 2837, N'Capital Federal', 0, 1, 1)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (12, N'Av Jujuy 383', 2122, N'Capital Federal', 0, 1, 1)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (15, N'Av Jujuy 121', 2122, N'Capital Federal', 0, 1, 1)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (17, N'Tucuman 212', 2991, N'Capital Federal', 0, 1, 1)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (18, N'Av Saenz 226', 1212, N'Capital Federal', 0, 1, 1)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [codigoPostal], [Localidad], [Nro], [IdPais], [IdProvincia]) VALUES (19, N'Lima 232', 3339, N'Capital Federal', 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Direccion] OFF
SET IDENTITY_INSERT [dbo].[Encomienda] ON 

INSERT [dbo].[Encomienda] ([IdEncomienda], [Alto], [Ancho], [ApellidoReceptor], [Apilable], [CantApilable], [CargaGranel], [CondicionTransporte], [DniReceptor], [Estado], [FechaCreacion], [FechaEstimadaEntrega], [Fragilidad], [IndicacionesManipulacion], [Internacional], [Largo], [NombreReceptor], [Peso], [Refrigerado], [ServicioSeguridad], [Tercerizado], [TipoEncomienda], [Tratamiento], [UnidadGranel], [Volumen], [VolumenGranel], [IdCliente], [IdDireccionDestino], [IdDireccionOrigen], [IdSucursalActual], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (1, 20, 10, N'Suarez', 1, 10, NULL, N'', N'29876543', N'Colocada', CAST(0x0000A6C200FF873A AS DateTime), CAST(0x0000A6C4007BB13B AS DateTime), NULL, NULL, 0, 20, N'Angel', 25, 0, NULL, 0, N'P', NULL, NULL, 0.0039999997243285179, 0, 1, NULL, NULL, 1, 5, 1)
INSERT [dbo].[Encomienda] ([IdEncomienda], [Alto], [Ancho], [ApellidoReceptor], [Apilable], [CantApilable], [CargaGranel], [CondicionTransporte], [DniReceptor], [Estado], [FechaCreacion], [FechaEstimadaEntrega], [Fragilidad], [IndicacionesManipulacion], [Internacional], [Largo], [NombreReceptor], [Peso], [Refrigerado], [ServicioSeguridad], [Tercerizado], [TipoEncomienda], [Tratamiento], [UnidadGranel], [Volumen], [VolumenGranel], [IdCliente], [IdDireccionDestino], [IdDireccionOrigen], [IdSucursalActual], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (2, 50, 100, N'Perez', 1, 10, NULL, N'', N'12342556', N'Colocada', CAST(0x0000A6C201000BA5 AS DateTime), CAST(0x0000A6C4007C35A6 AS DateTime), NULL, NULL, 0, 45, N'Alberto', 7, 0, NULL, 0, N'E', NULL, NULL, 0.22499999403953552, 0, 3, NULL, NULL, 1, 5, 1)
SET IDENTITY_INSERT [dbo].[Encomienda] OFF
INSERT [dbo].[EncomiendaEnvio] ([idEnvio], [idEncomienda]) VALUES (1, 1)
INSERT [dbo].[EncomiendaEnvio] ([idEnvio], [idEncomienda]) VALUES (1, 2)
SET IDENTITY_INSERT [dbo].[Envio] ON 

INSERT [dbo].[Envio] ([IdEnvio], [Estado], [FechaActualizacion], [FechaLlegadaEstimada], [FechaSalida], [NroTracking], [Propio], [IdMapaDeRuta], [IdCoordenadaActual], [IdProveedor], [IdSucursalDestino], [IdSucursalOrigen], [vehiculo_IdVehiculo]) VALUES (1, N'Pendiente', CAST(0x0000A6C201095FE0 AS DateTime), CAST(0x0000A6C400000000 AS DateTime), CAST(0x0000A6C200000000 AS DateTime), NULL, 1, 4, 2, NULL, 5, 1, 1)
SET IDENTITY_INSERT [dbo].[Envio] OFF
SET IDENTITY_INSERT [dbo].[EnvioHistorico] ON 

INSERT [dbo].[EnvioHistorico] ([IdEnvioHistorico], [Estado], [FechaActualizacion], [IdEnvio]) VALUES (1, N'Pendiente', CAST(0x0000A6C20109601B AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[EnvioHistorico] OFF
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([IdFactura], [Fecha], [FechaVencimiento], [Pagada], [TipoFactura], [IdCtaCte], [IdEncomienda]) VALUES (1, CAST(0x0000A6C200FF86E8 AS DateTime), CAST(0x0000A6E000FF86E8 AS DateTime), 0, N'A', NULL, 1)
INSERT [dbo].[Factura] ([IdFactura], [Fecha], [FechaVencimiento], [Pagada], [TipoFactura], [IdCtaCte], [IdEncomienda]) VALUES (2, CAST(0x0000A6C201000B62 AS DateTime), CAST(0x0000A6E001000B62 AS DateTime), 0, N'A', NULL, 2)
SET IDENTITY_INSERT [dbo].[Factura] OFF
SET IDENTITY_INSERT [dbo].[ItemFactura] ON 

INSERT [dbo].[ItemFactura] ([IdItemFactura], [Cantidad], [Descripcion], [Valor], [IdFactura]) VALUES (3, 1, N'Transporte: 1-1-5', 2000, 1)
INSERT [dbo].[ItemFactura] ([IdItemFactura], [Cantidad], [Descripcion], [Valor], [IdFactura]) VALUES (4, 1, N'IVA 21%', 420, 1)
INSERT [dbo].[ItemFactura] ([IdItemFactura], [Cantidad], [Descripcion], [Valor], [IdFactura]) VALUES (5, 1, N'Transporte: 1-1-5', 2000, 1)
INSERT [dbo].[ItemFactura] ([IdItemFactura], [Cantidad], [Descripcion], [Valor], [IdFactura]) VALUES (6, 1, N'IVA 21%', 420, 1)
INSERT [dbo].[ItemFactura] ([IdItemFactura], [Cantidad], [Descripcion], [Valor], [IdFactura]) VALUES (9, 1, N'Transporte: 3-1-5', 2000, 2)
INSERT [dbo].[ItemFactura] ([IdItemFactura], [Cantidad], [Descripcion], [Valor], [IdFactura]) VALUES (10, 1, N'IVA 21%', 420, 2)
SET IDENTITY_INSERT [dbo].[ItemFactura] OFF
SET IDENTITY_INSERT [dbo].[ItemManifiesto] ON 

INSERT [dbo].[ItemManifiesto] ([IdItemManifiesto], [Cantidad], [Descripcion], [IdManifiesto], [IdProducto]) VALUES (2, 1, N'Encomienda: 12345678 - 1 - 5', 2, NULL)
INSERT [dbo].[ItemManifiesto] ([IdItemManifiesto], [Cantidad], [Descripcion], [IdManifiesto], [IdProducto]) VALUES (3, 3, N'Proudcto 1 - Cantidad 3', 3, 1)
INSERT [dbo].[ItemManifiesto] ([IdItemManifiesto], [Cantidad], [Descripcion], [IdManifiesto], [IdProducto]) VALUES (4, 2, N'Proudcto 2 - Cantidad 2', 3, 2)
SET IDENTITY_INSERT [dbo].[ItemManifiesto] OFF
SET IDENTITY_INSERT [dbo].[ItemRemito] ON 

INSERT [dbo].[ItemRemito] ([IdItemRemito], [Cantidad], [Descripcion], [IdProducto], [IdRemito]) VALUES (1, 1, N'Encomienda: 12345678 - 1 - 5', NULL, 1)
INSERT [dbo].[ItemRemito] ([IdItemRemito], [Cantidad], [Descripcion], [IdProducto], [IdRemito]) VALUES (2, 3, N'Proudcto 1 - Cantidad 3', 1, 2)
INSERT [dbo].[ItemRemito] ([IdItemRemito], [Cantidad], [Descripcion], [IdProducto], [IdRemito]) VALUES (3, 2, N'Proudcto 2 - Cantidad 2', 2, 2)
SET IDENTITY_INSERT [dbo].[ItemRemito] OFF
SET IDENTITY_INSERT [dbo].[Manifiesto] ON 

INSERT [dbo].[Manifiesto] ([IdManifiesto], [Fecha], [IdEncomienda]) VALUES (2, CAST(0x0000A6C200FF873B AS DateTime), 1)
INSERT [dbo].[Manifiesto] ([IdManifiesto], [Fecha], [IdEncomienda]) VALUES (3, CAST(0x0000A6C201000BA6 AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Manifiesto] OFF
SET IDENTITY_INSERT [dbo].[MapaDeRuta] ON 

INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (1, 1000, 1200, 8, 2, 1)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (2, 1300, 1500, 10, 3, 1)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (3, 1600, 1600, 14, 4, 1)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (4, 2000, 2000, 16, 5, 1)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (5, 1000, 1000, 8, 3, 2)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (6, 1000, 1000, 8, 4, 2)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (7, 900, 900, 7, 5, 2)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (8, 900, 900, 8, 4, 3)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (9, 1800, 1800, 14, 5, 3)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (10, 1500, 1500, 11, 5, 4)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (11, 1000, 1200, 8, 1, 2)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (12, 1300, 1500, 10, 1, 3)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (13, 1600, 1600, 14, 1, 4)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (14, 2000, 2000, 16, 1, 5)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (15, 1000, 1000, 8, 2, 3)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (16, 1000, 1000, 8, 2, 4)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (17, 900, 900, 7, 2, 5)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (18, 900, 900, 8, 3, 4)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (19, 1800, 1800, 14, 3, 5)
INSERT [dbo].[MapaDeRuta] ([IdMapaDeRuta], [CantKm], [costo], [Duracion], [IdSucursalDestino], [IdSucursalOrigen]) VALUES (20, 1500, 1500, 11, 4, 5)
SET IDENTITY_INSERT [dbo].[MapaDeRuta] OFF
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (1, 80)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (1, 81)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (1, 82)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (1, 83)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (1, 84)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (1, 85)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (1, 86)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (1, 87)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (2, 70)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (2, 71)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (2, 72)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (2, 73)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (2, 74)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (2, 75)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (2, 76)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (3, 88)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (2, 77)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (2, 78)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (2, 79)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (3, 89)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (3, 90)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (3, 91)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (3, 92)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (3, 93)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (3, 94)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (4, 95)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (4, 96)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (4, 97)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (4, 98)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (4, 99)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (4, 100)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (4, 101)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (4, 102)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (4, 103)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (5, 104)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (5, 105)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (5, 106)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (5, 107)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (5, 108)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (6, 109)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (6, 110)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (6, 111)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (6, 112)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (6, 113)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (6, 114)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (6, 115)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (7, 116)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (7, 117)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (7, 118)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (7, 119)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (7, 120)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (7, 121)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (8, 122)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (8, 123)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (8, 124)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (8, 125)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (8, 126)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (9, 127)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (9, 128)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (9, 129)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (9, 130)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (9, 131)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (10, 132)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (10, 133)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (10, 134)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (10, 135)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (11, 80)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (11, 81)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (11, 82)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (11, 83)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (11, 84)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (11, 85)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (11, 86)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (11, 87)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (12, 70)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (12, 71)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (12, 72)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (12, 73)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (12, 74)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (12, 75)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (13, 76)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (13, 88)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (12, 77)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (12, 78)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (12, 79)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (13, 89)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (13, 90)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (13, 91)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (13, 92)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (13, 93)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (13, 94)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (14, 95)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (14, 96)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (14, 97)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (14, 98)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (14, 99)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (14, 100)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (14, 101)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (14, 102)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (14, 103)
GO
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (15, 104)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (15, 105)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (15, 106)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (15, 107)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (15, 108)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (16, 109)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (16, 110)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (16, 111)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (16, 112)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (16, 113)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (16, 114)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (16, 115)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (17, 116)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (17, 117)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (17, 118)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (17, 119)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (17, 120)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (17, 121)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (18, 122)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (18, 123)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (18, 124)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (18, 125)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (18, 126)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (19, 127)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (19, 128)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (19, 129)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (19, 130)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (19, 131)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (20, 132)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (20, 133)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (20, 134)
INSERT [dbo].[MapaDeRutaCoordenada] ([IdMapaDeRuta], [IdCoordenada]) VALUES (20, 135)
SET IDENTITY_INSERT [dbo].[Pais] ON 

INSERT [dbo].[Pais] ([IdPais], [Descripcion]) VALUES (1, N'Argentina')
INSERT [dbo].[Pais] ([IdPais], [Descripcion]) VALUES (2, N'Espana')
INSERT [dbo].[Pais] ([IdPais], [Descripcion]) VALUES (3, N'Francia')
INSERT [dbo].[Pais] ([IdPais], [Descripcion]) VALUES (4, N'Colombia')
INSERT [dbo].[Pais] ([IdPais], [Descripcion]) VALUES (5, N'China')
INSERT [dbo].[Pais] ([IdPais], [Descripcion]) VALUES (6, N'Peru')
INSERT [dbo].[Pais] ([IdPais], [Descripcion]) VALUES (7, N'Mexico')
INSERT [dbo].[Pais] ([IdPais], [Descripcion]) VALUES (8, N'USA')
INSERT [dbo].[Pais] ([IdPais], [Descripcion]) VALUES (9, N'Inglaterra')
INSERT [dbo].[Pais] ([IdPais], [Descripcion]) VALUES (10, N'Italia')
INSERT [dbo].[Pais] ([IdPais], [Descripcion]) VALUES (11, N'Alemania')
INSERT [dbo].[Pais] ([IdPais], [Descripcion]) VALUES (12, N'Japon')
SET IDENTITY_INSERT [dbo].[Pais] OFF
SET IDENTITY_INSERT [dbo].[PlanMantenimiento] ON 

INSERT [dbo].[PlanMantenimiento] ([IdPlanMantenimiento], [Comentarios], [Descripcion]) VALUES (1, N'plan mantenimiento A', N'Plan A')
SET IDENTITY_INSERT [dbo].[PlanMantenimiento] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [Categoria], [CodigoProducto], [Descripcion], [Unidad], [IdCliente]) VALUES (1, N'Informatica', N'Laptop A342', N'portatil liviana', N'Pieza', 3)
INSERT [dbo].[Producto] ([IdProducto], [Categoria], [CodigoProducto], [Descripcion], [Unidad], [IdCliente]) VALUES (2, N'Informatica', N'Laptop 14', N'ABC333', N'Pieza', 3)
INSERT [dbo].[Producto] ([IdProducto], [Categoria], [CodigoProducto], [Descripcion], [Unidad], [IdCliente]) VALUES (3, N'Informatica', N'Laptop 15', N'ABC332', N'Pieza', 3)
INSERT [dbo].[Producto] ([IdProducto], [Categoria], [CodigoProducto], [Descripcion], [Unidad], [IdCliente]) VALUES (4, N'Libreria', N'Cuaderno cuadriculado', N'48 hojas', N'Pieza', 4)
INSERT [dbo].[Producto] ([IdProducto], [Categoria], [CodigoProducto], [Descripcion], [Unidad], [IdCliente]) VALUES (5, N'Libreria', N'Cuaderno a rayas', N'48 hojas', N'Pieza', 4)
INSERT [dbo].[Producto] ([IdProducto], [Categoria], [CodigoProducto], [Descripcion], [Unidad], [IdCliente]) VALUES (6, N'Libreria', N'Folios', N'100', N'Pieza', 4)
INSERT [dbo].[Producto] ([IdProducto], [Categoria], [CodigoProducto], [Descripcion], [Unidad], [IdCliente]) VALUES (7, N'Libreria', N'Cartulina', N'varios colores', N'm', 4)
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[ProductoEncomienda] ON 

INSERT [dbo].[ProductoEncomienda] ([IdProductoEncomienda], [cantidad], [IdEncomienda], [IdProducto]) VALUES (1, 3, 2, 1)
INSERT [dbo].[ProductoEncomienda] ([IdProductoEncomienda], [cantidad], [IdEncomienda], [IdProducto]) VALUES (2, 2, 2, 2)
SET IDENTITY_INSERT [dbo].[ProductoEncomienda] OFF
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([IdProveedor], [Activo], [Cuit], [Email], [RazonSocial], [EsTallerOficial], [Telefono], [Tipo], [IdDireccion]) VALUES (1, N'1', N'12345678', N'tallerOscar@gmail.com', N'Taller Oscar', 1, N'54448888', N'T', 7)
INSERT [dbo].[Proveedor] ([IdProveedor], [Activo], [Cuit], [Email], [RazonSocial], [EsTallerOficial], [Telefono], [Tipo], [IdDireccion]) VALUES (2, N'1', N'2766655558', N'info@aseguradoraa.com', N'Aseguradora A', 0, N'45553377', N'A', 12)
INSERT [dbo].[Proveedor] ([IdProveedor], [Activo], [Cuit], [Email], [RazonSocial], [EsTallerOficial], [Telefono], [Tipo], [IdDireccion]) VALUES (3, N'1', N'2766655554', N'info@nuevocarrier.com', N'Nuevo Carrier', 0, N'47776666', N'C', 15)
INSERT [dbo].[Proveedor] ([IdProveedor], [Activo], [Cuit], [Email], [RazonSocial], [EsTallerOficial], [Telefono], [Tipo], [IdDireccion]) VALUES (4, N'1', N'2765432536', N'info@oopa.com', N'Oopa', 0, N'49112839', N'S', 18)
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (1, N'Buenos Aires', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (2, N'Mendoza', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (3, N'Cordoba', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (4, N'La Pampa', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (5, N'Santa Fe', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (6, N'Capital Federal', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (7, N'La Rioja', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (8, N'Catamarca', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (9, N'Salta', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (10, N'Jujuy', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (11, N'Tucuman', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (12, N'Rio Negro', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (13, N'Tierra del Fuego', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (14, N'Neuquen', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (15, N'Misiones', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (16, N'Entre Rios', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (17, N'Formosa', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (18, N'San Juan', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (19, N'Chubut', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (20, N'Santa Cruz', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (21, N'Santiago del Estero', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (22, N'Chaco', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (23, N'Corrientes', 1)
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdPais]) VALUES (24, N'San Luis', 1)
SET IDENTITY_INSERT [dbo].[Provincia] OFF
SET IDENTITY_INSERT [dbo].[Remito] ON 

INSERT [dbo].[Remito] ([IdRemito], [ApellidoReceptor], [CondicionTransporte], [Conformado], [DniReceptor], [FechaConformado], [FechaEstimadaEntrega], [IndicacionesManipulacion], [NombreReceptor], [IdEncomienda]) VALUES (1, N'Suarez', NULL, 1, N'29876543', CAST(0x0000A6C200FF86E8 AS DateTime), CAST(0x0000A6C4007BB13B AS DateTime), NULL, N'Angel', 1)
INSERT [dbo].[Remito] ([IdRemito], [ApellidoReceptor], [CondicionTransporte], [Conformado], [DniReceptor], [FechaConformado], [FechaEstimadaEntrega], [IndicacionesManipulacion], [NombreReceptor], [IdEncomienda]) VALUES (2, N'Perez', NULL, 1, N'12342556', CAST(0x0000A6C201000BA5 AS DateTime), CAST(0x0000A6C4007C35A6 AS DateTime), NULL, N'Alberto', 2)
SET IDENTITY_INSERT [dbo].[Remito] OFF
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [Descripcion]) VALUES (1, N'ADMINISTRACION')
INSERT [dbo].[Rol] ([IdRol], [Descripcion]) VALUES (2, N'VEHICULOS')
INSERT [dbo].[Rol] ([IdRol], [Descripcion]) VALUES (3, N'ENVIO')
INSERT [dbo].[Rol] ([IdRol], [Descripcion]) VALUES (4, N'ENCOMIENDA')
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[Seguro] ON 

INSERT [dbo].[Seguro] ([IdSeguro], [Descripcion], [Tarifa], [TarifaPorKm], [TipoSeguro], [idProveedor]) VALUES (1, N'Seguro', 110, 0, N'Mercaderia', 2)
SET IDENTITY_INSERT [dbo].[Seguro] OFF
SET IDENTITY_INSERT [dbo].[ServicioSeguridad] ON 

INSERT [dbo].[ServicioSeguridad] ([IdServicioSeguridad], [Descripcion], [Tarifa], [idProveedor]) VALUES (1, N'Servicio Completo', 800, 4)
SET IDENTITY_INSERT [dbo].[ServicioSeguridad] OFF
SET IDENTITY_INSERT [dbo].[Sucursal] ON 

INSERT [dbo].[Sucursal] ([IdSucursal], [Descripcion], [Telefono], [Coordenada], [IdDireccion], [IdGerente]) VALUES (1, N'Sucursal Buenos Aires', N'42223333', 2, 2, 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [Descripcion], [Telefono], [Coordenada], [IdDireccion], [IdGerente]) VALUES (2, N'Sucursal Cordoba', N'44432222', 3, 3, 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [Descripcion], [Telefono], [Coordenada], [IdDireccion], [IdGerente]) VALUES (3, N'Sucursal La Pampa', N'4493333', 4, 4, 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [Descripcion], [Telefono], [Coordenada], [IdDireccion], [IdGerente]) VALUES (4, N'Sucursal Mendoza', N'33332222', 5, 5, 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [Descripcion], [Telefono], [Coordenada], [IdDireccion], [IdGerente]) VALUES (5, N'Sucursal Tucuman', N'29993333', 6, 6, 1)
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
SET IDENTITY_INSERT [dbo].[TareaMantenimiento] ON 

INSERT [dbo].[TareaMantenimiento] ([Tipo], [IdTareaMantenimiento], [Tarea], [CantidadDias], [CantidadKilometros], [IdPlanMantenimiento]) VALUES (N'k', 1, N'Tarea Km', NULL, 1000, 1)
INSERT [dbo].[TareaMantenimiento] ([Tipo], [IdTareaMantenimiento], [Tarea], [CantidadDias], [CantidadKilometros], [IdPlanMantenimiento]) VALUES (N't', 2, N'Tarea Tiempo', 30, NULL, 1)
SET IDENTITY_INSERT [dbo].[TareaMantenimiento] OFF
SET IDENTITY_INSERT [dbo].[TareaMantenimientoRealizada] ON 

INSERT [dbo].[TareaMantenimientoRealizada] ([IdTareaMantenimientoRealizada], [CantidadKilometros], [FechaRealizada], [IdProveedor], [IdTareaMantenimiento], [IdVehiculo]) VALUES (1, 1000, CAST(0x0000A6C200C3E685 AS DateTime), 1, 1, 1)
INSERT [dbo].[TareaMantenimientoRealizada] ([IdTareaMantenimientoRealizada], [CantidadKilometros], [FechaRealizada], [IdProveedor], [IdTareaMantenimiento], [IdVehiculo]) VALUES (2, 1000, CAST(0x0000A6C200C417D1 AS DateTime), 1, 2, 1)
INSERT [dbo].[TareaMantenimientoRealizada] ([IdTareaMantenimientoRealizada], [CantidadKilometros], [FechaRealizada], [IdProveedor], [IdTareaMantenimiento], [IdVehiculo]) VALUES (3, 1500, CAST(0x0000A6C200C6A4BE AS DateTime), 1, 1, 2)
INSERT [dbo].[TareaMantenimientoRealizada] ([IdTareaMantenimientoRealizada], [CantidadKilometros], [FechaRealizada], [IdProveedor], [IdTareaMantenimiento], [IdVehiculo]) VALUES (4, 1500, CAST(0x0000A6C200C6C981 AS DateTime), 1, 2, 2)
INSERT [dbo].[TareaMantenimientoRealizada] ([IdTareaMantenimientoRealizada], [CantidadKilometros], [FechaRealizada], [IdProveedor], [IdTareaMantenimiento], [IdVehiculo]) VALUES (5, 1500, CAST(0x0000A6C200C6DC7F AS DateTime), 1, 1, 3)
INSERT [dbo].[TareaMantenimientoRealizada] ([IdTareaMantenimientoRealizada], [CantidadKilometros], [FechaRealizada], [IdProveedor], [IdTareaMantenimiento], [IdVehiculo]) VALUES (6, 1500, CAST(0x0000A6C200C6EFDE AS DateTime), 1, 2, 3)
INSERT [dbo].[TareaMantenimientoRealizada] ([IdTareaMantenimientoRealizada], [CantidadKilometros], [FechaRealizada], [IdProveedor], [IdTareaMantenimiento], [IdVehiculo]) VALUES (7, 1500, CAST(0x0000A6C200C700B0 AS DateTime), 1, 1, 4)
INSERT [dbo].[TareaMantenimientoRealizada] ([IdTareaMantenimientoRealizada], [CantidadKilometros], [FechaRealizada], [IdProveedor], [IdTareaMantenimiento], [IdVehiculo]) VALUES (8, 1500, CAST(0x0000A6C200C71161 AS DateTime), 1, 2, 4)
INSERT [dbo].[TareaMantenimientoRealizada] ([IdTareaMantenimientoRealizada], [CantidadKilometros], [FechaRealizada], [IdProveedor], [IdTareaMantenimiento], [IdVehiculo]) VALUES (9, 1500, CAST(0x0000A6C200C72272 AS DateTime), 1, 1, 5)
INSERT [dbo].[TareaMantenimientoRealizada] ([IdTareaMantenimientoRealizada], [CantidadKilometros], [FechaRealizada], [IdProveedor], [IdTareaMantenimiento], [IdVehiculo]) VALUES (10, 1500, CAST(0x0000A6C200C733CA AS DateTime), 1, 2, 5)
SET IDENTITY_INSERT [dbo].[TareaMantenimientoRealizada] OFF
SET IDENTITY_INSERT [dbo].[TarifasCarrier] ON 

INSERT [dbo].[TarifasCarrier] ([IdTarifasCarrier], [Ciudad], [Comentarios], [PrecioKMExtra], [Prioridad], [Tarifa], [IdSucursal], [IdPais], [idProveedor]) VALUES (1, N'Capital Federal', N'', 5400, N'1', 240, 1, 2, 3)
INSERT [dbo].[TarifasCarrier] ([IdTarifasCarrier], [Ciudad], [Comentarios], [PrecioKMExtra], [Prioridad], [Tarifa], [IdSucursal], [IdPais], [idProveedor]) VALUES (2, N'Paris', N'tarifa viaje directo', 4600, N'2', 2500, 1, 3, 3)
SET IDENTITY_INSERT [dbo].[TarifasCarrier] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Dni], [fechaCreacion], [Nombre], [Password], [UltimoAcceso], [usuario], [IdRolUsuario], [IdSucursal]) VALUES (1, N'Administrador', N'123456', CAST(0x0000A6C2004ED6EF AS DateTime), N'Admin', N'admin', CAST(0x0000A6C2004ED6EF AS DateTime), N'admin', NULL, 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Dni], [fechaCreacion], [Nombre], [Password], [UltimoAcceso], [usuario], [IdRolUsuario], [IdSucursal]) VALUES (2, N'Lopez', N'29888777', CAST(0x0000A6C200000000 AS DateTime), N'Pepe', N'admin2', NULL, N'admin2', NULL, 2)
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Dni], [fechaCreacion], [Nombre], [Password], [UltimoAcceso], [usuario], [IdRolUsuario], [IdSucursal]) VALUES (3, N'Corvetto', N'29458933', CAST(0x0000A6C200FC038F AS DateTime), N'Dana', N'admin3', NULL, N'admin3', NULL, 3)
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Dni], [fechaCreacion], [Nombre], [Password], [UltimoAcceso], [usuario], [IdRolUsuario], [IdSucursal]) VALUES (4, N'Guccione', N'32999888', CAST(0x0000A6C200FC29F1 AS DateTime), N'Vanesa', N'admin4', NULL, N'admin4', NULL, 4)
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Dni], [fechaCreacion], [Nombre], [Password], [UltimoAcceso], [usuario], [IdRolUsuario], [IdSucursal]) VALUES (5, N'Sanchez', N'33666777', CAST(0x0000A6C200FC7A9C AS DateTime), N'Cristian', N'admin5', NULL, N'admin5', NULL, 5)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
INSERT [dbo].[UsuarioRol] ([Usuario], [IdRol]) VALUES (1, 1)
INSERT [dbo].[UsuarioRol] ([Usuario], [IdRol]) VALUES (1, 2)
INSERT [dbo].[UsuarioRol] ([Usuario], [IdRol]) VALUES (1, 3)
INSERT [dbo].[UsuarioRol] ([Usuario], [IdRol]) VALUES (1, 4)
INSERT [dbo].[UsuarioRol] ([Usuario], [IdRol]) VALUES (1, 1)
INSERT [dbo].[UsuarioRol] ([Usuario], [IdRol]) VALUES (1, 2)
INSERT [dbo].[UsuarioRol] ([Usuario], [IdRol]) VALUES (1, 3)
INSERT [dbo].[UsuarioRol] ([Usuario], [IdRol]) VALUES (1, 4)
INSERT [dbo].[UsuarioRol] ([Usuario], [IdRol]) VALUES (2, 1)
INSERT [dbo].[UsuarioRol] ([Usuario], [IdRol]) VALUES (3, 1)
INSERT [dbo].[UsuarioRol] ([Usuario], [IdRol]) VALUES (4, 1)
INSERT [dbo].[UsuarioRol] ([Usuario], [IdRol]) VALUES (5, 1)
SET IDENTITY_INSERT [dbo].[Vehiculo] ON 

INSERT [dbo].[Vehiculo] ([IdVehiculo], [FechaIngreso], [Alto], [Ancho], [Anio], [CondicionTransporte], [Estado], [KmRecorridos], [Largo], [Marca], [Modelo], [Patente], [Peso], [Refrigerado], [Tara], [TemperaturaMax], [TemperaturaMin], [Tipo], [Volumen], [IdPlanMantenimiento], [idSucursal]) VALUES (1, CAST(0x0000A6C200B45750 AS DateTime), 2000, 500, N'2015', NULL, NULL, 1000, 1400, N'Mercedes Benz', N'110', N'AAA001', 22000, 0, 12000, 30, 10, N'Tractor', 45, 1, 1)
INSERT [dbo].[Vehiculo] ([IdVehiculo], [FechaIngreso], [Alto], [Ancho], [Anio], [CondicionTransporte], [Estado], [KmRecorridos], [Largo], [Marca], [Modelo], [Patente], [Peso], [Refrigerado], [Tara], [TemperaturaMax], [TemperaturaMin], [Tipo], [Volumen], [IdPlanMantenimiento], [idSucursal]) VALUES (2, CAST(0x0000A6C200B45750 AS DateTime), 2000, 500, N'2014', NULL, NULL, 1500, 1400, N'Mercedes Benz', N'110', N'AAA002', 3500, 0, 2500, 30, 10, N'Camion', 20, 1, 1)
INSERT [dbo].[Vehiculo] ([IdVehiculo], [FechaIngreso], [Alto], [Ancho], [Anio], [CondicionTransporte], [Estado], [KmRecorridos], [Largo], [Marca], [Modelo], [Patente], [Peso], [Refrigerado], [Tara], [TemperaturaMax], [TemperaturaMin], [Tipo], [Volumen], [IdPlanMantenimiento], [idSucursal]) VALUES (3, CAST(0x0000A6C200B45750 AS DateTime), 2000, 500, N'2014', NULL, NULL, 1500, 1400, N'Mercedes Benz', N'115', N'AAA003', 2000, 0, 1650, 30, 10, N'Camioneta', 10, 1, 1)
INSERT [dbo].[Vehiculo] ([IdVehiculo], [FechaIngreso], [Alto], [Ancho], [Anio], [CondicionTransporte], [Estado], [KmRecorridos], [Largo], [Marca], [Modelo], [Patente], [Peso], [Refrigerado], [Tara], [TemperaturaMax], [TemperaturaMin], [Tipo], [Volumen], [IdPlanMantenimiento], [idSucursal]) VALUES (4, CAST(0x0000A6C200B45750 AS DateTime), 2000, 500, N'2013', NULL, NULL, 1500, 1400, N'Mercedes Benz', N'115', N'AAA004', 4500, 0, 3500, 30, 10, N'Tanque', 30, 1, 1)
INSERT [dbo].[Vehiculo] ([IdVehiculo], [FechaIngreso], [Alto], [Ancho], [Anio], [CondicionTransporte], [Estado], [KmRecorridos], [Largo], [Marca], [Modelo], [Patente], [Peso], [Refrigerado], [Tara], [TemperaturaMax], [TemperaturaMin], [Tipo], [Volumen], [IdPlanMantenimiento], [idSucursal]) VALUES (5, CAST(0x0000A6C200B45750 AS DateTime), 2000, 500, N'2010', NULL, NULL, 1500, 1400, N'Mercedes Benz', N'185', N'AAA005', 3600, 0, 2500, 30, 10, N'Camion', 22, 1, 1)
SET IDENTITY_INSERT [dbo].[Vehiculo] OFF
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_5jy3irhw05qxk9hn2ju64fsip] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_5jy3irhw05qxk9hn2ju64fsip]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_qs7ssl7d86bfgexbktnekqntc] FOREIGN KEY([IdCuentaCorriente])
REFERENCES [dbo].[CuentaCorriente] ([IdCtaCte])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_qs7ssl7d86bfgexbktnekqntc]
GO
ALTER TABLE [dbo].[CondicionesEspecialesVehiculo]  WITH CHECK ADD  CONSTRAINT [FK_jk7l79lybvcbxiacj6793ba7x] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculo] ([IdVehiculo])
GO
ALTER TABLE [dbo].[CondicionesEspecialesVehiculo] CHECK CONSTRAINT [FK_jk7l79lybvcbxiacj6793ba7x]
GO
ALTER TABLE [dbo].[CuentaCorriente]  WITH CHECK ADD  CONSTRAINT [FK_p3q634oqli6wlvhe61xip39jf] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[CuentaCorriente] CHECK CONSTRAINT [FK_p3q634oqli6wlvhe61xip39jf]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_jr58si85nf07txqjf2epuhleb] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_jr58si85nf07txqjf2epuhleb]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_mhrj7tnuxp2ryclmtdi1hfgge] FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincia] ([IdProvincia])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_mhrj7tnuxp2ryclmtdi1hfgge]
GO
ALTER TABLE [dbo].[Encomienda]  WITH CHECK ADD  CONSTRAINT [FK_2m8bu2xqrrub3sp73xb5o57y9] FOREIGN KEY([IdSucursalDestino])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Encomienda] CHECK CONSTRAINT [FK_2m8bu2xqrrub3sp73xb5o57y9]
GO
ALTER TABLE [dbo].[Encomienda]  WITH CHECK ADD  CONSTRAINT [FK_2pj86q8exi5ccco4wfqlh5shs] FOREIGN KEY([IdDireccionOrigen])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Encomienda] CHECK CONSTRAINT [FK_2pj86q8exi5ccco4wfqlh5shs]
GO
ALTER TABLE [dbo].[Encomienda]  WITH CHECK ADD  CONSTRAINT [FK_61obb82luusx9y5d9thxd3ynt] FOREIGN KEY([IdSucursalActual])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Encomienda] CHECK CONSTRAINT [FK_61obb82luusx9y5d9thxd3ynt]
GO
ALTER TABLE [dbo].[Encomienda]  WITH CHECK ADD  CONSTRAINT [FK_dha138ls5i6ce973ffnp4l9u4] FOREIGN KEY([IdSucursalOrigen])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Encomienda] CHECK CONSTRAINT [FK_dha138ls5i6ce973ffnp4l9u4]
GO
ALTER TABLE [dbo].[Encomienda]  WITH CHECK ADD  CONSTRAINT [FK_e8bgxppwiw6p7b3d97dnjq3j9] FOREIGN KEY([IdDireccionDestino])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Encomienda] CHECK CONSTRAINT [FK_e8bgxppwiw6p7b3d97dnjq3j9]
GO
ALTER TABLE [dbo].[Encomienda]  WITH CHECK ADD  CONSTRAINT [FK_mm5y5jydlhj3x3xoph11quol1] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Encomienda] CHECK CONSTRAINT [FK_mm5y5jydlhj3x3xoph11quol1]
GO
ALTER TABLE [dbo].[EncomiendaEnvio]  WITH CHECK ADD  CONSTRAINT [FK_6caxxdlre7aep6hiiky3y3eeq] FOREIGN KEY([idEnvio])
REFERENCES [dbo].[Envio] ([IdEnvio])
GO
ALTER TABLE [dbo].[EncomiendaEnvio] CHECK CONSTRAINT [FK_6caxxdlre7aep6hiiky3y3eeq]
GO
ALTER TABLE [dbo].[EncomiendaEnvio]  WITH CHECK ADD  CONSTRAINT [FK_b9bcu95f3f670b7fk6q5edmne] FOREIGN KEY([idEncomienda])
REFERENCES [dbo].[Encomienda] ([IdEncomienda])
GO
ALTER TABLE [dbo].[EncomiendaEnvio] CHECK CONSTRAINT [FK_b9bcu95f3f670b7fk6q5edmne]
GO
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_6ie4obmme5gkbr31v55t7qlu7] FOREIGN KEY([IdMapaDeRuta])
REFERENCES [dbo].[MapaDeRuta] ([IdMapaDeRuta])
GO
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_6ie4obmme5gkbr31v55t7qlu7]
GO
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_6u7ie99rj9flnm7eqk32daqq4] FOREIGN KEY([IdSucursalOrigen])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_6u7ie99rj9flnm7eqk32daqq4]
GO
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_9jgq3c8erfcsvgkfocn60k1jb] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_9jgq3c8erfcsvgkfocn60k1jb]
GO
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_faulvsugk9d0y3ja9ey7jdb2k] FOREIGN KEY([IdSucursalDestino])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_faulvsugk9d0y3ja9ey7jdb2k]
GO
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_q9ukvvakhy5t5c75iaigkg2ho] FOREIGN KEY([IdCoordenadaActual])
REFERENCES [dbo].[Coordenada] ([IdCoordenada])
GO
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_q9ukvvakhy5t5c75iaigkg2ho]
GO
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_qyb1jjjt6ggg4l87b87s104pe] FOREIGN KEY([vehiculo_IdVehiculo])
REFERENCES [dbo].[Vehiculo] ([IdVehiculo])
GO
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_qyb1jjjt6ggg4l87b87s104pe]
GO
ALTER TABLE [dbo].[EnvioHistorico]  WITH CHECK ADD  CONSTRAINT [FK_qxkoivh1re6md9a7mp94dpft7] FOREIGN KEY([IdEnvio])
REFERENCES [dbo].[Envio] ([IdEnvio])
GO
ALTER TABLE [dbo].[EnvioHistorico] CHECK CONSTRAINT [FK_qxkoivh1re6md9a7mp94dpft7]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_938cujxvkgjd25tpjd2dk7csc] FOREIGN KEY([IdEncomienda])
REFERENCES [dbo].[Encomienda] ([IdEncomienda])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_938cujxvkgjd25tpjd2dk7csc]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_jfeia8o9g46k5hql71xfdbsj0] FOREIGN KEY([IdCtaCte])
REFERENCES [dbo].[CuentaCorriente] ([IdCtaCte])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_jfeia8o9g46k5hql71xfdbsj0]
GO
ALTER TABLE [dbo].[ItemFactura]  WITH CHECK ADD  CONSTRAINT [FK_nhm0tq2t4ebmgs3xo10mdyfsv] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([IdFactura])
GO
ALTER TABLE [dbo].[ItemFactura] CHECK CONSTRAINT [FK_nhm0tq2t4ebmgs3xo10mdyfsv]
GO
ALTER TABLE [dbo].[ItemManifiesto]  WITH CHECK ADD  CONSTRAINT [FK_4jsasu4gsrshs8xmhj393w5u] FOREIGN KEY([IdManifiesto])
REFERENCES [dbo].[Manifiesto] ([IdManifiesto])
GO
ALTER TABLE [dbo].[ItemManifiesto] CHECK CONSTRAINT [FK_4jsasu4gsrshs8xmhj393w5u]
GO
ALTER TABLE [dbo].[ItemManifiesto]  WITH CHECK ADD  CONSTRAINT [FK_ikuc9domwvqr25xab2tpeebi9] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[ItemManifiesto] CHECK CONSTRAINT [FK_ikuc9domwvqr25xab2tpeebi9]
GO
ALTER TABLE [dbo].[ItemRemito]  WITH CHECK ADD  CONSTRAINT [FK_56fu6a58bhnipm65f15e84ejf] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[ItemRemito] CHECK CONSTRAINT [FK_56fu6a58bhnipm65f15e84ejf]
GO
ALTER TABLE [dbo].[ItemRemito]  WITH CHECK ADD  CONSTRAINT [FK_5pp2fyjbwvkxd4r5bqk2s6w5e] FOREIGN KEY([IdRemito])
REFERENCES [dbo].[Remito] ([IdRemito])
GO
ALTER TABLE [dbo].[ItemRemito] CHECK CONSTRAINT [FK_5pp2fyjbwvkxd4r5bqk2s6w5e]
GO
ALTER TABLE [dbo].[Manifiesto]  WITH CHECK ADD  CONSTRAINT [FK_cgtv27tsonxit0n382sa8p8kq] FOREIGN KEY([IdEncomienda])
REFERENCES [dbo].[Encomienda] ([IdEncomienda])
GO
ALTER TABLE [dbo].[Manifiesto] CHECK CONSTRAINT [FK_cgtv27tsonxit0n382sa8p8kq]
GO
ALTER TABLE [dbo].[MapaDeRuta]  WITH CHECK ADD  CONSTRAINT [FK_3cu85ladlcpv6rykllmwfq60t] FOREIGN KEY([IdSucursalOrigen])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[MapaDeRuta] CHECK CONSTRAINT [FK_3cu85ladlcpv6rykllmwfq60t]
GO
ALTER TABLE [dbo].[MapaDeRuta]  WITH CHECK ADD  CONSTRAINT [FK_tr0a7wnpwachf46d3ecxvmrtm] FOREIGN KEY([IdSucursalDestino])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[MapaDeRuta] CHECK CONSTRAINT [FK_tr0a7wnpwachf46d3ecxvmrtm]
GO
ALTER TABLE [dbo].[MapaDeRutaCoordenada]  WITH CHECK ADD  CONSTRAINT [FK_60hyv30fs2urepyusiayo6kol] FOREIGN KEY([IdCoordenada])
REFERENCES [dbo].[Coordenada] ([IdCoordenada])
GO
ALTER TABLE [dbo].[MapaDeRutaCoordenada] CHECK CONSTRAINT [FK_60hyv30fs2urepyusiayo6kol]
GO
ALTER TABLE [dbo].[MapaDeRutaCoordenada]  WITH CHECK ADD  CONSTRAINT [FK_ewu2f5oq8or79f49ns6gdufm1] FOREIGN KEY([IdMapaDeRuta])
REFERENCES [dbo].[MapaDeRuta] ([IdMapaDeRuta])
GO
ALTER TABLE [dbo].[MapaDeRutaCoordenada] CHECK CONSTRAINT [FK_ewu2f5oq8or79f49ns6gdufm1]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_ilamvx9jfcjgc34mj9je3li5k] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_ilamvx9jfcjgc34mj9je3li5k]
GO
ALTER TABLE [dbo].[ProductoEncomienda]  WITH CHECK ADD  CONSTRAINT [FK_jsk9wjgb26hyvnvn11cgu1699] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[ProductoEncomienda] CHECK CONSTRAINT [FK_jsk9wjgb26hyvnvn11cgu1699]
GO
ALTER TABLE [dbo].[ProductoEncomienda]  WITH CHECK ADD  CONSTRAINT [FK_t1glhweh5g9jeoc2o12r64vqw] FOREIGN KEY([IdEncomienda])
REFERENCES [dbo].[Encomienda] ([IdEncomienda])
GO
ALTER TABLE [dbo].[ProductoEncomienda] CHECK CONSTRAINT [FK_t1glhweh5g9jeoc2o12r64vqw]
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_l17061vp55k68ipl68nk06vp9] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [FK_l17061vp55k68ipl68nk06vp9]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [FK_ffhq7ncsu2euj1snx5hhcu0ye] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [FK_ffhq7ncsu2euj1snx5hhcu0ye]
GO
ALTER TABLE [dbo].[Remito]  WITH CHECK ADD  CONSTRAINT [FK_r2jsj721vp5i0fxmhjoghk3mj] FOREIGN KEY([IdEncomienda])
REFERENCES [dbo].[Encomienda] ([IdEncomienda])
GO
ALTER TABLE [dbo].[Remito] CHECK CONSTRAINT [FK_r2jsj721vp5i0fxmhjoghk3mj]
GO
ALTER TABLE [dbo].[Seguro]  WITH CHECK ADD  CONSTRAINT [FK_24w5n0gpq4pxym4ln48j4fvy0] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Seguro] CHECK CONSTRAINT [FK_24w5n0gpq4pxym4ln48j4fvy0]
GO
ALTER TABLE [dbo].[ServicioSeguridad]  WITH CHECK ADD  CONSTRAINT [FK_882he748eg9fqika0um1e7skf] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[ServicioSeguridad] CHECK CONSTRAINT [FK_882he748eg9fqika0um1e7skf]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_28itdo6e3nj2ghytuyx6jv66b] FOREIGN KEY([Coordenada])
REFERENCES [dbo].[Coordenada] ([IdCoordenada])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_28itdo6e3nj2ghytuyx6jv66b]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_m4qcqa6av7n12ntu0txu0yfyp] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_m4qcqa6av7n12ntu0txu0yfyp]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_mr20ybw1wg9wjkddnamjj5kjk] FOREIGN KEY([IdGerente])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_mr20ybw1wg9wjkddnamjj5kjk]
GO
ALTER TABLE [dbo].[TareaMantenimiento]  WITH CHECK ADD  CONSTRAINT [FK_32iwbokk6q935dturganj4eoa] FOREIGN KEY([IdPlanMantenimiento])
REFERENCES [dbo].[PlanMantenimiento] ([IdPlanMantenimiento])
GO
ALTER TABLE [dbo].[TareaMantenimiento] CHECK CONSTRAINT [FK_32iwbokk6q935dturganj4eoa]
GO
ALTER TABLE [dbo].[TareaMantenimientoRealizada]  WITH CHECK ADD  CONSTRAINT [FK_2nq6ugyu5knhh3mhxjinm7lri] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculo] ([IdVehiculo])
GO
ALTER TABLE [dbo].[TareaMantenimientoRealizada] CHECK CONSTRAINT [FK_2nq6ugyu5knhh3mhxjinm7lri]
GO
ALTER TABLE [dbo].[TareaMantenimientoRealizada]  WITH CHECK ADD  CONSTRAINT [FK_mu5jbyxp3rb6wu3lgdlg5ejvw] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[TareaMantenimientoRealizada] CHECK CONSTRAINT [FK_mu5jbyxp3rb6wu3lgdlg5ejvw]
GO
ALTER TABLE [dbo].[TareaMantenimientoRealizada]  WITH CHECK ADD  CONSTRAINT [FK_o48kw5irdxe24sanxrh4ru2bb] FOREIGN KEY([IdTareaMantenimiento])
REFERENCES [dbo].[TareaMantenimiento] ([IdTareaMantenimiento])
GO
ALTER TABLE [dbo].[TareaMantenimientoRealizada] CHECK CONSTRAINT [FK_o48kw5irdxe24sanxrh4ru2bb]
GO
ALTER TABLE [dbo].[TarifasCarrier]  WITH CHECK ADD  CONSTRAINT [FK_a46tc6uwpnkdyjkxajc8sgy34] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[TarifasCarrier] CHECK CONSTRAINT [FK_a46tc6uwpnkdyjkxajc8sgy34]
GO
ALTER TABLE [dbo].[TarifasCarrier]  WITH CHECK ADD  CONSTRAINT [FK_jqvqa8xygi069ettskf50dhrw] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[TarifasCarrier] CHECK CONSTRAINT [FK_jqvqa8xygi069ettskf50dhrw]
GO
ALTER TABLE [dbo].[TarifasCarrier]  WITH CHECK ADD  CONSTRAINT [FK_l7fnbk7raoq1dgmx6w3kd28vv] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[TarifasCarrier] CHECK CONSTRAINT [FK_l7fnbk7raoq1dgmx6w3kd28vv]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_jfihpoxeop2l4bf65gncda72f] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_jfihpoxeop2l4bf65gncda72f]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_pqiw1hsuxr1xeboev5o9laqgw] FOREIGN KEY([IdRolUsuario])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_pqiw1hsuxr1xeboev5o9laqgw]
GO
ALTER TABLE [dbo].[UsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_7pak6cvbpyi3obxjoo70jqdfr] FOREIGN KEY([Usuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuarioRol] CHECK CONSTRAINT [FK_7pak6cvbpyi3obxjoo70jqdfr]
GO
ALTER TABLE [dbo].[UsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_qyadlqm26qwv2fm3rdhoamfgn] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[UsuarioRol] CHECK CONSTRAINT [FK_qyadlqm26qwv2fm3rdhoamfgn]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_9w89rmqpg9qi9m8wo06847omg] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_9w89rmqpg9qi9m8wo06847omg]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_kf5umanbe19gjqcunrolrtxqq] FOREIGN KEY([IdPlanMantenimiento])
REFERENCES [dbo].[PlanMantenimiento] ([IdPlanMantenimiento])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_kf5umanbe19gjqcunrolrtxqq]
GO
USE [master]
GO
ALTER DATABASE [AD2016] SET  READ_WRITE 
GO
