-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 07, 2024 at 05:44 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nhom12`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id_cmt` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ngay_cmt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `review` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `star` int NOT NULL,
  PRIMARY KEY (`id_cmt`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id_cmt`, `id`, `name`, `ngay_cmt`, `email`, `review`, `star`) VALUES
(20, 36, 'phuc', '2024-12-07 16:34:37', 'phuc@gmail.com', 'xin giá', 5);

-- --------------------------------------------------------

--
-- Table structure for table `infor`
--

DROP TABLE IF EXISTS `infor`;
CREATE TABLE IF NOT EXISTS `infor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `lname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `address` varchar(255) NOT NULL,
  `tel` int NOT NULL,
  `code_order` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `infor`
--

INSERT INTO `infor` (`id`, `fname`, `lname`, `address`, `tel`, `code_order`) VALUES
(76, 'Phuoc Tran', 'Minh', '504 to ngoc van', 98677678, 3204);

-- --------------------------------------------------------

--
-- Table structure for table `manufactures`
--

DROP TABLE IF EXISTS `manufactures`;
CREATE TABLE IF NOT EXISTS `manufactures` (
  `manu_id` int NOT NULL AUTO_INCREMENT,
  `manu_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`manu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `manufactures`
--

INSERT INTO `manufactures` (`manu_id`, `manu_name`) VALUES
(1, 'Apple'),
(2, 'Oppo'),
(3, 'Samsung'),
(4, 'Xiaomi'),
(5, 'Realme'),
(6, 'Dell'),
(7, 'Lenovo'),
(8, 'MSI');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `manu_id` int NOT NULL,
  `type_id` int NOT NULL,
  `price` int NOT NULL,
  `image` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `feature` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bestseller` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `manu_id`, `type_id`, `price`, `image`, `description`, `feature`, `created_at`, `bestseller`) VALUES
