USE [websango]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 10/24/2024 4:11:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[pid] [int] NULL,
	[name] [nvarchar](100) NULL,
	[quantity] [int] NULL,
	[image] [varchar](255) NULL,
	[price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 10/24/2024 4:11:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[message]    Script Date: 10/24/2024 4:11:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[message] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 10/24/2024 4:11:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[number] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[payment_method] [nvarchar](50) NULL,
	[address] [nvarchar](255) NULL,
	[total_product] [int] NULL,
	[total_price] [decimal](10, 2) NULL,
	[time_order] [datetime2](7) NULL,
	[payment_status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 10/24/2024 4:11:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[name] [nvarchar](100) NOT NULL,
	[details] [nvarchar](max) NULL,
	[price] [decimal](10, 2) NULL,
	[image] [varchar](255) NULL,
	[thickness] [decimal](10, 2) NULL,
	[width] [decimal](10, 2) NULL,
	[length] [decimal](10, 2) NULL,
	[warranty] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/24/2024 4:11:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[user_type] [nvarchar](50) NULL,
	[phone] [varchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cart] ON 

INSERT [dbo].[cart] ([id], [user_id], [pid], [name], [quantity], [image], [price]) VALUES (1, 2, 1, N'Sàn gỗ căm xe', 2, N'san_go_cam_xe.jpg', CAST(1000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cart] ([id], [user_id], [pid], [name], [quantity], [image], [price]) VALUES (2, 2, 5, N'Len chân tường', 5, N'len_chan_tuong.jpg', CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[cart] ([id], [user_id], [pid], [name], [quantity], [image], [price]) VALUES (3, 3, 2, N'Sàn gỗ lim', 1, N'san_go_lim.jpg', CAST(700000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name]) VALUES (1, N'Sàn gỗ tự nhiên')
INSERT [dbo].[category] ([id], [name]) VALUES (2, N'Sàn gỗ công nghiệp')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'Phụ kiện sàn gỗ')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[message] ON 

INSERT [dbo].[message] ([id], [user_id], [message]) VALUES (1, 2, N'Tôi muốn hỏi thêm về chính sách bảo hành cho sàn gỗ tự nhiên.')
INSERT [dbo].[message] ([id], [user_id], [message]) VALUES (2, 3, N'Sản phẩm của shop rất chất lượng, tôi sẽ tiếp tục ủng hộ.')
SET IDENTITY_INSERT [dbo].[message] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [user_id], [name], [number], [email], [payment_method], [address], [total_product], [total_price], [time_order], [payment_status]) VALUES (1, 2, N'Trần Thị Cúc', N'0123456789', N'tranthicuc@gmail.com', N'COD', N'123 Đường 3, Quận Bình Thạnh, TP HCM', 3, CAST(1500000.00 AS Decimal(10, 2)), CAST(N'1900-01-01T10:30:00.0000000' AS DateTime2), N'Đang xử lý')
INSERT [dbo].[orders] ([id], [user_id], [name], [number], [email], [payment_method], [address], [total_product], [total_price], [time_order], [payment_status]) VALUES (2, 3, N'Lê Văn Đại', N'0987654321', N'levanc@outlock.com', N'Chuyển khoản', N'456 Đường Hoàng Xuân, Quận 1, TP HCM', 2, CAST(900000.00 AS Decimal(10, 2)), CAST(N'1900-01-01T11:00:00.0000000' AS DateTime2), N'Đã thanh toán')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [category_id], [name], [details], [price], [image], [thickness], [width], [length], [warranty]) VALUES (1, 1, N'Sàn gỗ căm xe', N'Sàn gỗ căm xe tự nhiên, chất lượng cao, màu sắc sang trọng. Kích thước: 1200 x 120 x 15 mm', CAST(500000.00 AS Decimal(10, 2)), N'san_go_cam_xe.jpg', CAST(15.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), CAST(1200.00 AS Decimal(10, 2)), N'24 tháng')
INSERT [dbo].[product] ([id], [category_id], [name], [details], [price], [image], [thickness], [width], [length], [warranty]) VALUES (2, 1, N'Sàn gỗ lim', N'Sàn gỗ lim tự nhiên, chịu lực tốt, thích hợp cho các công trình cao cấp. Kích thước: 1500 x 130 x 18 mm', CAST(700000.00 AS Decimal(10, 2)), N'san_go_lim.jpg', CAST(18.00 AS Decimal(10, 2)), CAST(130.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), N'36 tháng')
INSERT [dbo].[product] ([id], [category_id], [name], [details], [price], [image], [thickness], [width], [length], [warranty]) VALUES (3, 2, N'Sàn gỗ công nghiệp Krono Original', N'Sàn gỗ công nghiệp chịu nước, chống trầy xước, phù hợp cho phòng khách và phòng ngủ. Kích thước: 1200 x 190 x 8 mm', CAST(300000.00 AS Decimal(10, 2)), N'san_go_krono.jpg', CAST(8.00 AS Decimal(10, 2)), CAST(190.00 AS Decimal(10, 2)), CAST(1200.00 AS Decimal(10, 2)), N'12 tháng')
INSERT [dbo].[product] ([id], [category_id], [name], [details], [price], [image], [thickness], [width], [length], [warranty]) VALUES (4, 2, N'Sàn gỗ công nghiệp Robina', N'Sàn gỗ công nghiệp Robina, màu sắc tự nhiên, bề mặt chống xước cao cấp. Kích thước: 1200 x 196 x 12 mm', CAST(450000.00 AS Decimal(10, 2)), N'san_go_robina.jpg', CAST(12.00 AS Decimal(10, 2)), CAST(196.00 AS Decimal(10, 2)), CAST(1200.00 AS Decimal(10, 2)), N'18 tháng')
INSERT [dbo].[product] ([id], [category_id], [name], [details], [price], [image], [thickness], [width], [length], [warranty]) VALUES (5, 3, N'Len chân tường', N'Len chân tường nhựa cao cấp, nhiều màu sắc lựa chọn, bền đẹp với thời gian', CAST(50000.00 AS Decimal(10, 2)), N'len_chan_tuong.jpg', NULL, NULL, NULL, N'6 tháng')
INSERT [dbo].[product] ([id], [category_id], [name], [details], [price], [image], [thickness], [width], [length], [warranty]) VALUES (6, 3, N'Nẹp kết thúc', N'Nẹp kết thúc nhôm dùng để kết thúc sàn gỗ, tạo điểm nhấn và che khuyết điểm', CAST(70000.00 AS Decimal(10, 2)), N'nep_ket_thuc.jpg', NULL, NULL, NULL, N'6 tháng')
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [email], [password], [user_type], [phone]) VALUES (1, N'Nguyễn Hoàng Hải', N'hai0777@gmail.com', N'123123', N'admin', NULL)
INSERT [dbo].[users] ([id], [name], [email], [password], [user_type], [phone]) VALUES (2, N'Trần Thị Cúc', N'tranthicuc@gmail.com', N'123123', N'user', NULL)
INSERT [dbo].[users] ([id], [name], [email], [password], [user_type], [phone]) VALUES (3, N'Lê Văn Đại', N'levandai1@outlock.com', N'khongnho124', N'user', NULL)
INSERT [dbo].[users] ([id], [name], [email], [password], [user_type], [phone]) VALUES (4, N'hai', N'123@gmail.com', N'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', N'user', NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E61646BAB6E3E]    Script Date: 10/24/2024 4:11:20 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
ALTER TABLE [dbo].[message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[message] CHECK CONSTRAINT [FK_Message_Users]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_Product_Category]
GO
