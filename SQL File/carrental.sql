-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2024 at 09:16 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '5c428d8875d2948607f3e3fe134d71b4', '2017-06-18 12:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `id` int(11) NOT NULL,
  `BookingNumber` bigint(12) DEFAULT NULL,
  `userEmail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VehicleId` int(11) DEFAULT NULL,
  `FromDate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ToDate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`id`, `BookingNumber`, `userEmail`, `VehicleId`, `FromDate`, `ToDate`, `message`, `Status`, `PostingDate`, `LastUpdationDate`) VALUES
(1, 123456789, 'test@gmail.com', 1, '2023-07-07', '2023-07-09', 'What  is the cost?', 1, '2023-12-14 14:03:09', '2023-12-08 08:24:09'),
(2, 987456321, 'test@gmail.com', 4, '2023-11-19', '2023-11-24', 'hfghg', 1, '2023-11-30 17:49:21', '2023-12-02 12:20:57'),
(3, 299672584, 'test@gmail.com', 1, '2023-12-12', '2023-12-28', 'ok', 1, '2023-12-02 17:33:46', '2023-12-08 08:24:18'),
(4, 867072983, 'test@gmail.com', 11, '2023-12-06', '2023-12-10', 'Toi se xem xe', 1, '2023-12-05 13:26:18', '2023-12-08 08:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `tblbrands`
--

CREATE TABLE `tblbrands` (
  `id` int(11) NOT NULL,
  `BrandName` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbrands`
--