(1, 'Iphone 14pro max', 1, 1, 35000000, 'iphone-14-pro-tim-1-1.jpg', 'Mới đây thì chiếc điện thoại iPhone 14 Pro Max 256GB cũng đã được chính thức lộ diện trên toàn cầu và đập tan bao lời đồn đoán bấy lâu nay, bên trong máy sẽ được trang bị con chip hiệu năng khủng cùng sự nâng cấp về camera đến từ nhà Apple.', 1, '2022-11-04 14:39:44', 450),
(2, 'Iphone 13pro max', 1, 1, 25000000, 'iphone-13-pro-max-1-3.jpg', '128GB', 1, '2022-11-04 14:39:56', 360),
(3, 'Iphone 11', 1, 1, 10000000, 'iphone-11-xanh-la-1-org.jpg', 'Được xem là một trong những phiên bản iPhone \"giá rẻ\" của bộ 3 iPhone 11 series nhưng iPhone 11 128GB vẫn sở hữu cho mình rất nhiều ưu điểm mà hiếm có một chiếc smartphone nào khác sở hữu.', 1, '2022-11-04 14:40:08', 1200),
(4, 'OPPO Reno8 Pro 5G', 2, 1, 18990000, 'oppo-reno8-pro-black-1.jpg', 'OPPO Reno8 Pro 5G ra mắt với sự đột phá về phần camera khi đây là thiết bị đầu tiên thuộc dòng Reno được tích hợp NPU MariSilicon X, được xem là NPU cao cấp nhất đến từ OPPO (2022) có khả năng xử lý hình ảnh đỉnh cao. Kèm với đó là một con chip mạnh mẽ đến từ nhà MediaTek giúp bạn có thể cân được mọi tựa game đang hiện hành.', 0, '2022-11-04 14:40:17', 140),
(5, 'Laptop Apple MacBook Pro M2 2022', 1, 2, 32990000, 'apple-macbook-pro-13-inch-m2-2022-1-1.jpg', 'Thiết kế thanh lịch, sang trọng cùng hiệu năng vượt trội đến từ vi xử lý tân tiến Apple M2 có trong Macbook Pro M2, hứa hẹn sẽ mang lại nhiều giá trị cho người dùng sáng tạo, phục vụ tốt nhu cầu thiết kế đồ hoạ nâng cao.\r\n', 0, '2022-11-04 14:40:29', 570),
(6, 'Máy tính bảng Samsung Galaxy Tab A7 Lite', 3, 3, 3990000, 'samsung-galaxy-tab-a7-lite-1-3-org.jpg', 'Máy tính bảng Samsung Galaxy Tab A7 Lite là phiên bản rút gọn của dòng tablet \"ăn khách\" Galaxy Tab A7 thuộc thương hiệu Samsung, đáp ứng nhu cầu giải trí của khách hàng thuộc phân khúc bình dân với màn hình lớn nhưng vẫn gọn nhẹ hợp túi tiền.', 0, '2022-11-10 12:21:34', 103),
(7, 'Máy tính bảng Xiaomi Redmi Pad (3GB/64GB)', 4, 3, 6990000, 'xiaomi-redmi-pad-1.jpg', 'Xiaomi Redmi Pad (3GB/64GB) là cái tên được nhắc đến khá nhiều trong giới công nghệ gần đây, khi xuất hiện trên nhiều mặt báo, với mức giá bán không quá cao nhưng được trang bị bộ thông số cực kỳ xịn sò. Hứa hẹn sẽ là chiếc máy tính bảng Xiaomi đáng mong đợi trong giai đoạn nửa cuối năm 2022.', 0, '2022-11-10 12:21:36', 80),
(8, 'Pin sạc dự phòng Polymer 20.000 mAh Type C PD Samsung EB-P5300', 3, 4, 1300000, 'polymer-20000mah-type-c-25w-samsung-eb-p5300-2-1-org.jpg', 'Lớp vỏ nhựa cao cấp kháng vỡ, giúp giảm trọng lượng sạc dự phòng, cầm nắm hơi đầm tay nhưng không nặng với 392 gram.', 0, '2022-11-10 12:26:05', 230),
(9, 'Điện thoại Realme 9 Pro+ 5G', 5, 1, 8990000, 'realme-9-pro-plus-1-1.jpg', 'Realme 9 Pro+ 5G - chiếc smartphone tầm trung của Realme đã được ra mắt, máy có một thiết kế đầy màu sắc, cụm 3 camera với cảm biến IMX766 giúp bạn có được những bức ảnh sinh động.', 0, '2022-11-04 14:41:15', 305),
(10, 'Loa Xiaomi x21', 4, 4, 980000, 'bluetooth-mozard-x21-ava-600x600.jpg', '                   Thiết kế gọn đẹp, bề mặt phủ sắc đen thời thượng, đính kèm dây treo tiện di chuyển                   ', 0, '2022-12-23 06:35:08', 30),
(16, 'Laptop Apple MacBook Air M2 2022 16GB/512GB/10-core GPU', 1, 2, 32990000, 'apple-macbook-air-m2-2022-16gb-1.jpg', 'Thiết kế thanh lịch, sang trọng cùng hiệu năng vượt trội đến từ vi xử lý tân tiến Apple M2 có trong Macbook Pro M2, hứa hẹn sẽ mang lại nhiều giá trị cho người dùng sáng tạo, phục vụ tốt nhu cầu thiết kế đồ hoạ nâng cao.\r\n', 0, '2022-11-14 17:00:00', 700),
(17, 'Laptop Dell Gaming G15 5515 R5 ', 6, 2, 234900, 'dell-gaming-g15-54dgr-1.jpg', 'Thiết kế thanh lịch, sang trọng cùng hiệu năng vượt trội đến từ vi xử lý tân tiến Apple M2 có trong Macbook Pro M2, hứa hẹn sẽ mang lại nhiều giá trị cho người dùng sáng tạo, phục vụ tốt nhu cầu thiết kế đồ hoạ nâng cao.\r\n', 0, '2022-11-08 12:48:30', 100),
(18, 'Laptop Dell Vostro 3510 i3 1115G4/8GB/256GB', 6, 2, 234900, 'dell-vostro-3510-i3-1.jpg', 'Laptop Dell Vostro 3510 i3 (V5I3305W) sở hữu thiết kế phổ thông, đơn giản nhưng lại mang cấu hình ổn định nhờ con chip Intel thế hệ 11, đáp ứng đầy đủ mọi nhu cầu cơ bản hằng ngày, hứa hẹn sẽ là một trợ thủ đắc lực với mức giá vô cùng lý tưởng, phù hợp với hầu hết mọi đối tượng sử dụng.', 0, '2022-11-14 10:14:26', 67),
(19, 'Điện thoại OPPO Find X5 Pro 5G', 2, 1, 10000000, 'oppo-find-x5-pro-1-1.jpg', 'OPPO Find X5 Pro 5G có lẽ là cái tên sáng giá được xướng tên trong danh sách điện thoại có thiết kế ấn tượng trong năm 2022. Máy được hãng cho ra mắt với một diện mạo độc lạ chưa từng có, cùng với đó là những nâng cấp về chất lượng ở camera nhờ sự hợp tác với nhà sản xuất máy ảnh Hasselblad. ', 1, '2022-09-11 17:00:00', 83),
(20, 'Điện thoại OPPO A96', 2, 1, 6900000, 'oppo-a96-4g-glr-hong-1.jpg', 'OPPO A96 là cái tên được nhắc đến khá nhiều trên các diễn đàn công nghệ hiện nay, nhờ sở hữu một ngoại hình hết sức bắt mắt cùng hàng loạt các thông số ấn tượng trong phân khúc giá như hiệu năng cao, camera chụp ảnh sắc nét.', 0, '2022-11-08 11:50:30', 20),
(21, 'Điện thoại Samsung Galaxy Z Flip4', 3, 1, 20990000, 'samsung-galaxy-z-flip4-tim-128gb-1.jpg', 'Samsung Galaxy Z Flip4 128GB đã chính thức ra mắt thị trường công nghệ, đánh dấu sự trở lại của Samsung trên con đường định hướng người dùng về sự tiện lợi trên những chiếc điện thoại gập. Với độ bền được gia tăng cùng kiểu thiết kế đẹp mắt giúp Flip4 trở thành một trong những tâm điểm sáng giá cho nửa cuối năm 2022.', 0, '2022-11-04 14:40:08', 400),
(22, 'Điện thoại Samsung Galaxy S22', 3, 1, 25990000, 'samsung-galaxy-s22-ultra-1-1.jpg', 'Galaxy S22 Ultra 5G chiếc smartphone cao cấp nhất trong bộ 3 Galaxy S22 series mà Samsung đã cho ra mắt. Tích hợp bút S Pen hoàn hảo trong thân máy, trang bị vi xử lý mạnh mẽ cho các tác vụ sử dụng vô cùng mượt mà và nổi bật hơn với cụm camera không viền độc đáo mang đậm dấu ấn riêng.', 0, '2022-08-14 17:00:00', 208),
(23, 'Điện thoại Samsung Galaxy Z Fold4', 3, 1, 37990000, 'samsung-galaxy-z-fold-4-256gb-1.jpg', 'Samsung Galaxy Z Fold4 256GB chính thức được trình làng thị trường công nghệ, mang trên mình nhiều cải tiến đáng giá giúp Galaxy Z Fold trở thành dòng điện thoại gập đã tốt nay càng tốt hơn.', 1, '2022-08-14 17:00:00', 105),
(24, 'Điện thoại Realme 8 Pro', 5, 1, 7990000, 'realme-8-pro-den-1-org.jpg', 'Bên cạnh Realme 8, Realme 8 Pro cũng được giới thiệu đến người dùng với điểm nhấn chính là sự xuất hiện của camera 108 MP siêu nét cùng công nghệ sạc SuperDart 50 W và đi kèm mức giá bán tầm trung rất lý tưởng.', 0, '2022-08-14 17:00:00', 20),
(25, 'Điện thoại Realme C33', 5, 1, 3990000, 'realme-c33-den-1.jpg', ' Realme C33 (3GB/32GB) là cái tên thu hút được nhiều sự chú ý trên các diễn đàn công nghệ, sở hữu trên máy là một thiết kế hợp xu hướng đi kèm với màn hình to rõ giúp bạn có thể sử dụng các tác vụ giải trí được tốt hơn.', 1, '2022-08-14 17:00:00', 5),
(26, 'Laptop Dell Gaming G15 5515 R5 ', 6, 2, 43234900, 'dell-gaming-alienware-m15-r6-i7-p109f001dbl-3-1.jpg', 'Nhắc đến dòng laptop gaming, nhà Dell cũng đã sở hữu cho mình một siêu phẩm không thể bỏ qua là chiếc laptop Dell Alienware m15 R6 i7 (P109F001DBL) với card đồ hoạ RTX 3060 6 GB mạnh mẽ sẵn sàng cùng bạn chinh phục mọi thử thách chiến game.', 0, '2022-11-08 12:48:30', 100),
(27, 'Laptop Apple MacBook Air M1 2020', 1, 2, 30090000, 'apple-macbook-air-m1-2020-z124000de-1-org.jpg', 'Laptop Apple Air M1 2020 có thiết kế đẹp, sang trọng với CPU M1 độc quyền từ Apple cho hiệu năng đồ họa cao, màn hình Retina hiển thị siêu nét cùng với hệ thống bảo mật tối ưu.', 1, '2022-11-04 14:40:29', 150),
(28, 'Laptop Lenovo ThinkPad X1 Carbon Gen 10', 7, 2, 49490000, 'lenovo-thinkpad-x1-carbon-gen-10-i7-21cb00a8vn-1-1.jpg', 'Laptop Lenovo ThinkPad X1 Carbon Gen 10 i7 1260P (21CB00A8VN) không chỉ sở hữu thiết kế cứng cáp từ sợi Carbon, khả năng bảo mật cấp doanh nghiệp mà còn có hiệu năng vượt trội đến từ bộ vi xử lý Intel Gen 12 và đạt tiêu chuẩn nền Intel Evo, một chiếc laptop cao cấp - sang trọng đáp ứng mọi nhu cầu kể cả những doanh nhân kỹ tính.', 0, '2022-11-03 18:00:00', 220),
(29, 'Laptop Lenovo Ideapad Gaming 3 15IAH7', 7, 2, 30490000, 'lenovo-ideapad-gaming-3-15iah7-i7-82s9007uvn-1.jpg', 'Laptop Lenovo ThinkPad X1 Carbon Gen 10 i7 1260P (21CB00A8VN) không chỉ sở hữu thiết kế cứng cáp từ sợi Carbon, khả năng bảo mật cấp doanh nghiệp mà còn có hiệu năng vượt trội đến từ bộ vi xử lý Intel Gen 12 và đạt tiêu chuẩn nền Intel Evo, một chiếc laptop cao cấp - sang trọng đáp ứng mọi nhu cầu kể cả những doanh nhân kỹ tính.', 1, '2022-11-03 18:00:00', 135),
(31, 'Laptop MSI Modern 15 A5M R7 ', 8, 2, 1569000, 'msi-modern-15-a5m-r7-237vn-1.jpg', 'Nếu bạn đang tìm kiếm một chiếc laptop có thể đáp ứng đầy đủ mọi nhu cầu làm việc hay giải trí từ cơ bản đến nâng cao nhưng vẫn sở hữu một phong cách thiết kế sang chảnh, thời thượng, sức mạnh đa năng cùng mức giá hoàn toàn hợp lý, Laptop MSI Modern 15 A5M R7 (237VN) hứa hẹn sẽ mang đến những trải nghiệm trên cả tuyệt vời.', 1, '2024-12-07 17:00:00', 43),
(36, 'PC Gaming Online TG3770 – Core i7\r\n', 8, 5, 15690000, 'PC-Gaming-Online-TG3770.jpg', 'PC Gaming & Streaming – Core i7 là dòng sản phẩm máy tính chơi Game hướng đến các tựa Game Online và Stream: Call Of Duty, GTA 5, Dota, Pubg, Liên minh huyền thoại, Fifa online 4, Cf…, với bộ xử lý Intel Core i7 mạnh mẽ.\r\n\r\nVề phần thiết kế bên ngoài, chiếc máy tính được build từ case Gaming V212 với màu sắc đen chủ đạo, dải LED Rainbow nhằm tăng khả năng thoát nhiệt, thẩm mỹ và sự nổi bật cho hệ thống PC của bạn.\r\n\r\n', 1, '2022-11-10 12:00:05', 10),
(32, 'Laptop MSI Gaming Alpha 15', 8, 2, 35690000, 'msi-gaming-alpha-15-b5eek-r7-218vn-1-1.jpg', 'Một siêu phẩm xứng đáng được các game thủ mong đợi chính là chiếc laptop MSI Gaming Alpha 15 B5EEK R7 (218VN) khi sở hữu nguồn sức mạnh bộc phá đến từ bộ vi xử lý AMD 5800H cùng card đồ họa rời RX 6600M 8 GB, luôn sẵn sàng cùng mình khuấy động mọi chiến trường ảo.', 1, '2022-11-11 13:28:31', 24),
(37, 'PC Gaming Online GT6400 – G6400', 8, 5, 8500000, 'GT6400-G6400.jpg', 'PC Gaming Online GT6400 – Phổ Thông – G6400 là bộ máy tính chơi Game được tối ưu trong tầm giá 10 triệu để đáp ứng tốt các tựa game Hot hiện nay: Lmht, Fifa, Truy Kích, Cf….\r\n\r\nBộ PC có giá bán tốt, với khả năng nâng cấp về sau, cấu hình phổ thông đủ để trải nghiệm các tựa Game Online, đây chắc chắn là một trong những lựa chọn tốt nhất trong phân khúc 10 triệu đồng bạn không nên bỏ qua.', 0, '2022-11-09 17:00:00', 53),
(42, 'iPhone 13Pro', 1, 1, 20000000, 'iphone-13-pro-max-1-3.jpg', 'Iphone 13Pro 256gb với kích thước màn hình 5.8inch cho người dễ dàng sử dụng                                  ', 1, '2022-12-28 11:43:54', 344),
(63, 'Iphone 16', 1, 1, 34000, 'download.jpg', 'iPhone 16 series với 4 phiên bản: iPhone 16, iPhone 16 Plus, iPhone 16 Pro và iPhone 16 Pro Max đều có sự nâng cấp đáng kể, trong đó đáng chú ý là nút điều khiển camera mới, hệ thống camera tiên tiến, hiệu suất và thời lượng pin vượt trội. Trong đó iPhone 16 là dòng tiêu chuẩn với thiết kế trẻ trung và thời thượng cùng cấu hình mượt mà, giá bán phải chăng nhất. iPhone 16 Plus sở hữu ngoài màn hình lớn và thời lượng sử dụng pin dài hơn bản iPhone 16 thường. Đặc biệt nhất là 2 phiên bản iPhone 16 Pro và iPhone 16 Pro Max với chất liệu titan cao cấp, bền bỉ, chip A18 Pro siêu mạnh, có Neural Engine 16 lõi để xử lý các tính năng AI vượt trội.', 1, '2024-12-07 17:08:51', 2);

-- --------------------------------------------------------

--
-- Table structure for table `protypes`
--

DROP TABLE IF EXISTS `protypes`;
CREATE TABLE IF NOT EXISTS `protypes` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `protypes`
--

INSERT INTO `protypes` (`type_id`, `type_name`) VALUES
(1, 'Điện thoại'),
(2, 'Laptop'),
(3, 'Máy tính bảng'),
(5, 'PC'),
(4, 'Phụ Kiện');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `password`) VALUES
(22, 'phuchoang', 'phuc123', 'e10adc3949ba59abbe56e057f20f883e'),
(23, 'Dang Hoang Phuc', 'phuchoang', '827ccb0eea8a706c4c34a16891f84e7b'),
(24, 'Tran Minh Phuoc', 'phuoc123', '827ccb0eea8a706c4c34a16891f84e7b'),
(25, 'Dang Phuc', 'andre', '827ccb0eea8a706c4c34a16891f84e7b');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
