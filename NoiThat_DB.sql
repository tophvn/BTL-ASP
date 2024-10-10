-- Tạo cơ sở dữ liệu NoiThat_DB
CREATE DATABASE NoiThat_DB;
GO

-- Sử dụng cơ sở dữ liệu vừa tạo
USE NoiThat_DB;
GO

-- Tạo bảng user
CREATE TABLE [user] (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    user_type NVARCHAR(50)
);

-- Tạo bảng category
CREATE TABLE category (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100)
);

-- Tạo bảng product
CREATE TABLE product (
    id INT PRIMARY KEY IDENTITY(1,1),
    category_id INT FOREIGN KEY REFERENCES category(id),
    name NVARCHAR(100),
    details NVARCHAR(MAX),
    price INT,
    image VARCHAR(255),
    thickness DECIMAL(10, 2),
    width DECIMAL(10, 2),
    length DECIMAL(10, 2),
    warranty NVARCHAR(100)
);

-- Tạo bảng orders
CREATE TABLE orders (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT FOREIGN KEY REFERENCES [user](id),
    name NVARCHAR(100),
    number VARCHAR(20),
    email VARCHAR(100),
    payment_method NVARCHAR(50),
    address NVARCHAR(255),
    total_product INT,
    total_price INT,
    time_order TIME,
    payment_status NVARCHAR(50)
);

-- Tạo bảng cart
CREATE TABLE cart (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT FOREIGN KEY REFERENCES [user](id),
    pid INT FOREIGN KEY REFERENCES product(id),
    name NVARCHAR(100),
    quantity INT,
    image VARCHAR(255),
    price INT
);

-- Tạo bảng message
CREATE TABLE message (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT FOREIGN KEY REFERENCES [user](id),
    name NVARCHAR(100),
    email VARCHAR(100),
    number VARCHAR(12),
    message NVARCHAR(300)
);

-- Chèn dữ liệu vào bảng [user]
INSERT INTO [user] (name, email, password, user_type) VALUES
(N'Nguyễn Hoàng Hải', 'hai0777@gmail.com', '123123', 'admin'),
(N'Trần Thị Cúc', 'tranthicuc@gmail.com', '123123', 'user'),
(N'Lê Văn Đại', 'levandai1@outlock.com', 'khongnho124', 'user');

-- Chèn dữ liệu vào bảng category
INSERT INTO category (name) VALUES
(N'Sàn gỗ tự nhiên'),
(N'Sàn gỗ công nghiệp'),
(N'Phụ kiện sàn gỗ');

-- Chèn dữ liệu vào bảng product
INSERT INTO product (category_id, name, details, price, image, thickness, width, length, warranty) VALUES
(1, N'Sàn gỗ căm xe', N'Sàn gỗ căm xe tự nhiên, chất lượng cao, màu sắc sang trọng. Kích thước: 1200 x 120 x 15 mm', 500000, 'san_go_cam_xe.jpg', 15, 120, 1200, N'24 tháng'),
(1, N'Sàn gỗ lim', N'Sàn gỗ lim tự nhiên, chịu lực tốt, thích hợp cho các công trình cao cấp. Kích thước: 1500 x 130 x 18 mm', 700000, 'san_go_lim.jpg', 18, 130, 1500, N'36 tháng'),
(2, N'Sàn gỗ công nghiệp Krono Original', N'Sàn gỗ công nghiệp chịu nước, chống trầy xước, phù hợp cho phòng khách và phòng ngủ. Kích thước: 1200 x 190 x 8 mm', 300000, 'san_go_krono.jpg', 8, 190, 1200, N'12 tháng'),
(2, N'Sàn gỗ công nghiệp Robina', N'Sàn gỗ công nghiệp Robina, màu sắc tự nhiên, bề mặt chống xước cao cấp. Kích thước: 1200 x 196 x 12 mm', 450000, 'san_go_robina.jpg', 12, 196, 1200, N'18 tháng'),
(3, N'Len chân tường', N'Len chân tường nhựa cao cấp, nhiều màu sắc lựa chọn, bền đẹp với thời gian', 50000, 'len_chan_tuong.jpg', NULL, NULL, NULL, N'6 tháng'),
(3, N'Nẹp kết thúc', N'Nẹp kết thúc nhôm dùng để kết thúc sàn gỗ, tạo điểm nhấn và che khuyết điểm', 70000, 'nep_ket_thuc.jpg', NULL, NULL, NULL, N'6 tháng');

-- Chèn dữ liệu vào bảng orders
INSERT INTO orders (user_id, name, number, email, payment_method, address, total_product, total_price, time_order, payment_status) VALUES
(2, N'Trần Thị Cúc', '0123456789', 'tranthicuc@gmail.com', N'COD', N'123 Đường 3, Quận Bình Thạnh, TP HCM', 3, 1500000, '10:30:00', N'Đang xử lý'),
(3, N'Lê Văn Đại', '0987654321', 'levanc@outlock.com', N'Chuyển khoản', N'456 Đường Hoàng Xuân, Quận 1, TP HCM', 2, 900000, '11:00:00', N'Đã thanh toán');

-- Chèn dữ liệu vào bảng cart
INSERT INTO cart (user_id, pid, name, quantity, image, price) VALUES
(2, 1, N'Sàn gỗ căm xe', 2, 'san_go_cam_xe.jpg', 1000000),
(2, 5, N'Len chân tường', 5, 'len_chan_tuong.jpg', 250000),
(3, 2, N'Sàn gỗ lim', 1, 'san_go_lim.jpg', 700000);

-- Chèn dữ liệu vào bảng message
INSERT INTO message (user_id, name, email, number, message) VALUES
(2, N'Trần Thị Cúc', 'tranthib@gmail.com', '0123456789', N'Tôi muốn hỏi thêm về chính sách bảo hành cho sàn gỗ tự nhiên.'),
(3, N'Lê Văn Đại', 'levanc@outlock.com', '0987654321', N'Sản phẩm của shop rất chất lượng, tôi sẽ tiếp tục ủng hộ.');
