USE [HRA]
GO
/****** Object:  Schema [MAESTRO]    Script Date: 12/07/2022 14:59:51 ******/
CREATE SCHEMA [MAESTRO]
GO
/****** Object:  Table [MAESTRO].[Menu]    Script Date: 12/07/2022 14:59:51 ******/
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
/****** Object:  Table [MAESTRO].[Persona]    Script Date: 12/07/2022 14:59:51 ******/
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
/****** Object:  Table [MAESTRO].[Rol]    Script Date: 12/07/2022 14:59:51 ******/
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
/****** Object:  Table [MAESTRO].[RolMenu]    Script Date: 12/07/2022 14:59:51 ******/
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
/****** Object:  Table [MAESTRO].[Usuario]    Script Date: 12/07/2022 14:59:51 ******/
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
/****** Object:  Table [MAESTRO].[UsuarioRol]    Script Date: 12/07/2022 14:59:51 ******/
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
SET IDENTITY_INSERT [MAESTRO].[Menu] ON 

INSERT [MAESTRO].[Menu] ([MenuId], [Denominacion], [Modulo], [Url], [Icono], [IndPadre], [Orden], [Referencia]) VALUES (1, N'SEGURIDAD', N'', N'', NULL, 1, CAST(10.0 AS Decimal(3, 1)), NULL)
INSERT [MAESTRO].[Menu] ([MenuId], [Denominacion], [Modulo], [Url], [Icono], [IndPadre], [Orden], [Referencia]) VALUES (2, N'USUARIO', N'SEGURIDAD', N'Usuario', NULL, 0, CAST(10.1 AS Decimal(3, 1)), CAST(10.0 AS Decimal(3, 1)))
INSERT [MAESTRO].[Menu] ([MenuId], [Denominacion], [Modulo], [Url], [Icono], [IndPadre], [Orden], [Referencia]) VALUES (3, N'ROL', N'SEGURIDAD', N'Rol', NULL, 0, CAST(10.2 AS Decimal(3, 1)), CAST(10.0 AS Decimal(3, 1)))
INSERT [MAESTRO].[Menu] ([MenuId], [Denominacion], [Modulo], [Url], [Icono], [IndPadre], [Orden], [Referencia]) VALUES (4, N'PROYECTO', N'', N'', NULL, 1, CAST(20.0 AS Decimal(3, 1)), NULL)
INSERT [MAESTRO].[Menu] ([MenuId], [Denominacion], [Modulo], [Url], [Icono], [IndPadre], [Orden], [Referencia]) VALUES (5, N'GESTOR', N'PROYECTO', N'Gestor', NULL, 0, CAST(20.1 AS Decimal(3, 1)), CAST(20.0 AS Decimal(3, 1)))
INSERT [MAESTRO].[Menu] ([MenuId], [Denominacion], [Modulo], [Url], [Icono], [IndPadre], [Orden], [Referencia]) VALUES (6, N'TAREA', N'PROYECTO', N'Tarea', NULL, 0, CAST(20.2 AS Decimal(3, 1)), CAST(20.0 AS Decimal(3, 1)))
INSERT [MAESTRO].[Menu] ([MenuId], [Denominacion], [Modulo], [Url], [Icono], [IndPadre], [Orden], [Referencia]) VALUES (7, N'PERMISO', N'SEGURIDAD', N'Permiso', NULL, 0, CAST(10.3 AS Decimal(3, 1)), CAST(10.0 AS Decimal(3, 1)))
SET IDENTITY_INSERT [MAESTRO].[Menu] OFF
GO
SET IDENTITY_INSERT [MAESTRO].[Persona] ON 

INSERT [MAESTRO].[Persona] ([PersonaId], [Nombre], [ApePaterno], [ApeMaterno], [NombreCompleto], [NumeroDocumento], [Sexo], [Email], [FechaNacimiento], [Direccion], [DireccionRef], [Celular], [EstadoCivilId], [Activo], [Nota]) VALUES (1, N'RICHARD', N'ZAPATA', N'CASAVERDE', N'ZAPATA CASAVERDE RICHARD', N'41901791', N'M', NULL, NULL, NULL, NULL, N'966900599', NULL, 1, NULL)
INSERT [MAESTRO].[Persona] ([PersonaId], [Nombre], [ApePaterno], [ApeMaterno], [NombreCompleto], [NumeroDocumento], [Sexo], [Email], [FechaNacimiento], [Direccion], [DireccionRef], [Celular], [EstadoCivilId], [Activo], [Nota]) VALUES (8, N'YANIDE', N'GALINDO', N'BAUTISTA', N'GALINDO BAUTISTA YANIDE', N'41921997', N'F', NULL, NULL, NULL, NULL, N'9658569', NULL, 1, NULL)
INSERT [MAESTRO].[Persona] ([PersonaId], [Nombre], [ApePaterno], [ApeMaterno], [NombreCompleto], [NumeroDocumento], [Sexo], [Email], [FechaNacimiento], [Direccion], [DireccionRef], [Celular], [EstadoCivilId], [Activo], [Nota]) VALUES (1006, N'JUAN', N'PEREZ', N'PEREZ', N'PEREZ PEREZ JUAN', N'9999999', N'M', NULL, NULL, NULL, NULL, N'965874', NULL, 1, NULL)
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
SET IDENTITY_INSERT [MAESTRO].[Usuario] OFF
GO
SET IDENTITY_INSERT [MAESTRO].[UsuarioRol] ON 

INSERT [MAESTRO].[UsuarioRol] ([UsuarioRolId], [UsuarioId], [RolId]) VALUES (1004, 2, 1)
INSERT [MAESTRO].[UsuarioRol] ([UsuarioRolId], [UsuarioId], [RolId]) VALUES (1005, 2, 2)
INSERT [MAESTRO].[UsuarioRol] ([UsuarioRolId], [UsuarioId], [RolId]) VALUES (1006, 2, 1002)
INSERT [MAESTRO].[UsuarioRol] ([UsuarioRolId], [UsuarioId], [RolId]) VALUES (1008, 1, 1)
INSERT [MAESTRO].[UsuarioRol] ([UsuarioRolId], [UsuarioId], [RolId]) VALUES (1009, 1002, 1003)
SET IDENTITY_INSERT [MAESTRO].[UsuarioRol] OFF
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
/****** Object:  StoredProcedure [MAESTRO].[usp_MenuLst]    Script Date: 12/07/2022 14:59:51 ******/
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
