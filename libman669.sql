-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 21, 2024 lúc 12:01 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `libman669`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblbandoc669`
--

CREATE TABLE `tblbandoc669` (
  `tblNguoiDung669id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblbandoc669`
--

INSERT INTO `tblbandoc669` (`tblNguoiDung669id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblnguoidung669`
--

CREATE TABLE `tblnguoidung669` (
  `id` int(11) NOT NULL,
  `tk` varchar(255) NOT NULL,
  `mk` varchar(255) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `chucvu` tinyint(4) DEFAULT NULL CHECK (`chucvu` in (0,1,2))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblnguoidung669`
--

INSERT INTO `tblnguoidung669` (`id`, `tk`, `mk`, `ten`, `chucvu`) VALUES
(1, 'user1', 'password1', 'Nguyen Van A', 0),
(2, 'user2', 'password2', 'Tran Thi B', 1),
(3, 'user3', 'password3', 'Le Van C', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblnhacungcap669`
--

CREATE TABLE `tblnhacungcap669` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `sdt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblnhacungcap669`
--

INSERT INTO `tblnhacungcap669` (`id`, `ten`, `diachi`, `sdt`) VALUES
(1, 'Nhà cung cấp 1', 'Hà Nội', '0123456789'),
(2, 'Nhà cung cấp 2', 'Hồ Chí Minh', '0987654321');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblnhanvien669`
--

CREATE TABLE `tblnhanvien669` (
  `tblNguoiDung669id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblnhanvien669`
--

INSERT INTO `tblnhanvien669` (`tblNguoiDung669id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblphieumuon669`
--

CREATE TABLE `tblphieumuon669` (
  `id` int(11) NOT NULL,
  `ngayMuon` date DEFAULT NULL,
  `ngayPhaiTra` date DEFAULT NULL,
  `tblBanDoc669tblNguoiDung669id` int(11) DEFAULT NULL,
  `tblNhanVien669tblNguoiDung669id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblphieumuon669`
--

INSERT INTO `tblphieumuon669` (`id`, `ngayMuon`, `ngayPhaiTra`, `tblBanDoc669tblNguoiDung669id`, `tblNhanVien669tblNguoiDung669id`) VALUES
(1, '2024-01-10', '2024-01-20', 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblphieumuonchitiet669`
--

CREATE TABLE `tblphieumuonchitiet669` (
  `tblPhieuMuon669id` int(11) NOT NULL,
  `tblTaiLieu669id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblphieumuonchitiet669`
--

INSERT INTO `tblphieumuonchitiet669` (`tblPhieuMuon669id`, `tblTaiLieu669id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblphieunhaptailieu669`
--

CREATE TABLE `tblphieunhaptailieu669` (
  `id` int(11) NOT NULL,
  `ngayNhap` date DEFAULT NULL,
  `tblNhaCungCap669id` int(11) DEFAULT NULL,
  `tblNhanVien669tblNguoiDung669id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblphieunhaptailieu669`
--

INSERT INTO `tblphieunhaptailieu669` (`id`, `ngayNhap`, `tblNhaCungCap669id`, `tblNhanVien669tblNguoiDung669id`) VALUES
(1, '2024-11-12', 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblphieunhaptailieuchitiet669`
--

CREATE TABLE `tblphieunhaptailieuchitiet669` (
  `tblPhieuNhapTaiLieu669id` int(11) NOT NULL,
  `tblTaiLieu669id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblphieunhaptailieuchitiet669`
--

INSERT INTO `tblphieunhaptailieuchitiet669` (`tblPhieuNhapTaiLieu669id`, `tblTaiLieu669id`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblphieutra669`
--

CREATE TABLE `tblphieutra669` (
  `id` int(11) NOT NULL,
  `tblBanDoc669tblNguoiDung669id` int(11) DEFAULT NULL,
  `tblNhanVien669tblNguoiDung669id` int(11) DEFAULT NULL,
  `ngayTra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblphieutra669`
--

INSERT INTO `tblphieutra669` (`id`, `tblBanDoc669tblNguoiDung669id`, `tblNhanVien669tblNguoiDung669id`, `ngayTra`) VALUES
(1, 1, 2, '2024-01-18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblphieutrachitiet669`
--

CREATE TABLE `tblphieutrachitiet669` (
  `tblPhieuTraid` int(11) NOT NULL,
  `tblTaiLieu669id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblphieutrachitiet669`
--

INSERT INTO `tblphieutrachitiet669` (`tblPhieuTraid`, `tblTaiLieu669id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbltailieu669`
--

CREATE TABLE `tbltailieu669` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `tacgia` varchar(255) DEFAULT NULL,
  `namXB` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbltailieu669`
--

INSERT INTO `tbltailieu669` (`id`, `ten`, `tacgia`, `namXB`) VALUES
(1, 'Sách A', 'Tác giả 1', 2020),
(2, 'Sách B', 'Tác giả 2', 2019),
(3, 'Sách C', 'Tác giả 3', 2021);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblthebandoc669`
--

CREATE TABLE `tblthebandoc669` (
  `tblBanDoc669tblNguoiDung669id` int(11) NOT NULL,
  `ngayDangKi` date DEFAULT NULL,
  `ngayHetHan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblthebandoc669`
--

INSERT INTO `tblthebandoc669` (`tblBanDoc669tblNguoiDung669id`, `ngayDangKi`, `ngayHetHan`) VALUES
(1, '2024-11-21', '2025-11-21');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tblbandoc669`
--
ALTER TABLE `tblbandoc669`
  ADD PRIMARY KEY (`tblNguoiDung669id`);

--
-- Chỉ mục cho bảng `tblnguoidung669`
--
ALTER TABLE `tblnguoidung669`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblnhacungcap669`
--
ALTER TABLE `tblnhacungcap669`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblnhanvien669`
--
ALTER TABLE `tblnhanvien669`
  ADD PRIMARY KEY (`tblNguoiDung669id`);

--
-- Chỉ mục cho bảng `tblphieumuon669`
--
ALTER TABLE `tblphieumuon669`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblBanDoc669tblNguoiDung669id` (`tblBanDoc669tblNguoiDung669id`),
  ADD KEY `tblNhanVien669tblNguoiDung669id` (`tblNhanVien669tblNguoiDung669id`);

--
-- Chỉ mục cho bảng `tblphieumuonchitiet669`
--
ALTER TABLE `tblphieumuonchitiet669`
  ADD PRIMARY KEY (`tblPhieuMuon669id`,`tblTaiLieu669id`),
  ADD KEY `tblTaiLieu669id` (`tblTaiLieu669id`);

--
-- Chỉ mục cho bảng `tblphieunhaptailieu669`
--
ALTER TABLE `tblphieunhaptailieu669`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblNhaCungCap669id` (`tblNhaCungCap669id`),
  ADD KEY `tblNhanVien669tblNguoiDung669id` (`tblNhanVien669tblNguoiDung669id`);

--
-- Chỉ mục cho bảng `tblphieunhaptailieuchitiet669`
--
ALTER TABLE `tblphieunhaptailieuchitiet669`
  ADD KEY `tblTaiLieu669id` (`tblTaiLieu669id`),
  ADD KEY `tblPhieuNhapTaiLieu669id` (`tblPhieuNhapTaiLieu669id`,`tblTaiLieu669id`) USING BTREE;

--
-- Chỉ mục cho bảng `tblphieutra669`
--
ALTER TABLE `tblphieutra669`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblBanDoc669tblNguoiDung669id` (`tblBanDoc669tblNguoiDung669id`),
  ADD KEY `tblNhanVien669tblNguoiDung669id` (`tblNhanVien669tblNguoiDung669id`);

--
-- Chỉ mục cho bảng `tblphieutrachitiet669`
--
ALTER TABLE `tblphieutrachitiet669`
  ADD PRIMARY KEY (`tblPhieuTraid`,`tblTaiLieu669id`),
  ADD KEY `tblTaiLieu669id` (`tblTaiLieu669id`);

--
-- Chỉ mục cho bảng `tbltailieu669`
--
ALTER TABLE `tbltailieu669`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblthebandoc669`
--
ALTER TABLE `tblthebandoc669`
  ADD PRIMARY KEY (`tblBanDoc669tblNguoiDung669id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tblnguoidung669`
--
ALTER TABLE `tblnguoidung669`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tblnhacungcap669`
--
ALTER TABLE `tblnhacungcap669`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tblphieumuon669`
--
ALTER TABLE `tblphieumuon669`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tblphieunhaptailieu669`
--
ALTER TABLE `tblphieunhaptailieu669`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tblphieutra669`
--
ALTER TABLE `tblphieutra669`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbltailieu669`
--
ALTER TABLE `tbltailieu669`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tblbandoc669`
--
ALTER TABLE `tblbandoc669`
  ADD CONSTRAINT `tblbandoc669_ibfk_1` FOREIGN KEY (`tblNguoiDung669id`) REFERENCES `tblnguoidung669` (`id`);

--
-- Các ràng buộc cho bảng `tblnhanvien669`
--
ALTER TABLE `tblnhanvien669`
  ADD CONSTRAINT `tblnhanvien669_ibfk_1` FOREIGN KEY (`tblNguoiDung669id`) REFERENCES `tblnguoidung669` (`id`);

--
-- Các ràng buộc cho bảng `tblphieumuon669`
--
ALTER TABLE `tblphieumuon669`
  ADD CONSTRAINT `tblphieumuon669_ibfk_1` FOREIGN KEY (`tblBanDoc669tblNguoiDung669id`) REFERENCES `tblbandoc669` (`tblNguoiDung669id`),
  ADD CONSTRAINT `tblphieumuon669_ibfk_2` FOREIGN KEY (`tblNhanVien669tblNguoiDung669id`) REFERENCES `tblnhanvien669` (`tblNguoiDung669id`);

--
-- Các ràng buộc cho bảng `tblphieumuonchitiet669`
--
ALTER TABLE `tblphieumuonchitiet669`
  ADD CONSTRAINT `tblphieumuonchitiet669_ibfk_1` FOREIGN KEY (`tblPhieuMuon669id`) REFERENCES `tblphieumuon669` (`id`),
  ADD CONSTRAINT `tblphieumuonchitiet669_ibfk_2` FOREIGN KEY (`tblTaiLieu669id`) REFERENCES `tbltailieu669` (`id`);

--
-- Các ràng buộc cho bảng `tblphieunhaptailieu669`
--
ALTER TABLE `tblphieunhaptailieu669`
  ADD CONSTRAINT `tblphieunhaptailieu669_ibfk_1` FOREIGN KEY (`tblNhaCungCap669id`) REFERENCES `tblnhacungcap669` (`id`),
  ADD CONSTRAINT `tblphieunhaptailieu669_ibfk_2` FOREIGN KEY (`tblNhanVien669tblNguoiDung669id`) REFERENCES `tblnhanvien669` (`tblNguoiDung669id`);

--
-- Các ràng buộc cho bảng `tblphieunhaptailieuchitiet669`
--
ALTER TABLE `tblphieunhaptailieuchitiet669`
  ADD CONSTRAINT `tblphieunhaptailieuchitiet669_ibfk_1` FOREIGN KEY (`tblPhieuNhapTaiLieu669id`) REFERENCES `tblphieunhaptailieu669` (`id`),
  ADD CONSTRAINT `tblphieunhaptailieuchitiet669_ibfk_2` FOREIGN KEY (`tblTaiLieu669id`) REFERENCES `tbltailieu669` (`id`);

--
-- Các ràng buộc cho bảng `tblphieutra669`
--
ALTER TABLE `tblphieutra669`
  ADD CONSTRAINT `tblphieutra669_ibfk_1` FOREIGN KEY (`tblBanDoc669tblNguoiDung669id`) REFERENCES `tblbandoc669` (`tblNguoiDung669id`),
  ADD CONSTRAINT `tblphieutra669_ibfk_2` FOREIGN KEY (`tblNhanVien669tblNguoiDung669id`) REFERENCES `tblnhanvien669` (`tblNguoiDung669id`);

--
-- Các ràng buộc cho bảng `tblphieutrachitiet669`
--
ALTER TABLE `tblphieutrachitiet669`
  ADD CONSTRAINT `tblphieutrachitiet669_ibfk_1` FOREIGN KEY (`tblPhieuTraid`) REFERENCES `tblphieutra669` (`id`),
  ADD CONSTRAINT `tblphieutrachitiet669_ibfk_2` FOREIGN KEY (`tblTaiLieu669id`) REFERENCES `tbltailieu669` (`id`);

--
-- Các ràng buộc cho bảng `tblthebandoc669`
--
ALTER TABLE `tblthebandoc669`
  ADD CONSTRAINT `tblthebandoc669_ibfk_1` FOREIGN KEY (`tblBanDoc669tblNguoiDung669id`) REFERENCES `tblnguoidung669` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
