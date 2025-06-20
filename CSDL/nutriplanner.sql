-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2025 at 06:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nutriplanner`
--

-- --------------------------------------------------------

--
-- Table structure for table `allergen`
--

CREATE TABLE `allergen` (
  `allergenId` int(11) NOT NULL,
  `allergenName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allergen`
--

INSERT INTO `allergen` (`allergenId`, `allergenName`) VALUES
(1, 'Not Dairy'),
(2, 'Not Gluten'),
(3, 'Not Nuts'),
(4, 'Not Soy');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryId`, `categoryName`) VALUES
(1, 'Breakfast'),
(2, 'Lunch'),
(3, 'Dinner'),
(4, 'Snacks'),
(5, 'Smoothies');

-- --------------------------------------------------------

--
-- Table structure for table `categorydish`
--

CREATE TABLE `categorydish` (
  `categoryId` int(11) NOT NULL,
  `dishId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorydish`
--

INSERT INTO `categorydish` (`categoryId`, `dishId`) VALUES
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 20),
(1, 21),
(1, 24),
(2, 5),
(2, 8),
(2, 17),
(2, 23),
(2, 24),
(2, 28),
(2, 31),
(3, 12),
(3, 16),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 25),
(3, 26),
(3, 31),
(3, 32),
(4, 1),
(4, 11),
(4, 12),
(4, 15),
(4, 18),
(4, 28),
(5, 1),
(5, 2),
(5, 3),
(5, 10),
(5, 17),
(5, 19),
(5, 22),
(5, 27),
(5, 28),
(5, 29),
(5, 30);

-- --------------------------------------------------------

--
-- Table structure for table `dishallergen`
--

CREATE TABLE `dishallergen` (
  `dishId` int(11) NOT NULL,
  `allergenId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dishallergen`
--

INSERT INTO `dishallergen` (`dishId`, `allergenId`) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 1),
(4, 2),
(4, 3),
(5, 1),
(5, 4),
(6, 2),
(7, 3),
(7, 4),
(8, 1),
(8, 2),
(9, 4),
(10, 1),
(10, 3),
(10, 4),
(11, 2),
(12, 1),
(12, 4),
(13, 2),
(13, 3),
(14, 1),
(15, 3),
(15, 4),
(16, 1),
(16, 2),
(17, 4),
(18, 2),
(19, 1),
(19, 3),
(20, 4),
(21, 1),
(21, 2),
(21, 3),
(22, 2),
(23, 4),
(24, 1),
(24, 4),
(25, 2),
(25, 3),
(26, 1),
(26, 2),
(27, 3),
(28, 4),
(29, 2),
(29, 3),
(30, 1),
(31, 3),
(31, 4),
(32, 2);

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `dishId` int(11) NOT NULL,
  `dishName` varchar(200) NOT NULL,
  `Dishimage` varchar(255) NOT NULL,
  `stepProcess` text DEFAULT NULL,
  `totalCalorie` float DEFAULT NULL,
  `totalProtein` float DEFAULT NULL,
  `totalFat` float DEFAULT NULL,
  `totalCarb` float DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`dishId`, `dishName`, `Dishimage`, `stepProcess`, `totalCalorie`, `totalProtein`, `totalFat`, `totalCarb`, `createdAt`, `updatedAt`) VALUES