INSERT INTO `tblbrands` (`id`, `BrandName`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Maruti', '2023-12-03 09:37:21', '2023-12-04 06:42:23'),
(2, 'BMW', '2023-12-01 16:24:50', NULL),
(3, 'Audi', '2023-12-01 16:25:03', NULL),
(4, 'Nissan', '2023-12-01 16:25:13', NULL),
(5, 'Toyota', '2023-12-01 16:25:24', NULL),
(9, 'Mercedes-Benz', '2023-12-05 15:25:34', NULL),
(10, 'Hyundai', '2023-12-05 15:26:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ContactNo` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, '218 Lĩnh Nam , Hoàng Mai, Hà Nội', 'ttvcar@gmail.com', '0999888666');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailId` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ContactNumber` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusquery`
--

INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(1, 'Kunal ', 'kunal@gmail.com', '7977779798', 'I want to know you brach in Chandigarh?', '2020-07-07 09:34:51', 1),
(2, 'Lê Đình Khánh Quân', 'kquan2846@gmail.com', '0359508036', 'Sp', '2023-12-08 09:07:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(1, 'Điều khoản sử dụng', 'terms', '\r\n<p style=\"text-align: left;\">Xin chào và chào mừng bạn đến với trang web bán ô tô <Strong>TTV- Car</strong> của chúng tôi. Việc sử dụng trang web này có nghĩa là bạn chấp nhận và tuân theo các Điều khoản Sử dụng sau đây. Hãy đọc kỹ trước khi tiếp tục sử dụng trang web.</p>\r\n<section>\r\n        <li style=\"text-align: left;\"><h3>Thông tin Trang web:</h3></li>\r\n        <p style=\"text-align: left;\">Trang web này cung cấp thông tin chi tiết về các mẫu xe ô tô, giá cả, thông số kỹ thuật và các dịch vụ liên quan đến việc mua bán ô tô.</p>\r\n        <p style=\"text-align: left;\">Mọi thông tin và mô tả về sản phẩm đều chỉ mang tính chất tham khảo. Chúng tôi không chịu trách nhiệm đối với sự chênh lệch thông tin từ nhà sản xuất hoặc nguồn cung cấp khác.</p>\r\n    </section>\r\n\r\n    <section>\r\n        <li style=\"text-align: left;\"><h3>Tài khoản người dùng:</h3></li>\r\n        <p style=\"text-align: left;\">Để sử dụng một số tính năng trên trang web, bạn có thể cần phải tạo một tài khoản người dùng.</p>\r\n        <p style=\"text-align: left;\">Bạn phải cung cấp thông tin chính xác và không vi phạm bản quyền khi đăng ký tài khoản.</p>\r\n    </section>\r\n\r\n    <section>\r\n        <li style=\"text-align: left;\"><h3>Bảo mật thông tin:</h3></li>\r\n        <p style=\"text-align: left;\">Chúng tôi cam kết bảo vệ thông tin cá nhân của bạn và sử dụng nó theo Chính sách Bảo mật của chúng tôi.</p>\r\n        <p style=\"text-align: left;\">Việc sử dụng thông tin cá nhân của bạn sẽ tuân theo quy định pháp luật hiện hành.</p>\r\n    </section>\r\n\r\n    <section>\r\n        <li style=\"text-align: left;\"><h3>Chấp nhận sử dụng:</h3></li>\r\n        <p style=\"text-align: left;\">Bằng việc sử dụng trang web này, bạn đồng ý rằng bạn sẽ không sử dụng nó cho bất kỳ mục đích bất hợp pháp hoặc gây phiền hà cho người khác.</p>\r\n        <p style=\"text-align: left;\">Bạn chấp nhận không vi phạm bất kỳ quy định nào trong Điều khoản Sử dụng này.</p>\r\n    </section>\r\n\r\n    <section>\r\n        <li style=\"text-align: left;\"><h3>Thay đổi và Cập nhật:</h3></li>\r\n        <p style=\"text-align: left;\">Chúng tôi có quyền thay đổi hoặc cập nhật Điều khoản Sử dụng mà không cần thông báo trước.</p>\r\n        <p style=\"text-align: left;\">Việc tiếp tục sử dụng trang web sau khi thay đổi có nghĩa là bạn chấp nhận những thay đổi đó.</p>\r\n    </section>\r\n\r\n    <section>\r\n        <li style=\"text-align: left;\"><h3>Liên hệ:</h3></li>\r\n        <p style=\"text-align: left;\">Nếu bạn có bất kỳ câu hỏi hoặc yêu cầu gì về Điều khoản Sử dụng này, vui lòng liên hệ với chúng tôi theo thông tin liên hệ được cung cấp trên trang web.</p>\r\n    </section>'),
(2, 'Về chúng tôi', 'aboutus', '<section>\r\n        <h3 style=\"text-align: left;\">1.Giới thiệu về chúng tôi</h3>\r\n        <p style=\"text-align: left;\"><strong>TTV -Car</strong> chuyên cung cấp các dịch vụ mua bán ô tô, đem đến cho khách hàng những trải nghiệm mua sắm ô tô tuyệt vời nhất.</p>\r\n        <p style=\"text-align: left;\">Chúng tôi có một đội ngũ nhân viên chuyên nghiệp và giàu kinh nghiệm, luôn sẵn lòng hỗ trợ và tư vấn cho khách hàng.</p>\r\n    </section>\r\n\r\n    <section>\r\n        <h3 style=\"text-align: left;\">2.Sứ mệnh của chúng tôi</h3>\r\n        <p style=\"text-align: left;\">Sứ mệnh của chúng tôi là mang đến cho khách hàng những sản phẩm ô tô chất lượng cao, phục vụ chu đáo và giải pháp phù hợp nhất cho nhu cầu di chuyển của họ.</p>\r\n    </section>\r\n\r\n    <section>\r\n        <h3 style=\"text-align: left;\">3.Chúng tôi cam kết:</h3>\r\n        <p style=\"text-align: left;\">- Cung cấp những dịch vụ uy tín, chất lượng cao nhất.</p>\r\n        <p style=\"text-align: left;\">- Đảm bảo sự hài lòng và tin tưởng của khách hàng.</p>\r\n        <p style=\"text-align: left;\">- Tạo dựng mối quan hệ lâu dài và bền vững với khách hàng.</p>\r\n    </section>\r\n\r\n   '),
(3, 'Câu hỏi thường gặp', 'faqs', '<section>\r\n        <h4 style=\"text-align: left;\">Câu hỏi 1: <strong>TTV - Car</strong> cung cấp những dòng xe nào?</h4>\r\n        <p style=\"text-align: left;\">Chúng tôi cung cấp đa dạng các dòng xe ô tô từ các nhà sản xuất uy tín trên thị trường.</p>\r\n    </section>\r\n\r\n    <section>\r\n        <h4 style=\"text-align: left;\">Câu hỏi 2: Làm thế nào để mua một chiếc xe tại <strong>TTV - Car</strong>?</h4>\r\n        <p style=\"text-align: left;\">Quý khách có thể liên hệ trực tiếp với chúng tôi qua điện thoại hoặc ghé thăm showroom hoặc có thể đặt lich hẹn trực tiếp trên website của chúng tôi để được tư vấn và mua xe.</p>\r\n    </section>\r\n\r\n    <section>\r\n        <h4 style=\"text-align: left;\">Câu hỏi 3: Chính sách bảo hành của<strong> TTV - Car</strong> như thế nào?</h4>\r\n        <p style=\"text-align: left;\">Chúng tôi cam kết cung cấp chính sách bảo hành toàn diện cho các sản phẩm ô tô bán ra, với các điều khoản và điều kiện cụ thể. Vui lòng liên hệ với chúng tôi để biết thêm thông tin chi tiết.</p>\r\n    </section>\r\n\r\n    <section>\r\n        <h4 style=\"text-align: left;\">Câu hỏi 4: Làm thế nào để liên hệ với<strong> TTV - Car</strong>?</h4>\r\n        <p style=\"text-align: left;\">Bạn có thể gọi điện, gửi email qua website hoặc ghé thăm trực tiếp văn phòng hoặc showroom của chúng tôi. Thông tin liên hệ được cung cấp ở phần cuối trang.</p>\r\n    </section>\r\n<section>\r\n        <p style=\"text-align: left;\">Liên hệ: <strong>TTV - Car</strong> - Địa chỉ: Hoàng Mai - Hà Nội</p>\r\n    </section>'),
(4, 'Quyền riêng tư và chính sách', 'privacy', '<section>\r\n        <h4 style=\"text-align: left;\">Thông tin Thu thập</h4>\r\n        <p style=\"text-align: left;\">Chúng tôi có thể thu thập thông tin cá nhân từ bạn khi bạn tương tác với trang web của chúng tôi, bao gồm thông tin đăng ký, thông tin liên hệ và thông tin về hoạt động trên trang web.</p>\r\n    </section>\r\n\r\n    <section>\r\n        <h4 style=\"text-align: left;\">Đối tượng Sử dụng:</h4>\r\n        <p style=\"text-align: left;\">Thông tin cá nhân thu thập được có thể được sử dụng để cung cấp dịch vụ, cá nhân hóa trải nghiệm của bạn, cải thiện trang web của chúng tôi và liên hệ với bạn theo yêu cầu của bạn.</p>\r\n    </section>\r\n\r\n    <section>\r\n        <h4 style=\"text-align: left;\">Bảo mật thông tin:</h4>\r\n        <p style=\"text-align: left;\">Chúng tôi cam kết bảo vệ thông tin cá nhân của bạn và sử dụng các biện pháp bảo mật phù hợp để ngăn chặn truy cập trái phép hoặc sử dụng không đúng mục đích.</p>\r\n    </section>\r\n\r\n    <section>\r\n        <h4 style=\"text-align: left;\">Chia sẻ thông tin:</>\r\n        <p style=\"text-align: left;\">Chúng tôi không chia sẻ thông tin cá nhân của bạn với bên thứ ba mà không có sự đồng ý của bạn, trừ khi cần thiết để cung cấp dịch vụ hoặc tuân theo luật pháp.</p>\r\n    </section>');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscribers`
--

CREATE TABLE `tblsubscribers` (
  `id` int(11) NOT NULL,
  `SubscriberEmail` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubscribers`
--

INSERT INTO `tblsubscribers` (`id`, `SubscriberEmail`, `PostingDate`) VALUES
(7, 'thanhtunga4k57@gmail.com', '2023-12-06 19:17:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbltestimonial`
--

CREATE TABLE `tbltestimonial` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Testimonial` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltestimonial`
--

INSERT INTO `tbltestimonial` (`id`, `UserEmail`, `Testimonial`, `PostingDate`, `status`) VALUES
(1, 'test@gmail.com', 'I am satisfied with their service great job', '2020-07-07 14:30:12', 1),
(2, 'test@gmail.com', 'he he', '2023-11-23 12:33:07', 0),
(3, 'test@gmail.com', 'l?u l?u', '2023-11-23 13:03:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `EmailId` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ContactNo` char(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `City` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Country` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `dob`, `Address`, `City`, `Country`, `RegDate`, `UpdationDate`) VALUES
(2, 'Test', 'Test@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2342424234', NULL, NULL, NULL, NULL, '2023-12-02 17:32:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblvehicles`
--

CREATE TABLE `tblvehicles` (
  `id` int(11) NOT NULL,
  `VehiclesTitle` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VehiclesBrand` int(11) DEFAULT NULL,
  `VehiclesOverview` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PricePerDay` int(11) DEFAULT NULL,
  `FuelType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ModelYear` int(6) DEFAULT NULL,
  `SeatingCapacity` int(11) DEFAULT NULL,
  `Vimage1` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Vimage2` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Vimage3` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Vimage4` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Vimage5` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AirConditioner` int(11) DEFAULT NULL,
  `PowerDoorLocks` int(11) DEFAULT NULL,
  `AntiLockBrakingSystem` int(11) DEFAULT NULL,
  `BrakeAssist` int(11) DEFAULT NULL,
  `PowerSteering` int(11) DEFAULT NULL,
  `DriverAirbag` int(11) DEFAULT NULL,
  `PassengerAirbag` int(11) DEFAULT NULL,
  `PowerWindows` int(11) DEFAULT NULL,
  `CDPlayer` int(11) DEFAULT NULL,
  `CentralLocking` int(11) DEFAULT NULL,
  `CrashSensor` int(11) DEFAULT NULL,
  `LeatherSeats` int(11) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvehicles`
--

INSERT INTO `tblvehicles` (`id`, `VehiclesTitle`, `VehiclesBrand`, `VehiclesOverview`, `PricePerDay`, `FuelType`, `ModelYear`, `SeatingCapacity`, `Vimage1`, `Vimage2`, `Vimage3`, `Vimage4`, `Vimage5`, `AirConditioner`, `PowerDoorLocks`, `AntiLockBrakingSystem`, `BrakeAssist`, `PowerSteering`, `DriverAirbag`, `PassengerAirbag`, `PowerWindows`, `CDPlayer`, `CentralLocking`, `CrashSensor`, `LeatherSeats`, `RegDate`, `UpdationDate`) VALUES
(1, 'Maruti Suzuki Wagon R', 1, '\r\nMaruti Suzuki Wagon R là một mẫu xe cỡ nhỏ (city car) được sản xuất và phân phối bởi Suzuki thông qua công ty con Maruti Suzuki, chủ yếu cho thị trường Ấn Độ. Xe được giới thiệu lần đầu tiên vào năm 1993 và đã trở thành một trong những mẫu xe bán chạy nhất ở Ấn Độ, cũng như ở một số quốc gia khác như Indonesia, Pakistan, Bangladesh và Việt Nam.\r\n\r\nWagon R có thiết kế nhỏ gọn, cao ráo, với những đường nét vuông vức, khỏe khoắn. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 3.655 x 1.625 x 1.640 mm, chiều dài cơ sở 2.435 mm. Nhờ thiết kế cao ráo, Wagon R có không gian nội thất rộng rãi, thoải mái cho cả người lái và hành khách.\r\n\r\nWagon R được trang bị động cơ xăng K10B 1.0L hoặc K12M 1.2L, đi kèm hộp số sàn 5 cấp hoặc hộp số tự động AMT. Động cơ cho công suất tối đa 68 mã lực và mô-men xoắn cực đại 90 Nm.\r\n\r\nWagon R được trang bị những tính năng an toàn cơ bản như hệ thống chống bó cứng phanh (ABS), phân phối lực phanh điện tử (EBD), túi khí cho người lái và hành khách phía trước.\r\n\r\nTại Việt Nam, Wagon R được phân phối với 4 phiên bản, giá bán dao động từ 554 triệu đến 742 triệu đồng.\r\n\r\n+ Ưu điểm của Maruti Suzuki Wagon R:\r\n\r\n- Thiết kế nhỏ gọn, cao ráo, không gian nội thất rộng rãi\r\n- Động cơ tiết kiệm nhiên liệu\r\n- Giá bán hợp lý\r\n', 136000000, 'Xăng', 2019, 5, 'rear-3-4-left-589823254_930x620.jpg', 'tail-lamp-1666712219_930x620.jpg', 'rear-3-4-right-520328200_930x620.jpg', 'steering-close-up-1288209207_930x620.jpg', 'boot-with-standard-luggage-202327489_930x620.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2020-07-07 07:04:35', '2023-12-03 10:16:05'),
(2, 'BMW 5 Series', 2, 'BMW 5 Series là một mẫu sedan hạng sang cỡ trung được sản xuất bởi BMW từ năm 1972. Đây là một trong những mẫu xe bán chạy nhất của BMW, và được coi là đối thủ cạnh tranh của các mẫu xe như Mercedes-Benz E-Class, Audi A6 và Jaguar XF.\r\n\r\nThế hệ thứ 7 của BMW 5 Series, được gọi là G30, được ra mắt vào năm 2019. Xe có thiết kế hiện đại, sang trọng với những đường nét sắc sảo, tinh tế. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.936 x 1.868 x 1.479 mm, chiều dài cơ sở 2.975 mm. \r\nBMW 5 Series được trang bị nhiều động cơ khác nhau, bao gồm động cơ xăng, động cơ diesel và động cơ hybrid. Động cơ xăng có dung tích từ 2.0L đến 4.4L, cho công suất từ 184 mã lực đến 625 mã lực. Động cơ diesel có dung tích từ 2.0L đến 3.0L, cho công suất từ 184 mã lực đến 340 mã lực. Động cơ hybrid có dung tích 2.0L, cho công suất kết hợp 292 mã lực.\r\n\r\nBMW 5 Series được trang bị nhiều tính năng an toàn và tiện nghi hiện đại, bao gồm:\r\n\r\nHệ thống chống bó cứng phanh (ABS),\r\nHệ thống phân phối lực phanh điện tử (EBD),\r\nHệ thống cân bằng điện tử (ESP),\r\nHệ thống hỗ trợ khởi hành ngang dốc (HSA),\r\nHệ thống kiểm soát hành trình (Cruise Control),\r\nHệ thống cảnh báo điểm mù (BSM),\r\nHệ thống cảnh báo va chạm phía trước (FCW),\r\nHệ thống hỗ trợ giữ làn đường (LDW),\r\nHệ thống camera 360 độ,\r\nHệ thống âm thanh Harman Kardon,\r\nHệ thống thông tin giải trí iDrive 7.0,', 2105000000, 'Xăng', 2018, 5, 'BMW-5-Series-Exterior-102005.jpg', 'BMW-5-Series-New-Exterior-89729.jpg', 'BMW-5-Series-Exterior-102006.jpg', 'BMW-5-Series-Interior-102021.jpg', 'BMW-5-Series-Interior-102022.jpg', 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, '2020-07-07 07:12:02', '2023-12-03 10:19:45'),
(3, 'Audi Q8', 3, 'Audi Q8 là một mẫu SUV hạng sang cỡ lớn được sản xuất bởi Audi từ năm 2018. Đây là mẫu xe cao cấp nhất trong dòng Q của Audi, và được coi là đối thủ cạnh tranh của các mẫu xe như BMW X6, Mercedes-Benz GLE Coupe và Porsche Cayenne Coupe. \r\nQ8 có thiết kế sang trọng, thể thao với những đường nét sắc sảo, tinh tế. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.986 x 1.995 x 1.705 mm, chiều dài cơ sở 2.995 mm.\r\n\r\nQ8 được trang bị động cơ xăng V6 3.0L, cho công suất tối đa 340 mã lực và mô-men xoắn cực đại 500 Nm. Động cơ kết hợp với hộp số tự động 8 cấp Tiptronic, cho khả năng tăng tốc từ 0-100 km/h trong 5,6 giây.\r\n\r\nQ8 được trang bị nhiều tính năng an toàn và tiện nghi hiện đại, bao gồm:\r\n\r\nHệ thống chống bó cứng phanh (ABS),\r\nHệ thống phân phối lực phanh điện tử (EBD),\r\nHệ thống cân bằng điện tử (ESP),\r\nHệ thống hỗ trợ khởi hành ngang dốc (HSA),\r\nHệ thống kiểm soát hành trình (Cruise Control),\r\nHệ thống cảnh báo điểm mù (BSM),\r\nHệ thống cảnh báo va chạm phía trước (FCW),\r\nHệ thống hỗ trợ giữ làn đường (LDW),\r\nHệ thống camera 360 độ,,\r\nHệ thống âm thanh Bang & Olufsen,\r\nHệ thống thông tin giải trí MMI Touch Response,', 1987450000, 'Xăng', 2018, 5, 'audi-q8-front-view4.jpg', '1920x1080_MTC_XL_framed_Audi-Odessa-Armaturen_Spiegelung_CC_v05.jpg', 'audi1.jpg', '1audiq8.jpg', 'audi-q8-front-view4.jpeg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2020-07-07 07:19:21', '2023-12-03 10:24:39'),
(4, 'Nissan Kicks', 4, 'Nissan Kicks là một mẫu SUV đô thị được sản xuất bởi Nissan từ năm 2016. Đây là mẫu xe được phát triển dựa trên nền tảng của mẫu hatchback Nissan Micra, và được coi là đối thủ cạnh tranh của các mẫu xe như Honda HR-V, Toyota Corolla Cross và Hyundai Kona. \r\nKicks có thiết kế trẻ trung, năng động với những đường nét góc cạnh, mạnh mẽ. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.295 x 1.760 x 1.595 mm, chiều dài cơ sở 2.620 mm.\r\n\r\nKicks được trang bị động cơ xăng 1.5L, cho công suất tối đa 129 mã lực và mô-men xoắn cực đại 177 Nm. Động cơ kết hợp với hộp số tự động vô cấp CVT, cho khả năng tăng tốc từ 0-100 km/h trong 9,9 giây.\r\n\r\nKicks được trang bị những tính năng an toàn và tiện nghi hiện đại, bao gồm:\r\n\r\nHệ thống chống bó cứng phanh (ABS),\r\nHệ thống phân phối lực phanh điện tử (EBD),\r\nHệ thống cân bằng điện tử (ESP),\r\nHệ thống hỗ trợ khởi hành ngang dốc (HSA),\r\nHệ thống kiểm soát hành trình (Cruise Control),\r\nHệ thống cảnh báo điểm mù (BSM),\r\nHệ thống cảnh báo va chạm phía trước (FCW),\r\nHệ thống hỗ trợ giữ làn đường (LDW),\r\nHệ thống camera 360 độ,\r\nHệ thống âm thanh 6 loa,\r\nHệ thống thông tin giải trí NissanConnect 8 inch,\r\n\r\nNissan Kicks là một mẫu SUV đô thị được sản xuất bởi Nissan từ năm 2016. Đây là mẫu xe được phát triển dựa trên nền tảng của mẫu hatchback Nissan Micra, và được coi là đối thủ cạnh tranh của các mẫu xe như Honda HR-V, Toyota Corolla Cross và Hyundai Kona. \r\nImage of Nissan Kicks 2023Mở trong cửa sổ mới\r\nwww.nissan.com.mx\r\nNissan Kicks 2023\r\n\r\nKicks có thiết kế trẻ trung, năng động với những đường nét góc cạnh, mạnh mẽ. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.295 x 1.760 x 1.595 mm, chiều dài cơ sở 2.620 mm.\r\n\r\nKicks được trang bị động cơ xăng 1.5L, cho công suất tối đa 129 mã lực và mô-men xoắn cực đại 177 Nm. Động cơ kết hợp với hộp số tự động vô cấp CVT, cho khả năng tăng tốc từ 0-100 km/h trong 9,9 giây.\r\n\r\nKicks được trang bị những tính năng an toàn và tiện nghi hiện đại, bao gồm:\r\n\r\nHệ thống chống bó cứng phanh (ABS)\r\nHệ thống phân phối lực phanh điện tử (EBD)\r\nHệ thống cân bằng điện tử (ESP)\r\nHệ thống hỗ trợ khởi hành ngang dốc (HSA)\r\nHệ thống kiểm soát hành trình (Cruise Control)\r\nHệ thống cảnh báo điểm mù (BSM)\r\nHệ thống cảnh báo va chạm phía trước (FCW)\r\nHệ thống hỗ trợ giữ làn đường (LDW)\r\nHệ thống camera 360 độ\r\nHệ thống âm thanh 6 loa\r\nHệ thống thông tin giải trí NissanConnect 8 inch\r\nTại Việt Nam, Nissan Kicks được phân phối với 3 phiên bản, giá bán dao động từ 689 triệu đến 789 triệu đồng.\r\n\r\n+ Ưu điểm của Nissan Kicks:\r\n\r\nThiết kế trẻ trung, năng động,\r\nKhả năng vận hành tiết kiệm nhiên liệu,\r\nTrang bị an toàn và tiện nghi hiện đại,', 985765000, 'Xăng', 2020, 5, 'front-left-side-47.jpg', 'kicksmodelimage.jpg', 'download.jpg', 'kicksmodelimage.jpg', '', 1, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, '2020-07-07 07:25:28', NULL),
(5, 'Nissan GT-R', 4, 'Nissan GT-R là một mẫu xe thể thao hai cửa, hai chỗ ngồi được sản xuất bởi Nissan từ năm 2007. Đây là mẫu xe được phát triển dựa trên nền tảng của mẫu sedan Nissan Skyline, và được coi là đối thủ cạnh tranh của các mẫu xe như Porsche 911, Audi R8 và BMW M4. \r\nGT-R có thiết kế thể thao, mạnh mẽ với những đường nét sắc sảo, cá tính. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.704 x 1.895 x 1.370 mm, chiều dài cơ sở 2.780 mm.\r\n\r\nGT-R được trang bị động cơ xăng V6 3.8L, tăng áp kép, cho công suất tối đa 565 mã lực và mô-men xoắn cực đại 632 Nm. Động cơ kết hợp với hộp số tự động 6 cấp, cho khả năng tăng tốc từ 0-100 km/h trong 2,7 giây.\r\n+ Ưu điểm của Nissan GT-R:\r\n\r\nThiết kế thể thao, mạnh mẽ,\r\nKhả năng vận hành mạnh mẽ, ấn tượng,\r\nTrang bị an toàn và tiện nghi hiện đại,', 1678950000, 'Xăng', 2019, 5, 'Nissan-GTR-Right-Front-Three-Quarter-84895.jpg', 'Best-Nissan-Cars-in-India-New-and-Used-1.jpg', '2bb3bc938e734f462e45ed83be05165d.jpg', '2020-nissan-gtr-rakuda-tan-semi-aniline-leather-interior.jpg', 'nissan_gtr.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2020-07-07 07:34:17', '2023-12-05 12:10:44'),
(6, 'Nissan Sunny 2020', 4, 'Nissan Sunny 2020 là một mẫu xe sedan hạng B được sản xuất bởi Nissan. Đây là thế hệ thứ 12 của mẫu xe này, và được ra mắt lần đầu tiên vào năm 2017.\r\n\r\nNissan Sunny 2020 là một mẫu xe sedan hạng B được sản xuất bởi Nissan. Đây là thế hệ thứ 12 của mẫu xe này, và được ra mắt lần đầu tiên vào năm 2017.\r\nNissan Sunny 2020 có thiết kế hiện đại, trẻ trung với những đường nét tinh tế, uyển chuyển. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.495 x 1.740 x 1.500 mm, chiều dài cơ sở 2.620 mm.\r\n\r\nNissan Sunny 2020 được trang bị động cơ xăng 1.5L, cho công suất tối đa 107 mã lực và mô-men xoắn cực đại 138 Nm. Động cơ kết hợp với hộp số sàn 5 cấp hoặc hộp số tự động vô cấp CVT.\r\n+ Ưu điểm của Nissan Sunny 2020:\r\n\r\nThiết kế hiện đại, trẻ trung,\r\nKhả năng vận hành tiết kiệm nhiên liệu,\r\nTrang bị an toàn và tiện nghi hiện đại', 780990000, 'CNG', 2018, 5, 'Nissan-Sunny-Right-Front-Three-Quarter-48975_ol.jpg', 'images (1).jpg', 'Nissan-Sunny-Interior-114977.jpg', 'nissan-sunny-8a29f53-500x375.jpg', 'new-nissan-sunny-photo.jpg', 1, 1, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2020-07-07 09:12:49', NULL),
(7, 'Toyota Fortuner', 5, 'Toyota Fortuner là một mẫu xe SUV 7 chỗ cỡ trung được sản xuất bởi Toyota. Đây là mẫu xe được phát triển dựa trên nền tảng của mẫu bán tải Hilux, và được coi là đối thủ cạnh tranh của các mẫu xe như Ford Everest, Mitsubishi Pajero Sport và Mazda CX-8.\r\nFortuner có thiết kế mạnh mẽ, nam tính với những đường nét vuông vức, khỏe khoắn. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.795 x 1.855 x 1.835 mm, chiều dài cơ sở 2.745 mm.\r\n\r\nFortuner được trang bị động cơ diesel 2.8L, cho công suất tối đa 201 mã lực và mô-men xoắn cực đại 500 Nm. Động cơ kết hợp với hộp số tự động 6 cấp, cho khả năng tăng tốc từ 0-100 km/h trong 9,6 giây.\r\n+ Ưu điểm của Toyota Fortuner:\r\n\r\nThiết kế mạnh mẽ, nam tính.\r\nKhả năng vận hành mạnh mẽ bền bỉ,\r\nTrang bị an toàn và tiện nghi hiện đại.', 1450000000, 'Diesel', 2020, 5, '2015_Toyota_Fortuner_(New_Zealand).jpg', 'toyota-fortuner-legender-rear-quarters-6e57.jpg', 'zw-toyota-fortuner-2020-2.jpg', 'download (1).jpg', '', NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, 1, 1, 1, '2020-07-07 09:17:46', NULL),
(8, 'Maruti Suzuki Vitara Brezza', 1, 'Maruti Suzuki Vitara Brezza là một mẫu SUV cỡ nhỏ được sản xuất bởi Maruti Suzuki. Đây là mẫu xe được phát triển dựa trên nền tảng của mẫu hatchback Maruti Suzuki Baleno, và được coi là đối thủ cạnh tranh của các mẫu xe như Hyundai Creta, Kia Sonet và Nissan Magnite.\r\nVitara Brezza có thiết kế trẻ trung, năng động với những đường nét góc cạnh, mạnh mẽ. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 3.995 x 1.790 x 1.640 mm, chiều dài cơ sở 2.500 mm.\r\n\r\nVitara Brezza được trang bị động cơ xăng 1.5L, cho công suất tối đa 105 mã lực và mô-men xoắn cực đại 138 Nm. Động cơ kết hợp với hộp số sàn 5 cấp hoặc hộp số tự động vô cấp CVT.\r\n+ Ưu điểm của Maruti Suzuki Vitara Brezza:\r\n\r\nThiết kế trẻ trung, năng động,\r\nKhả năng vận hành tiết kiệm nhiên liệu,\r\nTrang bị an toàn và tiện nghi hiện đại.', 950000000, 'Xăng', 2018, 5, 'marutisuzuki-vitara-brezza-right-front-three-quarter3.jpg', 'marutisuzuki-vitara-brezza-rear-view37.jpg', 'marutisuzuki-vitara-brezza-dashboard10.jpg', '', 'marutisuzuki-vitara-brezza-boot-space28.jpg', NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, '2020-07-07 09:23:11', '2023-12-03 10:42:05'),
(9, 'Audi A4', 3, 'Audi A4 là một mẫu sedan hạng sang cỡ trung được sản xuất bởi Audi AG, một công ty ô tô của Đức. A4 được ra mắt lần đầu tiên vào năm 1994 và đã trải qua 8 thế hệ. A4 là một trong những mẫu xe bán chạy nhất của Audi, với hơn 10 triệu chiếc được bán ra trên toàn thế giới.Audi A4 có thiết kế sang trọng, tinh tế, mang đậm phong cách của Audi. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4726 x 1847 x 1427 mm, chiều dài cơ sở 2820 mm.\r\n\r\nPhần đầu xe nổi bật với lưới tản nhiệt hình lục giác đặc trưng của Audi, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình chữ L.', 1999850000, 'Xăng', 2020, 5, 'a4a4rightfrontthreequarter.jfif', 'a4a4rightrearthreequarter.jfif', 'a4a4rearview.jfif', 'a4a4rearrowcentrearmrest.jfif', 'a4a4frontview.jfif', 1, 1, 1, 1, 1, NULL, NULL, 1, 1, NULL, 1, 1, '2023-12-05 12:25:12', '2023-12-05 12:28:57'),
(10, 'Audi Q3', 3, '\r\nAudi Q3 là một mẫu SUV hạng sang cỡ nhỏ được sản xuất bởi Audi AG, một công ty ô tô của Đức. Q3 được ra mắt lần đầu tiên vào năm 2011 và đã trải qua 2 thế hệ. Q3 là một trong những mẫu xe bán chạy nhất của Audi, với hơn 1,8 triệu chiếc được bán ra trên toàn thế giới.\r\n\r\nTại Việt Nam, Audi Q3 được phân phối chính hãng với 2 phiên bản: Q3 35 TFSI và Q3 35 TDI.Audi Q3 có thiết kế sang trọng, trẻ trung, mang đậm phong cách của Audi. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.484 x 1.849 x 1.576 mm, chiều dài cơ sở 2.680 mm. ', 1920000000, 'Xăng', 2019, 5, 'q3q3rightfrontthreequarter.jfif', 'q3audiq3leftrearthreequarter201.jfif', 'q3audiq3leftfrontthreequarter155.jfif', 'q3q3frontrowseats.jfif', 'q3audiq3engineshot130.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, '2023-12-05 13:07:47', NULL),
(11, 'Audi Q5', 3, '\r\nAudi Q5 là một mẫu SUV hạng sang cỡ trung được sản xuất bởi Audi AG, một công ty ô tô của Đức. Q5 được ra mắt lần đầu tiên vào năm 2008 và đã trải qua 3 thế hệ. Q5 là một trong những mẫu xe bán chạy nhất của Audi, với hơn 2,6 triệu chiếc được bán ra trên toàn thế giới.\r\n\r\nTại Việt Nam, Audi Q5 được phân phối chính hãng với 2 phiên bản: Q5 2.0TFSI và Q5 55 TFSI Quattro.Audi Q5 có thiết kế sang trọng, thể thao, mang đậm phong cách của Audi. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.682 x 1.893 x 1.662 mm, chiều dài cơ sở 2.820 mm. Phần đầu xe nổi bật với lưới tản nhiệt hình lục giác đặc trưng của Audi, cùng với cụm đèn pha LED ma trận sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình chữ L.', 1650880000, 'Xăng', 2018, 5, 'q5q5rightfrontthreequarter.jfif', 'q5q5faceliftleftsideview.jfif', 'q5q5faceliftfrontview.jfif', 'q5q5faceliftengineshot.jfif', 'q5audiq5faceliftsteeringwheel.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, '2023-12-05 13:20:44', NULL),
(12, 'BMW X1', 2, 'BMW X1 là một mẫu SUV hạng sang cỡ nhỏ được sản xuất bởi BMW AG, một công ty ô tô của Đức. X1 được ra mắt lần đầu tiên vào năm 2009 và đã trải qua 3 thế hệ. X1 là một trong những mẫu xe bán chạy nhất của BMW, với hơn 1,5 triệu chiếc được bán ra trên toàn thế giới.\r\n\r\nTại Việt Nam, BMW X1 được phân phối chính hãng với 2 phiên bản: xDrive18i và xDrive20i.BMW X1 có thiết kế sang trọng, trẻ trung, mang đậm phong cách của BMW. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.447 x 1.821 x 1.598 mm, chiều dài cơ sở 2.670 mm. Phần đầu xe nổi bật với lưới tản nhiệt hình quả thận đặc trưng của BMW, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình chữ L.', 1780950000, 'Xăng', 2019, 4, 'x1x1rightfrontthreequarter.jfif', 'x1newx1rearseats.jfif', 'x1bmwx1rightsideview6.jfif', 'x1bmwx1rightfrontthreequarter17.jfif', 'x1bmwx1rightfrontthreequarter3.jfif', 1, 1, NULL, 1, 1, 1, 1, 1, 1, 1, NULL, 1, '2023-12-05 14:27:22', NULL),
(13, 'BMW 7 Series', 2, 'BMW 7 Series là một mẫu sedan hạng sang cỡ lớn được sản xuất bởi BMW AG, một công ty ô tô của Đức. 7 Series được ra mắt lần đầu tiên vào năm 1977 và đã trải qua 7 thế hệ. 7 Series là một trong những mẫu xe bán chạy nhất của BMW, với hơn 2 triệu chiếc được bán ra trên toàn thế giới.\r\n\r\nTại Việt Nam, BMW 7 Series được phân phối chính hãng với 3 phiên bản: 730Li, 740Li và 760Li.BMW 7 Series có thiết kế sang trọng, tinh tế, mang đậm phong cách của BMW. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 5.260 x 1.902 x 1.479 mm, chiều dài cơ sở 3.068 mm. Phần đầu xe nổi bật với lưới tản nhiệt hình quả thận đặc trưng của BMW, cùng với cụm đèn pha LED Matrix sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình chữ L.', 1999999999, 'Xăng', 2020, 5, '7seriesnewseriesrightfrontthreequarter.jfif', '7seriesnewseriesrightrearthreequarter.jfif', '7seriesnewseriesrearview.jfif', '7series7seriesrightsideview.png', '7series7seriesrearseats.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-12-05 14:32:25', NULL),
(14, 'BMW  X7', 2, 'BMW X7 là một mẫu SUV hạng sang cỡ lớn được sản xuất bởi BMW AG, một công ty ô tô của Đức. X7 được ra mắt lần đầu tiên vào năm 2018 và đã trải qua 1 thế hệ. X7 là một trong những mẫu xe bán chạy nhất của BMW, với hơn 200.000 chiếc được bán ra trên toàn thế giới.BMW X7 có thiết kế sang trọng, bề thế, mang đậm phong cách của BMW. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 5.151 x 2.000 x 1.805 mm, chiều dài cơ sở 3.105 mm. Phần đầu xe nổi bật với lưới tản nhiệt hình quả thận đặc trưng của BMW, cùng với cụm đèn pha LED Matrix sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình chữ L.', 1920000000, 'Xăng', 2021, 5, 'x7x7rightfrontthreequarter.jfif', 'x7x7faceliftrearview.jfif', 'x7x7faceliftleftrearthreequarter.jfif', 'x7x7faceliftfrontview.jfif', 'x7x7faceliftdashboard.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-12-05 14:47:59', '2023-12-05 14:49:25'),
(15, 'Nissan Magnite', 4, 'Nissan Magnite là một mẫu SUV đô thị cỡ nhỏ được sản xuất bởi Nissan Motor Corporation, một công ty ô tô của Nhật Bản. Magnite được ra mắt lần đầu tiên vào năm 2020 và đã được bán ra tại nhiều quốc gia trên thế giới, bao gồm Việt Nam.\r\n\r\nTại Việt Nam, Nissan Magnite được phân phối chính hãng với 3 phiên bản: MT tiêu chuẩn, CVT tiêu chuẩn và CVT cao cấp.Nissan Magnite có thiết kế trẻ trung, năng động, mang đậm phong cách của Nissan. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.009 x 1.748 x 1.572 mm, chiều dài cơ sở 2.500 mm. Phần đầu xe nổi bật với lưới tản nhiệt V-Motion đặc trưng của Nissan, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình boomerang.', 1780950000, 'Xăng', 2019, 5, 'magnitemagniterightfrontthreequarter.jfif', 'magnitemagniterightrearthreequarter.jfif', 'magnitemagniteleftrearthreequarter.jfif', 'magnitemagnitefrontview.jfif', 'magnitemagnitedashboard.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-12-05 14:57:04', NULL),
(16, 'Toyota Innova Crysta', 5, '\r\nToyota Innova Crysta là một mẫu MPV cỡ trung được sản xuất bởi Toyota Motor Corporation, một công ty ô tô của Nhật Bản. Innova Crysta được ra mắt lần đầu tiên vào năm 2016 và đã được bán ra tại nhiều quốc gia trên thế giới, bao gồm Việt Nam.\r\n\r\nTại Việt Nam, Toyota Innova Crysta được phân phối chính hãng với 2 phiên bản: 2.0G và 2.4G.\r\n\r\nThiết kế\r\n\r\nToyota Innova Crysta có thiết kế sang trọng, lịch lãm, mang đậm phong cách của Toyota. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.735 x 1.830 x 1.795 mm, chiều dài cơ sở 2.750 mm. Phần đầu xe nổi bật với lưới tản nhiệt hình thang đặc trưng của Toyota, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình chữ L.', 1600880000, 'Xăng', 2020, 5, 'innovacrystainnovacrystarightfrontthreequarter.png', 'innovacrystatoyotainnovacrystafrontview.jfif', 'innovacrystainnovacrystathirdrowseats.jfif', 'innovacrystainnovacrystaleftfrontthreequarter.jfif', 'innovacrystainnovacrystafrontview.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, '2023-12-05 15:03:30', NULL),
(17, 'Toyota Urban Cruiser Hyryder', 5, 'Toyota Urban Cruiser Hyryder là một mẫu SUV hạng B được sản xuất bởi Toyota Motor Corporation, một công ty ô tô của Nhật Bản. Hyryder được ra mắt lần đầu tiên vào năm 2022 và đã được bán ra tại nhiều quốc gia trên thế giới, bao gồm Việt Nam.\r\n\r\nTại Việt Nam, Toyota Urban Cruiser Hyryder được phân phối chính hãng với 2 phiên bản: X và V.Toyota Urban Cruiser Hyryder có thiết kế hiện đại, trẻ trung, mang đậm phong cách của Toyota. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.365 x 1.795 x 1.635 mm, chiều dài cơ sở 2.600 mm. Phần đầu xe nổi bật với lưới tản nhiệt hình thang đặc trưng của Toyota, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình chữ L.', 2147000000, 'Xăng', 2021, 5, 'urbancruiserhyryderurbancruiserhyryderrightfrontthreequarter.jfif', 'urbancruiserhyryderurbancruiserhyryderfrontrowseats.jfif', 'urbancruiserhyryderurbancruiserhyryderrearview.jfif', 'urbancruiserhyryderurbancruiserhyryderrightsideview.jfif', 'urbancruiserhyryderurbancruiserhyryderbootspacerearseatfolded.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-12-05 15:11:33', '2023-12-05 15:13:24'),
(18, 'Toyota Land Cruiser', 5, '\r\nToyota Land Cruiser là một mẫu SUV hạng sang cỡ lớn được sản xuất bởi Toyota Motor Corporation, một công ty ô tô của Nhật Bản. Land Cruiser được ra mắt lần đầu tiên vào năm 1951 và đã được bán ra tại nhiều quốc gia trên thế giới, bao gồm Việt Nam.\r\n\r\nTại Việt Nam, Toyota Land Cruiser được phân phối chính hãng với 1 phiên bản: VX.Toyota Land Cruiser có thiết kế sang trọng, mạnh mẽ, mang đậm phong cách của Toyota. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.965 x 1.980 x 1.885 mm, chiều dài cơ sở 2.850 mm. Phần đầu xe nổi bật với lưới tản nhiệt hình thang đặc trưng của Toyota, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình chữ L.', 1999999999, 'Xăng', 2020, 5, 'landcruiserlandcruiserleftfrontthreequarter.jfif', 'landcruiserlandcruiserleftrearthreequarter.jfif', 'landcruiserlandcruiserrightfrontthreequarter.jfif', 'landcruisertoyotalandcruiserfrontrowseats4.jfif', 'landcruisertoyotalandcruiserrearrowaccontrols6.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-12-05 15:20:05', NULL),
(19, 'Maruti Fronx', 1, '\r\nMaruti Fronx là một mẫu SUV đô thị cỡ nhỏ được sản xuất bởi Maruti Suzuki, một công ty ô tô của Ấn Độ. Fronx được ra mắt lần đầu tiên vào năm 2022 và đã được bán ra tại nhiều quốc gia trên thế giới, bao gồm Việt Nam.\r\n\r\nTại Việt Nam, Maruti Fronx được phân phối chính hãng với 2 phiên bản: 1.2L MT và 1.0L Turbo CVT.Maruti Fronx có thiết kế trẻ trung, năng động, mang đậm phong cách của Maruti Suzuki. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.009 x 1.748 x 1.572 mm, chiều dài cơ sở 2.500 mm. Phần đầu xe nổi bật với lưới tản nhiệt hình chữ \"X\" đặc trưng của Maruti Suzuki, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình boomerang.', 1120500000, 'Xăng', 2019, 5, 'fronxfronxrightfrontthreequarter.jfif', 'fronxfronxrightsideview.jfif', 'fronxfronxrightfrontthreequarter (1).jfif', 'fronxfronxrearview.jfif', 'fronxfronxdashboard.jfif', 1, 1, NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, '2023-12-05 15:31:47', NULL),
(20, 'Maruti Swift', 1, 'Maruti Swift là một mẫu hatchback cỡ nhỏ được sản xuất bởi Maruti Suzuki, một công ty ô tô của Ấn Độ. Swift được ra mắt lần đầu tiên vào năm 2005 và đã được bán ra tại nhiều quốc gia trên thế giới, bao gồm Việt Nam.\r\n\r\nTại Việt Nam, Maruti Swift được phân phối chính hãng với 2 phiên bản: 1.2L MT và 1.0L Turbo CVT.Maruti Swift có thiết kế trẻ trung, năng động, mang đậm phong cách của Maruti Suzuki. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 3.845 x 1.735 x 1.495 mm, chiều dài cơ sở 2.450 mm. Phần đầu xe nổi bật với lưới tản nhiệt hình chữ \"U\" đặc trưng của Maruti Suzuki, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình boomerang.', 1099000000, 'Xăng', 2019, 5, 'swiftswiftrightfrontthreequarter.jfif', 'swiftswiftrightfrontthreequarter (1).jfif', 'swiftswiftrightsideview.jfif', 'swiftswiftfrontrowseats.jfif', 'steering-close-up-1288209207_930x620.jpg', 1, 1, NULL, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, '2023-12-05 15:37:40', '2023-12-05 15:37:54'),
(21, 'Mercedes-Benz GLA', 9, '\r\nMercedes-Benz GLA là một mẫu SUV đô thị cỡ nhỏ được sản xuất bởi Mercedes-Benz, một công ty ô tô của Đức. GLA được ra mắt lần đầu tiên vào năm 2013 và đã được bán ra tại nhiều quốc gia trên thế giới, bao gồm Việt Nam.\r\n\r\nTại Việt Nam, Mercedes-Benz GLA được phân phối chính hãng với 3 phiên bản: 200 AMG, 250 4MATIC và 35 AMG.Mercedes-Benz GLA có thiết kế trẻ trung, năng động, mang đậm phong cách của Mercedes-Benz. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.419 x 1.834 x 1.494 mm, chiều dài cơ sở 2.729 mm. Phần đầu xe nổi bật với lưới tản nhiệt Panamericana đặc trưng của Mercedes-Benz, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình boomerang.', 1999999999, 'Xăng', 2020, 5, 'glaglarightfrontthreequarter.jfif', 'glaglarightsideview.jfif', 'glaglarightfrontthreequarter (1).jfif', 'glaglafrontrowseats.jfif', 'glaglabootspacerearseatfolded.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-12-05 15:42:47', NULL),
(22, 'Mercedes-Benz GLS', 9, 'Mercedes-Benz GLS là một mẫu SUV hạng sang cỡ lớn được sản xuất bởi Mercedes-Benz, một công ty ô tô của Đức. GLS được ra mắt lần đầu tiên vào năm 2006 và đã được bán ra tại nhiều quốc gia trên thế giới, bao gồm Việt Nam.\r\n\r\nTại Việt Nam, Mercedes-Benz GLS được phân phối chính hãng với 2 phiên bản: 450 4MATIC và 580 4MATIC.Mercedes-Benz GLS có thiết kế sang trọng, mạnh mẽ, mang đậm phong cách của Mercedes-Benz. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 5.205 x 1.956 x 1.823 mm, chiều dài cơ sở 3.135 mm.\r\n\r\nPhần đầu xe nổi bật với lưới tản nhiệt Panamericana đặc trưng của Mercedes-Benz, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình boomerang.', 2147483647, 'Xăng', 2022, 5, 'glsglsrightfrontthreequarter.jfif', 'glsglsrightfrontthreequarter (1).jfif', 'glsglsopenboottrunk.jfif', 'glsglssidecladding.jfif', 'glsglstaillighttaillamp.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-12-05 16:06:30', NULL),
(23, 'Mercedes-Benz C-Class ', 9, 'Mercedes-Benz C-Class là một dòng xe sedan hạng sang cỡ nhỏ được sản xuất bởi Mercedes-Benz Group AG. C-Class sedan từng là mẫu xe hạng thấp của hãng cho đến năm 1997 khi Mercedes ra mắt A-Class. Hiện tại, C-Class có sẵn với nhiều kiểu dáng thân xe, bao gồm sedan, coupé, mui trần và wagon.Mercedes-Benz C-Class có thiết kế tinh tế và hiện đại, ngay lập tức được nhận ra là một chiếc Mercedes-Benz. Xe có mui dài, chắn bùn sau ngắn và dáng đứng rộng. Phần đầu xe được thống trị bởi lưới tản nhiệt lớn với logo ngôi sao Mercedes-Benz ở trung tâm. Đèn pha sắc sảo và thanh lịch, đèn hậu dài và mỏng.', 1999999999, 'Xăng', 2022, 5, 'cclasscclassrightfrontthreequarter.jfif', 'cclasscclasssteeringwheel.jfif', 'cclasscclassbootspacerearseatfolded.jfif', 'cclasscclassrearseats.jfif', 'cclasscclassrightsideview.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-12-05 16:12:51', '2023-12-05 16:14:22'),
(24, 'Mercedes-Benz GLE', 9, '\r\nMercedes-Benz GLE là một mẫu SUV hạng sang cỡ trung được sản xuất bởi Mercedes-Benz, một công ty ô tô của Đức. GLE được ra mắt lần đầu tiên vào năm 2015 và đã được bán ra tại nhiều quốc gia trên thế giới, bao gồm Việt Nam.\r\n\r\nTại Việt Nam, Mercedes-Benz GLE được phân phối chính hãng với 3 phiên bản: 300 4MATIC, 450 4MATIC và 53 4MATIC+.Mercedes-Benz GLE có thiết kế sang trọng, mạnh mẽ, mang đậm phong cách của Mercedes-Benz. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.925 x 1.947 x 1.730 mm, chiều dài cơ sở 2.935 mm.\r\n\r\nPhần đầu xe nổi bật với lưới tản nhiệt Panamericana đặc trưng của Mercedes-Benz, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình boomerang.', 1920000000, 'Xăng', 2021, 5, 'gleglefaceliftrightfrontthreequarter.jfif', 'gleglerightfrontthreequarter.jfif', 'gleglefaceliftrightfrontthreequarter (1).jfif', 'mercedesbenzgleexterior (1).jfif', 'mercedesbenzgleexterior.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, '2023-12-05 16:20:18', NULL),
(25, 'Mercedes-Benz GLC', 9, '\r\nMercedes-Benz GLC là một mẫu SUV hạng sang cỡ nhỏ được sản xuất bởi Mercedes-Benz, một công ty ô tô của Đức. GLC được ra mắt lần đầu tiên vào năm 2015 và đã được bán ra tại nhiều quốc gia trên thế giới, bao gồm Việt Nam.\r\n\r\nTại Việt Nam, Mercedes-Benz GLC được phân phối chính hãng với 3 phiên bản: 200 4MATIC, 250 4MATIC và 300 4MATIC.Mercedes-Benz GLC có thiết kế sang trọng, trẻ trung, mang đậm phong cách của Mercedes-Benz. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.656 x 1.890 x 1.639 mm, chiều dài cơ sở 2.873 mm.\r\n\r\nPhần đầu xe nổi bật với lưới tản nhiệt Panamericana đặc trưng của Mercedes-Benz, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình boomerang.', 1999850000, 'Xăng', 2021, 5, 'glcglcrightfrontthreequarter.jfif', 'glcnewglcrearseats.jfif', 'glcnewglcrightfrontthreequarter.jfif', 'glcnewglcrightsideview.jfif', 'glcnewglcsteeringwheel.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-12-05 16:24:47', NULL),
(26, 'Hyundai Exter', 10, 'Hyundai Exter là một mẫu SUV đô thị cỡ nhỏ được sản xuất bởi Hyundai, một công ty ô tô của Hàn Quốc. Exter được ra mắt lần đầu tiên vào năm 2023 và đã được bán ra tại Việt Nam.\r\n\r\nTại Việt Nam, Hyundai Exter được phân phối chính hãng với 2 phiên bản: 1.5L MT và 1.5L CVT.Hyundai Exter có thiết kế trẻ trung, năng động, mang đậm phong cách của Hyundai. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.419 x 1.834 x 1.494 mm, chiều dài cơ sở 2.729 mm.\r\n\r\nPhần đầu xe nổi bật với lưới tản nhiệt Cascading đặc trưng của Hyundai, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình boomerang.', 1600880000, 'Xăng', 2018, 5, 'exterexterrightfrontthreequarter.jfif', 'exterexterrightfrontthreequarter (2).jfif', 'exterexterrightfrontthreequarter (1).jfif', 'exterexterrearview.jfif', 'exterexterdashboard.jfif', 1, NULL, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, '2023-12-05 16:31:25', NULL),
(27, 'Hyundai Creta', 10, 'Hyundai Creta là một mẫu SUV đô thị cỡ nhỏ được sản xuất bởi Hyundai, một công ty ô tô của Hàn Quốc. Creta được ra mắt lần đầu tiên vào năm 2015 và đã được bán ra tại Việt Nam.\r\n\r\nTại Việt Nam, Hyundai Creta được phân phối chính hãng với 4 phiên bản: Tiêu chuẩn, Đặc biệt, Tiêu chuẩn 1.4L Turbo và Đặc biệt 1.4L Turbo.Hyundai Creta có thiết kế trẻ trung, năng động, mang đậm phong cách của Hyundai. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.300 x 1.790 x 1.660 mm, chiều dài cơ sở 2.610 mm.\r\n\r\nPhần đầu xe nổi bật với lưới tản nhiệt Cascading đặc trưng của Hyundai, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình boomerang.', 1780950000, 'Xăng', 2019, 5, 'cretacretarightfrontthreequarter.jfif', 'cretacretafrontrowseats.jfif', 'cretacretabootspacerearseatfolded.jfif', 'hyundaicretaleftfrontthreequarter.jfif', 'hyundaicretarearview.jfif', 1, 1, NULL, 1, 1, 1, 1, 1, NULL, 1, NULL, NULL, '2023-12-05 16:36:44', NULL),
(28, 'Hyundai Venue', 10, 'Hyundai Venue là một mẫu SUV đô thị cỡ nhỏ được sản xuất bởi Hyundai, một công ty ô tô của Hàn Quốc. Venue được ra mắt lần đầu tiên vào năm 2019 và đã được bán ra tại Việt Nam.\r\n\r\nTại Việt Nam, Hyundai Venue được phân phối chính hãng với 3 phiên bản: 1.6 MT, 1.6 AT và 1.0T AT.\r\n\r\nThiết kế\r\n\r\nHyundai Venue có thiết kế trẻ trung, năng động, mang đậm phong cách của Hyundai. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.035 x 1.770 x 1.620 mm, chiều dài cơ sở 2.580 mm.\r\n\r\nPhần đầu xe nổi bật với lưới tản nhiệt Cascading đặc trưng của Hyundai, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình boomerang.', 1600880000, 'Xăng', 2018, 5, 'venuevenuerightfrontthreequarter.jfif', 'venuevenuegearshiftergearshifterstalk.jfif', 'venuevenuedashboard.jfif', 'venuehyundaivenuerightrearthreequarter17.jfif', 'venuehyundaivenuerightfrontthreequarter2.jfif', 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, '2023-12-05 16:40:59', NULL),
(29, 'Hyundai Alcazar', 10, '\r\nHyundai Alcazar là một mẫu SUV 7 chỗ cỡ trung được sản xuất bởi Hyundai, một công ty ô tô của Hàn Quốc. Alcazar được ra mắt lần đầu tiên vào năm 2022 và đã được bán ra tại Việt Nam.\r\n\r\nTại Việt Nam, Hyundai Alcazar được phân phối chính hãng với 2 phiên bản: 2.0L 6AT và 2.0L Turbo 7AT.\r\n\r\nThiết kế\r\n\r\nHyundai Alcazar có thiết kế sang trọng, lịch lãm, mang đậm phong cách của Hyundai. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.500 x 1.865 x 1.700 mm, chiều dài cơ sở 2.760 mm.\r\n\r\nPhần đầu xe nổi bật với lưới tản nhiệt Cascading đặc trưng của Hyundai, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình boomerang.', 1780950000, 'Xăng', 2020, 5, 'alcazaralcazarrightfrontthreequarter.jfif', 'alcazarhyundaialcazarrightrearthreequarter33.jfif', 'alcazarhyundaialcazarrearview43.jfif', 'alcazarhyundaialcazarrightfrontthreequarter9.jfif', 'alcazaralcazarinstrumentcluster.jfif', 1, 1, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, 1, '2023-12-05 16:45:32', NULL),
(30, 'Hyundai Venue N Line', 10, '\r\nHyundai Venue N Line là một phiên bản nâng cấp thể thao của mẫu SUV đô thị cỡ nhỏ Hyundai Venue. Xe được ra mắt lần đầu tiên vào năm 2022 và đã được bán ra tại Việt Nam.\r\n\r\nTại Việt Nam, Hyundai Venue N Line được phân phối chính hãng với 1 phiên bản duy nhất.\r\n\r\nThiết kế\r\n\r\nHyundai Venue N Line có thiết kế thể thao, mạnh mẽ, mang đậm phong cách của Hyundai. Xe có kích thước tổng thể dài x rộng x cao lần lượt là 4.035 x 1.770 x 1.620 mm, chiều dài cơ sở 2.580 mm.\r\n\r\nPhần đầu xe nổi bật với lưới tản nhiệt N Line đặc trưng, cùng với cụm đèn pha LED sắc sảo. Thân xe có thiết kế uyển chuyển, với những đường gân dập nổi mạnh mẽ. Đuôi xe có thiết kế thanh lịch, với cụm đèn hậu LED hình boomerang.', 1650880000, 'Xăng', 2018, 5, 'venuenlinevenuenlinerightfrontthreequarter.jfif', 'venuenlinevenuenlineinstrumentcluster.jfif', 'venuenlinevenuenlinegearshiftergearshifterstalk.jfif', 'venuenlinehyundaivenuenlinerightrearthreequarter1.jfif', 'venuenlinehyundaivenuenlineleftfrontthreequarter0.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, '2023-12-05 16:51:13', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbrands`
--
ALTER TABLE `tblbrands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EmailId` (`EmailId`);

--
-- Indexes for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblbrands`
--
ALTER TABLE `tblbrands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
