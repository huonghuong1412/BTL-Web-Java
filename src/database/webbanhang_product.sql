-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: webbanhang
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(1000) NOT NULL,
  `Price` double NOT NULL,
  `Quantity` int NOT NULL,
  `Image` varchar(1000) NOT NULL,
  `Description` varchar(3000) NOT NULL,
  `Material` varchar(250) NOT NULL,
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID_idx` (`CategoryID`),
  CONSTRAINT `FK_CategoryProduct` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Áo Len Cotton Cổ V Sọc Ngang Túi Lệch',100000,100,'enda-ao-len-co-v-soc-ngang-tui-lech_89ccc1e941cd4736b60dfa3ef34d0fcf_grande.jpg','Description 1','100% Ramie',1),(2,'Áo Cotton Hoa Nghệ Thuật Cổ V',100000,100,'ao-cotton-hoa-nghe-thuat-co-v_dfcbd85c9030451cb98de378be03614c_grande.jpg','Description 2','100% Ramie',1),(3,'Áo Sơ Mi Cotton Cổ V Phối Màu',100000,100,'enda-ao-so-mi-cotton-co-v-phoi-mau_b77365645d87449198a0c22dbf1e259a_grande.jpg','Description 3','100% Ramie',4),(4,'Quần Jean Harem Gấu In Chữ',100000,96,'enda-quan-jean-harem-gau-in-chu_ac655df1e2cd46928b86fcc84042e245_grande.jpg','Description 4','100% Ramie',4),(5,'Quần Linen Harem Retro Văn Học',100000,100,'quan-linen-harem-retro-van-hoc_1b4c2510294e41139f59792c5dd0f73d_grande.jpg','Description 5','100% Ramie',4),(7,'Áo Khoác Khí Chất Phối Vàng Trắng',100000,100,'ao-khoac-khi-chat-phoi-vang-trang_424a25d1e0d64b659b6c4d6e96bb6309_grande.jpg','Description 7','100% Ramie',2),(8,'Chân Váy Ramie Sắc Cầu Vòng',100000,100,'chan-vay-ramie-sac-cau-vong2_46e46fc932f248a19aac2a2cbfcb7c7d_grande.jpg','Description 8','100% Ramie',3),(9,'Đầm Retro Hoa Văn Nghệ Thuật',100000,100,'dam-retro-hoa-van-nghe-thuat_92c5ff12e87449b09722e8c94c5106b9_grande.jpg','Description 9','100% Ramie',3),(10,'Bộ Mặc Nhà Cotton Lụa Co Dãn Cổ Tim Ren Hoa',100000,100,'bo-mac-nha-cotton-lua-co-nghe-thuat-0_289b3d39276d40e3948690d083979c6f_grande.jpg','Description 10','100% Ramie',5),(11,'Áo Khoác Jean Denim Có Nón',200000,150,'ao-khoac-khi-chat-phoi-vang-trang_424a25d1e0d64b659b6c4d6e96bb6309_grande.jpg','Description 11','Cotton',2),(12,'Áo Khoác Len Dệt Kim Có Nón Retro Sọc',150000,100,'enda-ao-khoac-len-det-kim-co-non-retro-soc-1_c4940fe2ed4442cf868689c966794b58_grande.jpg','Description 12','Poliester',2),(13,'Áo Khoác Denim Linh Hoạt',120000,100,'enda-ao-khoac-len-det-kim-co-non-retro-soc-1_c4940fe2ed4442cf868689c966794b58_grande.jpg','Description 13','100% da',2),(14,'Áo Khoác Denim Linh Hoạt-1',120000,100,'enda-ao-khoac-len-det-kim-co-non-retro-soc-1_c4940fe2ed4442cf868689c966794b58_grande.jpg','Description 14','100% cotton',2),(15,'Áo Khoác Denim Linh Hoạt-2',120000,100,'enda-ao-khoac-len-det-kim-co-non-retro-soc-1_c4940fe2ed4442cf868689c966794b58_grande.jpg','Description 15','100% poli',2),(16,'Áo Khoác Denim Linh Hoạt-3',120000,100,'enda-ao-khoac-len-det-kim-co-non-retro-soc-1_c4940fe2ed4442cf868689c966794b58_grande.jpg','Description 16','Cotton',2),(17,'Giày Thể Thao Cột Dây Năng Động',150000,96,'enda-giay-the-thao-cot-day-nang-dong_597bb5e9c8fb4be4a306d2a14863daea_grande.jpg','Description 17','Da',6),(18,'Giày Thể Thao Nữ Cột Dây Mũi Tròn',100000,100,'enda-giay-the-thao-nu-cot-day-mui-tron-1_d1c029962cd140a6b4fae1791d1e2eba_grande.jpg','Description 16','Da bò',6),(19,'Giày Thể Thao Nữ Lưới Bố Thoáng Cao 5cm',300000,100,'enda-giay-the-thao-nu-luoi-bo-thoang-cao-5cm-1_21929cf58da14b0aa2cc5782eeced72c_grande.jpg','Description 16','Da thật',6),(20,'Giày Thể Thao Nữ Lưới Thoáng Juku',250000,100,'enda-giay-the-thao-nu-luoi-thoang-juku_cb74bf7d11954171834ca988ce994e39_grande.jpg','Description 16','Da Microfiber',6),(21,'Giày Thể Thao Trắng Dây Đen',200000,100,'8eb3672ac5c722997bd6_64cc7cd845864a4895fab4bd27c4655a_grande.jpg','Description 16','Da PU',6),(22,'Giày Thể Thao Bệt Đế Bằng',180000,100,'giay-the-thao-bet-de-bang_636375aaf8f54adea1e5f32be0721417_grande.jpg','Description 16','Cao su',6),(23,'Giày Sneaker Chỉ Đỏ',160000,100,'giay-sneaker-chi-do_0acb66a70f05449db5dc944e78622551_grande.jpg','Description 16','Cao su',6),(24,'Giày Martin Boots Cổ Ngắn',150000,100,'giay-martin_boot-co-ngan_888efd48e6754fc789b82399d8c2155b_grande.jpg','Description 16','Cao su',6),(26,'HuongZZ',100000,150,'8eb3672ac5c722997bd6_64cc7cd845864a4895fab4bd27c4655a_grande.jpg','Description17','Cao su',2),(32,'ABC',123456,100,'fdd064c1288a1597b3d829a11e6724d7.jpg','12345','Da Thật',3),(33,'Huong zzzzzzz',200000,100,'tui-da-that-deo-vai-ca-tinh_f1f0d2f8def04968aff945daa174ed5c_grande.jpg','San pham rat dep','Da Thật',1),(34,'Huong',123456,100,'enda-ao-khoac-denim-linh-hoat-2_298f334cf9224155bdf0d08649da8b74_grande.jpg','San pham rat dep','Da Thật',2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-03 12:10:33