(1, 'Salmon Salad', './assets/img/dish/dish1.jpg', 'Bước 1: Chuẩn bị nguyên liệu\nRửa sạch cá hồi, rau xanh và các loại hạt.\nBước 2: Chế biến cá hồi\nÁp chảo cá hồi đến khi chín vàng đều các mặt.\nBước 3: Chuẩn bị rau\nRửa sạch rau xanh và để ráo.\nBước 4: Trộn salad\nTrộn cá hồi, rau xanh, và các loại hạt với sốt vinaigrette nhẹ.\nBước 5: Trình bày\nCho salad ra đĩa, trang trí thêm lát chanh và rau thơm tùy thích.', 729.3, 29.8, 39.2, 64.4, '2025-05-25 06:02:55', '2025-06-11 14:10:49'),
(2, 'Beef Stir-fry', './assets/img/dish/dish2.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nThái lát thịt bò, rửa sạch rau bina và chuối.\r\nBước 2: Xào thịt\r\nPhi thơm tỏi, xào thịt bò với nước sốt đậu nành.\r\nBước 3: Thêm rau\r\nCho rau bina và chuối vào xào nhanh tay.\r\nBước 4: Nêm nếm\r\nNêm muối, đường và gia vị vừa ăn.\r\nBước 5: Trình bày\r\nCho ra đĩa và trang trí với hành lá.', 581.7, 21.5, 20.7, 77.4, '2025-05-25 06:03:10', '2025-06-08 16:25:13'),
(3, 'Vegan Bowl', './assets/img/dish/dish3.jpg', 'Bước 1: Chuẩn bị nguyên liệu\nRửa sạch các loại rau củ và thịt thay thế.\nBước 2: Luộc hoặc hấp\nLuộc rau củ và thịt thay thế đến chín.\nBước 3: Pha sốt\nTrộn các loại sốt chấm vegan.\nBước 4: Trộn tô\nXếp rau củ và thịt thay thế vào tô, rưới sốt.\nBước 5: Trang trí\nThêm hạt dinh dưỡng và rau thơm lên trên.', 1020.6, 16.4, 46.2, 134.9, '2025-05-25 06:03:42', '2025-06-11 15:52:53'),
(4, 'Chicken Soup', './assets/img/dish/dish4.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch thịt gà, rau cải và các gia vị.\r\nBước 2: Nấu nước dùng\r\nĐun sôi thịt gà cùng gia vị, hớt bọt.\r\nBước 3: Thêm rau\r\nCho rau cải vào nấu chín tới.\r\nBước 4: Nêm nếm\r\nNêm muối, tiêu cho vừa ăn.\r\nBước 5: Trình bày\r\nMúc ra bát, trang trí hành lá.', 725.3, 50.5, 39.2, 42.6, '2025-05-25 06:03:55', '2025-06-08 16:25:13'),
(5, 'Fruit Smoothie', './assets/img/dish/dish5.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch khoai lang, bông cải và mật ong.\r\nBước 2: Xay sinh tố\r\nCho nguyên liệu vào máy xay, xay nhuyễn.\r\nBước 3: Kiểm tra vị\r\nThêm đường hoặc mật ong nếu cần.\r\nBước 4: Rót ly\r\nRót ra ly và thêm đá tùy thích.\r\nBước 5: Trang trí\r\nTrang trí bằng lát trái cây tươi.', 869.7, 39, 29, 113.2, '2025-05-25 06:04:08', '2025-06-08 16:25:13'),
(6, 'Avocado Toast', './assets/img/dish/dish6.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nNghiền bơ, thái lát đậu phụ và đậu phộng.\r\nBước 2: Nướng bánh mì\r\nNướng bánh mì cho giòn đều.\r\nBước 3: Phết bơ\r\nPhết bơ lên mặt bánh mì.\r\nBước 4: Trang trí\r\nThêm đậu phụ và đậu phộng lên trên.\r\nBước 5: Thưởng thức\r\nDùng ngay khi bánh còn nóng.', 484, 21.9, 17.8, 59.2, '2025-05-25 06:04:28', '2025-06-08 16:25:13'),
(7, 'Oatmeal with Berries', './assets/img/dish/dish7.jpg', 'Bước 1: Chuẩn bị nguyên liệu\nRửa sạch quả mọng và yến mạch.\nBước 2: Nấu cháo\nNấu yến mạch với nước hoặc sữa.\nBước 3: Thêm quả mọng\nCho quả mọng lên trên cháo.\nBước 4: Thêm topping\nRắc hạt quinoa và sữa chua.\nBước 5: Thưởng thức\nDùng khi còn ấm.', 750, 35.7, 27.9, 89, '2025-05-25 06:04:38', '2025-06-11 14:11:51'),
(8, 'Grilled Chicken', './assets/img/dish/dish8.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch thịt gà, khoai lang và yến mạch.\r\nBước 2: Ướp thịt\r\nƯớp thịt với gia vị, muối tiêu.\r\nBước 3: Nướng thịt\r\nNướng thịt trên than hoặc lò nướng.\r\nBước 4: Chuẩn bị kèm\r\nLuộc khoai lang và nấu yến mạch.\r\nBước 5: Trình bày\r\nBày gà với khoai lang và yến mạch lên đĩa.', 269.9, 7.2, 14.8, 27, '2025-05-25 06:04:58', '2025-06-08 16:25:13'),
(9, 'Tofu Curry', './assets/img/dish/dish9.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch đậu phụ, lạc, gạo và bông cải.\r\nBước 2: Nấu nước cốt cà ri\r\nPhi hành, thêm nước cốt dừa và gia vị.\r\nBước 3: Thêm nguyên liệu\r\nCho đậu phụ, lạc, gạo và bông cải vào nấu.\r\nBước 4: Nêm nếm\r\nNêm muối, đường cho vừa ăn.\r\nBước 5: Trình bày\r\nMúc cà ri ra bát, rắc rau thơm.', 318.2, 14.5, 9, 44.8, '2025-05-25 06:05:16', '2025-06-08 16:25:13'),
(10, 'Egg Muffins', './assets/img/dish/dish10.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nĐánh tan trứng, rửa sạch rau bina và quả mọng.\r\nBước 2: Trộn hỗn hợp\r\nTrộn trứng với rau và quả mọng.\r\nBước 3: Đổ khuôn\r\nĐổ hỗn hợp vào khuôn muffin.\r\nBước 4: Nướng\r\nNướng trong lò 20 phút ở 180 độ C.\r\nBước 5: Thưởng thức\r\nLấy ra để nguội và dùng.', 224.1, 22.1, 7.6, 16.8, '2025-05-25 06:05:29', '2025-06-08 16:25:13'),
(11, 'Protein Pancakes', './assets/img/dish/dish11.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nTrộn bột pancake với cá hồi, bông cải và sữa.\r\nBước 2: Nướng bánh\r\nĐổ bột lên chảo, nướng chín vàng đều.\r\nBước 3: Lật mặt\r\nLật bánh và nướng mặt còn lại.\r\nBước 4: Trang trí\r\nThêm chút mật ong hoặc trái cây.\r\nBước 5: Thưởng thức\r\nDùng nóng để tận hưởng vị ngon.', 747.4, 38.3, 16, 112.7, '2025-05-25 06:05:49', '2025-06-08 16:25:13'),
(12, 'Zucchini Noodles', './assets/img/dish/dish12.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nGọt vỏ bí ngòi thành sợi, rửa sạch khoai lang, quả mọng và thịt bò.\r\nBước 2: Luộc sơ\r\nLuộc khoai lang và thịt bò cho chín tái.\r\nBước 3: Xào nhanh\r\nXào bí ngòi với gia vị nhẹ.\r\nBước 4: Trộn nguyên liệu\r\nTrộn tất cả nguyên liệu vào cùng.\r\nBước 5: Trình bày\r\nCho ra đĩa và thêm rau thơm.', 819.1, 24.7, 48.2, 71.5, '2025-05-25 06:06:04', '2025-06-08 16:25:13'),
(13, 'Shrimp Tacos', './assets/img/dish/dish13.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch tôm, đậu phụ, cà rốt và quả mọng.\r\nBước 2: Nấu tôm\r\nChiên hoặc hấp tôm đến khi chín.\r\nBước 3: Chuẩn bị tacos\r\nLàm nóng bánh tacos.\r\nBước 4: Nhồi nhân\r\nNhồi tôm và các nguyên liệu vào tacos.\r\nBước 5: Trang trí\r\nThêm rau thơm và nước sốt theo khẩu vị.', 548.9, 33.4, 26.2, 44.8, '2025-05-25 06:06:14', '2025-06-08 16:25:13'),
(14, 'Kale Chips', './assets/img/dish/dish14.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch cải kale, gạo, sữa và yến mạch.\r\nBước 2: Làm khô\r\nLàm khô cải kale và cắt thành miếng nhỏ.\r\nBước 3: Nướng\r\nNướng cải kale với gia vị cho giòn.\r\nBước 4: Chuẩn bị kèm\r\nLuộc gạo và nấu yến mạch.\r\nBước 5: Thưởng thức\r\nĂn kèm cải kale với các món khác.', 144, 4.2, 7, 16, '2025-05-25 06:06:24', '2025-06-08 16:25:13'),
(15, 'Lentil Stew', './assets/img/dish/dish15.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch đậu lăng, hạnh nhân, thịt bò và khoai lang.\r\nBước 2: Nấu đậu lăng\r\nNấu đậu lăng với nước dùng.\r\nBước 3: Thêm nguyên liệu\r\nCho hạnh nhân, thịt bò và khoai lang vào nồi.\r\nBước 4: Nêm nếm\r\nNêm muối tiêu và gia vị.\r\nBước 5: Trình bày\r\nMúc ra tô và trang trí rau thơm.', 794.3, 14.3, 44, 85.2, '2025-05-25 06:06:35', '2025-06-08 16:25:13'),
(16, 'Banana Smoothie', './assets/img/dish/dish16.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch quả mọng, mật ong và đậu phụ.\r\nBước 2: Xay sinh tố\r\nCho nguyên liệu vào máy xay, xay nhuyễn.\r\nBước 3: Thêm đá\r\nThêm đá nếu muốn lạnh.\r\nBước 4: Rót ly\r\nRót smoothie ra ly.\r\nBước 5: Trang trí\r\nThêm lát chuối hoặc quả mọng lên trên.', 606.1, 48.5, 20, 58, '2025-05-25 06:06:45', '2025-06-08 16:25:13'),
(17, 'Yogurt Parfait', './assets/img/dish/dish17.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch đậu phụ, hạnh nhân và quinoa.\r\nBước 2: Lớp đầu\r\nCho sữa chua vào ly.\r\nBước 3: Lớp thứ hai\r\nThêm đậu phụ, hạnh nhân và quinoa.\r\nBước 4: Lặp lại\r\nLặp lại các lớp.\r\nBước 5: Trang trí\r\nThêm trái cây tươi lên trên.', 788.3, 26.6, 31.9, 98.8, '2025-05-25 06:06:57', '2025-06-08 16:25:13'),
(18, 'Quinoa Salad', './assets/img/dish/dish18.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch quinoa, chuối và yến mạch.\r\nBước 2: Luộc quinoa\r\nLuộc quinoa đến khi mềm.\r\nBước 3: Trộn salad\r\nTrộn quinoa với chuối và yến mạch.\r\nBước 4: Thêm gia vị\r\nThêm muối, tiêu và dầu ôliu.\r\nBước 5: Trình bày\r\nCho ra đĩa và thêm rau thơm.', 548.3, 25.7, 29, 46.1, '2025-05-25 06:07:06', '2025-06-08 16:25:13'),
(19, 'Pumpkin Soup', './assets/img/dish/dish19.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch bí đỏ, cải bó xôi, quả mọng và trứng.\r\nBước 2: Nấu bí đỏ\r\nNấu bí đỏ cho mềm.\r\nBước 3: Xay nhuyễn\r\nXay bí đỏ với các nguyên liệu còn lại.\r\nBước 4: Nêm nếm\r\nNêm muối tiêu, gia vị.\r\nBước 5: Trình bày\r\nRót súp ra bát và trang trí rau thơm.', 315.4, 27.1, 12.3, 24, '2025-05-25 06:07:15', '2025-06-08 16:25:13'),
(20, 'Stuffed Peppers', './assets/img/dish/dish20.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch ớt chuông, sữa chua, khoai lang và yến mạch.\r\nBước 2: Nhồi ớt\r\nNhồi hỗn hợp sữa chua, khoai lang và yến mạch vào ớt.\r\nBước 3: Nướng ớt\r\nNướng ớt đến khi mềm.\r\nBước 4: Trình bày\r\nCho ra đĩa và trang trí.\r\nBước 5: Thưởng thức\r\nDùng nóng để ngon hơn.', 321.2, 10, 17.8, 30.4, '2025-05-25 06:07:30', '2025-06-08 16:25:13'),
(21, 'Peanut Butter Bars', './assets/img/dish/dish21.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nTrộn thịt gà, thịt bò và chuối.\r\nBước 2: Tạo khuôn\r\nĐổ hỗn hợp vào khuôn nướng.\r\nBước 3: Nướng\r\nNướng ở nhiệt độ vừa phải cho chín.\r\nBước 4: Làm nguội\r\nĐể nguội trước khi cắt.\r\nBước 5: Thưởng thức\r\nDùng làm món ăn nhẹ.', 976.8, 26, 53.4, 98.1, '2025-05-25 06:07:39', '2025-06-08 16:25:13'),
(22, 'Chia Pudding', './assets/img/dish/dish22.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nNgâm hạt chia, thịt bò, quinoa và cải bó xôi.\r\nBước 2: Pha trộn\r\nTrộn các nguyên liệu với sữa hoặc nước.\r\nBước 3: Ủ lạnh\r\nĐể hỗn hợp trong tủ lạnh qua đêm.\r\nBước 4: Trình bày\r\nCho pudding ra ly.\r\nBước 5: Thêm topping\r\nThêm trái cây hoặc hạt theo ý thích.', 1365.4, 49.7, 53.2, 171.9, '2025-05-25 06:07:48', '2025-06-08 16:25:13'),
(23, 'Spinach Omelette', './assets/img/dish/dish23.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nĐánh trứng, rửa sạch đậu phụ, yến mạch và khoai lang.\r\nBước 2: Xào rau\r\nXào đậu phụ và khoai lang.\r\nBước 3: Đổ trứng\r\nĐổ trứng vào chảo, thêm rau đã xào.\r\nBước 4: Nướng\r\nChiên đến khi trứng chín.\r\nBước 5: Trình bày\r\nDùng nóng cùng rau thơm.', 594.8, 31.1, 40.7, 26, '2025-05-25 06:08:02', '2025-06-08 16:25:13'),
(24, 'Cauliflower Rice', './assets/img/dish/dish24.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch bông cải xanh, sữa chua và chuối.\r\nBước 2: Xay nhuyễn\r\nXay bông cải xanh thành hạt gạo.\r\nBước 3: Nấu\r\nXào bông cải với sữa chua và chuối.\r\nBước 4: Nêm nếm\r\nNêm muối và gia vị.\r\nBước 5: Trình bày\r\nCho ra đĩa và trang trí.', 211.8, 7.6, 3.2, 38.1, '2025-05-25 06:08:19', '2025-06-08 16:25:13'),
(25, 'Greek Salad', './assets/img/dish/dish25.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch cơm, rau cải và cá hồi.\r\nBước 2: Trộn salad\r\nTrộn các nguyên liệu với dầu ôliu và gia vị.\r\nBước 3: Thêm topping\r\nThêm phô mai feta và ô liu.\r\nBước 4: Trình bày\r\nCho ra đĩa sâu lòng.\r\nBước 5: Thưởng thức\r\nDùng ngay để giữ độ tươi ngon.', 314.1, 24.4, 9, 33.8, '2025-05-25 06:08:32', '2025-06-08 16:25:13'),
(26, 'Berry Shake', './assets/img/dish/dish26.jpg', 'Bước 1: Chuẩn bị nguyên liệu\nRửa sạch thịt gà, thịt bò và quinoa.\nBước 2: Xay sinh tố\nXay nguyên liệu với đá và mật ong.\nBước 3: Rót ly\nRót sinh tố ra ly.\nBước 4: Trang trí\nThêm quả mọng tươi.\nBước 5: Thưởng thức\nDùng lạnh.', 421.4, 12.6, 19.1, 49.9, '2025-05-25 06:08:45', '2025-06-11 14:12:37'),
(27, 'Mushroom Risotto', './assets/img/dish/dish27.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch yến mạch, khoai lang và cải bó xôi.\r\nBước 2: Xào nấm\r\nXào nấm với tỏi và bơ.\r\nBước 3: Nấu risotto\r\nNấu yến mạch với nước dùng và nấm.\r\nBước 4: Thêm gia vị\r\nNêm muối, tiêu vừa ăn.\r\nBước 5: Trình bày\r\nRắc phô mai lên trên và dùng nóng.', 553.6, 31.3, 28.6, 42.8, '2025-05-25 06:08:54', '2025-06-08 16:25:13'),
(28, 'Energy Balls', './assets/img/dish/dish28.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch bông cải xanh, cá hồi và đậu phụ.\r\nBước 2: Trộn nguyên liệu\r\nTrộn tất cả nguyên liệu với mật ong và hạt.\r\nBước 3: Tạo viên\r\nTạo các viên nhỏ bằng tay.\r\nBước 4: Làm lạnh\r\nĐể trong tủ lạnh ít nhất 1 giờ.\r\nBước 5: Thưởng thức\r\nDùng làm món ăn nhẹ.', 586.4, 40.7, 18.7, 63.9, '2025-05-25 06:09:03', '2025-06-08 16:25:13'),
(29, 'Grilled Tofu', './assets/img/dish/dish29.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch thịt gà, rau bina và mật ong.\r\nBước 2: Ướp đậu phụ\r\nƯớp đậu phụ với gia vị.\r\nBước 3: Nướng\r\nNướng đậu phụ đến khi vàng giòn.\r\nBước 4: Chuẩn bị rau\r\nLuộc rau bina hoặc xào nhanh.\r\nBước 5: Trình bày\r\nBày đậu phụ và rau lên đĩa, rưới mật ong.', 594.7, 44, 18.2, 63.7, '2025-05-25 06:09:14', '2025-06-08 16:25:13'),
(30, 'Turkey Wrap', './assets/img/dish/dish30.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\nRửa sạch thịt gà tây, cá hồi và quả mọng.\r\nBước 2: Chuẩn bị bánh\r\nLàm nóng bánh wrap.\r\nBước 3: Nhồi nhân\r\nNhồi thịt gà tây, cá hồi và quả mọng vào bánh.\r\nBước 4: Cuộn bánh\r\nCuộn chặt bánh lại.\r\nBước 5: Thưởng thức\r\nCắt vừa ăn và dùng ngay.', 661.7, 40.3, 24, 71.2, '2025-05-25 06:09:22', '2025-06-08 16:25:13'),
(31, 'Mango Sticky Rice', './assets/img/dish/dish31.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\n  - Vo sạch gạo nếp và ngâm trong nước khoảng 4 tiếng.\r\n  - Gọt vỏ xoài, cắt thành lát mỏng.\r\nBước 2: Hấp gạo nếp\r\n  - Hấp gạo nếp đến khi chín mềm.\r\nBước 3: Pha nước cốt dừa\r\n  - Đun nước cốt dừa với đường và một chút muối.\r\nBước 4: Trộn gạo nếp\r\n  - Trộn gạo nếp với nước cốt dừa, để thấm khoảng 15 phút.\r\nBước 5: Trình bày\r\n  - Cho gạo nếp ra đĩa, xếp xoài lên trên.\r\n  - Rưới thêm nước cốt dừa và rắc mè rang trang trí.', 945.7, 34.2, 39.6, 113.1, '2025-05-25 06:09:33', '2025-06-08 16:25:13'),
(32, 'Spaghetti Carbonara', './assets/img/dish/dish32.jpg', 'Bước 1: Chuẩn bị nguyên liệu\r\n  - Luộc mì spaghetti theo hướng dẫn trên bao bì.\r\n  - Băm nhỏ tỏi và thái lát thịt ba chỉ hoặc pancetta.\r\nBước 2: Xào thịt\r\n  - Phi tỏi và xào thịt đến khi giòn.\r\nBước 3: Chuẩn bị sốt\r\n  - Đánh trứng với phô mai Parmesan và tiêu đen.\r\nBước 4: Trộn mì\r\n  - Trộn mì vừa luộc vào chảo thịt, tắt bếp.\r\n  - Đổ hỗn hợp trứng vào trộn nhanh để sốt sánh mượt.\r\nBước 5: Trình bày\r\n  - Cho ra đĩa, rắc thêm phô mai và tiêu.', 965, 55.4, 44.3, 86.2, '2025-05-25 06:09:44', '2025-06-08 16:25:13');

