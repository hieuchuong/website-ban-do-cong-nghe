-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 27, 2022 lúc 06:39 PM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bandienmay`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `email`, `password`, `admin_name`) VALUES
(2, 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'HieuChuong');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_baiviet`
--

CREATE TABLE `tbl_baiviet` (
  `baiviet_id` int(11) NOT NULL,
  `tenbaiviet` varchar(100) NOT NULL,
  `tomtat` text NOT NULL,
  `noidung` text NOT NULL,
  `danhmuctin_id` int(11) NOT NULL,
  `baiviet_image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`) VALUES
(1, 'LAPTOP'),
(2, 'TỦ LẠNH'),
(3, 'MÁY GIẶC'),
(4, 'ĐIỆN THOẠI'),
(5, 'TIVI');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_danhmuc_tin`
--

CREATE TABLE `tbl_danhmuc_tin` (
  `danhmuctin_id` int(11) NOT NULL,
  `tendanhmuc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_donhang`
--

CREATE TABLE `tbl_donhang` (
  `donhang_id` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `mahang` varchar(50) NOT NULL,
  `khachhang_id` int(11) NOT NULL,
  `ngaythang` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tinhtrang` int(11) NOT NULL,
  `huydon` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_giaodich`
--

CREATE TABLE `tbl_giaodich` (
  `giaodich_id` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `magiaodich` varchar(50) NOT NULL,
  `ngaythang` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `khachhang_id` int(11) NOT NULL,
  `tinhtrangdon` int(11) NOT NULL DEFAULT 0,
  `huydon` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_giohang`
--

