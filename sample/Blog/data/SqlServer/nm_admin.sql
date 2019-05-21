USE [master]
GO
/****** Object:  Database [Nm_Admin]    Script Date: 2019/5/21 15:25:14 ******/
CREATE DATABASE [Nm_Admin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nm_Admin', FILENAME = N'D:\Database\SqlServer\Nm_Admin.mdf' , SIZE = 98304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Nm_Admin_log', FILENAME = N'D:\Database\SqlServer\Nm_Admin_log.ldf' , SIZE = 517184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Nm_Admin] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nm_Admin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nm_Admin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nm_Admin] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nm_Admin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nm_Admin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nm_Admin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nm_Admin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nm_Admin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nm_Admin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nm_Admin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nm_Admin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nm_Admin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nm_Admin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nm_Admin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nm_Admin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nm_Admin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nm_Admin] SET RECOVERY FULL 
GO
ALTER DATABASE [Nm_Admin] SET  MULTI_USER 
GO
ALTER DATABASE [Nm_Admin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nm_Admin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nm_Admin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nm_Admin] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Nm_Admin] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Nm_Admin', N'ON'
GO
ALTER DATABASE [Nm_Admin] SET QUERY_STORE = OFF
GO
USE [Nm_Admin]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2019/5/21 15:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[LoginTime] [datetime] NOT NULL,
	[LoginIP] [nvarchar](50) NOT NULL,
	[Status] [smallint] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[ClosedTime] [datetime] NOT NULL,
	[ClosedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Role]    Script Date: 2019/5/21 15:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Account_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditInfo]    Script Date: 2019/5/21 15:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditInfo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [uniqueidentifier] NULL,
	[Area] [nvarchar](50) NOT NULL,
	[Controller] [nvarchar](50) NOT NULL,
	[Action] [nvarchar](50) NOT NULL,
	[Parameters] [nvarchar](max) NULL,
	[Result] [nvarchar](max) NULL,
	[ExecutionTime] [datetime] NOT NULL,
	[ExecutionDuration] [bigint] NOT NULL,
	[BrowserInfo] [nvarchar](500) NULL,
	[Platform] [smallint] NOT NULL,
	[IP] [nvarchar](50) NULL,
 CONSTRAINT [PK_AuditInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Button]    Script Date: 2019/5/21 15:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Button](
	[Id] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Icon] [nvarchar](50) NULL,
	[Code] [nvarchar](100) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Button] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Button_Permission]    Script Date: 2019/5/21 15:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Button_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ButtonId] [uniqueidentifier] NOT NULL,
	[PermissionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Button_Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 2019/5/21 15:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](255) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[Remarks] [nvarchar](255) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2019/5/21 15:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [uniqueidentifier] NOT NULL,
	[ModuleCode] [varchar](50) NOT NULL,
	[Type] [smallint] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[RouteName] [nvarchar](100) NOT NULL,
	[RouteParams] [nvarchar](500) NULL,
	[RouteQuery] [nvarchar](500) NULL,
	[Icon] [nvarchar](20) NOT NULL,
	[IconColor] [nvarchar](10) NULL,
	[Url] [nvarchar](255) NOT NULL,
	[Level] [int] NOT NULL,
	[Show] [bit] NOT NULL,
	[Sort] [int] NOT NULL,
	[Target] [smallint] NOT NULL,
	[DialogWidth] [nvarchar](20) NULL,
	[DialogHeight] [nvarchar](20) NULL,
	[DialogFullscreen] [bit] NOT NULL,
	[Remarks] [nvarchar](255) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__menu__3214EC0736145F4E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_Permission]    Script Date: 2019/5/21 15:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[PermissionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__menu_per__3214EC07810AB101] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModuleInfo]    Script Date: 2019/5/21 15:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Version] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](500) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__modulein__3214EC07FE6866D0] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 2019/5/21 15:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ModuleCode] [nvarchar](50) NOT NULL,
	[Controller] [nvarchar](50) NOT NULL,
	[Action] [nvarchar](50) NOT NULL,
	[HttpMethod] [smallint] NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__permissi__3214EC0749519E5A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2019/5/21 15:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](255) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK__role__3214EC073DA7FC47] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Menu]    Script Date: 2019/5/21 15:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__role_men__3214EC0772E9B7E0] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Menu_Button]    Script Date: 2019/5/21 15:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Menu_Button](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[ButtonId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RoleMenuButton] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Id], [UserName], [Password], [Name], [Phone], [Email], [LoginTime], [LoginIP], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [ClosedTime], [ClosedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', N'tdkj', N'FDFAEC6B4F80E739A50ADC802C5B537C', N'管理员', N'', N'', CAST(N'2019-05-17T12:51:33.453' AS DateTime), N'0.0.0.1', 1, CAST(N'2019-04-12T11:36:51.523' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-04-18T17:30:56.847' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T11:36:51.523' AS DateTime), N'00000000-0000-0000-0000-000000000000', 0, CAST(N'2019-04-12T11:36:51.523' AS DateTime), N'00000000-0000-0000-0000-000000000000')
SET IDENTITY_INSERT [dbo].[Account_Role] ON 

INSERT [dbo].[Account_Role] ([Id], [AccountId], [RoleId]) VALUES (2, N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d')
SET IDENTITY_INSERT [dbo].[Account_Role] OFF
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'40f1bfdb-22bd-0da1-3942-39ed220df27f', N'0404f457-1c32-ba61-8fad-39ed2208bcd9', N'同步', N'refresh', N'admin_moduleinfo_sync', CAST(N'2019-04-12T12:49:31.740' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T12:49:31.740' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'181f6b49-4e36-8620-dc51-39ed220df287', N'0404f457-1c32-ba61-8fad-39ed2208bcd9', N'删除', NULL, N'admin_moduleinfo_del', CAST(N'2019-04-12T12:49:31.743' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T12:49:31.743' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ef881c51-de63-8572-250b-39ed2211c64a', N'a74578da-7b3b-8a7c-e54c-39ed22090f48', N'同步', N'refresh', N'admin_permission_sync', CAST(N'2019-04-12T12:53:42.543' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T12:53:42.543' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'97727921-f069-afab-cff8-39ed2211c64d', N'a74578da-7b3b-8a7c-e54c-39ed22090f48', N'删除', NULL, N'admin_permission_del', CAST(N'2019-04-12T12:53:42.547' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T12:53:42.547' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'99eb627e-7e79-b36a-1c3c-39ed2213be3e', N'a9105ca0-722c-66f5-844b-39ed220926a0', N'添加', N'', N'admin_menu_add', CAST(N'2019-04-12T12:55:51.607' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T10:05:21.157' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b4eaae9e-6d8d-4c28-f832-39ed2213be41', N'a9105ca0-722c-66f5-844b-39ed220926a0', N'编辑', N'', N'admin_menu_edit', CAST(N'2019-04-12T12:55:51.607' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T10:05:21.173' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1fc9841e-ccba-4b85-41c6-39ed2213be42', N'a9105ca0-722c-66f5-844b-39ed220926a0', N'删除', N'', N'admin_menu_del', CAST(N'2019-04-12T12:55:51.607' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T10:05:21.187' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6309893f-188f-16db-ca2e-39ed2213be43', N'a9105ca0-722c-66f5-844b-39ed220926a0', N'绑定权限', N'', N'admin_menu_bind_permission', CAST(N'2019-04-12T12:55:51.607' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T10:05:21.193' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'64a397a3-f185-f740-5fd8-39ed2213be46', N'a9105ca0-722c-66f5-844b-39ed220926a0', N'绑定按钮', N'', N'admin_menu_bind_button', CAST(N'2019-04-12T12:55:51.607' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T10:05:21.207' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'13ee6243-46b6-ae86-a1aa-39ed22360378', N'e38b0e46-a755-ff0f-012c-39ed2209462a', N'添加', NULL, N'admin_role_add', CAST(N'2019-04-12T13:33:17.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T13:33:17.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c8c65374-9db0-98ed-9c41-39ed2236037b', N'e38b0e46-a755-ff0f-012c-39ed2209462a', N'编辑', NULL, N'admin_role_edit', CAST(N'2019-04-12T13:33:17.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T13:33:17.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6443babb-3005-3393-cfa3-39ed2236037e', N'e38b0e46-a755-ff0f-012c-39ed2209462a', N'删除', NULL, N'admin_role_del', CAST(N'2019-04-12T13:33:17.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T13:33:17.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7fcb3809-1893-bd91-ce50-39ed22360380', N'e38b0e46-a755-ff0f-012c-39ed2209462a', N'绑定菜单', NULL, N'admin_role_bind_menu', CAST(N'2019-04-12T13:33:17.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T13:33:17.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a83923d1-7aa3-107b-c72d-39ed2238c64f', N'64bb88f0-ae8d-eff9-c537-39ed22096f9b', N'添加', N'add', N'admin_account_add', CAST(N'2019-04-12T13:36:18.500' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T13:36:18.500' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'02aa62d0-2944-eabe-ed49-39ed2238c652', N'64bb88f0-ae8d-eff9-c537-39ed22096f9b', N'编辑', NULL, N'admin_account_edit', CAST(N'2019-04-12T13:36:18.500' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T13:36:18.500' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'40ccb97f-49b2-24ad-bfd7-39ed2238c653', N'64bb88f0-ae8d-eff9-c537-39ed22096f9b', N'删除', NULL, N'admin_account_del', CAST(N'2019-04-12T13:36:18.500' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T13:36:18.500' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f92ee62d-1499-c296-e25c-39ed2238c655', N'64bb88f0-ae8d-eff9-c537-39ed22096f9b', N'重置密码', NULL, N'admin_account_reset_password', CAST(N'2019-04-12T13:36:18.500' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T13:36:18.500' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'62c2cb73-eec9-dea5-c020-39ed223c4590', N'b09aac3d-43b4-3327-9f05-39ed22098f00', N'详情', NULL, N'admin_auditinfo_details', CAST(N'2019-04-12T13:40:07.673' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T13:40:07.673' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'62717e4f-d4db-e8ec-2d4e-39edd5b637bb', N'a9105ca0-722c-66f5-844b-39ed220926a0', N'排序', NULL, N'admin_menu_sort', CAST(N'2019-05-17T10:05:21.100' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T10:05:21.100' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'161e3e65-a02e-8a59-8c3e-39edd64a36e9', N'f2155b1a-d222-8786-e9d7-39edd6492774', N'添加', N'add', N'codegenerator_enum_add', CAST(N'2019-05-17T12:47:00.270' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:47:00.270' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1ae9f5e5-b972-375f-d680-39edd64a3703', N'f2155b1a-d222-8786-e9d7-39edd6492774', N'编辑', NULL, N'codegenerator_enum_edit', CAST(N'2019-05-17T12:47:00.273' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:47:00.273' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a7d396fb-bc36-ee11-a857-39edd64a370a', N'f2155b1a-d222-8786-e9d7-39edd6492774', N'删除', NULL, N'codegenerator_enum_del', CAST(N'2019-05-17T12:47:00.273' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:47:00.273' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7823220c-7fad-05cd-b3ff-39edd64d6318', N'90fe5cac-952b-8919-59be-39edd648fab5', N'添加', N'add', N'codegenerator_project_add', CAST(N'2019-05-17T12:50:28.227' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:50:28.227' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'577bebf3-2408-9fa6-071a-39edd64d6328', N'90fe5cac-952b-8919-59be-39edd648fab5', N'编辑', NULL, N'codegenerator_project_edit', CAST(N'2019-05-17T12:50:28.227' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:50:28.227' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'318c6f27-604e-afc5-22bf-39edd64d6330', N'90fe5cac-952b-8919-59be-39edd648fab5', N'删除', NULL, N'codegenerator_project_del', CAST(N'2019-05-17T12:50:28.227' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:50:28.227' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8405fed8-e131-23ab-7740-39edd64d6339', N'90fe5cac-952b-8919-59be-39edd648fab5', N'生成', NULL, N'codegenerator_project_build_code', CAST(N'2019-05-17T12:50:28.227' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:50:28.227' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
SET IDENTITY_INSERT [dbo].[Button_Permission] ON 

INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (1, N'40f1bfdb-22bd-0da1-3942-39ed220df27f', N'70581745-e062-dcd0-c19c-39ed221095c5')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (2, N'181f6b49-4e36-8620-dc51-39ed220df287', N'753bc64a-a40c-e4c4-698d-39ed221095cc')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (3, N'ef881c51-de63-8572-250b-39ed2211c64a', N'b93930ae-b840-d1a1-b19e-39ed221095d5')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (4, N'97727921-f069-afab-cff8-39ed2211c64d', N'453fef51-1d67-3c8d-10b5-39ed221095d6')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (5, N'99eb627e-7e79-b36a-1c3c-39ed2213be3e', N'6528a89e-55e0-55e3-10ae-39ed221095ad')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (6, N'99eb627e-7e79-b36a-1c3c-39ed2213be3e', N'f9a16174-575b-6c3b-3f9d-39ed221095d1')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (7, N'b4eaae9e-6d8d-4c28-f832-39ed2213be41', N'f9a16174-575b-6c3b-3f9d-39ed221095d1')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (8, N'b4eaae9e-6d8d-4c28-f832-39ed2213be41', N'c1580441-4cc5-6733-e9df-39ed221095b3')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (9, N'b4eaae9e-6d8d-4c28-f832-39ed2213be41', N'63237d43-54f2-5e06-2cea-39ed221095b4')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (10, N'1fc9841e-ccba-4b85-41c6-39ed2213be42', N'f3959eb5-2cc2-aed6-67fc-39ed221095b0')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (23, N'6309893f-188f-16db-ca2e-39ed2213be43', N'f9a16174-575b-6c3b-3f9d-39ed221095d1')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (24, N'6309893f-188f-16db-ca2e-39ed2213be43', N'2f075121-ff29-b379-88e0-39ed221095fe')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (25, N'6309893f-188f-16db-ca2e-39ed2213be43', N'c1699e04-4ad0-df03-b375-39ed22109602')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (26, N'6309893f-188f-16db-ca2e-39ed2213be43', N'369ca0d5-73b1-5dff-0306-39ed221095d3')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (27, N'6309893f-188f-16db-ca2e-39ed2213be43', N'bd77531e-9146-ac03-b2d0-39ed221095c1')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (28, N'6309893f-188f-16db-ca2e-39ed2213be43', N'3de2e2dd-2e1a-bbca-9162-39ed221095bf')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (34, N'64a397a3-f185-f740-5fd8-39ed2213be46', N'c26bb465-8c89-51f9-a71f-39ed22109597')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (35, N'64a397a3-f185-f740-5fd8-39ed2213be46', N'131f5777-26da-9a17-15b6-39ed2210959d')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (36, N'64a397a3-f185-f740-5fd8-39ed2213be46', N'eb48579b-94a3-2dc8-ae5e-39ed22109593')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (37, N'64a397a3-f185-f740-5fd8-39ed2213be46', N'40a6a7cb-c7f2-3065-7640-39ed2210959f')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (38, N'64a397a3-f185-f740-5fd8-39ed2213be46', N'cfd7e4ea-2592-3b9a-6780-39ed221095a1')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (39, N'64a397a3-f185-f740-5fd8-39ed2213be46', N'369ca0d5-73b1-5dff-0306-39ed221095d3')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (40, N'64a397a3-f185-f740-5fd8-39ed2213be46', N'f9a16174-575b-6c3b-3f9d-39ed221095d1')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (41, N'64a397a3-f185-f740-5fd8-39ed2213be46', N'2f075121-ff29-b379-88e0-39ed221095fe')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (42, N'64a397a3-f185-f740-5fd8-39ed2213be46', N'c1699e04-4ad0-df03-b375-39ed22109602')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (43, N'13ee6243-46b6-ae86-a1aa-39ed22360378', N'21cb159f-dddd-9aae-90ee-39ed221095e1')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (44, N'c8c65374-9db0-98ed-9c41-39ed2236037b', N'6e4bd745-6add-d321-03a3-39ed221095e4')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (45, N'c8c65374-9db0-98ed-9c41-39ed2236037b', N'941b90ca-7bf7-fa66-21f4-39ed221095e5')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (46, N'6443babb-3005-3393-cfa3-39ed2236037e', N'dad12acd-cc26-ac17-4ff6-39ed221095e3')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (47, N'7fcb3809-1893-bd91-ce50-39ed22360380', N'dc464a46-960c-dd10-0713-39ed221095e7')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (48, N'7fcb3809-1893-bd91-ce50-39ed22360380', N'4b6ee44f-89f4-b657-2887-39ed221095ed')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (49, N'7fcb3809-1893-bd91-ce50-39ed22360380', N'46f7f154-2b89-3f80-cc18-39ed221095f1')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (50, N'7fcb3809-1893-bd91-ce50-39ed22360380', N'e1f86178-2204-72bd-8c55-39ed221095f3')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (51, N'7fcb3809-1893-bd91-ce50-39ed22360380', N'21194feb-9c9f-3fc6-a27b-39ed221095a3')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (52, N'7fcb3809-1893-bd91-ce50-39ed22360380', N'3c8918f7-15cc-8493-f61b-39ed221095c2')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (54, N'02aa62d0-2944-eabe-ed49-39ed2238c652', N'2baa7b7d-94a9-9f13-d009-39ed22109581')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (55, N'02aa62d0-2944-eabe-ed49-39ed2238c652', N'60de5dba-7e79-658e-8a5f-39ed22109583')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (56, N'40ccb97f-49b2-24ad-bfd7-39ed2238c653', N'd4bd9d65-8540-9463-762f-39ed22109589')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (57, N'f92ee62d-1499-c296-e25c-39ed2238c655', N'5e13bbc7-40c0-78f0-9700-39ed2210958e')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (58, N'62c2cb73-eec9-dea5-c020-39ed223c4590', N'f6b17ecc-900f-0547-f1e6-39ed22109591')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (59, N'a83923d1-7aa3-107b-c72d-39ed2238c64f', N'479a4f27-08db-c255-b993-39ed22109580')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (60, N'a83923d1-7aa3-107b-c72d-39ed2238c64f', N'024c22b5-dac2-f91c-33d3-39ed221095f5')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (78, N'62717e4f-d4db-e8ec-2d4e-39edd5b637bb', N'336cf783-a167-8aa0-5065-39edd5b5eee0')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (79, N'62717e4f-d4db-e8ec-2d4e-39edd5b637bb', N'ba54d018-0eb1-0683-8469-39edd5b5eebc')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (80, N'161e3e65-a02e-8a59-8c3e-39edd64a36e9', N'7e9a9372-b299-9f8e-155b-39edd646f21f')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (81, N'1ae9f5e5-b972-375f-d680-39edd64a3703', N'ac3c8201-d7d7-46d4-121b-39edd646f22b')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (82, N'1ae9f5e5-b972-375f-d680-39edd64a3703', N'dd546001-8f04-1ec4-8515-39edd646f235')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (83, N'a7d396fb-bc36-ee11-a857-39edd64a370a', N'7bd7741b-3653-bba9-c13f-39edd646f225')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (84, N'7823220c-7fad-05cd-b3ff-39edd64d6318', N'103ad30b-f5cb-ec6b-2aaa-39edd646f2c7')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (85, N'577bebf3-2408-9fa6-071a-39edd64d6328', N'a474ff49-b640-461a-e6fd-39edd646f2d7')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (86, N'577bebf3-2408-9fa6-071a-39edd64d6328', N'935b0ba6-4396-60ee-2ae7-39edd646f2db')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (87, N'318c6f27-604e-afc5-22bf-39edd64d6330', N'938f6b86-b398-eed9-970c-39edd646f2d0')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (88, N'8405fed8-e131-23ab-7740-39edd64d6339', N'cda73ba5-0aca-c003-9e2e-39edd64e7949')
SET IDENTITY_INSERT [dbo].[Button_Permission] OFF
SET IDENTITY_INSERT [dbo].[Config] ON 

INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (1, N'sys_button_permission', N'True', N'启用按钮权限', CAST(N'2019-04-12T11:36:51.550' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-05-16T16:04:23.583' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (2, N'sys_logo', N'', N'系统Logo', CAST(N'2019-04-12T11:36:51.550' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-05-16T16:04:23.583' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (3, N'sys_auditing', N'False', N'启用审计日志', CAST(N'2019-04-12T11:36:51.550' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-05-16T16:04:23.583' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (4, N'sys_toolbar_skin', N'True', N'显示工具栏皮肤按钮', CAST(N'2019-04-12T11:36:51.550' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-05-16T16:04:23.587' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (5, N'sys_title', N'通用权限管理系统', N'系统标题', CAST(N'2019-04-12T11:36:51.547' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-05-16T16:04:23.583' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (6, N'sys_toolbar_fullscreen', N'True', N'显示工具栏全屏按钮', CAST(N'2019-04-12T11:36:51.550' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-05-16T16:04:23.583' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (7, N'sys_home', N'', N'系统首页', CAST(N'2019-04-12T11:36:51.550' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-05-16T16:04:23.583' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (8, N'sys_verify_code', N'False', N'启用登录验证码功能', CAST(N'2019-05-06T09:11:35.273' AS DateTime), N'39ed5ab3-0c91-a26c-2f8a-a3b723ef422a', CAST(N'2019-05-16T16:04:23.583' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (9, N'sys_toolbar_userinfo', N'True', N'显示工具栏用户信息按钮', CAST(N'2019-05-06T09:35:47.593' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-16T16:04:23.640' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (10, N'sys_toolbar_logout', N'True', N'显示工具栏退出按钮', CAST(N'2019-05-06T09:35:47.593' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-16T16:04:23.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
SET IDENTITY_INSERT [dbo].[Config] OFF
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'214e8c1a-6a87-c214-7ff9-39ed21e7cc27', N'', 0, N'00000000-0000-0000-0000-000000000000', N'权限管理', N'', N'', N'', N'verifycode', N'', N'', 0, 1, 10, -1, N'', N'', 1, N'', CAST(N'2019-04-12T12:07:51.583' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-06T16:54:30.907' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0404f457-1c32-ba61-8fad-39ed2208bcd9', N'Admin', 1, N'214e8c1a-6a87-c214-7ff9-39ed21e7cc27', N'模块管理', N'admin_moduleinfo', N'', N'', N'app', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-04-12T12:43:50.333' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T10:09:12.263' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a74578da-7b3b-8a7c-e54c-39ed22090f48', N'Admin', 1, N'214e8c1a-6a87-c214-7ff9-39ed21e7cc27', N'权限管理', N'admin_permission', N'', N'', N'permission', N'', N'', 1, 1, 1, 0, N'', N'', 1, N'', CAST(N'2019-04-12T12:44:11.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T10:09:12.273' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a9105ca0-722c-66f5-844b-39ed220926a0', N'Admin', 1, N'214e8c1a-6a87-c214-7ff9-39ed21e7cc27', N'菜单管理', N'admin_menu', N'', N'', N'menu', N'', N'', 1, 1, 2, 0, N'', N'', 1, N'', CAST(N'2019-04-12T12:44:17.437' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T10:09:12.283' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e38b0e46-a755-ff0f-012c-39ed2209462a', N'Admin', 1, N'214e8c1a-6a87-c214-7ff9-39ed21e7cc27', N'角色管理', N'admin_role', N'', N'', N'role', N'', N'', 1, 1, 3, 0, N'', N'', 1, N'', CAST(N'2019-04-12T12:44:25.510' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T10:09:12.290' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'64bb88f0-ae8d-eff9-c537-39ed22096f9b', N'Admin', 1, N'214e8c1a-6a87-c214-7ff9-39ed21e7cc27', N'账户管理', N'admin_account', N'', N'', N'user', N'', N'', 1, 1, 4, 0, N'', N'', 1, N'', CAST(N'2019-04-12T12:44:36.123' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T10:09:12.307' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b09aac3d-43b4-3327-9f05-39ed22098f00', N'Admin', 1, N'214e8c1a-6a87-c214-7ff9-39ed21e7cc27', N'审计日志', N'admin_auditinfo', N'', N'', N'log', N'', N'', 1, 1, 5, 0, N'', N'', 1, N'', CAST(N'2019-04-12T12:44:44.153' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T10:09:12.313' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7f9dcb98-20b2-3556-a850-39ed2209ab84', N'Admin', 1, N'214e8c1a-6a87-c214-7ff9-39ed21e7cc27', N'系统配置', N'admin_system_config', N'', N'', N'system', N'', N'', 1, 1, 6, 0, N'', N'', 1, N'', CAST(N'2019-04-12T12:44:51.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T10:09:12.323' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'601d5926-cf2a-ea30-b3cc-39edd647ecd8', N'', 0, N'00000000-0000-0000-0000-000000000000', N'开发工具', N'', N'', N'', N'develop', N'', N'', 0, 1, 1, -1, N'', N'', 1, N'', CAST(N'2019-05-17T12:44:30.287' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:44:30.287' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'aca98589-c672-4c78-8831-39edd648acbb', N'', 0, N'601d5926-cf2a-ea30-b3cc-39edd647ecd8', N'代码生成器', N'', N'', N'', N'develop', N'', N'', 1, 1, 0, -1, N'', N'', 1, N'', CAST(N'2019-05-17T12:45:19.397' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:45:19.397' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'90fe5cac-952b-8919-59be-39edd648fab5', N'CodeGenerator', 1, N'aca98589-c672-4c78-8831-39edd648acbb', N'项目列表', N'codegenerator_project', N'', N'', N'project', N'', N'', 2, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-05-17T12:45:39.373' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:45:39.373' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f2155b1a-d222-8786-e9d7-39edd6492774', N'CodeGenerator', 1, N'aca98589-c672-4c78-8831-39edd648acbb', N'枚举列表', N'codegenerator_enum', N'', N'', N'tag', N'', N'', 2, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-05-17T12:45:50.833' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:45:50.833' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
SET IDENTITY_INSERT [dbo].[Menu_Permission] ON 

INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (1, N'0404f457-1c32-ba61-8fad-39ed2208bcd9', N'0c882026-3b09-a715-698e-39ed221095c4')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (2, N'a74578da-7b3b-8a7c-e54c-39ed22090f48', N'369ca0d5-73b1-5dff-0306-39ed221095d3')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (5, N'e38b0e46-a755-ff0f-012c-39ed2209462a', N'd533353c-a241-c4f5-82bd-39ed221095dd')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (6, N'64bb88f0-ae8d-eff9-c537-39ed22096f9b', N'4888619b-5d4a-6430-ad3a-39ed2210957f')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (8, N'b09aac3d-43b4-3327-9f05-39ed22098f00', N'3d58a917-a9e6-8fb4-aef0-39ed22109590')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (9, N'7f9dcb98-20b2-3556-a850-39ed2209ab84', N'07b2c882-d6f8-e251-e5ec-39ed221095f6')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (10, N'7f9dcb98-20b2-3556-a850-39ed2209ab84', N'e8080a42-912a-23f7-474a-39ed221095f8')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (178, N'a9105ca0-722c-66f5-844b-39ed220926a0', N'2073b60e-8afd-4854-a206-39ed221095a4')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (179, N'a9105ca0-722c-66f5-844b-39ed220926a0', N'21194feb-9c9f-3fc6-a27b-39ed221095a3')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (180, N'a9105ca0-722c-66f5-844b-39ed220926a0', N'79429274-cfcf-30f1-2b1e-39ed221095ba')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (181, N'f2155b1a-d222-8786-e9d7-39edd6492774', N'5a77ee39-3b26-088f-b0c4-39edd646f216')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (182, N'f2155b1a-d222-8786-e9d7-39edd6492774', N'dbe09a62-04ea-257f-4bbf-39edd646f243')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (183, N'f2155b1a-d222-8786-e9d7-39edd6492774', N'de8fc51b-88e7-553b-7773-39edd646f24c')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (184, N'f2155b1a-d222-8786-e9d7-39edd6492774', N'ea79dedb-099c-3132-92c4-39edd646f252')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (185, N'f2155b1a-d222-8786-e9d7-39edd6492774', N'ad112412-b385-a42e-9cb0-39edd646f256')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (186, N'f2155b1a-d222-8786-e9d7-39edd6492774', N'a8d12a71-6045-356a-56e1-39edd646f25e')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (187, N'f2155b1a-d222-8786-e9d7-39edd6492774', N'd327a892-61f1-5dbf-da86-39edd646f266')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (188, N'f2155b1a-d222-8786-e9d7-39edd6492774', N'821d172a-aadd-8516-ca9f-39edd646f26e')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (190, N'90fe5cac-952b-8919-59be-39edd648fab5', N'70ea1fa1-1b84-c6b7-1c5b-39edd646f2be')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (191, N'90fe5cac-952b-8919-59be-39edd648fab5', N'eec8c8d7-6f42-4cc3-1e27-39edd646f20f')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (192, N'90fe5cac-952b-8919-59be-39edd648fab5', N'c0944193-d0c2-8040-91e5-39edd646f207')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (193, N'90fe5cac-952b-8919-59be-39edd648fab5', N'8563a927-bb00-0d98-5b42-39edd646f203')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (194, N'90fe5cac-952b-8919-59be-39edd648fab5', N'31f87f68-25d2-dd70-2821-39edd646f1fd')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (195, N'90fe5cac-952b-8919-59be-39edd648fab5', N'0a4360f5-7fde-6cf6-88f0-39edd646f1ef')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (196, N'90fe5cac-952b-8919-59be-39edd648fab5', N'e181e108-3a6d-ebb5-8f53-39edd646f31d')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (197, N'90fe5cac-952b-8919-59be-39edd648fab5', N'92ba26a7-c033-58d3-6a10-39edd646f318')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (198, N'90fe5cac-952b-8919-59be-39edd648fab5', N'4e0ee58f-9bf6-14e4-0874-39edd646f312')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (199, N'90fe5cac-952b-8919-59be-39edd648fab5', N'd7948bc2-c6d0-f501-8bf5-39edd646f30d')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (200, N'90fe5cac-952b-8919-59be-39edd648fab5', N'cc325b48-b557-0635-d042-39edd646f306')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (201, N'90fe5cac-952b-8919-59be-39edd648fab5', N'ed24644b-5857-c37f-4df3-39edd646f2fe')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (202, N'90fe5cac-952b-8919-59be-39edd648fab5', N'9ab67430-412e-0ca0-0635-39edd646f2f2')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (203, N'90fe5cac-952b-8919-59be-39edd648fab5', N'60dbf5ce-ff5f-88d6-ff9f-39edd646f2ee')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (204, N'90fe5cac-952b-8919-59be-39edd648fab5', N'3b70252c-0225-efdc-9f04-39edd646f2e8')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (205, N'90fe5cac-952b-8919-59be-39edd648fab5', N'837c460d-4a4b-c720-97ef-39edd646f2e1')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (206, N'90fe5cac-952b-8919-59be-39edd648fab5', N'45c2b872-d473-c1c7-43f0-39edd646f2b8')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (207, N'90fe5cac-952b-8919-59be-39edd648fab5', N'db2e0a42-417d-98f3-9d03-39edd646f2b0')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (208, N'90fe5cac-952b-8919-59be-39edd648fab5', N'594a2ae3-56a8-d255-cb55-39edd646f2ab')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (209, N'90fe5cac-952b-8919-59be-39edd648fab5', N'efbc6833-809e-9270-8898-39edd646f2a1')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (210, N'90fe5cac-952b-8919-59be-39edd648fab5', N'8dcec627-a20b-20ea-c4ef-39edd646f299')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (211, N'90fe5cac-952b-8919-59be-39edd648fab5', N'ec812192-f175-6415-67e9-39edd646f292')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (212, N'90fe5cac-952b-8919-59be-39edd648fab5', N'c87c85e6-e85e-ece1-cdb4-39edd646f28c')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (213, N'90fe5cac-952b-8919-59be-39edd648fab5', N'370d8236-6b26-a615-2d9f-39edd646f284')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (214, N'90fe5cac-952b-8919-59be-39edd648fab5', N'e4d3cc7f-8017-3a34-d296-39edd646f27c')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (215, N'90fe5cac-952b-8919-59be-39edd648fab5', N'e528d8ac-9704-607d-0d76-39edd646f275')
SET IDENTITY_INSERT [dbo].[Menu_Permission] OFF
INSERT [dbo].[ModuleInfo] ([Id], [Name], [Code], [Version], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd4f5f231-f698-f224-d587-39ed9d56bf37', N'权限管理', N'Admin', N'1.4.4', N'', CAST(N'2019-05-06T11:22:20.310' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:43:16.930' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[ModuleInfo] ([Id], [Name], [Code], [Version], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4fe58ac7-506b-d100-c374-39edd646ce70', N'代码生成', N'CodeGenerator', N'1.0.0', NULL, CAST(N'2019-05-17T12:43:16.960' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:43:16.960' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'16c7e2bc-a808-55d1-64d6-39ed22109572', N'账户管理_绑定角色', N'Admin', N'Account', N'BindRole', 3, CAST(N'2019-04-12T12:52:24.547' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.513' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4888619b-5d4a-6430-ad3a-39ed2210957f', N'账户管理_查询', N'Admin', N'Account', N'Query', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'479a4f27-08db-c255-b993-39ed22109580', N'账户管理_添加', N'Admin', N'Account', N'Add', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.563' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2baa7b7d-94a9-9f13-d009-39ed22109581', N'账户管理_编辑', N'Admin', N'Account', N'Edit', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.593' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'60de5dba-7e79-658e-8a5f-39ed22109583', N'账户管理_更新', N'Admin', N'Account', N'Update', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.607' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd4bd9d65-8540-9463-762f-39ed22109589', N'账户管理_删除', N'Admin', N'Account', N'Delete', 4, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.627' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5e13bbc7-40c0-78f0-9700-39ed2210958e', N'账户管理_重置密码', N'Admin', N'Account', N'ResetPassword', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.640' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3d58a917-a9e6-8fb4-aef0-39ed22109590', N'审计信息_查询', N'Admin', N'AuditInfo', N'Query', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.650' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f6b17ecc-900f-0547-f1e6-39ed22109591', N'审计信息_详情', N'Admin', N'AuditInfo', N'Details', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.660' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'eb48579b-94a3-2dc8-ae5e-39ed22109593', N'按钮管理_查询', N'Admin', N'Button', N'Query', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.680' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c26bb465-8c89-51f9-a71f-39ed22109597', N'按钮管理_同步', N'Admin', N'Button', N'Sync', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.690' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'131f5777-26da-9a17-15b6-39ed2210959d', N'按钮管理_删除', N'Admin', N'Button', N'Delete', 4, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'40a6a7cb-c7f2-3065-7640-39ed2210959f', N'按钮管理_获取按钮绑定的权限列表', N'Admin', N'Button', N'PermissionList', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.730' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cfd7e4ea-2592-3b9a-6780-39ed221095a1', N'按钮管理_绑定权限', N'Admin', N'Button', N'BindPermission', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.737' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'21194feb-9c9f-3fc6-a27b-39ed221095a3', N'菜单管理_菜单树', N'Admin', N'Menu', N'Tree', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.760' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2073b60e-8afd-4854-a206-39ed221095a4', N'菜单管理_查询菜单列表', N'Admin', N'Menu', N'Query', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.767' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6528a89e-55e0-55e3-10ae-39ed221095ad', N'菜单管理_添加', N'Admin', N'Menu', N'Add', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.793' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f3959eb5-2cc2-aed6-67fc-39ed221095b0', N'菜单管理_删除', N'Admin', N'Menu', N'Delete', 4, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.803' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c1580441-4cc5-6733-e9df-39ed221095b3', N'菜单管理_编辑', N'Admin', N'Menu', N'Edit', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.827' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'63237d43-54f2-5e06-2cea-39ed221095b4', N'菜单管理_更新', N'Admin', N'Menu', N'Update', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.833' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'79429274-cfcf-30f1-2b1e-39ed221095ba', N'菜单管理_详情', N'Admin', N'Menu', N'Details', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T10:05:02.483' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3de2e2dd-2e1a-bbca-9162-39ed221095bf', N'菜单管理_获取菜单的权限列表', N'Admin', N'Menu', N'PermissionList', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.853' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'bd77531e-9146-ac03-b2d0-39ed221095c1', N'菜单管理_绑定权限', N'Admin', N'Menu', N'BindPermission', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.863' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3c8918f7-15cc-8493-f61b-39ed221095c2', N'菜单管理_获取菜单的按钮列表', N'Admin', N'Menu', N'ButtonList', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.877' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0c882026-3b09-a715-698e-39ed221095c4', N'模块信息_查询', N'Admin', N'ModuleInfo', N'Query', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.923' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'70581745-e062-dcd0-c19c-39ed221095c5', N'模块信息_同步模块数据', N'Admin', N'ModuleInfo', N'Sync', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.943' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'753bc64a-a40c-e4c4-698d-39ed221095cc', N'模块信息_删除', N'Admin', N'ModuleInfo', N'Delete', 4, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.950' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f9a16174-575b-6c3b-3f9d-39ed221095d1', N'模块信息_下拉列表数据', N'Admin', N'ModuleInfo', N'Select', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.967' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'369ca0d5-73b1-5dff-0306-39ed221095d3', N'权限接口_查询', N'Admin', N'Permission', N'Query', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.973' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b93930ae-b840-d1a1-b19e-39ed221095d5', N'权限接口_同步', N'Admin', N'Permission', N'Sync', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.993' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'453fef51-1d67-3c8d-10b5-39ed221095d6', N'权限接口_删除', N'Admin', N'Permission', N'Delete', 4, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.007' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd533353c-a241-c4f5-82bd-39ed221095dd', N'角色管理_查询', N'Admin', N'Role', N'Query', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.030' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'21cb159f-dddd-9aae-90ee-39ed221095e1', N'角色管理_添加', N'Admin', N'Role', N'Add', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.040' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'dad12acd-cc26-ac17-4ff6-39ed221095e3', N'角色管理_删除', N'Admin', N'Role', N'Delete', 4, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.050' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6e4bd745-6add-d321-03a3-39ed221095e4', N'角色管理_编辑', N'Admin', N'Role', N'Edit', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.057' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'941b90ca-7bf7-fa66-21f4-39ed221095e5', N'角色管理_修改', N'Admin', N'Role', N'Update', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.067' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'dc464a46-960c-dd10-0713-39ed221095e7', N'角色管理_获取角色的关联菜单列表', N'Admin', N'Role', N'MenuList', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.077' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4b6ee44f-89f4-b657-2887-39ed221095ed', N'角色管理_绑定菜单', N'Admin', N'Role', N'BindMenu', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.083' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'46f7f154-2b89-3f80-cc18-39ed221095f1', N'角色管理_获取角色关联的菜单按钮列表', N'Admin', N'Role', N'MenuButtonList', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.093' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e1f86178-2204-72bd-8c55-39ed221095f3', N'角色管理_绑定菜单按钮', N'Admin', N'Role', N'BindMenuButton', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.100' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'024c22b5-dac2-f91c-33d3-39ed221095f5', N'角色管理_下拉列表数据', N'Admin', N'Role', N'Select', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.113' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'07b2c882-d6f8-e251-e5ec-39ed221095f6', N'系统_修改系统配置', N'Admin', N'System', N'Config', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e8080a42-912a-23f7-474a-39ed221095f8', N'系统_上传Logo', N'Admin', N'System', N'UploadLogo', 3, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.130' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2f075121-ff29-b379-88e0-39ed221095fe', N'系统_获取指定模块的Controller下拉列表', N'Admin', N'System', N'AllController', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c1699e04-4ad0-df03-b375-39ed22109602', N'系统_获取指定模块和Controller的Action下拉列表', N'Admin', N'System', N'AllAction', 1, CAST(N'2019-04-12T12:52:24.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.147' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ba54d018-0eb1-0683-8469-39edd5b5eebc', N'菜单管理_更新排序信息', N'Admin', N'Menu', N'Sort', 1, CAST(N'2019-05-17T10:05:02.060' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.913' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'336cf783-a167-8aa0-5065-39edd5b5eee0', N'菜单管理_更新排序信息', N'Admin', N'Menu', N'Sort', 3, CAST(N'2019-05-17T10:05:02.060' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.913' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0a4360f5-7fde-6cf6-88f0-39edd646f1ef', N'实体管理_查询', N'codegenerator', N'Class', N'Query', 1, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.153' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'31f87f68-25d2-dd70-2821-39edd646f1fd', N'实体管理_添加', N'codegenerator', N'Class', N'Add', 3, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.163' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8563a927-bb00-0d98-5b42-39edd646f203', N'实体管理_删除', N'codegenerator', N'Class', N'Delete', 4, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.170' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c0944193-d0c2-8040-91e5-39edd646f207', N'实体管理_编辑', N'codegenerator', N'Class', N'Edit', 1, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.183' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'eec8c8d7-6f42-4cc3-1e27-39edd646f20f', N'实体管理_修改', N'codegenerator', N'Class', N'Update', 3, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.187' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5a77ee39-3b26-088f-b0c4-39edd646f216', N'枚举管理_查询', N'codegenerator', N'Enum', N'Query', 1, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.197' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7e9a9372-b299-9f8e-155b-39edd646f21f', N'枚举管理_添加', N'codegenerator', N'Enum', N'Add', 3, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.203' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7bd7741b-3653-bba9-c13f-39edd646f225', N'枚举管理_删除', N'codegenerator', N'Enum', N'Delete', 4, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.213' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ac3c8201-d7d7-46d4-121b-39edd646f22b', N'枚举管理_编辑', N'codegenerator', N'Enum', N'Edit', 1, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.220' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'dd546001-8f04-1ec4-8515-39edd646f235', N'枚举管理_修改', N'codegenerator', N'Enum', N'Update', 3, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.233' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0bbb7988-4e4b-073e-b94e-39edd646f23c', N'枚举管理_下拉列表', N'codegenerator', N'Enum', N'Select', 1, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.240' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'dbe09a62-04ea-257f-4bbf-39edd646f243', N'枚举项管理_查询', N'codegenerator', N'EnumItem', N'Query', 1, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.250' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'de8fc51b-88e7-553b-7773-39edd646f24c', N'枚举项管理_添加', N'codegenerator', N'EnumItem', N'Add', 3, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.260' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ea79dedb-099c-3132-92c4-39edd646f252', N'枚举项管理_删除', N'codegenerator', N'EnumItem', N'Delete', 4, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.267' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ad112412-b385-a42e-9cb0-39edd646f256', N'枚举项管理_编辑', N'codegenerator', N'EnumItem', N'Edit', 1, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.277' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a8d12a71-6045-356a-56e1-39edd646f25e', N'枚举项管理_修改', N'codegenerator', N'EnumItem', N'Update', 3, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.283' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd327a892-61f1-5dbf-da86-39edd646f266', N'枚举项管理_更新排序信息', N'codegenerator', N'EnumItem', N'Sort', 1, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.317' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'821d172a-aadd-8516-ca9f-39edd646f26e', N'枚举项管理_更新排序信息', N'codegenerator', N'EnumItem', N'Sort', 3, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.317' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e528d8ac-9704-607d-0d76-39edd646f275', N'模型属性管理_查询', N'codegenerator', N'ModelProperty', N'Query', 1, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.330' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e4d3cc7f-8017-3a34-d296-39edd646f27c', N'模型属性管理_添加', N'codegenerator', N'ModelProperty', N'Add', 3, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.337' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'370d8236-6b26-a615-2d9f-39edd646f284', N'模型属性管理_删除', N'codegenerator', N'ModelProperty', N'Delete', 4, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.347' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c87c85e6-e85e-ece1-cdb4-39edd646f28c', N'模型属性管理_编辑', N'codegenerator', N'ModelProperty', N'Edit', 1, CAST(N'2019-05-17T12:43:25.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.357' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ec812192-f175-6415-67e9-39edd646f292', N'模型属性管理_修改', N'codegenerator', N'ModelProperty', N'Update', 3, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.367' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8dcec627-a20b-20ea-c4ef-39edd646f299', N'模型属性管理_更新排序信息', N'codegenerator', N'ModelProperty', N'Sort', 1, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.387' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'efbc6833-809e-9270-8898-39edd646f2a1', N'模型属性管理_更新排序信息', N'codegenerator', N'ModelProperty', N'Sort', 3, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.387' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'594a2ae3-56a8-d255-cb55-39edd646f2ab', N'模型属性管理_修改可空状态', N'codegenerator', N'ModelProperty', N'UpdateNullable', 3, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.397' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'db2e0a42-417d-98f3-9d03-39edd646f2b0', N'模型属性管理_获取下拉列表', N'codegenerator', N'ModelProperty', N'Select', 1, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.403' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'45c2b872-d473-c1c7-43f0-39edd646f2b8', N'模型属性管理_从实体中导入属性', N'codegenerator', N'ModelProperty', N'ImportFromEntity', 3, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.410' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'70ea1fa1-1b84-c6b7-1c5b-39edd646f2be', N'项目管理_查询', N'codegenerator', N'Project', N'Query', 1, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.417' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'103ad30b-f5cb-ec6b-2aaa-39edd646f2c7', N'项目管理_添加', N'codegenerator', N'Project', N'Add', 3, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.427' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'938f6b86-b398-eed9-970c-39edd646f2d0', N'项目管理_删除', N'codegenerator', N'Project', N'Delete', 4, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.433' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a474ff49-b640-461a-e6fd-39edd646f2d7', N'项目管理_编辑', N'codegenerator', N'Project', N'Edit', 1, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.443' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'935b0ba6-4396-60ee-2ae7-39edd646f2db', N'项目管理_修改', N'codegenerator', N'Project', N'Update', 3, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.450' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'837c460d-4a4b-c720-97ef-39edd646f2e1', N'实体属性管理_查询', N'codegenerator', N'Property', N'Query', 1, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.507' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3b70252c-0225-efdc-9f04-39edd646f2e8', N'实体属性管理_添加', N'codegenerator', N'Property', N'Add', 3, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.513' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'60dbf5ce-ff5f-88d6-ff9f-39edd646f2ee', N'实体属性管理_删除', N'codegenerator', N'Property', N'Delete', 4, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.520' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9ab67430-412e-0ca0-0635-39edd646f2f2', N'实体属性管理_编辑', N'codegenerator', N'Property', N'Edit', 1, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.530' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ed24644b-5857-c37f-4df3-39edd646f2fe', N'实体属性管理_修改', N'codegenerator', N'Property', N'Update', 3, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.533' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cc325b48-b557-0635-d042-39edd646f306', N'实体属性管理_更新排序信息', N'codegenerator', N'Property', N'Sort', 1, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd7948bc2-c6d0-f501-8bf5-39edd646f30d', N'实体属性管理_更新排序信息', N'codegenerator', N'Property', N'Sort', 3, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4e0ee58f-9bf6-14e4-0874-39edd646f312', N'实体属性管理_修改可空状态', N'codegenerator', N'Property', N'UpdateNullable', 3, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.560' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'92ba26a7-c033-58d3-6a10-39edd646f318', N'实体属性管理_修改列表显示状态', N'codegenerator', N'Property', N'UpdateShowInList', 3, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.563' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e181e108-3a6d-ebb5-8f53-39edd646f31d', N'实体属性管理_获取下拉列表', N'codegenerator', N'Property', N'Select', 1, CAST(N'2019-05-17T12:43:25.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:39.573' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cda73ba5-0aca-c003-9e2e-39edd64e7949', N'项目管理_生成代码', N'codegenerator', N'Project', N'BuildCode', 3, CAST(N'2019-05-17T12:51:38.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-05-17T12:51:38.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Role] ([Id], [Name], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'系统管理员', NULL, CAST(N'2019-04-12T11:36:51.500' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-04-12T11:36:51.500' AS DateTime), N'00000000-0000-0000-0000-000000000000', 0, CAST(N'2019-04-12T11:36:51.500' AS DateTime), N'00000000-0000-0000-0000-000000000000')
SET IDENTITY_INSERT [dbo].[Role_Menu] ON 

INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (73, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'601d5926-cf2a-ea30-b3cc-39edd647ecd8')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (74, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'aca98589-c672-4c78-8831-39edd648acbb')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (75, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'90fe5cac-952b-8919-59be-39edd648fab5')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (76, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f2155b1a-d222-8786-e9d7-39edd6492774')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (77, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'214e8c1a-6a87-c214-7ff9-39ed21e7cc27')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (78, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'0404f457-1c32-ba61-8fad-39ed2208bcd9')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (79, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'a74578da-7b3b-8a7c-e54c-39ed22090f48')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (80, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'a9105ca0-722c-66f5-844b-39ed220926a0')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (81, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'e38b0e46-a755-ff0f-012c-39ed2209462a')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (82, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'64bb88f0-ae8d-eff9-c537-39ed22096f9b')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (83, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'b09aac3d-43b4-3327-9f05-39ed22098f00')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (84, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'7f9dcb98-20b2-3556-a850-39ed2209ab84')
SET IDENTITY_INSERT [dbo].[Role_Menu] OFF
SET IDENTITY_INSERT [dbo].[Role_Menu_Button] ON 

INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (1, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'0404f457-1c32-ba61-8fad-39ed2208bcd9', N'40f1bfdb-22bd-0da1-3942-39ed220df27f')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (2, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'0404f457-1c32-ba61-8fad-39ed2208bcd9', N'181f6b49-4e36-8620-dc51-39ed220df287')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (3, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'a74578da-7b3b-8a7c-e54c-39ed22090f48', N'ef881c51-de63-8572-250b-39ed2211c64a')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (4, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'a74578da-7b3b-8a7c-e54c-39ed22090f48', N'97727921-f069-afab-cff8-39ed2211c64d')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (5, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'a9105ca0-722c-66f5-844b-39ed220926a0', N'99eb627e-7e79-b36a-1c3c-39ed2213be3e')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (6, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'a9105ca0-722c-66f5-844b-39ed220926a0', N'b4eaae9e-6d8d-4c28-f832-39ed2213be41')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (7, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'a9105ca0-722c-66f5-844b-39ed220926a0', N'1fc9841e-ccba-4b85-41c6-39ed2213be42')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (8, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'a9105ca0-722c-66f5-844b-39ed220926a0', N'6309893f-188f-16db-ca2e-39ed2213be43')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (9, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'a9105ca0-722c-66f5-844b-39ed220926a0', N'64a397a3-f185-f740-5fd8-39ed2213be46')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (10, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'e38b0e46-a755-ff0f-012c-39ed2209462a', N'13ee6243-46b6-ae86-a1aa-39ed22360378')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (11, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'e38b0e46-a755-ff0f-012c-39ed2209462a', N'c8c65374-9db0-98ed-9c41-39ed2236037b')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (12, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'e38b0e46-a755-ff0f-012c-39ed2209462a', N'6443babb-3005-3393-cfa3-39ed2236037e')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (13, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'e38b0e46-a755-ff0f-012c-39ed2209462a', N'7fcb3809-1893-bd91-ce50-39ed22360380')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (14, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'64bb88f0-ae8d-eff9-c537-39ed22096f9b', N'a83923d1-7aa3-107b-c72d-39ed2238c64f')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (15, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'64bb88f0-ae8d-eff9-c537-39ed22096f9b', N'02aa62d0-2944-eabe-ed49-39ed2238c652')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (16, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'64bb88f0-ae8d-eff9-c537-39ed22096f9b', N'40ccb97f-49b2-24ad-bfd7-39ed2238c653')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (17, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'64bb88f0-ae8d-eff9-c537-39ed22096f9b', N'f92ee62d-1499-c296-e25c-39ed2238c655')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (18, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'b09aac3d-43b4-3327-9f05-39ed22098f00', N'62c2cb73-eec9-dea5-c020-39ed223c4590')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (34, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'a9105ca0-722c-66f5-844b-39ed220926a0', N'62717e4f-d4db-e8ec-2d4e-39edd5b637bb')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (35, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'90fe5cac-952b-8919-59be-39edd648fab5', N'7823220c-7fad-05cd-b3ff-39edd64d6318')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (36, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'90fe5cac-952b-8919-59be-39edd648fab5', N'577bebf3-2408-9fa6-071a-39edd64d6328')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (37, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'90fe5cac-952b-8919-59be-39edd648fab5', N'318c6f27-604e-afc5-22bf-39edd64d6330')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (38, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'90fe5cac-952b-8919-59be-39edd648fab5', N'8405fed8-e131-23ab-7740-39edd64d6339')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (39, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f2155b1a-d222-8786-e9d7-39edd6492774', N'161e3e65-a02e-8a59-8c3e-39edd64a36e9')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (40, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f2155b1a-d222-8786-e9d7-39edd6492774', N'1ae9f5e5-b972-375f-d680-39edd64a3703')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (41, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f2155b1a-d222-8786-e9d7-39edd6492774', N'a7d396fb-bc36-ee11-a857-39edd64a370a')
SET IDENTITY_INSERT [dbo].[Role_Menu_Button] OFF
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_account_LastLoginTime]  DEFAULT (getdate()) FOR [LoginTime]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_account_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_DeletedTime]  DEFAULT (getdate()) FOR [DeletedTime]
GO
ALTER TABLE [dbo].[AuditInfo] ADD  CONSTRAINT [DF_AuditInfo_ExecutionTime]  DEFAULT (getdate()) FOR [ExecutionTime]
GO
ALTER TABLE [dbo].[AuditInfo] ADD  CONSTRAINT [DF_AuditInfo_ExecutionDuration]  DEFAULT ((0)) FOR [ExecutionDuration]
GO
ALTER TABLE [dbo].[AuditInfo] ADD  CONSTRAINT [DF_AuditInfo_Platform]  DEFAULT ((0)) FOR [Platform]
GO
ALTER TABLE [dbo].[Button] ADD  CONSTRAINT [DF_Button_DomId]  DEFAULT (N'') FOR [Code]
GO
ALTER TABLE [dbo].[Button] ADD  CONSTRAINT [DF_Button_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Button] ADD  CONSTRAINT [DF_Button_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_DialogFullscreen]  DEFAULT ((1)) FOR [DialogFullscreen]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[ModuleInfo] ADD  CONSTRAINT [DF_ModuleInfo_Version]  DEFAULT (N'') FOR [Version]
GO
ALTER TABLE [dbo].[ModuleInfo] ADD  CONSTRAINT [DF_ModuleInfo_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[ModuleInfo] ADD  CONSTRAINT [DF_ModuleInfo_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_HttpMethod]  DEFAULT ((0)) FOR [HttpMethod]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_DeletedTime]  DEFAULT (getdate()) FOR [DeletedTime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'LoginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'LoginIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态：0、未激活 1、正常 2、禁用 3、注销' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注销时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ClosedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注销人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ClosedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'DeletedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'DeletedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Role', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Role', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'Controller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'Action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返回数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'Result'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方法开始执行时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'ExecutionTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方法执行总用时(ms)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'ExecutionDuration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览器信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'BrowserInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平台' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'Platform'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button_Permission', @level2type=N'COLUMN',@level2name=N'ButtonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button_Permission', @level2type=N'COLUMN',@level2name=N'PermissionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Key'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属模块' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModuleCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型，0、节点 1、链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'RouteName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'RouteParams'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'RouteQuery'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'IconColor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Show'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'打开方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Target'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对话框宽度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'DialogWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对话框高度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'DialogHeight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对话框可全屏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'DialogFullscreen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu_Permission', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu_Permission', @level2type=N'COLUMN',@level2name=N'PermissionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'Version'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'ModuleCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'Controller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动作' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'Action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求方法' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'HttpMethod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'DeletedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'DeletedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Menu', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Menu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
USE [master]
GO
ALTER DATABASE [Nm_Admin] SET  READ_WRITE 
GO