-- --------------------------------------------------------

--
-- Table structure for table `dishingredient`
--

CREATE TABLE `dishingredient` (
  `dishId` int(11) NOT NULL,
  `ingredientId` int(11) NOT NULL,
  `amount` float DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dishingredient`
--

INSERT INTO `dishingredient` (`dishId`, `ingredientId`, `amount`, `createdAt`) VALUES
(1, 1, 169.2, '2025-05-25 07:56:57'),
(1, 8, 117.5, '2025-05-25 07:56:57'),
(1, 11, 274.5, '2025-05-25 07:56:57'),
(2, 2, 71.4, '2025-05-25 07:56:57'),
(2, 14, 162.5, '2025-05-25 07:56:57'),
(2, 23, 118.6, '2025-05-25 07:56:57'),
(3, 3, 231.3, '2025-05-25 07:56:57'),
(3, 11, 46.5, '2025-05-25 07:56:57'),
(3, 14, 259.3, '2025-05-25 07:56:57'),
(4, 11, 235.1, '2025-05-25 07:56:57'),
(4, 20, 265.2, '2025-05-25 07:56:57'),
(4, 23, 143.7, '2025-05-25 07:56:57'),
(5, 6, 261, '2025-05-25 07:56:57'),
(5, 12, 168.8, '2025-05-25 07:56:57'),
(5, 26, 207.1, '2025-05-25 07:56:57'),
(6, 8, 185, '2025-05-25 07:56:57'),
(6, 18, 66.9, '2025-05-25 07:56:57'),
(6, 27, 63.9, '2025-05-25 07:56:57'),
(7, 4, 149.4, '2025-05-25 07:56:57'),
(7, 19, 66, '2025-05-25 07:56:57'),
(7, 28, 247.1, '2025-05-25 07:56:57'),
(8, 8, 14.4, '2025-05-25 07:56:57'),
(8, 15, 207.2, '2025-05-25 07:56:57'),
(8, 26, 50.7, '2025-05-25 07:56:57'),
(9, 6, 135.7, '2025-05-25 07:56:57'),
(9, 18, 31.5, '2025-05-25 07:56:57'),
(9, 20, 112.8, '2025-05-25 07:56:57'),
(10, 4, 227.8, '2025-05-25 07:56:57'),
(10, 11, 26, '2025-05-25 07:56:57'),
(10, 23, 22.3, '2025-05-25 07:56:57'),
(11, 6, 215.1, '2025-05-25 07:56:57'),
(11, 14, 20.3, '2025-05-25 07:56:57'),
(11, 21, 206.6, '2025-05-25 07:56:57'),
(12, 3, 216.8, '2025-05-25 07:56:57'),
(12, 4, 134.7, '2025-05-25 07:56:57'),
(12, 26, 278.5, '2025-05-25 07:56:57'),
(13, 4, 264.6, '2025-05-25 07:56:57'),
(13, 7, 204.3, '2025-05-25 07:56:57'),
(13, 27, 106.9, '2025-05-25 07:56:57'),
(14, 14, 27.3, '2025-05-25 07:56:57'),
(14, 15, 51.7, '2025-05-25 07:56:57'),
(14, 20, 46.2, '2025-05-25 07:56:57'),
(15, 1, 227.6, '2025-05-25 07:56:57'),
(15, 3, 142.3, '2025-05-25 07:56:57'),
(15, 26, 232, '2025-05-25 07:56:57'),
(16, 4, 78.3, '2025-05-25 07:56:57'),
(16, 12, 194.5, '2025-05-25 07:56:57'),
(16, 27, 162, '2025-05-25 07:56:57'),
(17, 1, 234.4, '2025-05-25 07:56:57'),
(17, 19, 204.2, '2025-05-25 07:56:57'),
(17, 27, 100.4, '2025-05-25 07:56:57'),
(18, 2, 212, '2025-05-25 07:56:57'),
(18, 15, 131.8, '2025-05-25 07:56:57'),
(18, 27, 121.8, '2025-05-25 07:56:57'),
(19, 4, 83.4, '2025-05-25 07:56:57'),
(19, 11, 90, '2025-05-25 07:56:57'),
(19, 23, 109.1, '2025-05-25 07:56:57'),
(20, 15, 98.5, '2025-05-25 07:56:57'),
(20, 26, 90.4, '2025-05-25 07:56:57'),
(20, 28, 65.1, '2025-05-25 07:56:57'),
(21, 2, 251.2, '2025-05-25 07:56:57'),
(21, 3, 203.1, '2025-05-25 07:56:57'),
(21, 9, 270, '2025-05-25 07:56:57'),
(22, 3, 274.3, '2025-05-25 07:56:57'),
(22, 19, 292.8, '2025-05-25 07:56:57'),
(22, 23, 164.6, '2025-05-25 07:56:57'),
(23, 15, 112.1, '2025-05-25 07:56:57'),
(23, 26, 272.8, '2025-05-25 07:56:57'),
(23, 27, 225, '2025-05-25 07:56:57'),
(24, 2, 22.2, '2025-05-25 07:56:57'),
(24, 6, 137.7, '2025-05-25 07:56:57'),
(24, 28, 10.6, '2025-05-25 07:56:57'),
(25, 20, 74.3, '2025-05-25 07:56:57'),
(25, 21, 42.8, '2025-05-25 07:56:57'),
(25, 23, 113.3, '2025-05-25 07:56:57'),
(26, 3, 21.3, '2025-05-25 07:56:57'),
(26, 9, 84.8, '2025-05-25 07:56:57'),
(26, 19, 152.6, '2025-05-25 07:56:57'),
(27, 15, 17.6, '2025-05-25 07:56:57'),
(27, 23, 192.7, '2025-05-25 07:56:57'),
(27, 26, 265.5, '2025-05-25 07:56:57'),
(28, 6, 41.5, '2025-05-25 07:56:57'),
(28, 21, 191.2, '2025-05-25 07:56:57'),
(28, 27, 124.4, '2025-05-25 07:56:57'),
(29, 9, 192.1, '2025-05-25 07:56:57'),
(29, 12, 59.1, '2025-05-25 07:56:57'),
(29, 23, 248.1, '2025-05-25 07:56:57'),
(30, 4, 74.5, '2025-05-25 07:56:57'),
(30, 9, 155.6, '2025-05-25 07:56:57'),
(30, 21, 220.1, '2025-05-25 07:56:57'),
(31, 10, 154.6, '2025-05-25 07:56:57'),
(31, 13, 289.8, '2025-05-25 07:56:57'),
(31, 24, 154.5, '2025-05-25 07:56:57'),
(31, 25, 11.6, '2025-05-25 07:56:57'),
(32, 5, 109.8, '2025-05-25 07:56:57'),
(32, 11, 182, '2025-05-25 07:56:57'),
(32, 16, 126.2, '2025-05-25 07:56:57'),
(32, 17, 201.6, '2025-05-25 07:56:57'),
(32, 22, 108.6, '2025-05-25 07:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `dishtag`
--

CREATE TABLE `dishtag` (
  `dishId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dishtag`
--

INSERT INTO `dishtag` (`dishId`, `tagId`) VALUES
(1, 3),
(1, 4),
(1, 5),
(1, 9),
(2, 6),
(2, 9),
(3, 4),
(3, 5),
(3, 6),
(4, 2),
(4, 4),
(4, 7),
(5, 4),
(5, 7),
(6, 4),
(6, 5),
(6, 9),
(7, 2),
(7, 3),
(8, 5),
(8, 9),
(9, 3),
(10, 3),
(11, 5),
(12, 5),
(13, 2),
(13, 6),
(14, 1),
(14, 4),
(14, 6),
(14, 9),
(15, 6),
(16, 6),
(16, 9),
(17, 4),
(17, 9),
(18, 9),
(19, 6),
(20, 5),
(20, 8),
(20, 9),
(21, 9),
(22, 6),
(23, 5),
(24, 5),
(24, 6),
(25, 1),
(25, 4),
(25, 5),
(26, 9),
(27, 1),
(27, 2),
(27, 9),
(28, 6),
(28, 9),
(29, 4),
(30, 5),
(31, 3),
(31, 4),
(31, 5),
(32, 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedbackId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `message` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackId`, `userId`, `phone`, `rating`, `message`, `createdAt`, `email`) VALUES
(1, 32, '0966782856', 2, '1', '2025-06-08 05:08:34', 'huy123@gmail.com'),
(2, 32, '0966785831', 1, '12', '2025-06-08 05:08:49', 'huy123@gmail.com'),
(3, 32, '0358064055', 2, '123', '2025-06-08 05:12:07', 'huy123@gmail.com'),
(4, 32, '0966782859', 4, '123', '2025-06-08 05:33:08', 'huy123@gmail.com'),
(5, 32, '0966785836', 4, '22', '2025-06-08 16:01:08', 'huy123@gmail.com'),
(6, 32, '0966785836', 3, '1', '2025-06-09 06:20:58', 'huy123@gmail.com'),
(7, 32, '0966785836', 3, '1', '2025-06-09 06:21:14', 'huy123@gmail.com'),
(8, 32, '0966785836', 3, '1', '2025-06-09 12:22:08', 'huy123@gmail.com'),
(9, 37, '0912234232', 2, 'jjjj', '2025-06-09 13:31:38', 'minh123@gmail.com'),
(10, 32, '0966782856', 2, '123', '2025-06-10 06:27:06', 'huy123@gmail.com'),
(11, 32, '0966782858', 2, '1', '2025-06-11 15:51:29', 'huy123@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredientId` int(11) NOT NULL,
  `ingredientName` varchar(200) NOT NULL,
  `caloriesPer100g` float DEFAULT NULL,
  `proteinPer100g` float DEFAULT NULL,
  `fatPer100g` float DEFAULT NULL,
  `carbPer100g` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ingredientId`, `ingredientName`, `caloriesPer100g`, `proteinPer100g`, `fatPer100g`, `carbPer100g`) VALUES
(1, 'Almonds', 117.49, 1.57, 4.29, 18.15),
(2, 'Banana', 149.6, 5.03, 8.04, 14.28),
(3, 'Beef', 197.02, 3.58, 9.38, 24.57),
(4, 'Berries', 71.26, 7.6, 2.06, 5.58),
(5, 'Black Pepper', 150.97, 13.55, 3.85, 15.53),
(6, 'Broccoli', 113.93, 4.06, 0.45, 23.41),
(7, 'Carrot', 129.74, 1.48, 7.62, 13.81),
(8, 'Cheese', 162.07, 5.1, 5.27, 23.56),
(9, 'Chicken', 74.39, 2.27, 5.23, 4.56),
(10, 'Coconut Milk', 179.79, 13.92, 8.23, 12.51),
(11, 'Egg', 123.89, 7.71, 9.37, 2.18),
(12, 'Honey', 208.68, 13.85, 5.4, 26.17),
(13, 'Mango', 159.82, 3.32, 6.3, 22.46),
(14, 'Milk', 195.64, 1.73, 7.76, 29.72),
(15, 'Oats', 93.02, 2.52, 4.58, 10.43),
(16, 'Pancetta', 64.2, 2.57, 4.96, 2.32),
(17, 'Parmesan Cheese', 124.22, 5.77, 3.18, 18.13),
(18, 'Peanuts', 190.08, 9.35, 7.32, 21.7),
(19, 'Quinoa', 207.32, 6.47, 8.28, 26.73),
(20, 'Rice', 91.91, 5.35, 5.39, 5.5),
(21, 'Salmon', 223.93, 14.14, 6.49, 27.24),
(22, 'Spaghetti', 223.08, 10.67, 9.52, 23.68),
(23, 'Spinach', 132.39, 12.69, 1.99, 15.93),
(24, 'Sticky Rice', 122.84, 1.08, 5.16, 18.02),
(25, 'Sugar', 127.62, 11.98, 5.74, 7.01),
(26, 'Sweet Potato', 106.26, 2.42, 9.02, 3.85),
(27, 'Tofu', 89.16, 9.64, 4.88, 1.67),
(28, 'Yogurt', 205.07, 8.13, 7.83, 25.52);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tagId` int(11) NOT NULL,
  `tagName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tagId`, `tagName`) VALUES
