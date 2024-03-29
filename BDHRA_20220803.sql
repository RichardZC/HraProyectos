USE [HRA]
GO
/****** Object:  Schema [MAESTRO]    Script Date: 3/08/2022 14:57:53 ******/
CREATE SCHEMA [MAESTRO]
GO
/****** Object:  Schema [VENTA]    Script Date: 3/08/2022 14:57:53 ******/
CREATE SCHEMA [VENTA]
GO
/****** Object:  Table [MAESTRO].[Menu]    Script Date: 3/08/2022 14:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAESTRO].[Menu](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[Denominacion] [varchar](255) NOT NULL,
	[Modulo] [varchar](255) NOT NULL,
	[Url] [varchar](255) NOT NULL,
	[Icono] [varchar](255) NULL,
	[IndPadre] [bit] NULL,
	[Orden] [decimal](3, 1) NULL,
	[Referencia] [decimal](3, 1) NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MAESTRO].[Persona]    Script Date: 3/08/2022 14:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAESTRO].[Persona](
	[PersonaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](70) NOT NULL,
	[ApePaterno] [varchar](70) NOT NULL,
	[ApeMaterno] [varchar](70) NOT NULL,
	[NombreCompleto] [varchar](250) NOT NULL,
	[NumeroDocumento] [varchar](12) NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[Email] [varchar](100) NULL,
	[FechaNacimiento] [date] NULL,
	[Direccion] [varchar](300) NULL,
	[DireccionRef] [varchar](300) NULL,
	[Celular] [varchar](10) NULL,
	[EstadoCivilId] [int] NULL,
	[Activo] [bit] NOT NULL,
	[Nota] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MAESTRO].[Rol]    Script Date: 3/08/2022 14:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAESTRO].[Rol](
	[RolId] [int] IDENTITY(1,1) NOT NULL,
	[Denominacion] [varchar](255) NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MAESTRO].[RolMenu]    Script Date: 3/08/2022 14:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAESTRO].[RolMenu](
	[RolMenuId] [int] IDENTITY(1,1) NOT NULL,
	[RolId] [int] NULL,
	[MenuId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RolMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MAESTRO].[Usuario]    Script Date: 3/08/2022 14:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAESTRO].[Usuario](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[PersonaId] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Clave] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__Usuario__2B3DE7B89F2A7448] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MAESTRO].[UsuarioRol]    Script Date: 3/08/2022 14:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAESTRO].[UsuarioRol](
	[UsuarioRolId] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NULL,
	[RolId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioRolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [VENTA].[CATEGORIA]    Script Date: 3/08/2022 14:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [VENTA].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [VENTA].[DETALLE_VENTA]    Script Date: 3/08/2022 14:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [VENTA].[DETALLE_VENTA](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[PrecioVenta] [decimal](10, 2) NULL,
	[Cantidad] [int] NULL,
	[Total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [VENTA].[PRODUCTO]    Script Date: 3/08/2022 14:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [VENTA].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](100) NULL,
	[IdCategoria] [int] NULL,
	[Descripcion] [varchar](100) NULL,
	[PrecioCompra] [decimal](10, 2) NULL,
	[PrecioVenta] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [VENTA].[VENTA]    Script Date: 3/08/2022 14:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [VENTA].[VENTA](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[TipoPago] [varchar](50) NULL,
	[NumeroDocumento] [varchar](50) NULL,
	[DocumentoCliente] [varchar](50) NULL,
	[NombreCliente] [varchar](100) NULL,
	[MontoPagoCon] [decimal](10, 2) NULL,
	[MontoCambio] [decimal](10, 2) NULL,
	[MontoSubTotal] [decimal](10, 2) NULL,
	[MontoIGV] [decimal](10, 2) NULL,
	[MontoTotal] [decimal](10, 2) NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [MAESTRO].[Menu] ON 

INSERT [MAESTRO].[Menu] ([MenuId], [Denominacion], [Modulo], [Url], [Icono], [IndPadre], [Orden], [Referencia]) VALUES (1, N'SEGURIDAD', N'', N'', NULL, 1, CAST(10.0 AS Decimal(3, 1)), NULL)
INSERT [MAESTRO].[Menu] ([MenuId], [Denominacion], [Modulo], [Url], [Icono], [IndPadre], [Orden], [Referencia]) VALUES (2, N'USUARIO', N'SEGURIDAD', N'Usuario', NULL, 0, CAST(10.1 AS Decimal(3, 1)), CAST(10.0 AS Decimal(3, 1)))
INSERT [MAESTRO].[Menu] ([MenuId], [Denominacion], [Modulo], [Url], [Icono], [IndPadre], [Orden], [Referencia]) VALUES (3, N'ROL', N'SEGURIDAD', N'Rol', NULL, 0, CAST(10.2 AS Decimal(3, 1)), CAST(10.0 AS Decimal(3, 1)))
INSERT [MAESTRO].[Menu] ([MenuId], [Denominacion], [Modulo], [Url], [Icono], [IndPadre], [Orden], [Referencia]) VALUES (4, N'VENTA', N'', N'', NULL, 1, CAST(20.0 AS Decimal(3, 1)), NULL)
INSERT [MAESTRO].[Menu] ([MenuId], [Denominacion], [Modulo], [Url], [Icono], [IndPadre], [Orden], [Referencia]) VALUES (5, N'VENTA', N'VENTA', N'Venta', NULL, 0, CAST(20.1 AS Decimal(3, 1)), CAST(20.0 AS Decimal(3, 1)))
INSERT [MAESTRO].[Menu] ([MenuId], [Denominacion], [Modulo], [Url], [Icono], [IndPadre], [Orden], [Referencia]) VALUES (6, N'TAREA', N'PROYECTO', N'Tarea', NULL, 0, CAST(20.2 AS Decimal(3, 1)), CAST(20.0 AS Decimal(3, 1)))
INSERT [MAESTRO].[Menu] ([MenuId], [Denominacion], [Modulo], [Url], [Icono], [IndPadre], [Orden], [Referencia]) VALUES (7, N'PERMISO', N'SEGURIDAD', N'Permiso', NULL, 0, CAST(10.3 AS Decimal(3, 1)), CAST(10.0 AS Decimal(3, 1)))
SET IDENTITY_INSERT [MAESTRO].[Menu] OFF
GO
SET IDENTITY_INSERT [MAESTRO].[Persona] ON 

INSERT [MAESTRO].[Persona] ([PersonaId], [Nombre], [ApePaterno], [ApeMaterno], [NombreCompleto], [NumeroDocumento], [Sexo], [Email], [FechaNacimiento], [Direccion], [DireccionRef], [Celular], [EstadoCivilId], [Activo], [Nota]) VALUES (1, N'RICHARD', N'ZAPATA', N'CASAVERDE', N'ZAPATA CASAVERDE RICHARD', N'41901791', N'M', NULL, NULL, NULL, NULL, N'966900599', NULL, 1, NULL)
INSERT [MAESTRO].[Persona] ([PersonaId], [Nombre], [ApePaterno], [ApeMaterno], [NombreCompleto], [NumeroDocumento], [Sexo], [Email], [FechaNacimiento], [Direccion], [DireccionRef], [Celular], [EstadoCivilId], [Activo], [Nota]) VALUES (8, N'YANIDE', N'GALINDO', N'BAUTISTA', N'GALINDO BAUTISTA YANIDE', N'41921997', N'F', NULL, NULL, NULL, NULL, N'9658569', NULL, 1, NULL)
INSERT [MAESTRO].[Persona] ([PersonaId], [Nombre], [ApePaterno], [ApeMaterno], [NombreCompleto], [NumeroDocumento], [Sexo], [Email], [FechaNacimiento], [Direccion], [DireccionRef], [Celular], [EstadoCivilId], [Activo], [Nota]) VALUES (1006, N'JUAN', N'PEREZ', N'PEREZ', N'PEREZ PEREZ JUAN', N'9999999', N'M', NULL, NULL, NULL, NULL, N'965874', NULL, 1, NULL)
INSERT [MAESTRO].[Persona] ([PersonaId], [Nombre], [ApePaterno], [ApeMaterno], [NombreCompleto], [NumeroDocumento], [Sexo], [Email], [FechaNacimiento], [Direccion], [DireccionRef], [Celular], [EstadoCivilId], [Activo], [Nota]) VALUES (2006, N'RUMIR', N'MITMA', N'DE RAUL', N'MITMA DE RAUL RUMIR', N'999889988', N'M', NULL, NULL, NULL, NULL, N'66554477', NULL, 1, NULL)
INSERT [MAESTRO].[Persona] ([PersonaId], [Nombre], [ApePaterno], [ApeMaterno], [NombreCompleto], [NumeroDocumento], [Sexo], [Email], [FechaNacimiento], [Direccion], [DireccionRef], [Celular], [EstadoCivilId], [Activo], [Nota]) VALUES (3006, N'DEMO', N'DEMO', N'DEMO', N'DEMO DEMO DEMO', N'12345678', N'M', NULL, NULL, NULL, NULL, N'99999999', NULL, 1, NULL)
SET IDENTITY_INSERT [MAESTRO].[Persona] OFF
GO
SET IDENTITY_INSERT [MAESTRO].[Rol] ON 

INSERT [MAESTRO].[Rol] ([RolId], [Denominacion], [Estado]) VALUES (1, N'Administrador', 1)
INSERT [MAESTRO].[Rol] ([RolId], [Denominacion], [Estado]) VALUES (2, N'Vendedor', 1)
INSERT [MAESTRO].[Rol] ([RolId], [Denominacion], [Estado]) VALUES (1002, N'Cajero modificado', 1)
INSERT [MAESTRO].[Rol] ([RolId], [Denominacion], [Estado]) VALUES (1003, N'Tecnico', 1)
SET IDENTITY_INSERT [MAESTRO].[Rol] OFF
GO
SET IDENTITY_INSERT [MAESTRO].[RolMenu] ON 

INSERT [MAESTRO].[RolMenu] ([RolMenuId], [RolId], [MenuId]) VALUES (16, 1003, 2)
INSERT [MAESTRO].[RolMenu] ([RolMenuId], [RolId], [MenuId]) VALUES (17, 1, 5)
INSERT [MAESTRO].[RolMenu] ([RolMenuId], [RolId], [MenuId]) VALUES (18, 1, 6)
INSERT [MAESTRO].[RolMenu] ([RolMenuId], [RolId], [MenuId]) VALUES (19, 1, 7)
INSERT [MAESTRO].[RolMenu] ([RolMenuId], [RolId], [MenuId]) VALUES (20, 1, 3)
INSERT [MAESTRO].[RolMenu] ([RolMenuId], [RolId], [MenuId]) VALUES (21, 1, 2)
SET IDENTITY_INSERT [MAESTRO].[RolMenu] OFF
GO
SET IDENTITY_INSERT [MAESTRO].[Usuario] ON 

INSERT [MAESTRO].[Usuario] ([UsuarioId], [PersonaId], [Nombre], [Clave], [Estado]) VALUES (1, 1, N'ADMIN', N'5u2IyWH/5Go=', 1)
INSERT [MAESTRO].[Usuario] ([UsuarioId], [PersonaId], [Nombre], [Clave], [Estado]) VALUES (2, 8, N'YANIDEG', N'5u2IyWH/5Go=', 1)
INSERT [MAESTRO].[Usuario] ([UsuarioId], [PersonaId], [Nombre], [Clave], [Estado]) VALUES (1002, 1006, N'JUAN', N't9TF3dJQg7k=', 1)
INSERT [MAESTRO].[Usuario] ([UsuarioId], [PersonaId], [Nombre], [Clave], [Estado]) VALUES (2002, 2006, N'RUMIR', N't9TF3dJQg7k=', 1)
INSERT [MAESTRO].[Usuario] ([UsuarioId], [PersonaId], [Nombre], [Clave], [Estado]) VALUES (3002, 3006, N'DEMO', N'1NDX5nWKup0=', 1)
SET IDENTITY_INSERT [MAESTRO].[Usuario] OFF
GO
SET IDENTITY_INSERT [MAESTRO].[UsuarioRol] ON 

INSERT [MAESTRO].[UsuarioRol] ([UsuarioRolId], [UsuarioId], [RolId]) VALUES (1004, 2, 1)
INSERT [MAESTRO].[UsuarioRol] ([UsuarioRolId], [UsuarioId], [RolId]) VALUES (1005, 2, 2)
INSERT [MAESTRO].[UsuarioRol] ([UsuarioRolId], [UsuarioId], [RolId]) VALUES (1006, 2, 1002)
INSERT [MAESTRO].[UsuarioRol] ([UsuarioRolId], [UsuarioId], [RolId]) VALUES (1009, 1002, 1003)
INSERT [MAESTRO].[UsuarioRol] ([UsuarioRolId], [UsuarioId], [RolId]) VALUES (2002, 1, 1)
SET IDENTITY_INSERT [MAESTRO].[UsuarioRol] OFF
GO
SET IDENTITY_INSERT [VENTA].[CATEGORIA] ON 

INSERT [VENTA].[CATEGORIA] ([IdCategoria], [Descripcion], [FechaRegistro]) VALUES (1, N'Bebidas', CAST(N'2022-08-01T22:24:40.850' AS DateTime))
INSERT [VENTA].[CATEGORIA] ([IdCategoria], [Descripcion], [FechaRegistro]) VALUES (2, N'Embutidos', CAST(N'2022-08-01T22:24:40.850' AS DateTime))
INSERT [VENTA].[CATEGORIA] ([IdCategoria], [Descripcion], [FechaRegistro]) VALUES (3, N'Bazar', CAST(N'2022-08-01T22:24:40.850' AS DateTime))
INSERT [VENTA].[CATEGORIA] ([IdCategoria], [Descripcion], [FechaRegistro]) VALUES (4, N'Perifericos', CAST(N'2022-08-01T22:24:40.850' AS DateTime))
SET IDENTITY_INSERT [VENTA].[CATEGORIA] OFF
GO
SET IDENTITY_INSERT [VENTA].[DETALLE_VENTA] ON 

INSERT [VENTA].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [PrecioVenta], [Cantidad], [Total]) VALUES (1, 1, 2, CAST(7.20 AS Decimal(10, 2)), 1, CAST(7.20 AS Decimal(10, 2)))
INSERT [VENTA].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [PrecioVenta], [Cantidad], [Total]) VALUES (2, 2, 2, CAST(7.20 AS Decimal(10, 2)), 1, CAST(7.20 AS Decimal(10, 2)))
INSERT [VENTA].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [PrecioVenta], [Cantidad], [Total]) VALUES (3, 3, 2, CAST(7.20 AS Decimal(10, 2)), 1, CAST(7.20 AS Decimal(10, 2)))
INSERT [VENTA].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [PrecioVenta], [Cantidad], [Total]) VALUES (4, 4, 2, CAST(7.20 AS Decimal(10, 2)), 1, CAST(7.20 AS Decimal(10, 2)))
INSERT [VENTA].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [PrecioVenta], [Cantidad], [Total]) VALUES (5, 5, 2, CAST(7.20 AS Decimal(10, 2)), 1, CAST(7.20 AS Decimal(10, 2)))
INSERT [VENTA].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [PrecioVenta], [Cantidad], [Total]) VALUES (6, 5, 3, CAST(5.20 AS Decimal(10, 2)), 1, CAST(5.20 AS Decimal(10, 2)))
INSERT [VENTA].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [PrecioVenta], [Cantidad], [Total]) VALUES (7, 6, 2, CAST(7.20 AS Decimal(10, 2)), 1, CAST(7.20 AS Decimal(10, 2)))
SET IDENTITY_INSERT [VENTA].[DETALLE_VENTA] OFF
GO
SET IDENTITY_INSERT [VENTA].[PRODUCTO] ON 

INSERT [VENTA].[PRODUCTO] ([IdProducto], [Codigo], [IdCategoria], [Descripcion], [PrecioCompra], [PrecioVenta], [Stock], [FechaRegistro]) VALUES (1, N'10101010', 3, N'Mermelada Gloria selecta 500mg', CAST(6.00 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), 50, CAST(N'2022-08-01T22:24:40.857' AS DateTime))
INSERT [VENTA].[PRODUCTO] ([IdProducto], [Codigo], [IdCategoria], [Descripcion], [PrecioCompra], [PrecioVenta], [Stock], [FechaRegistro]) VALUES (2, N'11111111', 3, N'Aceite primor 1.8lts', CAST(6.20 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), 40, CAST(N'2022-08-01T22:24:40.857' AS DateTime))
INSERT [VENTA].[PRODUCTO] ([IdProducto], [Codigo], [IdCategoria], [Descripcion], [PrecioCompra], [PrecioVenta], [Stock], [FechaRegistro]) VALUES (3, N'12121212', 3, N'Atun Real Light', CAST(4.00 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)), 30, CAST(N'2022-08-01T22:24:40.857' AS DateTime))
INSERT [VENTA].[PRODUCTO] ([IdProducto], [Codigo], [IdCategoria], [Descripcion], [PrecioCompra], [PrecioVenta], [Stock], [FechaRegistro]) VALUES (4, N'13131313', 3, N'Refresco zuko Naranja', CAST(1.20 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), 50, CAST(N'2022-08-01T22:24:40.857' AS DateTime))
INSERT [VENTA].[PRODUCTO] ([IdProducto], [Codigo], [IdCategoria], [Descripcion], [PrecioCompra], [PrecioVenta], [Stock], [FechaRegistro]) VALUES (5, N'14141414', 4, N'Mouse logitech g230', CAST(120.00 AS Decimal(10, 2)), CAST(130.00 AS Decimal(10, 2)), 20, CAST(N'2022-08-01T22:24:40.857' AS DateTime))
SET IDENTITY_INSERT [VENTA].[PRODUCTO] OFF
GO
SET IDENTITY_INSERT [VENTA].[VENTA] ON 

INSERT [VENTA].[VENTA] ([IdVenta], [TipoPago], [NumeroDocumento], [DocumentoCliente], [NombreCliente], [MontoPagoCon], [MontoCambio], [MontoSubTotal], [MontoIGV], [MontoTotal], [FechaRegistro]) VALUES (1, N'Tarjeta', NULL, N'24234', N'gdfgd', NULL, NULL, CAST(6.10 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(N'2022-08-03T10:34:56.653' AS DateTime))
INSERT [VENTA].[VENTA] ([IdVenta], [TipoPago], [NumeroDocumento], [DocumentoCliente], [NombreCliente], [MontoPagoCon], [MontoCambio], [MontoSubTotal], [MontoIGV], [MontoTotal], [FechaRegistro]) VALUES (2, N'Tarjeta', NULL, N'24234', N'gdfgd', NULL, NULL, CAST(6.10 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(N'2022-08-03T10:35:25.943' AS DateTime))
INSERT [VENTA].[VENTA] ([IdVenta], [TipoPago], [NumeroDocumento], [DocumentoCliente], [NombreCliente], [MontoPagoCon], [MontoCambio], [MontoSubTotal], [MontoIGV], [MontoTotal], [FechaRegistro]) VALUES (3, N'Efectivo', NULL, N'24234', N'gdfgd', CAST(10.00 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(N'2022-08-03T10:38:46.003' AS DateTime))
INSERT [VENTA].[VENTA] ([IdVenta], [TipoPago], [NumeroDocumento], [DocumentoCliente], [NombreCliente], [MontoPagoCon], [MontoCambio], [MontoSubTotal], [MontoIGV], [MontoTotal], [FechaRegistro]) VALUES (4, N'Tarjeta', NULL, N'321312', N'Rumi', NULL, NULL, CAST(6.10 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(N'2022-08-03T10:44:59.260' AS DateTime))
INSERT [VENTA].[VENTA] ([IdVenta], [TipoPago], [NumeroDocumento], [DocumentoCliente], [NombreCliente], [MontoPagoCon], [MontoCambio], [MontoSubTotal], [MontoIGV], [MontoTotal], [FechaRegistro]) VALUES (5, N'Tarjeta', NULL, N'41256398', N'Raul de Mitma', NULL, NULL, CAST(10.51 AS Decimal(10, 2)), CAST(1.89 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(N'2022-08-03T13:35:08.213' AS DateTime))
INSERT [VENTA].[VENTA] ([IdVenta], [TipoPago], [NumeroDocumento], [DocumentoCliente], [NombreCliente], [MontoPagoCon], [MontoCambio], [MontoSubTotal], [MontoIGV], [MontoTotal], [FechaRegistro]) VALUES (6, N'Tarjeta', NULL, N'345345', N'dsgfsdfs', NULL, NULL, CAST(6.10 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(N'2022-08-03T14:26:18.693' AS DateTime))
INSERT [VENTA].[VENTA] ([IdVenta], [TipoPago], [NumeroDocumento], [DocumentoCliente], [NombreCliente], [MontoPagoCon], [MontoCambio], [MontoSubTotal], [MontoIGV], [MontoTotal], [FechaRegistro]) VALUES (7, N'Tarjeta', NULL, N'345345', N'dsgfsdfs', NULL, NULL, CAST(6.10 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(N'2022-08-03T14:26:18.693' AS DateTime))
SET IDENTITY_INSERT [VENTA].[VENTA] OFF
GO
ALTER TABLE [VENTA].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [VENTA].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [VENTA].[VENTA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [MAESTRO].[RolMenu]  WITH CHECK ADD FOREIGN KEY([MenuId])
REFERENCES [MAESTRO].[Menu] ([MenuId])
GO
ALTER TABLE [MAESTRO].[RolMenu]  WITH CHECK ADD FOREIGN KEY([RolId])
REFERENCES [MAESTRO].[Rol] ([RolId])
GO
ALTER TABLE [MAESTRO].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK__Usuario__Persona__267ABA7A] FOREIGN KEY([PersonaId])
REFERENCES [MAESTRO].[Persona] ([PersonaId])
GO
ALTER TABLE [MAESTRO].[Usuario] CHECK CONSTRAINT [FK__Usuario__Persona__267ABA7A]
GO
ALTER TABLE [MAESTRO].[UsuarioRol]  WITH CHECK ADD FOREIGN KEY([RolId])
REFERENCES [MAESTRO].[Rol] ([RolId])
GO
ALTER TABLE [MAESTRO].[UsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK__UsuarioRo__Usuar__2B3F6F97] FOREIGN KEY([UsuarioId])
REFERENCES [MAESTRO].[Usuario] ([UsuarioId])
GO
ALTER TABLE [MAESTRO].[UsuarioRol] CHECK CONSTRAINT [FK__UsuarioRo__Usuar__2B3F6F97]
GO
ALTER TABLE [VENTA].[DETALLE_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_VENTA_PRODUCTO] FOREIGN KEY([IdProducto])
REFERENCES [VENTA].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [VENTA].[DETALLE_VENTA] CHECK CONSTRAINT [FK_DETALLE_VENTA_PRODUCTO]
GO
ALTER TABLE [VENTA].[DETALLE_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_VENTA_VENTA] FOREIGN KEY([IdVenta])
REFERENCES [VENTA].[VENTA] ([IdVenta])
GO
ALTER TABLE [VENTA].[DETALLE_VENTA] CHECK CONSTRAINT [FK_DETALLE_VENTA_VENTA]
GO
ALTER TABLE [VENTA].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_CATEGORIA] FOREIGN KEY([IdCategoria])
REFERENCES [VENTA].[CATEGORIA] ([IdCategoria])
GO
ALTER TABLE [VENTA].[PRODUCTO] CHECK CONSTRAINT [FK_PRODUCTO_CATEGORIA]
GO
/****** Object:  StoredProcedure [dbo].[usp_ReportePersona]    Script Date: 3/08/2022 14:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_ReportePersona]
AS

SELECT TOP 2 PersonaId, NombreCompleto, Celular
FROM MAESTRO.Persona

GO
/****** Object:  StoredProcedure [MAESTRO].[usp_MenuLst]    Script Date: 3/08/2022 14:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- MAESTRO.usp_MenuLst 1
CREATE PROC [MAESTRO].[usp_MenuLst]
@UsuarioId INT
AS
BEGIN
	WITH MNU AS(
		SELECT DISTINCT M.* 
		FROM MAESTRO.UsuarioRol UR
		INNER JOIN MAESTRO.RolMenu RM ON UR.RolId = RM.RolId
		INNER JOIN MAESTRO.Menu M ON RM.MenuId = M.MenuId
		WHERE UR.UsuarioId=@UsuarioId 
	)
	SELECT * FROM MNU
	UNION
	SELECT M.* FROM MAESTRO.Menu M
	INNER JOIN MNU M1 ON M1.Referencia=M.Orden 
	WHERE M.IndPadre=1
	ORDER BY 7
END
GO