CREATE TABLE `tbl_giohang` (
  `giohang_id` int(11) NOT NULL,
  `tensanpham` varchar(100) NOT NULL,
  `sanpham_id` int(11) NOT NULL,
  `giasanpham` varchar(50) NOT NULL,
  `hinhanh` varchar(50) NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_khachhang`
--

CREATE TABLE `tbl_khachhang` (
  `khachhang_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `note` text NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(100) NOT NULL,
  `giaohang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_sanpham`
--

CREATE TABLE `tbl_sanpham` (
  `sanpham_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sanpham_name` varchar(255) NOT NULL,
  `sanpham_chitiet` text NOT NULL,
  `sanpham_mota` text NOT NULL,
  `sanpham_gia` varchar(100) NOT NULL,
  `sanpham_giakhuyenmai` varchar(100) NOT NULL,
  `sanpham_active` int(11) NOT NULL,
  `sanpham_hot` int(11) NOT NULL,
  `sanpham_soluong` int(11) NOT NULL,
  `sanpham_image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_sanpham`
--

INSERT INTO `tbl_sanpham` (`sanpham_id`, `category_id`, `sanpham_name`, `sanpham_chitiet`, `sanpham_mota`, `sanpham_gia`, `sanpham_giakhuyenmai`, `sanpham_active`, `sanpham_hot`, `sanpham_soluong`, `sanpham_image`) VALUES
(1, 1, 'Acer Aspire 3 i3-1005G1 15.6 inch A315-56-37DV-70DEFGH-80TFG', 'Xử lý mọi tác vụ ổn định, giải quyết công việc nhanh chóng\r\nLaptop Acer Aspire 3 i3-1005G1 15.6 inch A315-56-37DV là một sản phẩm đến từ thương hiệu nổi tiếng Acer. Laptop Acer được trang bị bộ vi xử lý Intel Core i3-1005G1 hiện đại, đem đến khả năng nhận và xuất thông tin cực kỳ nhanh chóng, giúp người dùng dễ dàng hoàn thành mọi công việc chỉ với một chiếc Laptop nhỏ gọn.', 'Đặc điểm nổi bật\r\nCPU i3-1005G1 xử lý tác vụ cơ bản nhanh chóng\r\nMàn hình FHD 15.6 inch cho hình ảnh chân thật\r\nIntel UHD Graphics, đảm bảo chất lượng đồ họa \r\nHỗ trợ nhiều cổng kết nối, việc chia sẻ trở nên dễ hơn\r\nThiết kế gọn nhẹ, dễ dàng mang theo sử dụng', '30000000', '290000000', 1, 0, 10, 'lt1.jpg'),
(2, 1, 'Laptop Lenovo IdeaPad 5 14ITL05 i5-1135G7 14 inch 82FE00JKVN', 'Trải nghiệm hình ảnh sắc nét trên màn hình Full HD\r\nLaptop Lenovo IdeaPad 5 14ITL05 i5-1135G7 14 inch 82FE00JKVNcó ngôn ngữ thiết kế hiện đại, trang bị màn hình 14 inch với thiết kế viền mỏng, mang lại không gian trải nghiệm hình ảnh rộng rãi hơn. Kết hợp với độ phân giải Full HD (1920 x 1080), laptop mang đến những hình ảnh sống động với màu sắc chân thật, đẹp mắt. Ngoài ra, màn hình còn có công nghệ Anti-Glare chống chói hiệu quả, để bạn có thể sử dụng laptop ở nơi có nhiều ánh sáng.', 'Đặc điểm nổi bật\r\nLenovo Ideapad 5 14ITL05 có trọng lượng 1.4 kg, dễ mang theo sử dụng\r\nBộ vi xử lý i5-1135G7, 8GB RAM cho hiệu năng mạnh mẽ, đa nhiệm tốt\r\nỔ cứng SSD 512GB cho tốc độ phản hồi, mở máy, mở ứng dụng nhanh\r\nMàn hình Full HD 14 inch hiển thị hình ảnh sắc nét, màu sắc chân thực\r\nTận hưởng âm thanh sống động với công nghệ Realtek High Definition Audio', '31000000', '28000000', 1, 0, 10, 'lt2.jpg'),
(3, 1, 'Laptop MacBook Air M1 2020 13 inch 256GB MGND3SA/A Vàng', 'Chip Apple M1 mang đến sức mạnh chưa từng thấy trên Macbook Air trước đây\r\nLaptop MacBook Air M1 13 inch 256GB MGND3SA/A Vàng trang bị bộ vi xử lý Apple M1 8 core với sức mạnh đột phá giúp Macbook Air trở thành chiếc một trong những chiếc laptop nhỏ gọn, sang trọng với hiệu năng mạnh mẽ nhất từ trước đến nay. Bộ vi xử lý M1 8 nhân cực mạnh mang đến hiệu suất đáng kinh ngạc, tốc độ xử lý tuyệt vời, mượt mà tác vụ đồng thời kéo dài tuổi thọ pin.', 'Đặc điểm nổi bật\r\nThiết kế đẹp, sang trọng, gọn nhẹ dễ dàng mang theo sử dụng\r\nBộ vi xử lý Apple M1 8-core cho hiệu năng mạnh mẽ, mượt mà\r\nMàn hình Retina 13 inch hiển thị hình ảnh sắc nét chân thực\r\nThời lượng pin vượt trội, lướt web liên tục 15h, xem video 18h\r\nGPU 7 lõi xử lý mượt mà các tác vụ đồ họa nhanh hơn tới 5 lần\r\nTouch ID thay thế thao tác nhập mật khẩu chỉ bằng một chạm\r\nTrải nghiệm gõ phím tốt nhất với bàn phím Magic Keyboard \r\nBộ tản nhiệt với những lá nhôm tản nhiệt tốt, hoạt động êm ái', '25000000', '23000000', 1, 1, 10, 'lt3.jpg'),
(4, 1, 'Laptop Lenovo IdeaPad 5 14ITL05 i7-1165G7 14 inch 82FE00JLVN', 'Trải nghiệm hình ảnh sắc nét trên màn hình Full HD\r\nLaptop Lenovo IdeaPad 5 14ITL05 i7-1165G7 14 inch 82FE00JLVN trang bị màn hình 14 inch với thiết kế viền mỏng cho không gian trải nghiệm hình ảnh rộng rãi hơn. Kết hợp với độ phân giải Full HD (1920 x 1080), laptop mang đến những hình ảnh sống động với màu sắc chân thật, đẹp mắt. Ngoài ra, màn hình còn có Công nghệ Anti-Glare chống chói hiệu quả, để bạn có thể sử dụng laptop ở nơi có nhiều ánh sáng.', 'Đặc điểm nổi bật\r\nLenovo Ideapad 5 14ITL05 có trọng lượng nhẹ 1.4 kg, dễ mang theo sử dụng\r\nBộ vi xử lý i7-1165G7, 8GB RAM cho hiệu năng mạnh mẽ, đa nhiệm mượt mà\r\nỔ cứng SSD 512GB cho tốc độ phản hồi, khởi động máy, mở ứng dụng nhanh\r\nMàn hình Full HD Anti-glare 14\'\' hiển thị hình ảnh sắc nét, màu sắc chân thực\r\nTận hưởng âm thanh sống động nhờ công nghệ Realtek High Definition Audio', '28000000', '22000000', 1, 1, 10, 'lt4.jpg'),
(5, 1, 'Laptop Fujitsu CH-9C13A1 i5-1135G7 13.3 inch 4ZR1C39165', 'Laptop Fujitsu có thiết kế sang trọng và siêu gọn nhẹ\r\nLaptop Fujitsu CH-9C13A1 i5-1135G7 13.3 inch 4ZR1C39165 sở hữu thiết kế sang trọng với màu sắc trung tính kết hợp cùng các chi tiết tinh xảo mang đến sự thanh lịch và nổi bật cho người dùng. Với kích thước nhỏ gọn, trọng lượng khoảng 988g, bạn có thể dễ dàng mang laptop theo sử dụng ở bất cứ đâu. Nếu bạn thường xuyên phải đi công tác, hoặc gặp gỡ khách hàng, laptop Fujitsu sẽ là người bạn đồng hành cực kỳ hoàn hảo.', 'Đặc điểm nổi bật\r\nLaptop Fujitsu có thiết kế gọn nhẹ chỉ khoảng 988g dễ mang theo sử dụng\r\nBộ vi xử lý i5-1135G7 cho hiệu năng mạnh mẽ, xử lý tác vụ nhanh chóng\r\nRAM 8GB giúp laptop đa nhiệm mượt mà, chạy tốt nhiều ứng dụng cùng lúc\r\nỔ cứng SSD 512 GB cho tốc độ mở máy, ứng dụng nhanh, thoải mái lưu trữ\r\nMàn hình 13.3 inch Full HD hiển thị hình ảnh sắc nét, màu sắc chân thực\r\nThời lượng pin lên đến 11.4 tiếng đáp ứng tốt nhu cầu học tập, làm việc', '21000000', '20000000', 1, 1, 10, 'lt5.jpg'),
(6, 1, 'Laptop Dell Latitude 3420 i5-1135G7/8GB/256GB/Fedora', 'Hiệu năng mạnh mẽ, xử lý tác vụ nhanh chóng mượt mà\r\nLaptop Dell Vostro 3400 i7-1165G7 14 inch V4I7015W trang bị bộ vi xử lý Intel Core i7 Tiger Lake 1165G7 thuộc thế hệ thứ 11 vô cùng mạnh mẽ với xung nhịp cơ bản là 2.8 GHz, tốc độ tối đa lên đến 4.7 GHz. Bộ vi xử lý giúp laptop cân được hầu hết các ứng dụng học tập, văn phòng cũng như giải trí hằng ngày. Không chỉ vậy, Dell Vostro 3400 còn sở hữu card đồ họa NVIDIA GeForce MX330 2 GB mang đến hiệu năng ổn định đáp ứng tốt cho các tác vụ đồ họa cơ bản, hay chơi game ở mức đồ họa trung bình.', 'Đặc điểm nổi bật\r\nMàn hình 14 inch độ phân giải HD mang đến hình ảnh rõ nét đủ dùng\r\nBộ vi xử lý Intel Core i5-1135G7 xử lý tác vụ nhanh chóng, mượt mà\r\nRAM 8GB giúp laptop đa nhiệm mượt mà, hạn chế tình trạng giật lag\r\nỔ cứng SSD 256GB giúp khởi động máy nhanh, lưu trữ dữ liệu tốt', '35000000', '30000000', 1, 1, 10, 'lt6.jpg'),
(7, 2, 'Tủ lạnh Sharp Inverter 165 lít SJ-X196E-SL', 'Tủ lạnh Sharp có thiết kế sang trọng\r\nTủ lạnh Sharp Inverter 165 lít SJ-X196E-SL có vỏ ngoài màu bạc sang trọng, làm đẹp thêm cho gian bếp nhà bạn. Tủ lạnh Sharp có thiết kế ngăn đá trên truyền thống, tạo cảm giác gần gũi và quen thuộc với người dùng. Bên cạnh đó, tủ còn có khả năng đáp ứng tốt nhu cầu sử dụng của gia đình từ 2 - 3 người, nhờ vào dung tích lên đến 165 lít', 'Đặc điểm nổi bật\r\nCông nghệ J-Tech Inverter giúp máy vận hành ổn định, êm ái\r\nTích hợp bộ khử mùi sản sinh Ag+ loại bỏ vi khuẩn và mùi hôi\r\nChức năng làm đá nhanh gấp 2 lần chỉ trong 1 giờ\r\nKhay kính chịu lực bền bỉ, chịu được số lượng lớn thực phẩm\r\nThiết kế nhỏ gọn, tiết kiệm tối đa không gian', '15000000', '12000000', 1, 0, 10, 'tl1.jpg'),
(8, 2, 'Tủ lạnh Sharp Inverter 314 lít SJ-X316E-DS', 'Công nghệ J-tech Inverter tiết kiệm điện năng\r\nTủ lạnh Sharp Inverter 314 lít SJ-X316E-DS được trang bị công nghệ J-tech Inverter,  thiết bị thay đổi công suất làm lạnh ở 36 cấp độ, nhiều hơn công nghệ Inverter thông thường với chỉ 7 cấp độ, giúp tiết kiệm tối đa điện năng sử dụng, hoạt động vô cùng ổn định, êm ái và hạn chế gây ra tiếng ồn, tăng cường tuổi thọ cho bộ máy bên trong sản phẩm.', 'Đặc điểm nổi bật\r\nCông nghệ J-Tech Inverter máy vận hành êm ái, tiết kiệm điện\r\nCông nghệ Nano Ag+Cu loại bỏ tối đa vi khuẩn, nấm mốc\r\nChế độ Extra Eco tăng khả năng tiết kiệm điện \r\nTrang bị 7 tính năng ưu việt độc đáo, an toàn khi sử dụng\r\nThiết kế ngăn giữ tươi linh hoạt, làm lạnh thực phẩm dễ hơn', '17000000', '16000000', 1, 0, 10, 'tl2.jpg'),
(9, 2, 'Tủ lạnh Samsung Inverter 208 lít RT20HAR8DBU', 'Đặc điểm nổi bật\r\nDung tích 208 lít thích hợp cho gia đình từ 2 - 3 thành viên\r\nCông nghệ Digital Inverter hoạt động êm ái, tiết kiệm điện \r\nBộ lọc than hoạt tính Deodorizer giúp kháng khuẩn, khử mùi\r\nCông nghệ làm lạnh đa chiều, thực phẩm bảo quản tươi ngon\r\nNgăn đựng rau quả duy trì độ ẩm tốt, giữ thực phẩm tươi ngon', 'Đặc điểm nổi bật\r\nDung tích 208 lít thích hợp cho gia đình từ 2 - 3 thành viên\r\nCông nghệ Digital Inverter hoạt động êm ái, tiết kiệm điện \r\nBộ lọc than hoạt tính Deodorizer giúp kháng khuẩn, khử mùi\r\nCông nghệ làm lạnh đa chiều, thực phẩm bảo quản tươi ngon\r\nNgăn đựng rau quả duy trì độ ẩm tốt, giữ thực phẩm tươi ngon', '13000000', '12000000', 1, 0, 10, 'tl3.jpg'),
(10, 2, 'Tủ lạnh Casper Inverter 218 lít RT-230PB', 'Thiết kế hiện đại, kiểu dáng ngăn đông trên truyền thống\r\nTủ lạnh Casper Inverter 218 lít RT-230PB sở hữu thiết kế hiện đại, sang trọng với ngăn đông trên truyền thống kết hợp với gam màu đen bóng làm nổi bật không gian nội thất của gia đình. Tủ lạnh Casper RT-230PB được trang bị những công nghệ hiện đại như: công nghệ Inverter tiết kiệm điện, hệ thống làm lạnh đa chiều, bộ lọc than khử mùi hiện đại,... hứa hẹn sẽ là một trợ thủ đắc lực giúp gia đình bạn bảo quản thực phẩm tươi ngon', 'Đặc điểm nổi bật\r\nTủ lạnh có dung tích 218 lít thích hợp cho gia đình khoảng 1 - 2 người\r\nCông nghệ Inverter giúp tủ lạnh vận hành êm, tiết kiệm điện năng\r\nBộ lọc than hoạt tính khử mùi giúp không khí trong tủ luôn trong lành\r\nHệ thống làm lạnh đa chiều lan tỏa hơi lạnh đến mọi ngóc ngách trong tủ\r\nNgăn rau củ điều chỉnh độ ẩm giúp bảo quản thực phẩm tươi lâu hơn', '26000000', '23000000', 1, 1, 10, 'tl4.jpg'),
(11, 2, 'Tủ lạnh Sharp Inverter 315 lít SJ-X346E-SL', 'Tủ lạnh ngăn đá trên có thiết kế thon gọn, tinh tế\r\nTủ lạnh Sharp Inverter 315 lít SJ-X346E-SL sở hữu thiết kế ngăn đá trên truyền thống, 2 cửa, kết hợp cùng gam màu bạc tối giản sẽ dễ dàng kết hợp với mọi kiểu không gian nội thất của gia đình. Với dung tích 315 lít, chiếc tủ lạnh thích hợp sử dụng cho gia đình khoảng 3 - 4 thành viên. Nếu bạn đang tìm kiếm một chiếc tủ lạnh thanh lịch, làm lạnh tốt và tiết kiệm điện thì chiếc tủ lạnh Sharp này là một sự lựa chọn lý tưởng.', 'Đặc điểm nổi bật\r\nTủ lạnh dung tích 315L thích hợp sử dụng gia đình 3 - 4 người\r\nCông nghệ J-Tech Inverter vận hành êm ái, tiết kiệm điện năng\r\nChế độ Extra Eco nâng cao khả năng tiết kiệm điện tối đa\r\nBộ lọc phân tử Ag+Cu khử mùi giúp không khí trong tủ trong lành\r\nTủ lạnh có 7 tính năng bảo vệ ưu việt, an toàn sử dụng tuyệt đối\r\nThiết kế Ngăn giữ tươi linh hoạt, làm lạnh thực phẩm nhanh chóng', '29000000', '24000000', 1, 1, 10, 'tl5.jpg'),
(12, 2, 'Tủ lạnh Casper Inverter 463 lít RM-522VBW', 'Thiết kế sang trọng nâng tầm không gian nội thất\r\nTủ lạnh Casper Inverter 463 lít RM-522VBW sở hữu thiết kế hiện đại, chất liệu bằng thép không gỉ cao cấp không bám dấu vân tay, kết hợp cùng ngăn lấy nước ngoài tiện lợi mang đến vẻ đẹp tinh tế cho không gian nội thất của gia đình. Không chỉ được chăm chút vẻ ngoài, tủ lạnh Casper còn được trang bị những công nghệ hiện đại như: công nghệ Inverter tiết kiệm điện, hệ thống hai dàn lạnh độc lập, khả năng làm đông, làm lạnh nhanh,... Với những ưu điểm trên, chiếc tủ lạnh hứa hẹn sẽ là một trợ thủ đắc lực giúp gia đình bạn bảo quản thực phẩm tươi ngon.', 'Đặc điểm nổi bật\r\nDung tích lớn 463 lít thích hợp sử dụng cho gia đình trên 5 người\r\nCông nghệ Inverter vận hành êm, bền bỉ và tiết kiệm điện năng\r\nNgăn lấy nước ngoài tiện lợi, hạn chế mở cửa và thất thoát hơi lạnh\r\nHệ thống 2 dàn lạnh độc lập hạn chế lẫn mùi thực phẩm hiệu quả\r\nTủ lạnh sử dụng gas R600a làm lạnh sâu, thân thiện với môi trường\r\nNgăn rau quả tùy chỉnh độ ẩm bảo quản rau quả tươi ngon lâu hơn', '21000000', '17000000', 1, 1, 10, 'tl6.jpg'),
(13, 3, 'Máy giặt Electrolux Inverter 9 kg EWF9025BQWA', 'Máy giặt lồng ngang có khối lượng giặt 9kg\r\nMáy giặt Electrolux 9 kg EWF9025BQWA Inverter sở hữu thiết kế hiện đại với gam màu trắng sang trọng, khối lượng giặt 9 kg thích hợp sử dụng cho gia đình 3 - 5 thành viên. Máy giặt Electrolux được trang bị nhiều công nghệ hiện đại giúp cho công việc giặt giũ của các bà nội trợ trở nên nhanh chóng và tiện lợi hơn.', 'Đặc điểm nổi bật\r\nMáy giặt EWF9025BQWA có khối lượng giặt 9 kg thích hợp cho gia đình 3 - 5 người\r\nCông nghệ Inverter giúp máy giặt vận hành êm, tiết kiệm điện năng\r\nGiặt hơi nước Vapour Care ngừa dị ứng, cho quần áo mềm mại hơn\r\nLấy và bỏ áo quần dễ dàng nhờ thiết kế cửa máy giặt rộng cỡ 3XL\r\nCó thể thêm đồ giặt bị bỏ quên trong 15 phút đầu sau khi vận hành', '17000000', '12000000', 1, 0, 10, 'mg1.jpg'),
(14, 3, 'Máy giặt Electrolux Inverter 8 kg EWF8025CQSA', 'Công nghệ giặt hơi nước VapourCare loại bỏ vi khuẩn, an toàn cho làn da cả nhà\r\nMáy giặt Electrolux Inverter 8 kg EWF8025CQSA trang bị tính năng giặt hơi nước Vapour Care giúp loại bỏ vi khuẩn trên quẩn áo. Cụ thể ở tính năng này, nhiệt độ hơi nước giặt có thể lên đến 70 độ C. Nhờ vậy, mà quần áo của bạn không chỉ được kháng khuẩn lên đến 99,9% mà nó còn giảm nhăn đến 22%, bảo vệ an toàn cho làn da của bạn và người thân, đồng thời giúp bạn tiết kiệm được thời gian là ủi sau này.', 'Đặc điểm nổi bật\r\nMáy giặt có khối lượng giặt 8kg thích hợp cho 3 -5 người dùng\r\nCông nghệ giặt VapourCare loại bỏ vi khuẩn và chất gây dị ứng\r\nCông nghệ Inverter giúp máy giặt vận hành êm, tiết kiệm điện\r\nChương trình giặt riêng giúp giặt trang phục len an toàn\r\nThiết kế Cửa máy giặt 3XL giúp bỏ và lấy quần áo dễ dàng hơn\r\nChương trình giặt nhanh 15 phút giúp giặt quần áo nhanh chóng\r\nChức năng Thêm quần áo bị sót ngay cả khi máy đã vận hàn', '16000000', '11000000', 1, 0, 10, 'mg2.jpg'),
(15, 3, 'Máy giặt Samsung Inverter 8.5 kg WW85T4040CE/SV\r\n', 'Giặt hơi nước diệt khuẩn Steam, quần áo thơm tho, an toàn với làn da\r\nMáy giặt Samsung Inverter 8.5 kg WW85T4040CE/SV trang bị tính năng giặt hơi nước Stream. Cụ thể, máy giặt sẽ đẩy nhiệt độ cao thổi vào toàn bộ bề mặt và sâu bên trong từng kẽ vải giúp loại bỏ cặn bẩn bám sâu và diệt 99,9% vi khuẩn và các tác nhân gây dị ứng, bảo vệ sức khỏe cả gia đình', 'Đặc điểm nổi bật\r\nMáy giặt cửa trước có khối lượng giặt 8.5 kg thích hợp cho gia đình 3 - 5 người\r\nCỗ máy EcoBubble tạo bong bóng siêu mịn thẩm thấu nhanh, đánh bật vết bẩn\r\nCông nghệ Sạch siêu tốc QuickDrive đảm bảo giặt sạch sâu chỉ trong 39 phút\r\nGiặt giũ êm ái với công nghệ VRT Plus giảm rung ồn đến 30% trong quá trình giặt\r\nĐộng cơ Digital Inverter giúp máy giặt vận hành êm ái, tiết kiệm điện năng', '25000000', '19000000', 1, 1, 10, 'mg3.jpg'),
(16, 3, 'Máy giặt Toshiba Inverter 9.5 kg TW-BK105S3V (SK)', 'Công nghệ nước nóng loại bỏ mùi hôi khó chịu\r\nMáy giặt Toshiba Inverter 9.5 kg TW-BK105S3V (SK) tích hợp công nghệ nước nóng giúp góp phần giặt sạch mọi vết bẩn cứng đầu hiệu quả, đồng thời hỗ trợ diệt khuẩn tối ưu nhằm mang lại sự an toàn và loại bỏ vi khuẩn mùi hôi khó chịu cho người sử dụng. Tính năng này cực kỳ phù hợp cho gia đình có trẻ nhỏ và người lớn tuổi có làn da nhạy cảm', 'Đặc điểm nổi bật\r\nKhối lượng giặt 9.5 kg thích hợp sử dụng cho gia đình 5 -7 người\r\nCông nghệ Inverter vận hành êm ái, bền bỉ và tiết kiệm điện năng\r\nĐánh bay vết bẩn hiệu quả, giữ màu áo quần với công nghệ Greatwaves\r\nCông nghệ giặt nước nóng đánh bay vết bẩn, diệt khuẩn hiệu quả\r\nChế độ giặt Flush waves và color care giúp quần áo sạch và như mới\r\nTính năng vắt cực khô giúp rút ngắn thời gian phơi quần áo\r\nTiện lợi hơn với chức năng tự khởi động lại khi có điện, khóa trẻ em', '14000000', '10000000', 1, 0, 10, 'mg4.jpg'),
(17, 3, 'Máy giặt Toshiba Inverter 9 Kg AW-DK1000FV(KK)', 'Công nghệ giặt siêu sóng GreatWaves, đánh bay mọi vết bẩn\r\nMáy giặt Toshiba Inverter 9 Kg AW-DK1000FV(KK) được trang bị công nghệ giặt siêu sóng GreatWaves sử dụng hiệu ứng 3 luồng từ 3 hướng khác nhau tạo nên luồng nước siêu sóng, lên xuống đánh tan các vết bẩn nhanh chóng. Từ đó sẽ giảm được lượng nước và điện năng tiêu thụ, tiết kiệm chi phí hơn.', 'Đặc điểm nổi bật\r\nCông nghệ inverter tiết kiệm điện, vận hành ổn định\r\nĐộng cơ truyền động trực tiếp hoạt động êm, bền bỉ\r\nLồng giặt ngôi sao pha lê làm tăng hiệu quả giặt\r\nChế độ vắt khô tiết kiệm thời gian làm khô quần áo\r\nCông nghệ giặt Greatwaves giúp quần áo sạch, nhanh\r\nAn toàn hơn cho gia đình có trẻ nhỏ với khóa trẻ em', '18000000', '16000000', 1, 0, 10, 'mg5.jpg'),
(18, 3, 'Máy giặt Sharp 8 kg ES-W80GV-H', 'Công nghệ UltraMix giặt sạch sâu, không cặn giặt tẩy\r\nMáy giặt Electrolux Inverter 9 kg EWF9024P5SB xứng đáng trở thành \"dũng sĩ giặt giũ\" nhờ vào công nghệ UltraMix giúp hòa tan hoàn toàn chất giặt và xả trước khi cho vào lồng giặt giúp giặt sạch sâu, không cặn hóa chất trên quần áo và không cần giặt đi giặt lại nhiều lần. Ngoài ra, chiếc máy giặt lồng ngang này còn nâng cao hiệu quả làm sạch', 'Đặc điểm nổi bật\r\nLồng giặt Pump-Up không gây hư hại cho vải khi giặt giũ\r\nThiết kế đột phá với ngăn chứa bột giặt 3 trong 1 tiện ích\r\nMâm giặt phủ bạc AG+ ngăn chặn sự phát triển của vi khuần\r\n7 tính năng bảo vệ ưu việt giảm thiểu rủi ro khi sử dụng\r\nChức năng vệ sinh lồng giặt trên bảng điều khiển', '90000000', '70000000', 1, 1, 10, 'mg6.jpg'),
(19, 4, 'Điện thoại Xiaomi Redmi 9A 2GB/32GB Xanh dương', 'Màn hình HD+ 6.53 inch mở rộng không gian trải nghiệm\r\nĐiện thoại Xiaomi Redmi 9A 2GB/32GB Xanh dương có diện mạo thời trang, màu sắc nổi bật, mặt sau thiết kế đường vân chống bám vân tay tốt. Màn hình lớn 6.53 inch HD+ giúp mở rộng không gian trải nghiệm hình ảnh, video. Ánh sáng xanh thấp mang đến trải nghiệm xem thoải mái.', 'Đặc điểm nổi bật\r\nHiệu năng ổn định với bộ vi xử lý MediaTek Helio G25\r\nMàn hình LCD IPS tràn viền rộng trải nghiệm đã mắt\r\nCamera hỗ trợ AI thông minh đem lại hình ảnh sắc nét\r\nCông nghệ nhận diện khuôn mặt mở khóa nhanh chóng\r\nDung lượng pin 5000mAh cho thời lượng sử dụng lâu', '10000000', '8000000', 1, 0, 10, 'dt1.jpg'),
(20, 4, 'Điện thoại Samsung Galaxy A52 4G 8GB/128GB Đen', 'Màn hình Super AMOLED chuẩn FHD+ sắc nét, cuộn lướt mượt mà\r\nĐiện thoại Samsung Galaxy A52 4G 8GB/128GB Đen nâng tầm trải nghiệm giải trí với màn hình vô cực Infinity-O thời thượng 6.5 inch đưa bạn đắm chìm trong không gian của màu sắc sống động. Công nghệ Super AMOLED FHD+ hiển thị hình ảnh sắc nét rực rỡ với độ sáng lên đến 800 nit. Công nghệ Eye Comfort Shield giảm thiểu ánh sáng xanh gây hại cho mắt, trong khi đó công nghệ Real Smooth mang đến trải nghiệm mượt mà tối ưu, cho bạn cảm nhận sự khác biệt ở mỗi lần chạm.', 'Đặc điểm nổi bật\r\nMàn hình Super AMOLED Full HD+6.5 inch hiển thị hình ảnh sắc nét\r\nTần số quét màn hình 90Hz hiển thị mượt mà chuyển động trên khung hình\r\nBộ 4 camera sau 64 MP đột phá Công nghệ chống rung quang học OIS\r\nVi xử lý 8 nhân Snapdragon 720G cho hiệu năng mạnh mẽ, đa nhiệm tốt\r\nKháng nước và kháng bụi chuẩn IP67 nâng cao bộ bền cho sản phẩm\r\nĐiện thoại có dung lượng pin 4500mAh, sạc nhanh 25W, sử dụng cả ngày', '9000000', '5000000', 1, 1, 10, 'dt2.jpg'),
(21, 4, 'Điện thoại Samsung Galaxy S20 FE 8GB/256GB Xanh Lá', 'Trải nghiệm hình ảnh sắc nét trên màn hình tràn viền 6.5 inch\r\nĐiện thoại Samsung Galaxy S20 FE 8GB/256GB Xanh Lá thu hút mọi ánh nhìn với màn hình tràn viền sống động Infinity-O Super AMOLED 6.5 inch. Độ phân giải Full HD hiển thị hình ảnh sắc nét màu sắc chân thực cho cảm giác trải nghiệm thực sự sống động. Đặc biệt, tần số quét màn hình của S20 FE lên tới 120 Hz giúp cho trải ngiệm cho mọi trải nghiệm chạm, lướt mượt mà và trơn tru.', 'Đặc điểm nổi bật\r\nTrải nghiệm hình ảnh sắc nét trên màn hình Infinity-O Super AMOLED 6.5\'\'\r\nCPU Snapdragon 865 5G (7 nm+) cho hiệu năng mạnh mẽ, tác vụ mượt mà\r\nCamera sau: Chính 12 MP, 8 MP, 12 MP chụp ảnh rõ nét, màu sắc sống động\r\nCamera trước có độ phân giải 32MP chụp ảnh selfie sắc nét, đẹp tự nhiên\r\nDung lượng pin 4500mAh, hỗ trợ sạc nhanh 25W, thoải mái sử dụng cả ngày', '15000000', '12000000', 1, 0, 10, 'dt3.jpg'),
(22, 4, 'Điện thoại Xiaomi Redmi 9A 2GB/32GB Xám', 'Màn hình HD+ 6.53 inch mở rộng không gian trải nghiệm\r\nĐiện thoại Xiaomi Redmi 9A 2GB/32GB Xám có diện mạo thời trang, màu sắc nổi bật, mặt sau thiết kế đường vân chống bám vân tay tốt. Màn hình lớn 6.53 inch HD+ giúp mở rộng không gian trải nghiệm hình ảnh, video. Ánh sáng xanh thấp mang đến trải nghiệm xem thoải mái.', 'Đặc điểm nổi bật\r\nHiệu năng ổn định với bộ vi xử lý MediaTek Helio G25\r\nMàn hình LCD IPS tràn viền rộng trải nghiệm đã mắt\r\nCamera hỗ trợ AI thông minh đem lại hình ảnh sắc nét\r\nCông nghệ nhận diện khuôn mặt mở khóa nhanh chóng\r\nDung lượng pin 5000mAh cho thời lượng sử dụng lâu', '17000000', '13000000', 1, 0, 10, 'dt4.jpg'),
(23, 4, 'Điện thoại Samsung Galaxy S21 Plus 5G 8GB/128GB Đen', 'Thiết kế thời thượng, dẫn đầu xu hướng\r\nĐiện thoại Samsung Galaxy S21 Plus 5G 8GB/128GB Đen sở hữu thiết kế tuyệt đẹp với sắc màu dẫn đầu xu hướng kết hợp cùng kính cường lực Gorilla Glass Victus chịu lực tốt, hạn chế trầy xước giúp siêu phẩm trở nên sang trọng, cứng cáp và được bảo vệ toàn diện hơn. Không chỉ gây ấn tượng với vẻ ngoài thời thượng, chiếc điện thoại Samsung này còn được cải tiến với những tính năng nổi bật như: quay video 8K chuyên nghiệp, thời lượng pin siêu khủng và bộ vi xử lý Exynos 2100 (5nm) mạnh mẽ nhất trên dòng Galaxy hiện nay,... Với những ưu điểm trên, Galaxy S21 Plus 5G hứa hẹn mang đến cho bạn những trải nghiệm siêu mạnh mẽ, tốc độ xử lý và giải trí cực kỳ ấn tượng.', 'Đặc điểm nổi bật\r\nMàn hình 6.7 inch Full HD+ hiển thị hình ảnh sắc nét, màu sắc sống động\r\nBộ vi xử lý Exynos 2100 (5nm) cho tốc độ xử lý mạnh mẽ, nhanh chóng\r\nCamera sau 12MP + 12MP + 64MP chụp chân dung, chụp đêm siêu nét\r\nCamera trước 10MP lấy nét nhanh, chụp ảnh selfie rõ nét, đẹp tự nhiên\r\nCamera quay video 8K chuyên nghiệp, quay phim siêu chống rung mượt mà\r\nCảm biến vân tay dưới màn hình mở khóa nhanh an toàn chỉ với một chạm\r\nDung lượng pin 4800mAh hỗ trợ sạc nhanh thoải mái sử dụng cả ngày', '19000000', '13000000', 1, 1, 10, 'dt5.jpg'),
(24, 4, 'Điện thoại Vivo Y15s 3GB/32GB Trắng Xanh', 'Thiết kế sang trọng, nhỏ gọn, dễ dàng thao tác và sử dụng\r\nsở hữu màu sắc xám huyền bí mang lại vẻ đẹp sang trọng cho người sử dụng. Mặt khác, thiết kế đường nét mềm mại giúp khả năng cầm nắm chắc chắn. Ngoài những điểm nổi bật về kiểu dáng, máy còn được ưa chuộng nhờ vào giá thành mềm, vi xử lý mạnh mẽ, pin cực khủng xứng đáng trở thành sự lựa chọn hàng đầu trong phân khúc tầm trung', 'Đặc điểm nổi bật\r\nMàn hình 6.51 inch HD+ cho trải nghiệm hình ảnh rộng rãi thoải mái\r\nBộ vi xử lý MediaTek Helio P35 giúp xử lý tác vụ cơ bản nhanh chóng\r\nDung lượng pin 5000mAh cho bạn thoải mái trải nghiệm cả ngày dài\r\nCamera sau 13MP+2MP chụp ảnh rõ nét, lưu giữ khoảnh khắc đáng nhớ\r\nCamera trước có độ phân giải 8MP chụp selfie rõ nét, đẹp tự nhiên', '14000000', '13000000', 1, 0, 10, 'dt6.jpg'),
(25, 5, 'Android Tivi Casper 32 inch 32HG5200', 'Thiết kế sang trọng, kích thước 32 inch phù hợp với mọi không gian\r\nAndroid Tivi Casper 32 inch 32HG5200 có thiết kế tinh giản, viền mỏng tối ưu cùng kích thước 32 inch dễ dàng bố trí lắp đặt ở những căn phòng nhỏ giúp tô điểm không gian nội thất của gia đình. Phần chân đế hình chữ V úp ngược mang lại tổng thể chiếc tivi trở nên sang trọng. Bên cạnh đó, với kích 32 inch phù hợp trưng bày ở những nơi có không gian nhỏ như: Phòng ngủ, phòng khách nhỏ,...', 'Đặc điểm nổi bật\r\nThiết kế tinh giản, viền mỏng tối ưu tô điểm không gian nội thất\r\nHệ điều hành Android 9 với kho ứng dụng giải trí phong phú\r\nChế độ Super Brightness và 2K HDR cho hình ảnh chân thực, rõ nét\r\nCông nghệ âm thanh Dolby Audio, thoài mái tận hưởng âm nhạc\r\nTrợ lý ảo Google Assistant, tìm kiếm bằng giọng nói hỗ trợ Tiếng Việt', '19000000', '15000000', 1, 0, 10, 'tv1.jpg'),
(26, 5, 'Google Tivi Sony 4K 55 inch XR-55X90J VN3', 'Độ phân giải 4K hiển thị hình ảnh sắc nét đến từng chi tiết\r\nGoogle Tivi Sony 4K 55 inch XR-55X90J VN3 sở hữu thiết kế sang trọng, màn hình tràn viền tinh tế hòa quyện hoàn hảo vào không gian nội thất. Với độ phân giải 4K (sắc nét gấp 4 lần tivi Full HD), tivi Sony 4K hiển thị hình ảnh chân thực, rõ nét đến từng chi tiết. Giờ đây, bạn sẽ được đắm chìm trong những khung hình điện ảnh tuyệt đẹp, màu sắc tự nhiên cùng âm thanh rung cảm như rạp chiếu phim ngay tại căn nhà của mình. Tất cả được kết hợp hoàn hảo trên tivi Sony XR-X90J series', 'Đặc điểm nổi bật\r\nGoogle Tivi Sony có độ phân giải 4K sắc nét gấp 4 lần so với TV Full HD\r\nCông nghệ đèn nền Full Array LED, Local Dimming tái hiện hình ảnh chân thực\r\nCông nghệ XR 4K Upscaling tự động nâng cấp hình ảnh lên 4K sắc nét, chi tiết\r\nCông nghệ tương phản XR Contrast Booster 5 cho hình ảnh sống động như thật\r\nCông nghệ XR Triluminos PRO mở rộng hàng tỷ màu sắc, tăng cường độ bão hòa\r\nTrải nghiệm âm thanh đắm chìm nhờ Âm thanh từ màn hình Acoustics Multi-Audio\r\nCông nghệ nâng cấp âm thanh vòm 3D tái tạo âm thanh đa chiều, sống động', '17000000', '11000000', 1, 0, 10, 'tv2.jpg'),
(27, 5, 'Smart Tivi NanoCell LG 4K 50 inch 50NANO77TPA', ' Công nghệ NanoCell giúp hình ảnh có màu sắc tinh tế và thuần khiết\r\nSmart Tivi NanoCell LG 4K 50 inch 50NANO77TPA sở hữu thiết kế tối giản, độ mỏng vượt trội, đường nét thanh mảnh giúp tăng tính thẩm mỹ cho không gian phòng của bạn.Tivi LG 4K với Công nghệ NanoCell có khả năng lọc và tinh chỉnh màu sắc, giúp những màu sắc tinh khiết, chính xác mới được hiển thị trên màn hình. Kết hợp với màn hình 4K sắc nét, NanoCell Tivi truyền tải những hình ảnh tuyệt đẹp với màu sắc chính xác hơn, chất lượng cao hơn để nâng tầm trải nghiệm xem trở nên chân thật hơn', 'Đặc điểm nổi bật\r\nTivi NanoCell LG 4K hiển thị hình ảnh sắc nét, chi tiết, màu sắc chân thực\r\nCông nghệ NanoCell giúp hình ảnh có màu sắc thuần khiết và tinh tế hơn\r\nBộ xử lý Quad Core Processor 4K tái tạo và nâng cấp chất lượng hình ảnh\r\nFILMMAKER MODE™ truyền tải phim chân thực như dưới góc nhìn đạo diễn\r\nCông nghệ AI Sound tinh chỉnh âm thanh dựa trên thể loại nội dung đang xem\r\nTivi LG hỗ trợ tìm kiếm bằng giọng nói giúp tìm kiếm nội dung tiện lợi hơn', '47000000', '24000000', 1, 0, 10, 'tv3.jpg'),
(30, 5, 'Smart Tivi Casper 32 inch 32HX6200', 'Thiết kế sang trọng, viền màn hình mỏng nhẹ\r\nSmart Tivi Casper 32 inch 32HX6200 - Smart Tivi có thiết kế tinh tế với viền màn hình mỏng nhẹ, mang đến sự sang trọng cho không gian nội thất. Sở hữu công nghệ HDR tăng cường độ tương phản, công nghệ âm thanh Dolby Audio sống động, tivi Casper hứa hẹn mang đến cho bạn những phút giây thư giãn cùng gia đình.', 'Đặc điểm nổi bật\r\nThiết kế hiện đại sang trọng tô điểm không gian nội thất\r\nMàn hình 32 inch độ phân giải HD hiển thị hình ảnh rõ nét\r\nCông nghệ HDR tăng cường độ tương phản cho hình ảnh\r\nTấm nền IPS giúp hình ảnh có màu sắc tự nhiên, chân thực\r\nCông nghệ Dolby Audio mang đến âm thanh vòm sống động \r\nHệ điều hành Linux với giao diện đơn giản dễ sử dụng', '14000000', '10000000', 1, 1, 10, 'tv4.jpg'),
(31, 5, 'Smart Tivi LG 4K 55 inch 55UP7550PTC', 'Bộ vi xử lý lõi tứ 4k, mang đến trải nghiệm nghe và xem sống động\r\nSmart Tivi LG 4K 55 inch 55UP7550PTC trang bị bộ vi xử lý lõi tứ 4k, hỗ trợ loại bỏ tình trạng nhiễu trên video, nâng cao khả năng tái tạo màu sắc cũng như độ tương phản trở nên rực rỡ hơn. Đặc biệt, với bộ vi xử lý tân tiến những hình ảnh có độ phân giải thấp sẽ được tái tạo ở chất lượng gần 4k nhất, người dùng có thể tận hưởng những thước phim sống động đến từng điểm ảnh. Không chỉ giúp nâng cao hình ảnh, chúng còn cải thiện về âm thanh, tạo ra âm thanh vòm ảo giúp trải nghiệm xem phim và giải trí được tuyệt vời nhất', 'Đặc điểm nổi bật\r\nThiết kế tối giản, kích thước 55 inch tô điểm cho không gian nội thất tại nhà\r\nĐồ họa HDR tinh chỉnh, độ trễ thấp giúp chơi game mượt mà, hình ảnh sắc nét\r\nBộ xử lý AI a5 4K, loại bỏ nhiễu và tạo ra màu sắc, độ tương phản rực rỡ\r\nBluetooth Surround Ready mang đến trải nghiệm âm thanh vòm chân thật \r\nCông nghệ FILMMAKER MODE™, tận hưởng rạp chiếu phim ngay tại gia\r\nChất lượng hình ảnh trung thực và màu sắc sống động với độ phân giải 4k', '13000000', '11000000', 1, 0, 10, 'tv5.jpg'),
(32, 5, 'Android Tivi TCL 4K 50 inch 50P618', 'Thiết kế mỏng nhẹ, hiện đại\r\nAndroid Tivi TCL 4K 50 inch 50P618 sở hữu thiết kế mỏng nhẹ, đường viền nhỏ giúp tối trải nghiệm người dùng. Ngoài ra, màu đen lịch lãm với chân đế hình chữ V úp ngược chắc chắn, có thể đứng vững ở mọi mặt phẳng, phù hợp với mọi không gian nội thất. Hứa hẹn sẽ mang đến cho bạn những thước phim đẹp mãn nhãn, không thể rời mắt.', 'Đặc điểm nổi bật\r\nMàn hình tivi TCL 50 inch mở ra trải nghiệm nhìn hoàn hảo\r\nCông nghệ phân giải hình ảnh chất lượng 4K UHD\r\nTrang bị các cổng kết hỗ trợ nhu cầu chia sẻ của bạn\r\nTích hợp tiện ích tìm kiếm bằng giọng nói thông minh\r\nThiết kế hiện đại, tăng thêm vẻ tinh tế cho không gian', '17000000', '16000000', 1, 0, 10, 'tv6.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `slider_id` int(11) NOT NULL,
  `slider_image` varchar(100) NOT NULL,
  `slider_caption` text NOT NULL,
  `slider_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_slider`
--

INSERT INTO `tbl_slider` (`slider_id`, `slider_image`, `slider_caption`, `slider_active`) VALUES
(1, 'b2.jpg', 'Slider khuyến mãi ', 1),
(2, 'b3.jpg', 'Slider 50%', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `tbl_baiviet`
--
ALTER TABLE `tbl_baiviet`
  ADD PRIMARY KEY (`baiviet_id`);

--
-- Chỉ mục cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `tbl_danhmuc_tin`
--
ALTER TABLE `tbl_danhmuc_tin`
  ADD PRIMARY KEY (`danhmuctin_id`);

--
-- Chỉ mục cho bảng `tbl_donhang`
--
ALTER TABLE `tbl_donhang`
  ADD PRIMARY KEY (`donhang_id`);

--
-- Chỉ mục cho bảng `tbl_giaodich`
--
ALTER TABLE `tbl_giaodich`
  ADD PRIMARY KEY (`giaodich_id`);

--
-- Chỉ mục cho bảng `tbl_giohang`
--
ALTER TABLE `tbl_giohang`
  ADD PRIMARY KEY (`giohang_id`);

--
-- Chỉ mục cho bảng `tbl_khachhang`
--
ALTER TABLE `tbl_khachhang`
  ADD PRIMARY KEY (`khachhang_id`);

--
-- Chỉ mục cho bảng `tbl_sanpham`
--
ALTER TABLE `tbl_sanpham`
  ADD PRIMARY KEY (`sanpham_id`);

--
-- Chỉ mục cho bảng `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_baiviet`
--
ALTER TABLE `tbl_baiviet`
  MODIFY `baiviet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_danhmuc_tin`
--
ALTER TABLE `tbl_danhmuc_tin`
  MODIFY `danhmuctin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_donhang`
--
ALTER TABLE `tbl_donhang`
  MODIFY `donhang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `tbl_giaodich`
--
ALTER TABLE `tbl_giaodich`
  MODIFY `giaodich_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `tbl_giohang`
--
ALTER TABLE `tbl_giohang`
  MODIFY `giohang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tbl_khachhang`
--
ALTER TABLE `tbl_khachhang`
  MODIFY `khachhang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `tbl_sanpham`
--
ALTER TABLE `tbl_sanpham`
  MODIFY `sanpham_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
