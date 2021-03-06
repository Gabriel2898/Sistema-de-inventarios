USE [master]
GO
/****** Object:  Database [inventarios]    Script Date: 03/07/2018 06:49:13 p. m. ******/
CREATE DATABASE [inventarios]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'inventarios', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DEVCOFEMER\MSSQL\DATA\inventarios.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'inventarios_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DEVCOFEMER\MSSQL\DATA\inventarios_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [inventarios] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [inventarios].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [inventarios] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [inventarios] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [inventarios] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [inventarios] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [inventarios] SET ARITHABORT OFF 
GO
ALTER DATABASE [inventarios] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [inventarios] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [inventarios] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [inventarios] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [inventarios] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [inventarios] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [inventarios] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [inventarios] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [inventarios] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [inventarios] SET  DISABLE_BROKER 
GO
ALTER DATABASE [inventarios] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [inventarios] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [inventarios] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [inventarios] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [inventarios] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [inventarios] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [inventarios] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [inventarios] SET RECOVERY FULL 
GO
ALTER DATABASE [inventarios] SET  MULTI_USER 
GO
ALTER DATABASE [inventarios] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [inventarios] SET DB_CHAINING OFF 
GO
ALTER DATABASE [inventarios] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [inventarios] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [inventarios] SET DELAYED_DURABILITY = DISABLED 
GO
USE [inventarios]
GO
/****** Object:  Table [dbo].[Anexos]    Script Date: 03/07/2018 06:49:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Anexos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Archivo] [varchar](150) NOT NULL,
	[Producto_Id] [int] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Anexos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Catalogos]    Script Date: 03/07/2018 06:49:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catalogos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Catalogo] [varchar](50) NOT NULL,
	[Valor] [varchar](250) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Catalogos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 03/07/2018 06:49:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Compras](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Compra] [varchar](50) NULL,
	[Producto_Id] [int] NOT NULL,
	[Empresa_Id] [int] NOT NULL,
	[Cantidad] [numeric](18, 3) NOT NULL,
	[CostoUnitario] [numeric](18, 2) NULL,
	[CostoTotal] [numeric](18, 2) NULL,
	[CostoNeto] [numeric](18, 2) NULL,
	[GranTotal] [numeric](18, 2) NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empresas]    Script Date: 03/07/2018 06:49:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreEmpresa] [varchar](250) NOT NULL,
	[CorreoElectronico] [varchar](150) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Moneda] [varchar](5) NULL,
	[ZonaHoraria_Id] [int] NULL,
	[Logo] [varchar](50) NULL,
	[Direccion] [varchar](250) NULL,
	[Tipo_Id] [int] NOT NULL,
 CONSTRAINT [PK_Configuracion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Impuestos]    Script Date: 03/07/2018 06:49:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Impuestos](
	[Id] [int] NOT NULL,
	[Impuesto] [varchar](50) NOT NULL,
	[Porcentaje] [numeric](18, 2) NOT NULL,
	[Monto] [numeric](18, 2) NOT NULL,
	[Venta_Id] [int] NULL,
	[Compra_Id] [int] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Impuestos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 03/07/2018 06:49:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permisos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Grupo_Id] [int] NOT NULL,
	[Modificar] [varchar](50) NOT NULL,
	[Editar] [varchar](50) NOT NULL,
	[Eliminar] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 03/07/2018 06:49:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Nombre] [varchar](150) NULL,
	[Descripcion] [varchar](450) NULL,
	[Marca] [varchar](150) NULL,
	[Modelo] [varchar](150) NULL,
	[UnidadMedida] [varchar](150) NULL,
	[Estatus] [bit] NULL,
	[Coto] [numeric](18, 2) NULL,
	[Utilidad] [int] NULL,
	[PrecioVenta] [numeric](18, 2) NULL,
	[Stock] [int] NULL,
	[FechaRegistro] [date] NULL,
	[FechaActivo] [datetime] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Productos_Empresas]    Script Date: 03/07/2018 06:49:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos_Empresas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Producto_Id] [int] NOT NULL,
	[Empresa_Id] [int] NOT NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Productos_Empresas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 03/07/2018 06:49:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CorreoElectronico] [varchar](150) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[EmpresaId] [int] NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Nombres] [varchar](250) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Rol_Id] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 03/07/2018 06:49:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Venta] [varchar](50) NOT NULL,
	[Cliente_Id] [int] NOT NULL,
	[Producto_Id] [int] NOT NULL,
	[CostoUnitario] [numeric](18, 2) NULL,
	[CostoTotal] [numeric](18, 2) NULL,
	[CostoNeto] [numeric](18, 2) NULL,
	[GranTotal] [numeric](18, 2) NULL,
	[Fecha] [datetime] NOT NULL,
	[Cantidad] [numeric](18, 3) NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogos] ON 

INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (1, N'Roles', N'Administrador', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (2, N'Tipo Empresa', N'Administradora', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (3, N'Tipo Empresa', N'Proveedor', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (4, N'Roles', N'Clientes', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (5, N'Roles', N'Contacto Proveedor', 1)
SET IDENTITY_INSERT [dbo].[Catalogos] OFF
SET IDENTITY_INSERT [dbo].[Empresas] ON 

INSERT [dbo].[Empresas] ([Id], [NombreEmpresa], [CorreoElectronico], [Telefono], [Moneda], [ZonaHoraria_Id], [Logo], [Direccion], [Tipo_Id]) VALUES (1, N'Prueba', N'jiestrada@live.com.mx', N'5454', N'Peso', 2, N'', N'', 2)
SET IDENTITY_INSERT [dbo].[Empresas] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [CorreoElectronico], [Password], [EmpresaId], [Telefono], [Nombres], [Fecha], [Activo], [Rol_Id]) VALUES (1, N'info@estradawebgroup.com', N'asdasdasd', 1, N'', N'José', CAST(N'2018-07-03' AS Date), 1, 1)
INSERT [dbo].[Usuarios] ([Id], [CorreoElectronico], [Password], [EmpresaId], [Telefono], [Nombres], [Fecha], [Activo], [Rol_Id]) VALUES (2, N'info@estradawebgroup.com', N'asdasdasd', 1, N'', N'José', CAST(N'2018-07-03' AS Date), 1, 1)
INSERT [dbo].[Usuarios] ([Id], [CorreoElectronico], [Password], [EmpresaId], [Telefono], [Nombres], [Fecha], [Activo], [Rol_Id]) VALUES (3, N'info@estradawebgroup.com', N'asdasdasd', 1, N'', N'José', CAST(N'2018-07-03' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Anexos]  WITH CHECK ADD  CONSTRAINT [FK_Anexos_Productos] FOREIGN KEY([Producto_Id])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Anexos] CHECK CONSTRAINT [FK_Anexos_Productos]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Empresas] FOREIGN KEY([Empresa_Id])
REFERENCES [dbo].[Empresas] ([Id])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Empresas]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Productos] FOREIGN KEY([Producto_Id])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Productos]
GO
ALTER TABLE [dbo].[Empresas]  WITH CHECK ADD  CONSTRAINT [FK_Empresas_Catalogos] FOREIGN KEY([ZonaHoraria_Id])
REFERENCES [dbo].[Catalogos] ([Id])
GO
ALTER TABLE [dbo].[Empresas] CHECK CONSTRAINT [FK_Empresas_Catalogos]
GO
ALTER TABLE [dbo].[Empresas]  WITH CHECK ADD  CONSTRAINT [FK_Empresas_Catalogos1] FOREIGN KEY([Tipo_Id])
REFERENCES [dbo].[Catalogos] ([Id])
GO
ALTER TABLE [dbo].[Empresas] CHECK CONSTRAINT [FK_Empresas_Catalogos1]
GO
ALTER TABLE [dbo].[Impuestos]  WITH CHECK ADD  CONSTRAINT [FK_Impuestos_Compras] FOREIGN KEY([Compra_Id])
REFERENCES [dbo].[Compras] ([Id])
GO
ALTER TABLE [dbo].[Impuestos] CHECK CONSTRAINT [FK_Impuestos_Compras]
GO
ALTER TABLE [dbo].[Impuestos]  WITH CHECK ADD  CONSTRAINT [FK_Impuestos_Ventas] FOREIGN KEY([Venta_Id])
REFERENCES [dbo].[Ventas] ([Id])
GO
ALTER TABLE [dbo].[Impuestos] CHECK CONSTRAINT [FK_Impuestos_Ventas]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Catalogos] FOREIGN KEY([Grupo_Id])
REFERENCES [dbo].[Catalogos] ([Id])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Catalogos]
GO
ALTER TABLE [dbo].[Productos_Empresas]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Empresas_Empresas] FOREIGN KEY([Empresa_Id])
REFERENCES [dbo].[Empresas] ([Id])
GO
ALTER TABLE [dbo].[Productos_Empresas] CHECK CONSTRAINT [FK_Productos_Empresas_Empresas]
GO
ALTER TABLE [dbo].[Productos_Empresas]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Empresas_Productos] FOREIGN KEY([Producto_Id])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Productos_Empresas] CHECK CONSTRAINT [FK_Productos_Empresas_Productos]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Catalogos] FOREIGN KEY([Rol_Id])
REFERENCES [dbo].[Catalogos] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Catalogos]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Empresas] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Empresas] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Empresas]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Productos] FOREIGN KEY([Producto_Id])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Productos]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Usuarios] FOREIGN KEY([Cliente_Id])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [inventarios] SET  READ_WRITE 
GO
