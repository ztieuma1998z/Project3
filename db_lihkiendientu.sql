-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 08, 2020 lúc 04:15 PM
-- Phiên bản máy phục vụ: 10.4.8-MariaDB
-- Phiên bản PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_lihkiendientu`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'trạng thái',
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `status`, `created_at`, `updated_at`) VALUES
(34, 37, '2020-02-16', 100000, 'ATM', 'Ghi Chokú', 'đã xử lý', '2020-02-16 12:45:50', '2020-02-16 12:45:50'),
(35, 38, '2020-02-16', 47770000, NULL, 'ok', 'đã hủy', '2020-02-16 15:09:23', '2020-02-16 15:09:23'),
(36, 39, '2020-02-16', 22590000, 'COD', NULL, 'đã xử lý', '2020-02-16 15:09:20', '2020-02-16 15:09:20'),
(37, 40, '2020-02-16', 10440000, 'ATM', 'ok', 'Đang xử lý', '2020-02-16 16:00:46', '2020-02-16 16:00:46'),
(38, 41, '2020-02-28', 1750000, 'ATM', 'ok nhé. hii', 'đã xử lý', '2020-02-28 14:15:14', '2020-02-28 14:15:14'),
(39, 42, '2020-03-01', 3390000, 'ATM', 'ok ha`', 'đã xử lý', '2020-03-01 16:18:05', '2020-03-01 16:18:05'),
(40, 43, '2020-03-29', 8890000, 'ATM', 'Giao hàng sớm', 'Đang xử lý', '2020-03-29 15:17:37', '2020-03-29 15:17:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(47, 34, 63, 1, 100000, '2020-02-16 12:44:31', '2020-02-16 12:44:31'),
(48, 35, 107, 2, 12590000, '2020-02-16 15:04:48', '2020-02-16 15:04:48'),
(49, 35, 74, 1, 22590000, '2020-02-16 15:04:48', '2020-02-16 15:04:48'),
(50, 36, 74, 1, 22590000, '2020-02-16 15:09:07', '2020-02-16 15:09:07'),
(51, 37, 65, 1, 690000, '2020-02-16 16:00:46', '2020-02-16 16:00:46'),
(52, 37, 93, 2, 3390000, '2020-02-16 16:00:46', '2020-02-16 16:00:46'),
(53, 37, 97, 1, 2970000, '2020-02-16 16:00:46', '2020-02-16 16:00:46'),
(54, 38, 130, 1, 1650000, '2020-02-28 14:14:01', '2020-02-28 14:14:01'),
(55, 38, 63, 1, 100000, '2020-02-28 14:14:01', '2020-02-28 14:14:01'),
(56, 39, 93, 1, 3390000, '2020-03-01 16:17:17', '2020-03-01 16:17:17'),
(57, 40, 126, 1, 8890000, '2020-03-29 15:17:37', '2020-03-29 15:17:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_type` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `id_type`, `name`, `description`, `created_at`, `updated_at`) VALUES
(38, 22, 'CPU - Bộ vi xử lý', '<p>b&aacute;n vi xử l&yacute; m&aacute;y t&iacute;nh</p>', '2020-02-11 03:35:39', '2020-02-11 03:35:39'),
(39, 22, 'Mainboard - Bo mạch chủ', '<p>b&aacute;n bo mạch chủ</p>', '2020-02-11 03:36:06', '2020-02-11 03:36:06'),
(40, 22, 'RAM', '<p>b&aacute;n ram</p>', '2020-02-11 03:36:22', '2020-02-11 03:36:22'),
(41, 22, 'VGA - Card màn hình', '<p>b&aacute;n card m&agrave;n h&igrave;nh</p>', '2020-02-11 03:37:04', '2020-02-11 03:37:04'),
(42, 22, 'PSU -Nguồn', '<p>b&aacute;n nguồn m&aacute;y t&iacute;nh</p>', '2020-02-11 03:38:08', '2020-02-11 03:38:08'),
(43, 22, 'Case máy tính', '<p>b&aacute;n case m&aacute;y t&iacute;nh</p>', '2020-02-11 03:38:30', '2020-02-11 03:38:30'),
(44, 22, 'Tản nhiệt', '<p>b&aacute;n tản nhiệt</p>', '2020-02-11 03:38:48', '2020-02-11 03:38:48'),
(45, 22, 'Ổ cứng', '<p>b&aacute;n ổ cứng m&aacute;y t&iacute;nh</p>', '2020-02-11 03:39:12', '2020-02-11 03:39:12'),
(46, 22, 'Ổ đĩa gắn ngoài', '<p>b&aacute;n ổ đĩa</p>', '2020-02-11 03:39:34', '2020-02-11 03:39:34'),
(47, 26, 'Thiết bị mạng', '<p>b&aacute;n thiết bị mạng</p>', '2020-02-11 03:40:16', '2020-02-11 03:40:16'),
(48, 26, 'Thiết bị an ninh', '<p>b&aacute;n thiết bị an ninh</p>', '2020-02-11 03:40:31', '2020-02-11 03:40:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `content` varchar(2000) COLLATE utf8_vietnamese_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_vietnamese_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `id_product`, `content`, `name`, `email`, `created_at`, `updated_at`) VALUES
(6, 126, 'sản phẩm khá là ok luôn', 'đỗ văn tuyển', 'dotuyen141297@gmail.com', '2020-03-28 17:55:10', '2020-03-28 17:55:10'),
(7, 126, 'sản phẩm tốt', 'ANH THư', 'dotuyen1412197@gmail.com', '2020-03-29 15:17:00', '2020-03-29 15:17:00'),
(8, 142, 'case rất đẹp', 'tuyển', 'dotuyen1412197@gmail.com', '2020-03-29 15:38:23', '2020-03-29 15:38:23'),
(9, 143, 'sản phẩm tốt', 'đỗ văn tuyển', 'dotuyen1412197@gmail.com', '2020-04-05 16:20:43', '2020-04-05 16:20:43'),
(10, 144, 'sản phẩm tốt chất lượng', 'ANH THư', 'anhthu@gmail.com', '2020-04-05 16:27:13', '2020-04-05 16:27:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(37, 'Đỗ Văn Tuyển', 'nam', 'dotuyen1412197@gmail.com', 'Đội 7- Thôn Năm Mẫu - Xã Tứ Dân, Huyện Khoái Châu - Tỉnh Hưng Yên', '0369712385', 'Ghi Chokú', '2020-02-16 12:44:31', '2020-02-16 12:44:31'),
(38, 'do tuyen', 'nam', 'dotuyen016@gmail.com', 'Đội 7- Thôn Năm Mẫu - Xã Tứ Dân', '0369712385', 'ok', '2020-02-16 15:04:48', '2020-02-16 15:04:48'),
(39, 'admin', 'nam', 'dotuyen016@gmail.com', 'Đội 7- Thôn Năm Mẫu - Xã Tứ Dân', '0369712385', NULL, '2020-02-16 15:09:07', '2020-02-16 15:09:07'),
(40, 'tạ tài linh', 'nữ', 'ttlinh@gmail.com', 'phú thọ', '0369712385', 'ok', '2020-02-16 16:00:46', '2020-02-16 16:00:46'),
(41, 'Đỗ Văn Tuyển', 'nam', 'dotuyen1412197@gmail.com', 'Đội 7- Thôn Năm Mẫu - Xã Tứ Dân, Huyện Khoái Châu - Tỉnh Hưng Yên', '0369712385', 'ok nhé. hii', '2020-02-28 14:14:01', '2020-02-28 14:14:01'),
(42, 'Đỗ Văn Tuyển', 'nam', 'dotuyen1412197@gmail.com', 'Đội 7- Thôn Năm Mẫu - Xã Tứ Dân, Huyện Khoái Châu - Tỉnh Hưng Yên', '+84369712385', 'ok ha`', '2020-03-01 16:17:17', '2020-03-01 16:17:17'),
(43, 'Đỗ Văn Tuyển', 'nam', 'dotuyen1412197@gmail.com', 'Đội 7- Thôn Năm Mẫu - Xã Tứ Dân, Huyện Khoái Châu - Tỉnh Hưng Yên', '0369712385', 'Giao hàng sớm', '2020-03-29 15:17:37', '2020-03-29 15:17:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_employees` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'tên nhân viên',
  `email` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'email',
  `address` varchar(250) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'địa chỉ',
  `phone` varchar(20) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'số điện thoại',
  `gender` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'giới tính',
  `position` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'chức vụ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `employees`
--

INSERT INTO `employees` (`id`, `name_employees`, `email`, `address`, `phone`, `gender`, `position`, `created_at`, `updated_at`) VALUES
(3, 'Tuyển Đỗ Văn', 'dotuyen1412197@gmail.com', 'Năm Mẫu - Tứ Dân - Khoái Châu - Hưng Yên, An Tháp - Nhân Hòa - Mỹ Hào - Hưng Yên', '0369712385', 'nam', 'nhân viên bán hàng', '2020-02-28 14:16:28', '2020-02-28 14:16:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `import_bill`
--

CREATE TABLE `import_bill` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_import_bill_detail` int(10) UNSIGNED NOT NULL,
  `total_price` float NOT NULL,
  `id_employees` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `import_bill_detail`
--

CREATE TABLE `import_bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL COMMENT 'mã sản phẩm',
  `id_type_product` int(10) UNSIGNED NOT NULL COMMENT 'mã loại sp',
  `id_category` int(10) UNSIGNED NOT NULL COMMENT 'mã danh mục',
  `id_supplier` int(10) UNSIGNED NOT NULL COMMENT 'mã nhà cung cấp',
  `quantity` int(10) NOT NULL COMMENT 'số lượng',
  `unit_price` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `summary` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tóm tắt',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `summary`, `content`, `image`, `created_at`, `updated_at`) VALUES
(3, 'Đ&aacute;nh gi&aacute; HP Pavilion 14-ce3018TU: laptop ngon, gi&aacute; tốt cho mọi đối tượng', '<p>Để t&igrave;m sản phẩm laptop cao cấp, th&ocirc;ng số khủng hay laptop b&igrave;nh d&acirc;n gi&aacute; si&ecirc;u rẻ đều rất dễ. Thế nhưng ph&acirc;n kh&uacute;c ở ch&iacute;nh giữa khoảng 15 triệu lại kh&ocirc;ng qu&aacute; nhiều lựa chọn trong khi nhu cầu kh&ocirc;ng phải thấp. H&ocirc;m nay, h&atilde;y c&ugrave;ng Phong Vũ đ&aacute;nh gi&aacute; một mẫu m&aacute;y như vậy: Laptop HP Pavilion 14-ce3018TU (8QN89PA) (i5-1035G1).</p>\r\n\r\n<p><a href=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-4.jpg\"><img alt=\"Laptop HP Pavilion 14-ce3018TU: laptop giá tốt, vừa tầm cho giới trẻ\" sizes=\"(max-width: 696px) 100vw, 696px\" src=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-4-696x434.jpg\" srcset=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-4-696x434.jpg 696w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-4-300x187.jpg 300w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-4.jpg 768w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-4-673x420.jpg 673w\" style=\"height:434px; width:696px\" title=\"laptop-HP-Pavilion14-ce3018TU-phong-vu-4\" /></a></p>\r\n\r\n<p>Laptop HP Pavilion 14-ce3018TU mới ra mắt năm 2019</p>', '<h2><strong>Thiết kế bắt mắt với m&agrave;u sắc sang trọng</strong></h2>\r\n\r\n<p>Điểm tạo ấn tượng đầu ti&ecirc;n của sản phẩm hẳn l&agrave; m&agrave;u v&agrave;ng gold kh&aacute; s&aacute;ng bao phủ khắp to&agrave;n m&aacute;y. N&oacute; l&agrave; một lựa chọn vừa kh&ocirc;ng nh&agrave;m ch&aacute;n như c&aacute;c sắc trắng, bạc qu&aacute; quen thuộc lại kh&ocirc;ng qu&aacute; lạ, vẫn hợp gu nhiều người. Với những ai th&iacute;ch truyền thống th&igrave; cũng đừng lo, laptop n&agrave;y cũng c&oacute; phi&ecirc;n bản m&agrave;u bạc nữa. Hay c&aacute;c bạn nữ th&igrave; c&oacute; ri&ecirc;ng m&agrave;u Rose Gold si&ecirc;u điệu đ&agrave;.</p>\r\n\r\n<p><img alt=\"Laptop HP Pavilion 14-ce3018TU: laptop giá tốt, vừa tầm cho giới trẻ\" sizes=\"(max-width: 1200px) 100vw, 1200px\" src=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-1.jpg\" srcset=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-1.jpg 1200w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-1-300x255.jpg 300w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-1-768x653.jpg 768w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-1-1024x870.jpg 1024w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-1-696x592.jpg 696w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-1-1068x908.jpg 1068w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-1-494x420.jpg 494w\" style=\"height:1020px; width:1200px\" /></p>\r\n\r\n<p>Vỏ ngo&agrave;i b&oacute;ng bẩy sang trọng của Laptop HP Pavilion 14</p>\r\n\r\n<p>V&igrave; nhắm tới đối tượng sử dụng l&agrave; học sinh, sinh vi&ecirc;n, d&acirc;n văn ph&ograve;ng trẻ tuổi, HP Pavilion 14-ce3018TU được thiết kế trẻ trung, thời thượng v&agrave; d&agrave;nh cho cả nam lẫn nữ. K&iacute;ch thước m&aacute;y cụ thể 32.68 x 22.55 x 1.79 cm. Trọng lượng của mẫu m&aacute;y 14 inch n&agrave;y l&agrave; 1,6kg &ndash; vừa vặn để bạn mang đi học, đi l&agrave;m thoải m&aacute;i. Ngo&agrave;i ra, trong thiết kế c&ograve;n c&oacute; một điểm cộng nữa m&agrave; phải trải nghiệm thực tế người d&ugrave;ng mới biết được. Đ&oacute; l&agrave; b&agrave;n ph&iacute;m được thiết kế kh&aacute; s&acirc;u, đem lại độ nảy tốt hơn hẳn khi sử dụng.</p>\r\n\r\n<h2><strong>M&agrave;n h&igrave;nh &ldquo;c&acirc;n&rdquo; tốt nhiệm vụ giải tr&iacute;</strong></h2>\r\n\r\n<p>M&agrave;n h&igrave;nh của m&aacute;y c&oacute; k&iacute;ch thước 14 inch Full HD, g&oacute;c nh&igrave;n rộng 178 độ. Tr&ecirc;n m&agrave;n h&igrave;nh c&oacute; c&ocirc;ng nghệ LED Backlit n&ecirc;n h&igrave;nh ảnh kh&aacute; sống động, chi tiết. M&agrave;n h&igrave;nh hiển thị được đ&aacute;nh gi&aacute; l&agrave; trội hơn so với nhiều đối thủ c&ugrave;ng ph&acirc;n kh&uacute;c. C&aacute;c phần viền m&agrave;n h&igrave;nh kh&aacute; mỏng, bắt đ&uacute;ng xu hướng hiện nay của l&agrave;ng laptop.</p>\r\n\r\n<p><img alt=\"Laptop HP Pavilion 14-ce3018TU: laptop giá tốt, vừa tầm cho giới trẻ\" sizes=\"(max-width: 800px) 100vw, 800px\" src=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-2.jpg\" srcset=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-2.jpg 800w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-2-300x178.jpg 300w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-2-768x456.jpg 768w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-2-696x413.jpg 696w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-2-707x420.jpg 707w\" style=\"height:475px; width:800px\" /></p>\r\n\r\n<p>M&agrave;n h&igrave;nh kh&aacute; tốt để bạn giải tr&iacute; m&atilde;n nh&atilde;n hơn</p>\r\n\r\n<h2><strong>Cấu h&igrave;nh với CPU Intel đời mới nhất</strong></h2>\r\n\r\n<p>Nền tảng của m&aacute;y l&agrave; bộ vi xử l&yacute; Core i5 1035G1 1.0GHz-6MB, RAM 4GB. Với cấu h&igrave;nh n&agrave;y, bạn kh&ocirc;ng thể chơi game online cấu h&igrave;nh mạnh nhưng vẫn đủ để chơi game nhẹ, d&ugrave;ng Photoshop, Ai, Lightroom&nbsp;căn bản. Laptop hỗ trợ ổ cứng ngo&agrave;i SSD l&ecirc;n đến 256GB. Ở cạnh m&aacute;y c&oacute; 1 ổ USB type C, 2 ổ USB type A l&agrave;m nhiệm vụ kết nối. Cục pin laptop HP Pavilion 14-ce3029TU l&agrave; pin 3 cell kh&aacute; mạnh. Hệ điều h&agrave;nh mặc định ban đầu l&agrave;&nbsp;<a href=\"https://phongvu.vn/microsoft-windows-679.cat\" target=\"_blank\">Windows</a>&nbsp;10.</p>\r\n\r\n<p><img alt=\"Laptop HP Pavilion 14-ce3018TU: laptop giá tốt, vừa tầm cho giới trẻ\" sizes=\"(max-width: 800px) 100vw, 800px\" src=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-3.jpg\" srcset=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-3.jpg 800w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-3-300x188.jpg 300w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-3-768x480.jpg 768w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-3-696x435.jpg 696w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-3-672x420.jpg 672w\" style=\"height:500px; width:800px\" /></p>\r\n\r\n<p>Photoshop vẫn c&oacute; thể sử dụng tốt với Laptop HP Pavilion 14-ce3018TU</p>\r\n\r\n<h2><strong>Laptop HP Pavilion 14-ce3018TU d&agrave;nh cho ai?</strong></h2>\r\n\r\n<p>Với mẫu m&aacute;y n&agrave;y, HP đ&atilde; nhắm đến đối tượng kh&aacute;ch h&agrave;ng rất r&otilde; r&agrave;ng. Đ&oacute; l&agrave; c&aacute;c bạn học sinh, sinh vi&ecirc;n v&agrave; người trẻ n&oacute;i chung. Với mức gi&aacute; tầm trung, m&aacute;y cũng đ&aacute;p ứng nhu cầu tầm trung của người d&ugrave;ng. Tức l&agrave; bạn c&oacute; thể thoải m&aacute;i thao t&aacute;c văn ph&ograve;ng v&agrave; giải tr&iacute; với game, ứng dụng cấu h&igrave;nh trung b&igrave;nh.</p>\r\n\r\n<p>Với những bạn n&agrave;o c&agrave;y game online hay c&oacute; nhu cầu thiết kế đồ họa, dựng phim th&igrave; chắc chắn phải t&igrave;m tới laptop tầm cao hơn. Nhưng x&eacute;t theo th&oacute;i quen sử dụng của phần đ&ocirc;ng c&aacute;c bạn sinh vi&ecirc;n hiện nay th&igrave; chiếc m&aacute;y n&agrave;y chắc chắn l&agrave; đủ. Để giảm gi&aacute; th&agrave;nh sản phẩm, h&atilde;ng tập trung v&agrave;o những t&iacute;nh năng thiết thực. C&aacute;c c&ocirc;ng nghệ tuy hot nhưng kh&ocirc;ng qu&aacute; quan trọng như bảo mật v&acirc;n tay sẽ kh&ocirc;ng xuất hiện. Y&ecirc;n t&acirc;m v&igrave; HP cũng đ&atilde; nghi&ecirc;n cứu kh&ocirc;ng &iacute;t để cho ra đời laptop HP Pavilion 14-ce3018TU gi&aacute; tốt m&agrave; chất lượng cũng tốt.</p>\r\n\r\n<p><img alt=\"Laptop HP Pavilion 14-ce3018TU: laptop giá tốt, vừa tầm cho giới trẻ\" sizes=\"(max-width: 768px) 100vw, 768px\" src=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-4.jpg\" srcset=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-4.jpg 768w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-4-300x187.jpg 300w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-4-696x434.jpg 696w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/laptop-HP-Pavilion14-ce3018TU-phong-vu-4-673x420.jpg 673w\" style=\"height:479px; width:768px\" /></p>\r\n\r\n<p>Laptop HP Pavilion 14-ce3018TU mới ra mắt năm 2019</p>\r\n\r\n<p>Bạn c&oacute; bị hấp dẫn bởi mẫu m&aacute;y si&ecirc;u năng động n&agrave;y kh&ocirc;ng? Nếu c&oacute; th&igrave; đừng chần chừ m&agrave; đặt&nbsp;<a href=\"https://phongvu.vn/may-tinh-xach-tay-laptop-hp-pavilion-14ce3018tu-8qn89pa-i51035g1-vang-s191200242.html\">mua laptop HP Pavilion 14-ce3018TU gi&aacute; tốt</a>&nbsp;ngay lu&ocirc;n nh&eacute;!</p>', 'laptop-HP-Pavilion14-ce3018TU-phong-vu-4.jpg', '2020-03-29 16:11:28', '2020-03-29 16:11:28'),
(2, '7 mẹo sử dụng quạt điều h&ograve;a hiệu quả v&agrave; an to&agrave;n', '<p>C&agrave;ng ng&agrave;y quạt điều h&ograve;a c&agrave;ng phổ biến v&igrave; m&aacute;t hơn quạt thường m&agrave; lại tiết kiệm hơn điều h&ograve;a. Nhưng muốn quạt lu&ocirc;n m&aacute;t v&agrave; tạo kh&ocirc;ng kh&iacute; trong l&agrave;nh dễ chịu nhất c&oacute; thể, bạn n&ecirc;n thực hiện 7 mẹo sử dụng quạt điều h&ograve;a hiệu quả dưới đ&acirc;y.</p>\r\n\r\n<p><a href=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-4.jpg\"><img alt=\"Quạt điều hòa dùng sao mới hiệu quả, tiết kiệm? Ghi nhớ ngay 7 mẹo sau\" sizes=\"(max-width: 696px) 100vw, 696px\" src=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-4-696x435.jpg\" srcset=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-4-696x435.jpg 696w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-4-300x188.jpg 300w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-4-768x480.jpg 768w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-4-672x420.jpg 672w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-4.jpg 800w\" style=\"height:435px; width:696px\" title=\"su-dung-quat-dieu-hoa-phong-vu-4\" /></a></p>\r\n\r\n<p>Rất nhiều người đang d&ugrave;ng quạt điều h&ograve;a sai c&aacute;ch m&agrave; kh&ocirc;ng biết</p>', '<h2><strong>Điều chỉnh quạt theo từng bước</strong></h2>\r\n\r\n<p>Để đạt được hiệu suất gi&oacute; m&aacute;t dễ chịu v&agrave; tốt cho m&aacute;y, bạn n&ecirc;n bật quạt theo từng bước chứ kh&ocirc;ng n&ecirc;n bật t&ugrave;y &yacute; ngay từ đầu. Khi mới bật th&igrave; n&ecirc;n để chế độ Cool. Thường th&igrave; l&uacute;c n&agrave;y ch&uacute;ng ta cho đ&aacute; hoặc nước v&agrave;o m&aacute;y v&agrave; đợi tầm 15 ph&uacute;t nhiệt độ xung quanh sẽ giảm. Khi m&agrave; nhiệt độ đ&atilde; giảm, trong ph&ograve;ng thấy m&aacute;t l&agrave;nh hơn hẳn mới tiếp tục cho xoay quạt. L&uacute;c n&agrave;y bạn cũng c&oacute; thể chọn th&ecirc;m c&aacute;c chế độ tạo độ ẩm, tạo ion, lọc kh&iacute;,&hellip; (nếu c&oacute;).</p>\r\n\r\n<h2><strong>Chọn chỗ đặt quạt điều h&ograve;a hợp l&yacute;</strong></h2>\r\n\r\n<p>Kh&ocirc;ng giống quạt thường, quạt điều h&ograve;a phải đặt đ&uacute;ng nơi th&iacute;ch hợp th&igrave; mới ph&aacute;t huy hiệu quả tốt. Quan trọng nhất l&agrave; phải t&igrave;m nơi th&ocirc;ng tho&aacute;ng. Bạn kh&ocirc;ng n&ecirc;n đặt c&aacute;c đồ vật (kể cả tường) ở gần quạt d&ugrave; l&agrave; ph&iacute;a n&agrave;o đi chăng nữa. Khoảng c&aacute;ch tối đa n&ecirc;n l&agrave; 20cm. V&agrave; c&ograve;n c&oacute; một hiểu nhầm rất lớn nữa m&agrave; nhiều người hay mắc phải. Đ&oacute; l&agrave; nghĩ rằng quạt điều h&ograve;a giống điều h&ograve;a nhiệt độ, phải d&ugrave;ng trong ph&ograve;ng k&iacute;n. Sự thật l&agrave; ho&agrave;n to&agrave;n ngược lại, bạn n&ecirc;n d&ugrave;ng ch&uacute;ng ở kh&ocirc;ng gian tho&aacute;ng, lưu th&ocirc;ng kh&ocirc;ng kh&iacute;.</p>\r\n\r\n<p><img alt=\"Quạt điều hòa dùng sao mới hiệu quả, tiết kiệm? Ghi nhớ ngay 7 mẹo sau\" sizes=\"(max-width: 760px) 100vw, 760px\" src=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-2.jpg\" srcset=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-2.jpg 760w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-2-300x200.jpg 300w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-2-696x463.jpg 696w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-2-631x420.jpg 631w\" style=\"height:506px; width:760px\" /></p>\r\n\r\n<p>Kh&ocirc;ng gian c&agrave;ng tho&aacute;ng đ&atilde;ng th&igrave; quạt c&agrave;ng l&agrave;m việc tốt</p>\r\n\r\n<h2><strong>Đổ nước/đ&aacute; v&agrave;o b&igrave;nh đ&uacute;ng lượng</strong></h2>\r\n\r\n<p>Khi đổ nước hoặc đ&aacute; v&agrave;o b&igrave;nh chứa, nhiều người th&iacute;ch đổ lu&ocirc;n thật đầy để tiết kiệm thời gian, c&ocirc;ng đổ. Nhưng điều n&agrave;y lại kh&ocirc;ng tốt ch&uacute;t n&agrave;o cho quạt điều h&ograve;a. Mức đổ khuyến c&aacute;o chung chỉ l&agrave; gi&agrave; nửa b&igrave;nh chứa hoặc nhiều lắm l&agrave; 2/3. Nếu bạn đổ qu&aacute; đầy, trong l&uacute;c bất cẩn hoặc khi m&aacute;y hoạt động, nước c&oacute; thể bị tr&agrave;n, r&ograve; rỉ ra ngo&agrave;i. M&agrave; với thiết bị điện th&igrave; t&igrave;nh huống đ&oacute; rất nguy hiểm. C&ograve;n nếu trong b&igrave;nh lu&ocirc;n thiếu nước th&igrave; cũng kh&ocirc;ng tốt. Quạt chạy qu&aacute; l&acirc;u m&agrave; kh&ocirc;ng c&oacute; nước sẽ l&agrave;m n&oacute;ng, ch&aacute;y c&aacute;c bộ phận b&ecirc;n trong.</p>\r\n\r\n<h2><strong>Chỉ đổ nước sạch v&agrave;o b&igrave;nh chứa</strong></h2>\r\n\r\n<p>Đừng nghe theo c&aacute;c lời quảng c&aacute;o m&agrave; &ldquo;s&aacute;ng tạo&rdquo; ra c&aacute;c loại nước thơm, nước h&oacute;a chất v&agrave;o b&igrave;nh chứa. B&igrave;nh chứa quạt điều h&ograve;a chỉ để đựng nước sạch. Nếu bạn cho nước bẩn hay nước c&oacute; chứa h&oacute;a chất v&agrave;o trong đều sẽ g&acirc;y hại cho quạt. Gi&oacute; phả ra từ nguồn nước kh&ocirc;ng đảm bảo cũng g&acirc;y hại cho ch&iacute;nh con người. Nếu muốn tạo hương thơm m&aacute;t, bạn chỉ cần d&ugrave;ng s&aacute;p hoặc tinh dầu đặt trước quạt.</p>\r\n\r\n<p><img alt=\"Quạt điều hòa dùng sao mới hiệu quả, tiết kiệm? Ghi nhớ ngay 7 mẹo sau\" sizes=\"(max-width: 800px) 100vw, 800px\" src=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-5.jpg\" srcset=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-5.jpg 800w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-5-300x200.jpg 300w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-5-768x513.jpg 768w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-5-696x465.jpg 696w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-5-629x420.jpg 629w\" style=\"height:534px; width:800px\" /></p>\r\n\r\n<p>Việc thay nước đơn giản nhưng cần lưu &yacute; kh&ocirc;ng &iacute;t</p>\r\n\r\n<h2><strong>Thay nước thường xuy&ecirc;n</strong></h2>\r\n\r\n<p>Nếu nh&agrave; n&agrave;o d&ugrave;ng quạt điều h&ograve;a hằng ng&agrave;y th&igrave; sẽ kh&ocirc;ng cần lo lắng. Nhưng nếu bạn thỉnh thoảng mới d&ugrave;ng quạt, hoặc mới l&ocirc;i n&oacute; ra sau thời gian d&agrave;i chưa sử dụng th&igrave; sao? Đừng vội d&ugrave;ng lu&ocirc;n m&agrave; h&atilde;y đổ hết nước đang c&oacute; trong b&igrave;nh chứa đi v&agrave; thay bằng nước mới. Nước để qu&aacute; l&acirc;u sẽ c&oacute; nhiều vi khuẩn v&agrave; bị bẩn.</p>\r\n\r\n<h2><strong>Đặt quạt điều h&ograve;a trước mặt 2 &ndash; 3m</strong></h2>\r\n\r\n<p>Khi quạt điều h&ograve;a chạy th&igrave; gi&oacute; m&aacute;t sẽ tỏa khắp ph&ograve;ng. Nhưng d&ugrave; sao th&igrave; khả năng lan tỏa n&agrave;y cũng kh&ocirc;ng tốt như m&aacute;y lạnh được. Để c&oacute; được hơi m&aacute;t tốt nhất, bạn n&ecirc;n đặt quạt ở trước m&igrave;nh 2 đến 3 m&eacute;t.Thế nhưng nesu quạt c&ocirc;ng suất lớn th&igrave; n&ecirc;n ngồi xa hơn một ch&uacute;t.</p>\r\n\r\n<p><img alt=\"Quạt điều hòa dùng sao mới hiệu quả, tiết kiệm? Ghi nhớ ngay 7 mẹo sau\" sizes=\"(max-width: 900px) 100vw, 900px\" src=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-1.png\" srcset=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-1.png 900w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-1-300x200.png 300w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-1-768x512.png 768w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-1-696x464.png 696w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-1-630x420.png 630w\" style=\"height:600px; width:900px\" /></p>\r\n\r\n<p>Giữ khoảng c&aacute;ch tầm 3 m&eacute;t l&agrave; l&yacute; tưởng để tận hưởng gi&oacute; quạt</p>\r\n\r\n<h2><strong>Vệ sinh quạt điều h&ograve;a thường xuy&ecirc;n</strong></h2>\r\n\r\n<p>Thiết bị điện sẽ bền l&acirc;u n&ecirc;n ch&uacute;ng ta biết giữ g&igrave;n, vệ sinh định kỳ đ&uacute;ng c&aacute;ch. T&ugrave;y v&agrave;o tần suất sử dụng v&agrave; điều kiện m&ocirc;i trường, người d&ugrave;ng cần vệ sinh quạt mỗi tuần hoặc th&aacute;ng 1 lần. Việc vệ sinh kh&ocirc;ng qu&aacute; kh&oacute; khăn, chỉ việc th&aacute;o m&agrave;n chắn bụi với tấm l&agrave;m m&aacute;t ra rửa với nước sạch.</p>\r\n\r\n<p><img alt=\"Đừng bao giờ để quạt bám bụi quá nhiều\" sizes=\"(max-width: 730px) 100vw, 730px\" src=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-3.jpg\" srcset=\"https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-3.jpg 730w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-3-300x200.jpg 300w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-3-696x464.jpg 696w, https://phongvu.vn/cong-nghe/wp-content/uploads/2020/03/su-dung-quat-dieu-hoa-phong-vu-3-630x420.jpg 630w\" style=\"height:487px; width:730px\" /></p>\r\n\r\n<p>Đừng bao giờ để quạt b&aacute;m bụi qu&aacute; nhiều</p>\r\n\r\n<p>C&aacute;c mẹo d&ugrave;ng quạt điều h&ograve;a tr&ecirc;n rất đơn giản, dễ thực hiện nhưng đ&aacute;ng tiếc l&agrave; &iacute;t người biết v&agrave; l&agrave;m theo. Nếu đang hoặc sắp d&ugrave;ng quạt, h&atilde;y ghi nhớ lại ngay để giữ cho đồ d&ugrave;ng của m&igrave;nh bền l&acirc;u, lu&ocirc;n hoạt động hiệu quả nh&eacute;!</p>', 'su-dung-quat-dieu-hoa-phong-vu-4-696x435.jpg', '2020-03-29 16:04:54', '2020-03-29 16:04:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `id_category` int(10) UNSIGNED DEFAULT NULL,
  `id_supplier` int(11) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `Parameter` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'thông số',
  `origin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'xuất xứ',
  `material` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'chất liệu',
  `unit_price` float DEFAULT NULL COMMENT 'giá gốc',
  `promotion_price` float DEFAULT NULL COMMENT 'giá sale',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'đơn vị',
  `new` tinyint(4) DEFAULT 0,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `id_category`, `id_supplier`, `description`, `Parameter`, `origin`, `material`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `status`, `created_at`, `updated_at`) VALUES
(63, 'Turnboots Patch Cord Cat.6 1m LS-MTPC-UC632-XX-010', 26, 47, NULL, '<p>sản phẩm d&acirc;y mạng</p>', NULL, NULL, NULL, 109000, 100000, 'pd1.jpg', NULL, 0, '', '2020-02-11 08:56:08', '2020-02-11 08:56:08'),
(64, 'Router ToToLink A3002RU-V2', 26, 47, NULL, '<p>route totolink</p>', NULL, NULL, NULL, 1449000, 0, '1579600918.863809_1571732508.7105653_Router-ToToLink-A3002RU-V2-1.jpg', NULL, 0, '', '2020-02-11 09:02:58', '2020-02-11 09:02:58'),
(65, 'Thiết bị mạng/ Switch POE D-Link 6P DES-F1006P', 26, 47, NULL, '<p>thiết bị mạng&nbsp;&nbsp;Switch POE D-Link 6P DES-F1006P</p>', NULL, NULL, NULL, 690000, 0, '1571201453.9265943_D-Link_6P_DES-F1006P_1.jpg', NULL, 0, '', '2020-02-11 15:47:03', '2020-02-11 15:47:03'),
(66, 'Thiết bị mạng Asus USB-N10 NANO', 26, 47, NULL, '<h2>Thiết bị mạng Asus USB-N10 NANO</h2>', NULL, NULL, NULL, 250000, 0, '1573810368.4900053_Asus-USB-N10-NANO-1.jpg', NULL, 0, '', '2020-02-12 02:55:05', '2020-02-12 02:55:05'),
(67, 'Thiết bị mạng Asus RT-AC1500UHP', 26, 47, NULL, '<p>&nbsp;</p>\r\n\r\n<p>Thiết bị mạng Asus RT-AC1500UHP</p>', NULL, NULL, NULL, 1990000, 0, '1574911734.6526835_1573871401.745056210_Asus_RT-AC1500UHP_1.jpg', NULL, 1, '', '2020-02-12 02:57:08', '2020-02-13 02:48:05'),
(68, 'Router Wifi ToToLink EX200', 26, 47, NULL, '<p>264.000</p>', NULL, NULL, NULL, 264000, 0, '11526.jpg', NULL, 0, '', '2020-02-12 02:58:00', '2020-02-12 02:58:00'),
(69, 'Đầu ghi Hikvision DS-7104HGHI-F1', 26, 48, NULL, '<h2>Đầu ghi Hikvision DS-7104HGHI-F1</h2>', NULL, NULL, NULL, 1055000, 0, '1572319697.5277162_Hikvision-DS-7104HGHI-F1-1.jpg', NULL, 0, '', '2020-02-12 02:58:59', '2020-02-12 02:58:59'),
(70, 'Camera Hikvision DS-2CE16D0T-IR', 26, 48, NULL, '<h2>Camera Hikvision DS-2CE16D0T-IR</h2>', NULL, NULL, NULL, 505000, 0, '1572321191.0508235_Camera-Hikvision-DS-2CE16D0T-IR-1.jpg', NULL, 0, '', '2020-02-12 02:59:58', '2020-02-12 02:59:58'),
(71, 'Camera Hikvision DS-2CE56D0T-IR', 26, 48, NULL, '<h2>Camera Hikvision DS-2CE56D0T-IR</h2>', NULL, NULL, NULL, 460000, 0, '1572322398.2449481_Camera-Hikvision-DS-2CE56D0T-IR-1.jpg', NULL, 0, '', '2020-02-12 03:00:46', '2020-02-12 03:00:46'),
(72, 'Đầu ghi Hikvision DS-7204HGHI-F1', 26, 48, NULL, '<p>Đầu ghi Hikvision DS-7204HGHI-F1</p>', NULL, NULL, NULL, 1106000, 0, '1572322711.1873996_Hikvision-DS-7204HGHI-F1-1.jpg', NULL, 0, '', '2020-02-12 03:02:23', '2020-02-12 03:02:23'),
(73, 'Đầu ghi Hikvision DS-7104NI-Q1', 26, 48, NULL, '<h2>Đầu ghi Hikvision DS-7104NI-Q1</h2>', NULL, NULL, NULL, 1200000, 0, '1572330062.6932065_Hikvision--DS-7104NI-Q1-1.jpg', NULL, 0, '', '2020-02-12 03:03:44', '2020-02-12 03:03:44'),
(126, 'CPU INTEL Core i7-9700 (8C/8T, 3.00 GHz up to 4.70 GHz, 12MB) - 1151-v2', 22, 38, NULL, '<p>T&ecirc;n sản phẩm: Bộ vi xử l&yacute;/ CPU Intel Core i7-9700 (12M Cache, up to 4.7GHz)</p>\r\n\r\n<p>Socket: 1151-v2, Intel Core th&ecirc;́ h&ecirc;̣ thứ 9<br />\r\nTốc độ: 3.00 GHz up to 4.70 GHz (8nh&acirc;n, 8 luồng)<br />\r\nBộ nhớ đệm: 12MB<br />\r\nChip đồ họa t&iacute;ch hợp: Intel UHD Graphics 630</p>', NULL, NULL, NULL, 9190000, 8890000, '1569575815.9417503_i7-9700-1.jpg', NULL, 1, '', '2020-02-13 03:39:46', '2020-02-13 03:39:46'),
(127, 'CPU Intel Core i5-9400F (6C/6T, 2.9 - 4.1 GHz, 9MB) - LGA 1151-v2', 22, 38, NULL, '<p>T&ecirc;n sản phẩm: Bộ vi xử l&yacute;/ CPU Intel Core i5-9400F (9M Cache, up to 4.10GHz)</p>\r\n\r\n<p>- Socket: LGA 1151-v2 , Intel Core th&ecirc;́ h&ecirc;̣ thứ 9<br />\r\n- T&ocirc;́c đ&ocirc;̣ xử lý: 2.9 - 4.1 GHz ( 6 nh&acirc;n, 6 lu&ocirc;̀ng)<br />\r\n- Bộ nhớ đệm: 9MB</p>', NULL, NULL, NULL, 4390000, 3690000, '28dae48cbc31f3dc7c1433b68759b9ae_cpu intel core i5-9400f (9m cache, up to 4.10ghz)_1.jpg', NULL, 0, '', '2020-02-13 03:41:03', '2020-02-13 03:41:03'),
(128, 'CPU Intel Core i3-9100F (4C/4T, 3.60 GHz - 4.20 GHz, 6MB) - LGA 1151-v2', 22, 38, NULL, '<p>T&ecirc;n sản phẩm: Bộ vi xử l&yacute;/ CPU Intel Core i3-9100F (6M Cache, up to 4.20GHz)</p>\r\n\r\n<p>- Socket: LGA 1151-v2 , Intel Core th&ecirc;́ h&ecirc;̣ thứ 9<br />\r\n- T&ocirc;́c đ&ocirc;̣ xử lý: 3.60 GHz - 4.20 GHz ( 4 nh&acirc;n, 4 lu&ocirc;̀ng)<br />\r\n- Bộ nhớ đệm: 6MB</p>', NULL, NULL, NULL, 2590000, 2150000, '64a81af6c37b2535802559b68b60e47b_cpu intel core i3-9100f_1.jpg', NULL, 0, '', '2020-02-13 03:42:05', '2020-02-13 03:42:05'),
(129, 'Mainboard ASUS Strix B250G-Gaming', 22, 39, NULL, '<p>T&ecirc;n sản phẩm: Bo mạch ch&iacute;nh/ Mainboard Asus Strix B250G-Gaming</p>\r\n\r\n<p>- Chu&acirc;̉n mainboard: Micro-ATX<br />\r\n- Socket: LGA 1151 , Chipset: B250<br />\r\n- H&ocirc;̃ trợ RAM: DDR4 , tối đa 64GB</p>', NULL, NULL, NULL, 2137000, NULL, 'asus-strix-b250g-gaming-1.jpg', NULL, 1, '', '2020-02-13 03:44:35', '2020-02-13 03:44:35'),
(130, 'Mainboard GIGABYTE H310M DS2', 22, 39, NULL, '<p>T&ecirc;n sản phẩm: Bo mạch ch&iacute;nh/ Mainboard Gigabyte H310M-DS2</p>\r\n\r\n<p>- Chu&acirc;̉n mainboard: Micro-ATX<br />\r\n- Socket: LGA 1151-v2 , Chipset: H310<br />\r\n- H&ocirc;̃ trợ RAM: DDR4 , tối đa 32GB<br />\r\n- C&ocirc;̉ng cắm lưu trữ: 4 x SATA 3 6Gb/s<br />\r\n- Cổng xuất h&igrave;nh: 1 x VGA/D-sub</p>', NULL, NULL, NULL, 1650000, NULL, 'gigabyte-h310m-ds2-1.png', NULL, 1, '', '2020-02-13 03:45:52', '2020-02-13 03:45:52'),
(131, 'Mainboard ASUS EX-B365M-V5', 22, 39, NULL, '<p>T&ecirc;n sản phẩm: Bo mạch ch&iacute;nh/ Mainboard Asus EX-B365M-V5</p>\r\n\r\n<p>- Chu&acirc;̉n mainboard: Micro-ATX<br />\r\n- Socket: LGA 1151-v2 , Chipset: B365<br />\r\n- H&ocirc;̃ trợ RAM: DDR4 , tối đa 32GB<br />\r\n- C&ocirc;̉ng cắm lưu trữ: 1 x M.2 SATA/NVMe; 4 x SATA 3 6Gb/s; H&ocirc;̃ trợ Intel Optane<br />\r\n- Cổng xuất h&igrave;nh: 1 x HDMI; 1 x VGA/D-sub</p>', '<div class=\"attribute-content\">\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Thương hiệu</p>\r\n\r\n<p>TOTO LINK</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Bảo h&agrave;nh</p>\r\n\r\n<p>24 th&aacute;ng</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>M&ocirc; tả bảo h&agrave;nh</p>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Cấu h&igrave;nh chi tiết</p>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Băng tần hỗ trợ</p>\r\n\r\n<p>2.4 GHz / 5 GHz</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Tốc độ</p>\r\n\r\n<p>2.4GHz - 300Mbps / 5.0GHz - 867Mbps</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Chuẩn kết nối</p>\r\n\r\n<p>802.11 a/b/g/n/ac</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Cổng kết nối</p>\r\n\r\n<p>4x LAN Gigabit, 1x WAN Gigabit</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Ăng ten</p>\r\n\r\n<p>4x ngo&agrave;i / 5 dBi</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Nguồn điện cấp</p>\r\n\r\n<p>12V DC / 1A</p>\r\n</div>\r\n</div>', NULL, NULL, 1750000, 1650000, 'slide2.jpg', NULL, 1, '', '2020-02-13 03:48:55', '2020-04-05 15:49:29'),
(132, 'Card màn hình ASUS GeForce RTX 2080Ti 11GB GDDR6 ROG Strix OC (ROG-STRIX-RTX2080TI-O11G-GAMING)', 22, 41, NULL, '<p>T&ecirc;n sản phẩm: Card m&agrave;n h&igrave;nh Asus Rog Strix GeForce RTX 2080 Ti OC edition 11GB GDDR6 (ROG-STRIX-RTX2080TI-O11G-GAMING)</p>\r\n\r\n<p>- Chip đ&ocirc;̀ họa: NVIDIA GeForce RTX 2080Ti<br />\r\n- B&ocirc;̣ nhớ: 11GB GDDR6 ( 352-bit )<br />\r\n- GPU clock OC Mode - GPU Boost Clock : 1665 MHz , GPU Base Clock : 1350 MHz Gaming Mode (Default) - GPU Boost Clock : 1650 MHz , GPU Base Clock : 1350 MHz<br />\r\n- Nguồn phụ: 2 x 8-pin</p>', NULL, NULL, NULL, 43300000, NULL, 'slide1.jpg', NULL, 1, '', '2020-02-13 03:51:54', '2020-02-13 03:51:54'),
(139, 'RAM desktop KINGSTON Fury Black (1 x 8GB) DDR4 2666MHz ()', 22, 40, NULL, '<p>T&ecirc;n sản phẩm: Bộ nhớ DDR4 Kingston HyperX Fury Black 8GB (2666) (HX426C16FB3/8)</p>\r\n\r\n<p>Dung lượng: 1 x 8GB<br />\r\nThế hệ: DDR4<br />\r\nBus: 2666MHz<br />\r\nCas: 16</p>', NULL, NULL, NULL, 1290000, 990000, '1571193859.3729177_Kingston_HyperX_Fury_Black_1.jpg', NULL, 1, '', '2020-03-14 15:37:34', '2020-03-14 15:37:34'),
(140, 'Nguồn máy tính FSP Hyper K 500 - 500W - 80 Plus White1', 22, 42, NULL, '<p>500W</p>\r\n\r\n<p>S&ocirc;́ c&ocirc;̉ng cắm</p>\r\n\r\n<p>1 x 24-pin Main, 1 x 8-pin (4+4) EPS, 2 x 8-pin (6+2) PCIE, 6 x SATA, 1 x FDD (4-pin), 3 x Peripheral (4-pin)</p>\r\n\r\n<p>Hi&ecirc;̣u su&acirc;́t</p>\r\n\r\n<p>80 Plus White</p>\r\n\r\n<p>Quạt làm mát</p>\r\n\r\n<p>1 x 120 mm</p>\r\n\r\n<p>Ngu&ocirc;̀n đ&acirc;̀u vào</p>\r\n\r\n<p>200 - 240VAC</p>', NULL, NULL, NULL, 1290000, NULL, 'xiaomi-mi-2s-10000mah-bac-1.jpg', NULL, 0, '', '2020-03-14 15:44:36', '2020-03-29 15:23:57'),
(141, 'RAM desktop KINGSTON Fury Black (1 x 8GB) DDR4 2666MHz (22)', 22, 40, NULL, '<p>- Dung lượng: 1 x 8GB<br />\r\n- Thế hệ: DDR4<br />\r\n- Bus: 2666MHz<br />\r\n- Cas: 16<br />\r\nRAM desktop KINGSTON Fury Black (1 x 8GB) DDR4 2666MHz ()<br />\r\nSKU: 191004366</p>\r\n\r\n<p><br />\r\n&nbsp;</p>', NULL, NULL, NULL, 12000000, 9000000, '2222.jpg', NULL, 1, '', '2020-03-29 15:27:53', '2020-03-29 15:33:47'),
(142, 'Case máy tính Aerocool P7-C0 Pro', 22, 43, NULL, '<p>M&ocirc; tả</p>\r\n\r\n<p>T&ecirc;n sản phẩm: Th&ugrave;ng m&aacute;y/ Case Aerocool P7-C0 Pro</p>\r\n\r\n<p>- Loại case: Mid Tower<br />\r\n- H&ocirc;̃ trợ mainboard: ATX; Micro-ATX; Mini-ITX<br />\r\n- Khay mở r&ocirc;̣ng tối đa: 2 x 3.5&quot; , 2 x 2.5&quot;<br />\r\n- Cổng USB: 2 x USB 3.0<br />\r\n- S&ocirc;́ quạt tặng kèm: 1 x 120 mm; 3 x 120mm LED</p>', '<div class=\"attribute-content\">\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Thương hiệu</p>\r\n\r\n<p>AERO</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Bảo h&agrave;nh</p>\r\n\r\n<p>12 th&aacute;ng</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Cấu h&igrave;nh chi tiết</p>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Loại case</p>\r\n\r\n<p>Mid Tower</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Hỗ trợ mainboard</p>\r\n\r\n<p>ATX, Micro-ATX, Mini-ITX</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Số lượng ổ đĩa hỗ trợ</p>\r\n\r\n<p>2 x 3.5&quot; , 2 x 2.5&quot;</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Cổng k&ecirc;́t n&ocirc;́i</p>\r\n\r\n<p>2 x USB 3.0</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Hỗ trợ tản nhiệt CPU cao</p>\r\n\r\n<p>175</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>K&iacute;ch thước radiator tối đa</p>\r\n\r\n<p>360 mm</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Loại quạt hỗ trợ mặt trước</p>\r\n\r\n<p>2 x 140 mm, 3 x 120 mm</p>\r\n</div>\r\n</div>', NULL, NULL, 1898000, NULL, 'case1.jpg', NULL, 1, '', '2020-03-29 15:37:44', '2020-04-05 16:14:07'),
(143, 'Ổ cứng SSD Samsung 860 EVO 2TB 2.5\" (Mz-76E2T0BW)', 22, 45, NULL, '<p>M&ocirc; tả</p>\r\n\r\n<p>T&ecirc;n sản phẩm: Ổ cứng SSD Samsung 860 EVO 2TB 2.5&quot; (Mz-76E2T0BW)</p>\r\n\r\n<p>- Dung lượng: 2TB<br />\r\n- K&iacute;ch thước: 2.5&quot;<br />\r\n- Kết nối: SATA 3<br />\r\n- NAND: V-NAND<br />\r\n- Cache: 2GB<br />\r\n- Tốc độ đọc/ghi (tối đa): 550MB/s | 520MB/s</p>', '<div class=\"attribute-content\">\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Thương hiệu</p>\r\n\r\n<p>SAMSUNG</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Bảo h&agrave;nh</p>\r\n\r\n<p>60 th&aacute;ng</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>M&ocirc; tả bảo h&agrave;nh</p>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Cấu h&igrave;nh chi tiết</p>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Dung lượng</p>\r\n\r\n<p>2TB</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Kích thước</p>\r\n\r\n<p>2.5&quot;</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>K&ecirc;́t n&ocirc;́i</p>\r\n\r\n<p>SATA 3</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>B&ocirc;̣ nhớ NAND</p>\r\n\r\n<p>V-NAND</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Cache</p>\r\n\r\n<p>2GB</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>T&ocirc;́c đ&ocirc;̣ đọc</p>\r\n\r\n<p>550MB/s</p>\r\n</div>\r\n</div>', NULL, NULL, 10600000, NULL, '1572340640.3700545_SSD_Samsung_860_EVO_1.jpg', NULL, 1, '', '2020-04-05 16:19:54', '2020-04-05 16:19:54'),
(144, 'Ổ cứng SSD Kingston 256GB 2.5\" Sata (SKC600/256G)', 22, 45, NULL, '<p>M&ocirc; tả</p>\r\n\r\n<p>T&ecirc;n sản phẩm: Ổ cứng SSD Kingston 256GB 2.5&quot; Sata (SKC600/256G)</p>\r\n\r\n<p>- Dung lượng: 256GB<br />\r\n- K&iacute;ch thước: 2.5&quot;<br />\r\n- Kết nối: SATA 3<br />\r\n- NAND: 3D-NAND<br />\r\n- Tốc độ đọc/ghi (tối đa): 550MB/s | 500MB/s</p>', '<div class=\"attribute-content\">\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Thương hiệu</p>\r\n\r\n<p>KINGSTON</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Bảo h&agrave;nh</p>\r\n\r\n<p>60 th&aacute;ng</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>M&ocirc; tả bảo h&agrave;nh</p>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Cấu h&igrave;nh chi tiết</p>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Dung lượng</p>\r\n\r\n<p>256GB</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>Kích thước</p>\r\n\r\n<p>2.5&quot;</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>K&ecirc;́t n&ocirc;́i</p>\r\n\r\n<p>SATA 3</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>B&ocirc;̣ nhớ NAND</p>\r\n\r\n<p>3D-NAND</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>T&ocirc;́c đ&ocirc;̣ đọc</p>\r\n\r\n<p>550MB/s</p>\r\n</div>\r\n\r\n<div class=\"attribute-item mx20 py10\">\r\n<p>T&ocirc;́c đ&ocirc;̣ ghi</p>\r\n\r\n<p>500MB/s</p>\r\n</div>\r\n</div>', NULL, NULL, 19000000, NULL, '1574043697.0145652_SSD_Kingston_2.5_Sata_SKC600_1.jpg', NULL, 1, '', '2020-04-05 16:25:44', '2020-04-05 16:25:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) UNSIGNED NOT NULL,
  `name_supplier` varchar(250) COLLATE utf8_vietnamese_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8_vietnamese_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_vietnamese_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_vietnamese_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(22, 'Linh kiện máy tính', NULL, NULL, '2020-02-11 03:18:56', '2020-02-11 03:18:56'),
(26, 'Thiết bị mạng - An ninh', NULL, NULL, '2020-02-11 03:20:08', '2020-02-11 03:20:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(3) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `level`, `remember_token`, `created_at`, `updated_at`) VALUES
(17, 'admin1', 'dotuyen1412197@gmail.com', '$2y$10$.sVgfkvjzdmqUDtg4ZbEdu8n8oOvRVH2j3lNlOI7YORTAyjgXvrgi', '0369712385', 'Đội 7- Thôn Năm Mẫu - Xã Tứ Dân', 1, 'thwh4zWXLABk2RdLPaS6FVv67DcWGeQ28hwlUi0NW593O5BerSH51OUyzFbB', '2020-01-11 12:37:00', '2020-01-11 12:37:00'),
(18, 'admin', 'dotuyen016@gmail.com', '$2y$10$OoJeP4NzSkwZVv8qHOGs5OGv/1Isd7oEwZQHIGgoCURsREnNi3vtS', '0369712385', 'Đội 7- Thôn Năm Mẫu - Xã Tứ Dân', 1, 'CqVGpq7M2fICYN86vcGcwCUoJfDeVMV8tYac6LY8LJrVBSDV39fOnWhgYwT7', '2020-02-11 10:02:30', '2020-02-11 10:02:30');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type` (`id_type`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `import_bill`
--
ALTER TABLE `import_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employees` (`id_employees`),
  ADD KEY `id_import_bill_detail` (`id_import_bill_detail`);

--
-- Chỉ mục cho bảng `import_bill_detail`
--
ALTER TABLE `import_bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_type_product` (`id_type_product`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `import_bill`
--
ALTER TABLE `import_bill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `import_bill_detail`
--
ALTER TABLE `import_bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
