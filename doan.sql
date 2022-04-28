first_name-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 08, 2021 lúc 02:14 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `doan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(12) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `sdt` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tong` decimal(15,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(12) NOT NULL,
  `tensp` varchar(255) NOT NULL,
  `img` varchar(30) NOT NULL,
  `gia` decimal(15,3) NOT NULL,
  `sl` int(3) NOT NULL,
  `tong` decimal(15,3) NOT NULL,
  `idbill` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` varchar(10) NOT NULL,
  `tensp` varchar(30) NOT NULL,
  `loaisp` varchar(30) NOT NULL,
  `baohanh` varchar(10) NOT NULL,
  `trongluong` varchar(5) NOT NULL,
  `xuatxu` varchar(30) NOT NULL,
  `img` varchar(30) NOT NULL,
  `img1` varchar(30) NOT NULL,
  `img2` varchar(30) NOT NULL,
  `img3` varchar(30) NOT NULL,
  `img4` varchar(30) NOT NULL,
  `gia` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `tensp`, `loaisp`, `baohanh`, `trongluong`, `xuatxu`, `img`, `img1`, `img2`, `img3`, `img4`, `gia`) VALUES
('BA1', 'Cây Bình An', 'Để Bàn', '3 tháng', '4kg', 'Việt Nam', 'caydeban/a5.jpg', 'caydeban/a5.1.jpg', 'caydeban/a5.2.jpg', 'caydeban/a5.3.jpg', 'caydeban/a5.4.jpg', 149),
('BD1', 'Cây Đa Búp Đỏ', 'Để Bàn', '3 tháng', '3,5kg', 'Indonesia', 'caydeban/a11.jpg', 'caydeban/a11.1.jpg', 'caydeban/a11.2.jpg', 'caydeban/a11.3.jpg', 'caydeban/a11.4.jpg', 125),
('BG1', 'Cây Xương Rồng Bông Gòn', 'Xương Rồng', '3 tháng', '2kg', 'Việt Nam', 'xuongrong/a1.jpg', 'xuongrong/a1.1.jpg', 'xuongrong/a1.2.jpg', 'xuongrong/a1.3.jpg', 'xuongrong/a1.4.jpg', 69),
('BX1', 'Sen Đá Cánh Bướm Xanh', 'Sen Đá', '3 tháng', '2,5kg', 'Việt Nam', 'caysenda/a8.jpg', 'caysenda/a8.1.jpg', 'caysenda/a8.2.jpg', 'caysenda/a8.3.jpg', 'caysenda/a8.4.jpg', 25),
('CT1', 'Cây Dương Xỉ Cẩm Thạch', 'Để Bàn', '3 tháng', '5kg', 'Việt Nam', 'caydeban/a6.jpg', 'caydeban/a6.1.jpg', 'caydeban/a6.2.jpg', 'caydeban/a6.3.jpg', 'caydeban/a6.4.jpg', 125),
('DN1', 'Cây Dứa Cảnh Nến', 'Để Bàn', '3 tháng', '5kg', 'Việt Nam', 'caydeban/a9.jpg', 'caydeban/a9.1.jpg', 'caydeban/a9.2.jpg', 'caydeban/a9.3.jpg', 'caydeban/a9.4.jpg', 130),
('DT1', 'Cỏ Đồng Tiền', 'Thủy Sinh', '3 tháng', '1kg', 'Việt Nam', 'caythuysinh/a1.jpg', 'caythuysinh/a1.1.jpg', 'caythuysinh/a1.2.jpg', 'caythuysinh/a1.3.jpg', 'caythuysinh/a1.4.jpg', 99),
('DV1', 'Cây Cung Điện Vàng', 'Thủy Sinh', '3 tháng', '5kg', 'Việt Nam', 'caythuysinh/a4.jpg', 'caythuysinh/a4.1.jpg', 'caythuysinh/a4.2.jpg', 'caythuysinh/a4.3.jpg', 'caythuysinh/a4.4.jpg', 99),
('GS1', 'Cây Sen Đá Giọt Sương', 'Sen Đá', '3 tháng', '3kg', 'Việt Nam', 'caysenda/a3.jpg', 'caysenda/a3.1.jpg', 'caysenda/a3.2.jpg', 'caysenda/a3.3.jpg', 'caysenda/a3.4.jpg', 119),
('HP1', 'Cây Hạnh Phúc', 'Để Bàn', '3 tháng', '4kg', 'Châu Âu', 'caydeban/a12.jpg', 'caydeban/a12.1.jpg', 'caydeban/a12.2.jpg', 'caydeban/a12.3.jpg', 'caydeban/a12.4.jpg', 125),
('HP2', 'Sen Đá Hồng Phấn', 'Sen Đá', '3 tháng', '2kg', 'Mexico', 'caysenda/a6.jpg', 'caysenda/a6.1.jpg', 'caysenda/a6.2.jpg', 'caysenda/a6.3.jpg', 'caysenda/a6.4.jpg', 25),
('HT1', 'Cây Hương Thảo', 'Để Bàn', '3 tháng', '4,5kg', 'Địa Trung Hải & Tây Á', 'caydeban/a8.jpg', 'caydeban/a8.1.jpg', 'caydeban/a8.2.jpg', 'caydeban/a8.3.jpg', 'caydeban/a8.4.jpg', 125),
('KH1', 'Xương Rồng Kim Hổ', 'Xương Rồng', '3 tháng', '3kg', 'Sa Mạc Mehico', 'xuongrong/a3.jpg', 'xuongrong/a3.1.jpg', 'xuongrong/a3.2.jpg', 'xuongrong/a3.3.jpg', 'xuongrong/a3.4.jpg', 120),
('LL1', 'Cây trầu bà lá lỗ', 'Để Bàn', '3 tháng', '5kg', 'Costarica', 'caydeban/a1.jpg', 'caydeban/a1.1.jpg', 'caydeban/a1.2.jpg', 'caydeban/a1.3.jpg', 'caydeban/a1.4.jpg', 139),
('LT1', 'Sen Đá Lá Thơm', 'Sen Đá', '3 tháng', '2,5kg', 'Đà Lạt', 'caysenda/a7.jpg', 'caysenda/a7.1.jpg', 'caysenda/a7.2.jpg', 'caysenda/a7.3.jpg', 'caysenda/a7.4.jpg', 39),
('MN1', 'Cây Mạ Non', 'Để Bàn', '3 tháng', '2,5kg', 'DNA & Châu Phi', 'caydeban/a10.jpg', 'caydeban/a10.1.jpg', 'caydeban/a10.2.jpg', 'caydeban/a10.3.jpg', 'caydeban/a10.4.jpg', 99),
('ND1', 'Sen Đá Chuỗi Ngọc Đứng', 'Sen Đá', '3 tháng', '2kg', 'Việt Nam', 'caysenda/a4.jpg', 'caysenda/a4.1.jpg', 'caysenda/a4.2.jpg', 'caysenda/a4.3.jpg', 'caysenda/a4.4.jpg', 25),
('ND2', 'Sen Đá Nhím Đen', 'Sen Đá', '3 tháng', '2kg', 'Việt Nam', 'caysenda/a9.jpg', 'caysenda/a9.1.jpg', 'caysenda/a9.2.jpg', 'caysenda/a9.3.jpg', 'caysenda/a9.4.jpg', 30),
('RG1', 'Xương Rồng Gymno', 'Xương Rồng', '3 tháng', '3kg', 'Uruguay & Brazil', 'xuongrong/a2.jpg', 'xuongrong/a2.1.jpg', 'xuongrong/a2.2.jpg', 'xuongrong/a2.3.jpg', 'xuongrong/a2.4.jpg', 100),
('SD10', 'Combo 10 Cây Sen Đá', 'Sen Đá', '3 tháng', '5kg', 'Việt Nam', 'caysenda/a2.jpg', 'caysenda/a2.1.jpg', 'caysenda/a2.2.jpg', 'caysenda/a2.3.jpg', 'caysenda/a2.4.jpg', 149),
('SD20', 'Combo 20 Cây Sen Đá', 'Sen Đá', '3 tháng', '10kg', 'Việt Nam', 'caysenda/a1.jpg', 'caysenda/a1.1.jpg', 'caysenda/a1.2.jpg', 'caysenda/a1.3.jpg', 'caysenda/a1.4.jpg', 299),
('TB1', 'Cây Trầu Bà', 'Thủy Sinh', '3 tháng', '4kg', 'Việt Nam', 'caythuysinh/a3.jpg', 'caythuysinh/a3.1.jpg', 'caythuysinh/a3.2.jpg', 'caythuysinh/a3.3.jpg', 'caythuysinh/a3.4.jpg', 127),
('TD1', 'Sen Đá Thược Dược', 'Sen Đá', '3 tháng', '2kg', 'Mexico', 'caysenda/a5.jpg', 'caysenda/a5.1.jpg', 'caysenda/a5.2.jpg', 'caysenda/a5.3.jpg', 'caysenda/a5.4.jpg', 49),
('TS1', 'Cây Ngũ Gia Bì Thủy Sinh', 'Để Bàn & Thủy Sinh', '3 tháng', '4,5kg', 'Việt Nam', 'caydeban/a2.jpg', 'caydeban/a2.1.jpg', 'caydeban/a2.2.jpg', 'caydeban/a2.3.jpg', 'caydeban/a2.4.jpg', 125),
('TS2', 'Xương Rồng Kim Hổ Thủy Sinh', 'Thủy Sinh & Xương Rồng', '3 tháng', '5kg', 'Việt Nam', 'caythuysinh/a5.jpg', 'caythuysinh/a5.1.jpg', 'caythuysinh/a5.2.jpg', 'caythuysinh/a5.3.jpg', 'caythuysinh/a5.4.jpg', 110),
('TS3', 'Xương Rồng Thanh Sơn', 'Xương Rồng', '3 tháng', '3kg', 'Việt Nam', 'xuongrong/a4.jpg', 'xuongrong/a4.1.jpg', 'xuongrong/a4.2.jpg', 'xuongrong/a4.3.jpg', 'xuongrong/a4.4.jpg', 55),
('TT1', 'Cây Thủy Tùng', 'Để Bàn', '3 tháng', '6kg', 'Đông Nam Trung Quốc', 'caydeban/a4.jpg', 'caydeban/a4.1.jpg', 'caydeban/a4.2.jpg', 'caydeban/a4.3.jpg', 'caydeban/a4.4.jpg', 125),
('TT2', 'Cây Xương Rồng Tai Thỏ', 'Xương Rồng', '3 tháng', '2kg', 'Việt Nam', 'xuongrong/a5.jpg', 'xuongrong/a5.1.jpg', 'xuongrong/a5.2.jpg', 'xuongrong/a5.3.jpg', 'xuongrong/a5.4.jpg', 47),
('TX1', 'Cây Đuôi Công Táo Xanh', 'Để Bàn', '3 tháng', '6kg', ' Nam Mỹ', 'caydeban/a7.jpg', 'caydeban/a7.1.jpg', 'caydeban/a7.2.jpg', 'caydeban/a7.3.jpg', 'caydeban/a7.4.jpg', 139),
('VS1', 'Cây Trầu Bà Đế Vương Xanh', 'Để Bàn', '3 tháng', '4kg', 'Đảo Solomon', 'caydeban/a3.jpg', 'caydeban/a3.1.jpg', 'caydeban/a3.2.jpg', 'caydeban/a3.3.jpg', 'caydeban/a3.4.jpg', 129);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham2`
--

CREATE TABLE `sanpham2` (
  `id` varchar(5) NOT NULL,
  `tensp` varchar(30) NOT NULL,
  `gia` int(50) NOT NULL,
  `img` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `Id` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Ten` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `SDT` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`Id`, `Username`, `Password`, `Ten`, `Email`, `SDT`) VALUES
(0, 'huykhuc002', '12345', 'Khúc Thừa Huy', 'otaku2412002@gmail.com', 934754566),
(1, 'admin', '12345', 'Khúc Thừa Huy', 'huykhuc002@gmail.com', 934754566);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham2`
--
ALTER TABLE `sanpham2`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
