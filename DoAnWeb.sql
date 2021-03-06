USE [DoAnWeb]
GO
ALTER TABLE [dbo].[SANPHAM] DROP CONSTRAINT [FK_SANPHAM_HANGSX]
GO
ALTER TABLE [dbo].[DATHANG] DROP CONSTRAINT [FK__DATHANG__Makh__2645B050]
GO
ALTER TABLE [dbo].[CHITIETDATHANG] DROP CONSTRAINT [FK_CHITIETDATHANG_SANPHAM]
GO
ALTER TABLE [dbo].[CHITIETDATHANG] DROP CONSTRAINT [FK__CHITIETDAT__Madh__2739D489]
GO
/****** Object:  Table [dbo].[Trangbia]    Script Date: 10/27/2017 9:40:53 AM ******/
DROP TABLE [dbo].[Trangbia]
GO
/****** Object:  Table [dbo].[Tkadmin]    Script Date: 10/27/2017 9:40:53 AM ******/
DROP TABLE [dbo].[Tkadmin]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 10/27/2017 9:40:53 AM ******/
DROP TABLE [dbo].[SANPHAM]
GO
/****** Object:  Table [dbo].[Lienhe]    Script Date: 10/27/2017 9:40:53 AM ******/
DROP TABLE [dbo].[Lienhe]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 10/27/2017 9:40:53 AM ******/
DROP TABLE [dbo].[KHACHHANG]
GO
/****** Object:  Table [dbo].[HANGSX]    Script Date: 10/27/2017 9:40:53 AM ******/
DROP TABLE [dbo].[HANGSX]
GO
/****** Object:  Table [dbo].[DATHANG]    Script Date: 10/27/2017 9:40:53 AM ******/
DROP TABLE [dbo].[DATHANG]
GO
/****** Object:  Table [dbo].[CHITIETDATHANG]    Script Date: 10/27/2017 9:40:53 AM ******/
DROP TABLE [dbo].[CHITIETDATHANG]
GO
/****** Object:  Table [dbo].[CHITIETDATHANG]    Script Date: 10/27/2017 9:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDATHANG](
	[Madh] [int] NOT NULL,
	[Masp] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Gia] [decimal](18, 0) NULL,
 CONSTRAINT [PK__CHITIETD__75513AEB91944E55] PRIMARY KEY CLUSTERED 
(
	[Madh] ASC,
	[Masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DATHANG]    Script Date: 10/27/2017 9:40:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATHANG](
	[Madh] [int] IDENTITY(1,1) NOT NULL,
	[Makh] [int] NOT NULL,
	[Dathanhtoan] [bit] NULL,
	[Ngaydathang] [datetime] NULL,
	[Ngaygiahang] [nchar](10) NULL,
	[Dagiaohang] [bit] NULL,
 CONSTRAINT [PK__DATHANG__27237A29F0925283] PRIMARY KEY CLUSTERED 
(
	[Madh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HANGSX]    Script Date: 10/27/2017 9:40:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HANGSX](
	[Mahangsx] [varchar](30) NOT NULL,
	[Tenhangsx] [nvarchar](20) NULL,
	[Logo] [nvarchar](50) NULL,
 CONSTRAINT [PK__HANGSX__EE8B9E94325781D7] PRIMARY KEY CLUSTERED 
(
	[Mahangsx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 10/27/2017 9:40:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[Makh] [int] IDENTITY(1,1) NOT NULL,
	[Tenkh] [nvarchar](20) NOT NULL,
	[Diachikh] [nvarchar](50) NULL,
	[Sdtkh] [varchar](11) NOT NULL,
	[Taikhoan] [varchar](50) NOT NULL,
	[Matkhau] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Ngaysinh] [smalldatetime] NULL,
 CONSTRAINT [PK__KHACHHAN__2724C31667BED58D] PRIMARY KEY CLUSTERED 
(
	[Makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lienhe]    Script Date: 10/27/2017 9:40:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lienhe](
	[manoidung] [varchar](10) NOT NULL,
	[chitietnoidung] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[manoidung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 10/27/2017 9:40:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[Masp] [int] IDENTITY(1,1) NOT NULL,
	[Tensp] [nvarchar](30) NOT NULL,
	[Mahangsx] [varchar](30) NULL,
	[Tinhtrang] [bit] NULL,
	[Manhinh] [varchar](20) NULL,
	[Hedieuhanh] [varchar](30) NULL,
	[CPU] [varchar](50) NULL,
	[Ram] [varchar](30) NULL,
	[Pin] [varchar](30) NULL,
	[Khuyenmai] [bit] NULL,
	[Gia] [decimal](18, 0) NULL,
	[Hinhanh] [varchar](50) NULL,
	[Bonhotrong] [varchar](20) NULL,
	[Ngaycapnhat] [smalldatetime] NULL,
	[Camera] [varchar](50) NULL,
 CONSTRAINT [PK__SANPHAM__27240C2405162372] PRIMARY KEY CLUSTERED 
(
	[Masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tkadmin]    Script Date: 10/27/2017 9:40:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tkadmin](
	[maadmin] [varchar](20) NOT NULL,
	[pass] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[maadmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trangbia]    Script Date: 10/27/2017 9:40:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trangbia](
	[hinhanhbia] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CHITIETDATHANG] ([Madh], [Masp], [Soluong], [Gia]) VALUES (3, 1023, 1, CAST(7500000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DATHANG] ON 

INSERT [dbo].[DATHANG] ([Madh], [Makh], [Dathanhtoan], [Ngaydathang], [Ngaygiahang], [Dagiaohang]) VALUES (3, 1, 0, CAST(N'2017-10-27 06:50:17.897' AS DateTime), N'2017-10-28', 0)
SET IDENTITY_INSERT [dbo].[DATHANG] OFF
INSERT [dbo].[HANGSX] ([Mahangsx], [Tenhangsx], [Logo]) VALUES (N'1', N'Apple', N'logoip.png')
INSERT [dbo].[HANGSX] ([Mahangsx], [Tenhangsx], [Logo]) VALUES (N'2', N'SamSung', N'logoss.png')
INSERT [dbo].[HANGSX] ([Mahangsx], [Tenhangsx], [Logo]) VALUES (N'3', N'LG', N'logolg.png')
INSERT [dbo].[HANGSX] ([Mahangsx], [Tenhangsx], [Logo]) VALUES (N'4', N'Sony', N'logosn.png')
INSERT [dbo].[HANGSX] ([Mahangsx], [Tenhangsx], [Logo]) VALUES (N'5', N'Nokia', N'logonk.png')
INSERT [dbo].[HANGSX] ([Mahangsx], [Tenhangsx], [Logo]) VALUES (N'6', N'Xiaomi', N'logoxo.png')
INSERT [dbo].[HANGSX] ([Mahangsx], [Tenhangsx], [Logo]) VALUES (N'7', N'HTC', N'logohtc.png')
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([Makh], [Tenkh], [Diachikh], [Sdtkh], [Taikhoan], [Matkhau], [Email], [Ngaysinh]) VALUES (1, N'Nguyễn Phú Lộc', N'camranh', N'0977099741', N'locphu95', N'123', N'locphu95@gmail.com', CAST(N'1995-06-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([Makh], [Tenkh], [Diachikh], [Sdtkh], [Taikhoan], [Matkhau], [Email], [Ngaysinh]) VALUES (3, N'Trần Quang Khanh', N'Long An', N'0972524233', N'quangkhanh', N'1', N'quangkhanh@gmail.com', CAST(N'1993-10-26 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1016, N'iP6s Plus', N'1', 1, N'5.5 inch', N'iOS 10.3.3 ', N'A9 ', N'2 GB ', N'2750 mAh', 0, CAST(12000000 AS Decimal(18, 0)), N'ip6spls.png', N'64 GB', CAST(N'2017-10-24 00:00:00' AS SmallDateTime), N'13 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1017, N'Nokia 8', N'5', 1, N'5.5 inch', N'Androi 7.0', N'Snapdragon 835', N'3 GB', N'3090 mAh', 0, CAST(15000000 AS Decimal(18, 0)), N'nokia8.png', N'64 GB', CAST(N'2017-10-24 00:00:00' AS SmallDateTime), N'8 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1018, N'SamSung J7 Pro', N'2', 1, N'5.7 inch', N'Androi 7.0', N'Snapdragon 710', N'3 GB', N'3000 mAh', 0, CAST(85000000 AS Decimal(18, 0)), N'ssj7pro.png', N'32 GB', CAST(N'2017-10-25 00:00:00' AS SmallDateTime), N'13 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1019, N'Sony XA', N'4', 1, N'5.7 inch', N'Androi 7.0', N'Snapdragon 808', N'3 GB', N'3090 mAh', 0, CAST(12000000 AS Decimal(18, 0)), N'sonyxa.png', N'64 GB', CAST(N'2017-10-25 00:00:00' AS SmallDateTime), N'20 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1020, N'Xiaomi Mi Mix', N'6', 1, N'5.7 inch', N'Androi 7.0', N'Snapdragon 835', N'4 GB', N'4000 mAh', 0, CAST(15000000 AS Decimal(18, 0)), N'xiaomimimix.png', N'64 GB', CAST(N'2017-10-25 00:00:00' AS SmallDateTime), N'13 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1021, N'HTC One Me', N'7', 1, N'5.5 inch', N'Androi 7.0', N'Snapdragon 710', N'3 GB', N'2750 mAh', 0, CAST(7000000 AS Decimal(18, 0)), N'htconeme.png', N'32 GB', CAST(N'2017-10-25 00:00:00' AS SmallDateTime), N'8 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1022, N'LG V20', N'3', 0, N'5.7 inch', N'Androi 7.0', N'Snapdragon 835', N'4 GB', N'4000 mAh', 1, CAST(95000000 AS Decimal(18, 0)), N'lgv20.png', N'64 GB', CAST(N'2017-10-25 00:00:00' AS SmallDateTime), N'13 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1023, N'HTC 10Evo', N'7', 1, N'5.7 inch', N'Androi 7.0', N'Snapdragon 808', N'3 GB', N'3090 mAh', 0, CAST(7500000 AS Decimal(18, 0)), N'htc10evo.png', N'64 GB', CAST(N'2017-10-25 00:00:00' AS SmallDateTime), N'20 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1024, N'Xiaomi A1', N'6', 1, N'5.5 inch', N'Androi 7.0', N'Snapdragon 808', N'3 GB', N'3090 mAh', 0, CAST(8200000 AS Decimal(18, 0)), N'xiaomia1.png', N'64 GB', CAST(N'2017-10-25 00:00:00' AS SmallDateTime), N'13 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1025, N'LG Q8', N'3', 1, N'5.7 inch', N'Androi', N'Snapdragon 835', N'4 GB', N'4000 mAh', 0, CAST(14000000 AS Decimal(18, 0)), N'lgq8.png', N'128 GB', CAST(N'2017-10-25 00:00:00' AS SmallDateTime), N'20 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1026, N'iP6', N'1', 1, N'4.7 inch', N'iOS', N'A8', N'1 GB', N'2750 mAh', 0, CAST(6500000 AS Decimal(18, 0)), N'ip6.png', N'32 GB', CAST(N'2017-10-25 00:00:00' AS SmallDateTime), N'13 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1027, N'Nokia 3', N'5', 0, N'5.5 inch', N'Androi', N'Snapdragon', N'2 GB', N'3000 mAh', 1, CAST(4000000 AS Decimal(18, 0)), N'nokia3.png', N'64 GB', CAST(N'2017-10-25 00:00:00' AS SmallDateTime), N'8 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1028, N'Xiaomi Note 4', N'6', 1, N'5.7 inch', N'Androi', N'Snapdragon', N'4 GB', N'4500 mAh', 1, CAST(8600000 AS Decimal(18, 0)), N'xiaominote4.png', N'64 GB', CAST(N'2017-10-25 00:00:00' AS SmallDateTime), N'13 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1029, N'HTC U 11', N'7', 0, N'5.5 inch', N'Androi', N'Snapdragon', N'3 GB', N'3000 mAh', 0, CAST(9300000 AS Decimal(18, 0)), N'htcu11.png', N'128 GB', CAST(N'2017-10-25 00:00:00' AS SmallDateTime), N'20 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1030, N'SamSung Note 8', N'2', NULL, N'5.7 inch', N'Androi', N'Snapdragon', N'4 GB', N'4500 mAh', 0, CAST(14000000 AS Decimal(18, 0)), N'ssnt8.png', N'256 GB', CAST(N'2017-10-25 00:00:00' AS SmallDateTime), N'13 MP')
INSERT [dbo].[SANPHAM] ([Masp], [Tensp], [Mahangsx], [Tinhtrang], [Manhinh], [Hedieuhanh], [CPU], [Ram], [Pin], [Khuyenmai], [Gia], [Hinhanh], [Bonhotrong], [Ngaycapnhat], [Camera]) VALUES (1031, N'SamSung S7 Edge', N'2', 1, N'5.7 inch', N'Androi', N'Snapdragon 835', N'4 GB', N'4000 mAh', 1, CAST(11999999 AS Decimal(18, 0)), N'sss7e.png', N'64 GB', CAST(N'2017-10-25 00:00:00' AS SmallDateTime), N'8 MP')
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
INSERT [dbo].[Tkadmin] ([maadmin], [pass]) VALUES (N'admin', N'1')
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD  CONSTRAINT [FK__CHITIETDAT__Madh__2739D489] FOREIGN KEY([Madh])
REFERENCES [dbo].[DATHANG] ([Madh])
GO
ALTER TABLE [dbo].[CHITIETDATHANG] CHECK CONSTRAINT [FK__CHITIETDAT__Madh__2739D489]
GO
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDATHANG_SANPHAM] FOREIGN KEY([Masp])
REFERENCES [dbo].[SANPHAM] ([Masp])
GO
ALTER TABLE [dbo].[CHITIETDATHANG] CHECK CONSTRAINT [FK_CHITIETDATHANG_SANPHAM]
GO
ALTER TABLE [dbo].[DATHANG]  WITH CHECK ADD  CONSTRAINT [FK__DATHANG__Makh__2645B050] FOREIGN KEY([Makh])
REFERENCES [dbo].[KHACHHANG] ([Makh])
GO
ALTER TABLE [dbo].[DATHANG] CHECK CONSTRAINT [FK__DATHANG__Makh__2645B050]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_HANGSX] FOREIGN KEY([Mahangsx])
REFERENCES [dbo].[HANGSX] ([Mahangsx])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_HANGSX]
GO
