-- Create Database
CREATE DATABASE tuanweb;
USE tuanweb;

-- Create Table Accounts
CREATE TABLE Accounts (
                          Username VARCHAR(20) PRIMARY KEY NOT NULL,
                          Password VARCHAR(20) NOT NULL,
                          Fullname VARCHAR(50) NOT NULL,
                          Email VARCHAR(50) NOT NULL,
                          Photo VARCHAR(255) NOT NULL,
                          Activated BOOLEAN DEFAULT NULL,
                          Admin BOOLEAN DEFAULT NULL
);

-- Insert Data into Accounts
INSERT INTO Accounts (Username, Password, Fullname, Email, Photo, Activated, Admin) VALUES
                                                                                        ('TRINHTAI25', '123456', 'Trịnh Võ Đức Tài', 'taitvdps20669@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('HONGQUYEN30', '123456', 'Lê Hồng Quyên', 'quyentvdps20000@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('QUOCHUY19', '123456', 'Trịnh Võ Quốc Huy', 'huytvdps12345@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('TRUNGNGUYEN20', '123456', 'Lê Trung Nguyên', 'nguyentvdps34567@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('MINHTRI20', '123456', 'Trịnh Võ Đức Tài', 'tritvdps19999@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('HOANGPHUC20', '123456', 'Đinh Hoàng Phúc', 'phuctvdps19018@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('LAIBANG20', '123456', 'SGP Lai Bâng', 'laibangps98089@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('XUANBACH20', '123456', 'FL Xuân Bách', 'xuanbachps11980@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('ADC20', '123456', 'FL ADC', 'adcps09876@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('MARIS20', '123456', 'SGP MARIS', 'marisps12390@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('QUOCHUY20', '123456', 'FL Quốc Huy', 'quochuyps26761@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('DUCTAI20', '123456', 'FL Đức Tài', 'ductaips78791@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('HUULAM20', '123456', 'FL Hữu Lâm', 'huulamps13141@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('DIRUNG20', '123456', 'FL Đi Rừng', 'dirungps14642@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('NGUYENMAP20', '123456', 'FL Nguyên Mập', 'nguyenmapps23568@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('THACHDAU20', '123456', 'TDT Thách Đấu', 'thachdaups12467@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('HOANGTD20', '123456', 'TDT HoangTD', 'hoangtdps77812@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('ONGBACH20', '123456', 'TDT Ông Bạch', 'ongbachps12377@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('MARIN20', '123456', 'TDT Marin', 'marinps09123@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('CATIA20', '123456', 'TDT Catia', 'catiaps19090@.edu.vn', 'admin.png', 1, 1),
                                                                                        ('USER01', '123456', 'Đinh Hoàng User', 'userps01111@.edu.vn', 'user.png', 1, 0),
                                                                                        ('USER02', '123456', 'SGP User', 'userps02222@.edu.vn', 'user.png', 1, 0),
                                                                                        ('USER03', '123456', 'Trịnh Võ User', 'userps03333@.edu.vn', 'user.png', 1, 0),
                                                                                        ('USER04', '123456', 'Nguyễn Hoàng User', 'userps04444@.edu.vn', 'user.png', 1, 0),
                                                                                        ('USER05', '123456', 'Nguyễn Hữu User', 'userps05555@.edu.vn', 'user.png', 1, 0);

-- Create Table Categories
CREATE TABLE Categories (
                            CategoryId CHAR(5) PRIMARY KEY NOT NULL,
                            Name VARCHAR(50) NOT NULL
);

-- Insert Data into Categories
INSERT INTO Categories (CategoryId, Name) VALUES
                                              ('00001', 'Quần Nam'),
                                              ('00002', 'Quần Nữ'),
                                              ('00003', 'Áo Nam'),
                                              ('00004', 'Áo Nữ'),
                                              ('00005', 'Đồng Hồ'),
                                              ('00006', 'Nón Thời Trang'),
                                              ('00007', 'Túi Xách'),
                                              ('00008', 'Giày Dép');

-- Create Table Products
CREATE TABLE Products (
                          ProductId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                          Name VARCHAR(50) NOT NULL,
                          Image VARCHAR(255) NOT NULL,
                          Price FLOAT NOT NULL,
                          Quantity INT NOT NULL,
                          CreateDate DATE NOT NULL,
                          Available BOOLEAN NOT NULL,
                          CategoryId CHAR(5) NOT NULL,
                          FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId) ON DELETE CASCADE
);

-- Insert Data into Products
INSERT INTO Products (Name, Image, Price, Quantity, CreateDate, Available, CategoryId) VALUES
                                                                                           ('Quần shorts chạy bộ Ultra Fast & Free Run', '1.png', 280000, 10, '2021-11-15', 1, '00001'),
                                                                                           ('Quần Jeans Clean Denim dáng Regular S2', '2.png', 360000, 10, '2021-11-16', 1, '00001'),
                                                                                           ('Quần Jogger nam túi hộp Cargo Outdoor', '3.png', 330000, 10, '2021-11-17', 1, '00001'),
                                                                                           ('Quần dài Kaki Excool co giãn', '4.png', 499999, 10, '2021-11-15', 1, '00001'),
                                                                                           ('Quần short nam thể thao 5 New Ultra', '5.png', 99000, 10, '2021-11-16', 1, '00001'),
                                                                                           ('Quần short nữ giả váy xinh xắn', '6.png', 255000, 10, '2021-10-20', 1, '00002'),
                                                                                           ('Quần tây công sở nữ ĐAN CHÂU', '7.png', 280000, 10, '2021-10-21', 1, '00002'),
                                                                                           ('Quần short jean thêu hoa sành điệu', '8.png', 140000, 10, '2021-10-20', 1, '00002'),
                                                                                           ('Quần jeans nữ phối kéo ALE', '9.png', 539000, 10, '2021-10-21', 1, '00002'),
                                                                                           ('Quần CULOTTES Can De Blanc', '10.png', 1290000, 10, '2021-10-20', 1, '00002'),
                                                                                           ('Áo sơ mi dài tay Aristino ALS17403', '11.png', 895000, 5, '2021-09-13', 1, '00003'),
                                                                                           ('Áo polo nam cổ ngắn tay Aristino APS046S3', '12.png', 595000, 5, '2021-09-13', 1, '00003'),
                                                                                           ('Áo thun ngắn tay Aristino ATS010S3', '13.png', 395000, 5, '2021-09-13', 1, '00003'),
                                                                                           ('Áo blazer nam Aristino ABZ00502', '14.png', 2900000, 5, '2021-08-15', 1, '00003'),
                                                                                           ('Áo khoác 2 lớp Aristino AJK028W2', '15.png', 1950000, 5, '2021-08-15', 1, '00003'),
                                                                                           ('Áo khoác dù nữ form rộng cá tính', '16.png', 159000, 6, '2021-07-13', 1, '00004'),
                                                                                           ('Áo sơ mi nữ form rộng', '17.png', 159000, 7, '2021-07-13', 1, '00004'),
                                                                                           ('Áo thun nữ tay lỡ form rộng', '18.png', 129000, 5, '2021-06-15', 1, '00004'),
                                                                                           ('Áo kiểu nữ công sở tay dài', '19.png', 299000, 4, '2021-05-15', 1, '00004'),
                                                                                           ('Áo thun croptop nữ tay lỡ', '20.png', 99000, 8, '2021-04-15', 1, '00004');

-- Create Table Favorites
CREATE TABLE Favorites (
                           FavoriteId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                           Username VARCHAR(20) NOT NULL,
                           ProductId INT NOT NULL,
                           LikeDate DATE NOT NULL,
                           FOREIGN KEY (Username) REFERENCES Accounts(Username) ON DELETE CASCADE,
                           FOREIGN KEY (ProductId) REFERENCES Products(ProductId) ON DELETE CASCADE
);

-- Insert Data into Favorites
INSERT INTO Favorites (Username, ProductId, LikeDate) VALUES
                                                          ('TRINHTAI25', 1, '2021-10-10'),
                                                          ('TRINHTAI25', 2, '2021-10-10'),
                                                          ('HONGQUYEN30', 2, '2021-10-10'),
                                                          ('HONGQUYEN30', 3, '2021-10-10'),
                                                          ('QUOCHUY19', 3, '2021-10-10'),
                                                          ('QUOCHUY19', 4, '2021-10-10'),
                                                          ('TRUNGNGUYEN20', 4, '2021-10-10'),
                                                          ('TRUNGNGUYEN20', 5, '2021-10-10'),
                                                          ('MINHTRI20', 5, '2021-10-10'),
                                                          ('MINHTRI20', 6, '2021-10-10');

-- Create Table Orders
CREATE TABLE Orders (
                        OrderId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                        Username VARCHAR(20) NOT NULL,
                        OrderDate DATE NOT NULL,
                        Status INT NOT NULL,
                        FOREIGN KEY (Username) REFERENCES Accounts(Username) ON DELETE CASCADE
);

-- Insert Data into Orders
INSERT INTO Orders (Username, OrderDate, Status) VALUES
                                                     ('TRINHTAI25', '2021-10-10', 0),
                                                     ('HONGQUYEN30', '2021-10-10', 0),
                                                     ('QUOCHUY19', '2021-10-10', 0),
                                                     ('TRUNGNGUYEN20', '2021-10-10', 0),
                                                     ('MINHTRI20', '2021-10-10', 0);

-- Create Table OrderDetails
CREATE TABLE OrderDetails (
                              OrderDetailId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                              OrderId INT NOT NULL,
                              ProductId INT NOT NULL,
                              Price FLOAT NOT NULL,
                              Quantity INT NOT NULL,
                              FOREIGN KEY (OrderId) REFERENCES Orders(OrderId) ON DELETE CASCADE,
                              FOREIGN KEY (ProductId) REFERENCES Products(ProductId) ON DELETE CASCADE
);

-- Insert Data into OrderDetails
INSERT INTO OrderDetails (OrderId, ProductId, Price, Quantity) VALUES
                                                                   (1, 1, 280000, 1),
                                                                   (1, 2, 360000, 1),
                                                                   (2, 2, 360000, 1),
                                                                   (2, 3, 330000, 1),
                                                                   (3, 3, 330000, 1),
                                                                   (3, 4, 499999, 1),
                                                                   (4, 4, 499999, 1),
                                                                   (4, 5, 99000, 1),
                                                                   (5, 5, 99000, 1),
                                                                   (5, 6, 255000, 1);