(1, 'Low Carb'),
(2, 'High Protein'),
(3, 'Keto'),
(4, 'Vegetarian'),
(5, 'Vegan'),
(6, 'Paleo'),
(7, 'Diabetic Friendly'),
(8, 'Heart Healthy'),
(9, 'Gluten Free'),
(10, 'Weight Loss');

-- --------------------------------------------------------

--
-- Table structure for table `userfavorite`
--

CREATE TABLE `userfavorite` (
  `userId` int(11) NOT NULL,
  `dishId` int(11) NOT NULL,
  `likedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `isLiked` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userfavorite`
--

INSERT INTO `userfavorite` (`userId`, `dishId`, `likedAt`, `isLiked`) VALUES
(1, 11, '2025-05-25 08:50:04', 1),
(1, 18, '2025-05-25 08:50:04', 1),
(2, 2, '2025-05-25 08:50:04', 1),
(2, 15, '2025-05-25 08:50:04', 1),
(2, 30, '2025-05-25 08:50:04', 1),
(3, 14, '2025-05-25 08:50:04', 1),
(3, 15, '2025-05-25 08:50:04', 1),
(4, 6, '2025-05-25 08:50:04', 1),
(4, 25, '2025-05-25 08:50:04', 1),
(5, 7, '2025-05-25 08:50:04', 1),
(5, 14, '2025-05-25 08:50:04', 1),
(6, 24, '2025-05-25 08:50:04', 1),
(6, 30, '2025-05-25 08:50:04', 1),
(7, 21, '2025-05-25 08:50:04', 1),
(7, 32, '2025-05-25 08:50:04', 1),
(8, 2, '2025-05-25 08:50:04', 1),
(8, 3, '2025-05-25 08:50:04', 1),
(8, 15, '2025-05-25 08:50:04', 1),
(8, 29, '2025-05-25 08:50:04', 1),
(9, 5, '2025-05-25 08:50:04', 1),
(9, 30, '2025-05-25 08:50:04', 1),
(11, 18, '2025-05-25 08:50:04', 1),
(11, 26, '2025-05-25 08:50:04', 1),
(12, 14, '2025-05-25 08:50:04', 1),
(12, 23, '2025-05-25 08:50:04', 1),
(13, 6, '2025-05-25 08:50:04', 1),
(13, 7, '2025-05-25 08:50:04', 1),
(13, 18, '2025-05-25 08:50:04', 1),
(13, 30, '2025-05-25 08:50:04', 1),
(18, 8, '2025-05-25 08:50:04', 1),
(18, 13, '2025-05-25 08:50:04', 1),
(18, 16, '2025-05-25 08:50:04', 1),
(18, 19, '2025-05-25 08:50:04', 1),
(19, 13, '2025-05-25 08:50:04', 1),
(19, 18, '2025-05-25 08:50:04', 1),
(19, 28, '2025-05-25 08:50:04', 1),
(20, 11, '2025-05-25 08:50:04', 1),
(20, 17, '2025-05-25 08:50:04', 1),
(21, 8, '2025-05-25 08:50:04', 1),
(21, 15, '2025-05-25 08:50:04', 1),
(21, 24, '2025-05-25 08:50:04', 1),
(22, 6, '2025-05-25 08:50:04', 1),
(22, 18, '2025-05-25 08:50:04', 1),
(22, 21, '2025-05-25 08:50:04', 1),
(23, 5, '2025-05-25 08:50:04', 1),
(23, 27, '2025-05-25 08:50:04', 1),
(23, 28, '2025-05-25 08:50:04', 1),
(25, 4, '2025-05-25 08:50:04', 1),
(25, 19, '2025-05-25 08:50:04', 1),
(25, 22, '2025-05-25 08:50:04', 1),
(32, 1, '2025-06-10 09:52:22', 1),
(32, 2, '2025-06-11 13:41:26', 0),
(32, 3, '2025-06-11 13:41:22', 0),
(32, 4, '2025-06-11 13:41:21', 0),
(32, 5, '2025-06-10 05:15:45', 0),
(32, 6, '2025-06-10 06:26:45', 1),
(32, 7, '2025-06-10 06:26:46', 1),
(32, 8, '2025-06-11 15:48:55', 0),
(32, 11, '2025-06-09 10:41:15', 0),
(32, 12, '2025-06-09 04:53:34', 0),
(32, 14, '2025-06-10 09:55:22', 0),
(32, 18, '2025-06-09 04:53:35', 0),
(32, 20, '2025-06-09 04:53:17', 0),
(32, 21, '2025-06-09 01:40:13', 0),
(32, 22, '2025-06-09 04:53:36', 0),
(32, 23, '2025-06-09 04:53:36', 0),
(32, 24, '2025-06-09 04:53:26', 0),
(32, 25, '2025-06-10 09:55:21', 0),
(32, 27, '2025-06-11 10:06:03', 0),
(32, 29, '2025-06-09 04:53:31', 0),
(37, 3, '2025-06-09 13:25:07', 1),
(37, 4, '2025-06-09 17:00:02', 0),
(37, 5, '2025-06-09 17:00:14', 1),
(37, 6, '2025-06-09 17:00:13', 1),
(37, 8, '2025-06-09 17:00:39', 0),
(39, 3, '2025-06-11 15:11:35', 1),
(39, 4, '2025-06-11 15:11:36', 1),
(39, 5, '2025-06-11 15:11:39', 1),
(39, 6, '2025-06-11 15:11:40', 1),
(39, 7, '2025-06-11 15:11:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `displayName` varchar(255) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `userAvatar` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `email`, `displayName`, `passwordHash`, `userAvatar`, `isAdmin`, `createdAt`) VALUES
(1, 'user1', 'User 1', '0b14d501a594442a01c6859541bcb3e8164d183d32937b851835442f69d5c94e', './assets/img/avatars/user1.jpg', 1, '2025-05-25 08:10:51'),
(2, 'user2', 'User 2', '6cf615d5bcaac778352a8f1f3360d23f02f34ec182e259897fd6ce485d7870d4', './assets/img/avatars/user2.jpg', 1, '2025-05-25 08:10:51'),
(3, 'user3', 'User 3', '5906ac361a137e2d286465cd6588ebb5ac3f5ae955001100bc41577c3d751764', './assets/img/avatars/user3.jpg', 1, '2025-05-25 08:10:51'),
(4, 'user4', 'User 4', 'b97873a40f73abedd8d685a7cd5e5f85e4a9cfb83eac26886640a0813850122b', './assets/img/avatars/user4.jpg', 0, '2025-05-25 08:10:51'),
(5, 'user5', 'User 5', '8b2c86ea9cf2ea4eb517fd1e06b74f399e7fec0fef92e3b482a6cf2e2b092023', './assets/img/avatars/user5.jpg', 0, '2025-05-25 08:10:51'),
(6, 'user6', 'User 6', '598a1a400c1dfdf36974e69d7e1bc98593f2e15015eed8e9b7e47a83b31693d5', './assets/img/avatars/user6.jpg', 0, '2025-05-25 08:10:51'),
(7, 'user7', 'User 7', '5860836e8f13fc9837539a597d4086bfc0299e54ad92148d54538b5c3feefb7c', './assets/img/avatars/user7.jpg', 0, '2025-05-25 08:10:51'),
(8, 'user8', 'User 8', '57f3ebab63f156fd8f776ba645a55d96360a15eeffc8b0e4afe4c05fa88219aa', './assets/img/avatars/user8.jpg', 0, '2025-05-25 08:10:51'),
(9, 'user9', 'User 9', '9323dd6786ebcbf3ac87357cc78ba1abfda6cf5e55cd01097b90d4a286cac90e', './assets/img/avatars/user9.jpg', 0, '2025-05-25 08:10:51'),
(10, 'user10', 'User 10', 'aa4a9ea03fcac15b5fc63c949ac34e7b0fd17906716ac3b8e58c599cdc5a52f0', './assets/img/avatars/user10.jpg', 0, '2025-05-25 08:10:51'),
(11, 'user11', 'User 11', '53d453b0c08b6b38ae91515dc88d25fbecdd1d6001f022419629df844f8ba433', './assets/img/avatars/user11.jpg', 0, '2025-05-25 08:10:51'),
(12, 'user12', 'User 12', 'b3d17ebbe4f2b75d27b6309cfaae1487b667301a73951e7d523a039cd2dfe110', './assets/img/avatars/user12.jpg', 0, '2025-05-25 08:10:51'),
(13, 'user13', 'User 13', '48caafb68583936afd0d78a7bfd7046d2492fad94f3c485915f74bb60128620d', './assets/img/avatars/user13.jpg', 0, '2025-05-25 08:10:51'),
(14, 'user14', 'User 14', 'c6863e1db9b396ed31a36988639513a1c73a065fab83681f4b77adb648fac3d6', './assets/img/avatars/user14.jpg', 0, '2025-05-25 08:10:51'),
(15, 'user15', 'User 15', 'c63c2d34ebe84032ad47b87af194fedd17dacf8222b2ea7f4ebfee3dd6db2dfb', './assets/img/avatars/user15.jpg', 0, '2025-05-25 08:10:51'),
(16, 'user16', 'User 16', '17a3379984b560dc311bb921b7a46b28aa5cb495667382f887a44a7fdbca7a7a', './assets/img/avatars/user16.jpg', 0, '2025-05-25 08:10:51'),
(17, 'user17', 'User 17', '69bfb918de05145fba9dcee9688dfb23f6115845885e48fa39945eebb99d8527', './assets/img/avatars/user17.jpg', 0, '2025-05-25 08:10:51'),
(18, 'user18', 'User 18', 'd2042d75a67922194c045da2600e1c92ff6d87e8fb6e0208606665f2d1dfa892', './assets/img/avatars/user18.jpg', 0, '2025-05-25 08:10:51'),
(19, 'user19', 'User 19', '5790ac3d0b8ae8afc72c2c6fb97654f2b73651c328de0a3b74854ade562dd17a', './assets/img/avatars/user19.jpg', 0, '2025-05-25 08:10:51'),
(20, 'user20', 'User 20', '7535d8f2d8c35d958995610f971287288ab5e8c82a3c4fdc2b6fb5d757a5b9f8', './assets/img/avatars/user20.jpg', 0, '2025-05-25 08:10:51'),
(21, 'user21', 'User 21', '91a9ef3563010ea1af916083f9fb03a117d4d0d2a697f82368da1f737629f717', './assets/img/avatars/user21.jpg', 0, '2025-05-25 08:10:51'),
(22, 'user22', 'User 22', 'd23c1038532dc71d0a60a7fb3d330d7606b7520e9e5ee0ddcdb27ee1bd5bc0cd', './assets/img/avatars/user22.jpg', 0, '2025-05-25 08:10:51'),
(23, 'user23', 'User 23', '8b807aa0505a00b3ef49e26a2ade8e31fcd6c700d1a3aeee971b49d73da8e8ff', './assets/img/avatars/user23.jpg', 0, '2025-05-25 08:10:51'),
(24, 'user24', 'User 24', 'fc8a9296208a0b281f84690423c5d77785e493f435e6292cc322840f543729d3', './assets/img/avatars/user24.jpg', 0, '2025-05-25 08:10:51'),
(25, 'user25', 'User 25', '0b544d6d8da1d1af25318e97e0ac5f6bc70bba49919463dc0074ede01a49d381', './assets/img/avatars/user25.jpg', 0, '2025-05-25 08:10:51'),
(27, 'Huyphung123@gmail.com', 'huyphung123', '$2y$10$J/2DLB/6BeyFCp/3JX1VbO0VHjeh7wqId7SHBriA7MDJEpkoPlKKK', './assets/img/avatars/default.jpg', 0, '2025-06-01 10:49:22'),
(28, 'huyphung1234@gmail.com', 'huyPhung1234', '$2y$10$YXezeoD1yefNw8KzR27ChOP43tc/epfIUB2GeTRyg.ksQXYxMxO2G', './assets/img/avatars/default.jpg', 0, '2025-06-01 11:05:43'),
(29, 'Huyphung12345@gmail.com', 'HuyHuy123', '$2y$10$FMtjOW.ZO/.cFfoSZiA0munWCfLa0l1/pEEzO4g46RxLGlbAJf/8W', './assets/img/avatars/default.jpg', 0, '2025-06-01 16:46:40'),
(30, 'Huyphung234@gmail.com', 'Huyphung234', '$2y$10$wwVCDJ9huosdkIFWlgg3..SVnMT8GUsDbB2XzalUp1baIwKVRST/.', './assets/img/avatars/default.jpg', 0, '2025-06-02 01:30:35'),
(31, 'Huyphung234567@gmail.com', 'Huyphung1234123', '$2y$10$xpWDSwt.oEecT6s1oVZxmO1Km6/Pl4DkliYAAHTrlJA1rgpT2XQRy', './assets/img/avatars/default.jpg', 0, '2025-06-02 09:00:33'),
(32, 'huy123@gmail.com', 'HuyPhung1231234', '$2y$10$recXQr42FFPvcOjf4vKkGegfZjNTg912C8Q4pUrJiuy6/lJ8jlxHS', './assets/img/avatars/default.jpg', 0, '2025-06-02 11:30:49'),
(33, 'Huyphung@gmail.com', 'HuyPhung', '$2y$10$XrCKkLWMBswtVsK6ENakmevFashakSmROWOo0oc5ULLGWy7VnlEV2', './assets/img/avatars/default.jpg', 0, '2025-06-08 03:48:41'),
(34, 'Huyphung987@gmail.com', '987PhungHuy', '$2y$10$1AmPpL8yrbZhZ3TVjx4Exelykrr4JLC.hOHcUglpy9a2kuiwaChhi', './assets/img/avatars/default.jpg', 0, '2025-06-08 05:28:30'),
(35, 'Huyphung123987@gmail.com', '123987Hu', '$2y$10$WFFZ42jRua3n7BwPJ6QEW.ekr3kQkiqTFii9ZKpJW8zbJUq4J71Qu', './assets/img/avatars/default.jpg', 0, '2025-06-08 05:32:05'),
(36, 'dominh@fd.com', 'HuyPhung1', '$2y$10$HY1rJH5655XRa3HmBBTTgefCK4sXmVeN10.BGekTnEFQdlQZPKqe2', './assets/img/avatars/default.jpg', 0, '2025-06-09 13:21:39'),
(37, 'minh123@gmail.com', 'Minh', '$2y$10$pJgAaTYRBsENdNkO5h0GHOJnukvAK9yn.URHb/LvO8ggyf6RgjgVW', './assets/img/avatars/default.jpg', 0, '2025-06-09 13:22:39'),
(38, 'Huyphung12345678@gmail.com', 'HuyPhung123CCC', '$2y$10$VRIVxrLvgUa40FhVYDlN1ePIqoPUy1iUEL9lvlOk08z0rMWdBtkBe', './assets/img/avatars/default.jpg', 0, '2025-06-09 17:25:13'),
(39, 'huy1234@gmail.com', 'HuyDepTrai', '$2y$10$KgZU28Frm1bMQgewVWuLCeVc81UjIAYaR7dvaIcJhbh8jIpMV53kK', './assets/img/avatars/default.jpg', 0, '2025-06-11 15:10:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allergen`
--
ALTER TABLE `allergen`
  ADD PRIMARY KEY (`allergenId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `categorydish`
--
ALTER TABLE `categorydish`
  ADD PRIMARY KEY (`categoryId`,`dishId`),
  ADD KEY `dishId` (`dishId`);

--
-- Indexes for table `dishallergen`
--
ALTER TABLE `dishallergen`
  ADD PRIMARY KEY (`dishId`,`allergenId`),
  ADD KEY `allergenId` (`allergenId`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`dishId`);

--
-- Indexes for table `dishingredient`
--
ALTER TABLE `dishingredient`
  ADD PRIMARY KEY (`dishId`,`ingredientId`),
  ADD KEY `ingredientId` (`ingredientId`);

--
-- Indexes for table `dishtag`
--
ALTER TABLE `dishtag`
  ADD PRIMARY KEY (`dishId`,`tagId`),
  ADD KEY `tagId` (`tagId`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredientId`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tagId`);

--
-- Indexes for table `userfavorite`
--
ALTER TABLE `userfavorite`
  ADD PRIMARY KEY (`userId`,`dishId`),
  ADD KEY `mealId` (`dishId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allergen`
--
ALTER TABLE `allergen`
  MODIFY `allergenId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `dishId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categorydish`
--
ALTER TABLE `categorydish`
  ADD CONSTRAINT `categorydish_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorydish_ibfk_2` FOREIGN KEY (`dishId`) REFERENCES `dishes` (`dishId`) ON DELETE CASCADE;

--
-- Constraints for table `dishallergen`
--
ALTER TABLE `dishallergen`
  ADD CONSTRAINT `dishallergen_ibfk_1` FOREIGN KEY (`dishId`) REFERENCES `dishes` (`dishId`) ON DELETE CASCADE,
  ADD CONSTRAINT `dishallergen_ibfk_2` FOREIGN KEY (`allergenId`) REFERENCES `allergen` (`allergenId`) ON DELETE CASCADE;

--
-- Constraints for table `dishingredient`
--
ALTER TABLE `dishingredient`
  ADD CONSTRAINT `dishingredient_ibfk_1` FOREIGN KEY (`dishId`) REFERENCES `dishes` (`dishId`) ON DELETE CASCADE,
  ADD CONSTRAINT `dishingredient_ibfk_2` FOREIGN KEY (`ingredientId`) REFERENCES `ingredients` (`ingredientId`) ON DELETE CASCADE;

--
-- Constraints for table `dishtag`
--
ALTER TABLE `dishtag`
  ADD CONSTRAINT `dishtag_ibfk_1` FOREIGN KEY (`dishId`) REFERENCES `dishes` (`dishId`) ON DELETE CASCADE,
  ADD CONSTRAINT `dishtag_ibfk_2` FOREIGN KEY (`tagId`) REFERENCES `tag` (`tagId`) ON DELETE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE;

--
-- Constraints for table `userfavorite`
--
ALTER TABLE `userfavorite`
  ADD CONSTRAINT `userfavorite_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE,
  ADD CONSTRAINT `userfavorite_ibfk_2` FOREIGN KEY (`dishId`) REFERENCES `dishes` (`dishId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
