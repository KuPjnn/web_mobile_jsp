/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : webmobile

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 22/11/2019 15:12:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for atm
-- ----------------------------
DROP TABLE IF EXISTS `atm`;
CREATE TABLE `atm`  (
  `ID_ATM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ACCUONT_NUMBER` int(11) NOT NULL,
  `ACCUONT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BALANCE` double NOT NULL,
  PRIMARY KEY (`ID_ATM`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `ID_BILL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_NAME` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATE` date NOT NULL,
  `ADDRESS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STATUS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_BILL`) USING BTREE,
  INDEX `USER_NAME`(`USER_NAME`) USING BTREE,
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`USER_NAME`) REFERENCES `user` (`USER_NAME`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `ID_COMMENT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_NAME` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_PRODUCT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CONTENT` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATE_COMMENT` date NOT NULL,
  PRIMARY KEY (`ID_COMMENT`) USING BTREE,
  INDEX `ID_PRODUCT`(`ID_PRODUCT`) USING BTREE,
  INDEX `USER_NAME`(`USER_NAME`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`ID_PRODUCT`) REFERENCES `product` (`ID_PRODUCT`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`USER_NAME`) REFERENCES `user` (`USER_NAME`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('COMIP61', '17130000', 'IP6', 'Đỉnh cao cộng nghệ Nhật bản, tuyệt vời quá xá bà con ơi nên mua nhé.', '2019-11-20');
INSERT INTO `comment` VALUES ('COMIP62', '17130000', 'IP6', 'Iphone 6 ngon quá ta...', '2019-11-20');
INSERT INTO `comment` VALUES ('COMIP81', '17130000', 'IP8', 'Được của ló đấy ....', '2019-11-20');
INSERT INTO `comment` VALUES ('COMIP82', '17130000', 'IP8', 'Được của ló đấy ....', '2019-11-20');
INSERT INTO `comment` VALUES ('COMIPX1', '17130000', 'IPX', 'Được của ló đấy ....', '2019-11-20');

-- ----------------------------
-- Table structure for configuration
-- ----------------------------
DROP TABLE IF EXISTS `configuration`;
CREATE TABLE `configuration`  (
  `ID_CONF` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_PRODUCT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DISPLAY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CAMERA_FRONT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CAMERA_BACK` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RAM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CPU` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GPU` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BATTERY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `OS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SIM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_CONF`) USING BTREE,
  INDEX `ID_PRODUCT`(`ID_PRODUCT`) USING BTREE,
  CONSTRAINT `configuration_ibfk_1` FOREIGN KEY (`ID_PRODUCT`) REFERENCES `product` (`ID_PRODUCT`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of configuration
-- ----------------------------
INSERT INTO `configuration` VALUES ('CONFIP11', 'IP11', 'IPS LCD, 6.4″, Full HD+', '20 MP', '20MP + 12MP', '4 GB', '128 GB', 'Apple A12', 'Mali', '2500-mAh', 'IOS 13', '1 SIM');
INSERT INTO `configuration` VALUES ('CONFIP6', 'IP6', 'IPS LCD, 4.53″, HD+', '5 MP', '8MP', '2 GB', '32 GB', 'Apple A9', 'Mali', '2500-mAh', 'IOS 12', '1 SIM');
INSERT INTO `configuration` VALUES ('CONFIP7', 'IP7', 'IPS LCD, 6″, HD+', '8 MP', '12MP + 5MP', '2 GB', '32 GB', 'Apple A9', 'Mali', '2500-mAh', 'IOS 12', '1 SIM');
INSERT INTO `configuration` VALUES ('CONFIP8', 'IP8', 'IPS LCD, 6.3″, HD+', '20 MP', '12MP + 5MP', '3 GB', '64 GB', 'Apple A10', 'Mali', '2500-mAh', 'IOS 12', '1 SIM');
INSERT INTO `configuration` VALUES ('CONFIPX', 'IPX', 'IPS LCD, 6.53″, Full HD+', '20 MP', '12MP + 5MP', '3 GB', '64 GB', 'Apple A11', 'Mali', '2500-mAh', 'IOS 13', '1 SIM');

-- ----------------------------
-- Table structure for detail_order
-- ----------------------------
DROP TABLE IF EXISTS `detail_order`;
CREATE TABLE `detail_order`  (
  `ID_PRODUCT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_BILL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_PRODUCT`, `ID_BILL`) USING BTREE,
  INDEX `ID_PRODUCT`(`ID_PRODUCT`) USING BTREE,
  INDEX `ID_BILL`(`ID_BILL`) USING BTREE,
  CONSTRAINT `detail_order_ibfk_1` FOREIGN KEY (`ID_PRODUCT`) REFERENCES `product` (`ID_PRODUCT`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detail_order_ibfk_2` FOREIGN KEY (`ID_BILL`) REFERENCES `bill` (`ID_BILL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `ID_ITEMS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ITEMS_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_ITEMS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('DT', 'Điện thoại');
INSERT INTO `items` VALUES ('LT', 'Laptop');
INSERT INTO `items` VALUES ('MTB', 'Máy tính bảng');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `ID_PRODUCT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_ITEMS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_SUPPLIER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PRODUCT_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PRICE` double NOT NULL,
  `IMG` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TOTAL` int(11) NOT NULL,
  PRIMARY KEY (`ID_PRODUCT`) USING BTREE,
  INDEX `ID_ITEMS`(`ID_ITEMS`) USING BTREE,
  INDEX `ID_SUPPLIER`(`ID_SUPPLIER`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ID_ITEMS`) REFERENCES `items` (`ID_ITEMS`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`ID_SUPPLIER`) REFERENCES `supplier` (`ID_SUPPLIER`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('DELG3', 'LT', 'DEL', 'G3', 20000000, 'http://localhost:8080/web_mobile/img/laptop/dell-g3.jpg', 1000);
INSERT INTO `product` VALUES ('DELG7', 'LT', 'DEL', 'G7', 35000000, 'http://localhost:8080/web_mobile/img/laptop/dell-g7.jpg', 1000);
INSERT INTO `product` VALUES ('DELN3567', 'LT', 'DEL', 'N3567s', 25500000, 'http://localhost:8080/web_mobile/img/laptop/dell-ins-3567.jpg', 1000);
INSERT INTO `product` VALUES ('DELXPS13', 'LT', 'DEL', 'XPS 13', 35500000, 'http://localhost:8080/web_mobile/img/laptop/dell-xps-13.jpg', 1000);
INSERT INTO `product` VALUES ('DELXPS15', 'LT', 'DEL', 'XPS 15', 46000000, 'http://localhost:8080/web_mobile/img/laptop/dell-xps-15.jpg', 1000);
INSERT INTO `product` VALUES ('IP11', 'DT', 'APP', 'Iphone 11', 22000000, 'http://localhost:8080/web_mobile/img/phone/Iphone11.jpg', 1000);
INSERT INTO `product` VALUES ('IP6', 'DT', 'APP', 'Iphone 6', 5000000, 'http://localhost:8080/web_mobile/img/phone/Iphone6.jpg', 1000);
INSERT INTO `product` VALUES ('IP7', 'DT', 'APP', 'Iphone 7', 8000000, 'http://localhost:8080/web_mobile/img/phone/Iphone7.jpg', 1000);
INSERT INTO `product` VALUES ('IP8', 'DT', 'APP', 'Iphone 8', 15000000, 'http://localhost:8080/web_mobile/img/phone/Iphone8.jpg', 1000);
INSERT INTO `product` VALUES ('IPAD2018', 'MTB', 'APP', 'Ipad 2018', 10000000, 'http://localhost:8080/web_mobile/img/tablet/ipad-2018.jpg', 1000);
INSERT INTO `product` VALUES ('IPAD2019', 'MTB', 'APP', 'Ipad 2019', 16000000, 'http://localhost:8080/web_mobile/img/tablet/ipad-2019.jpg', 1000);
INSERT INTO `product` VALUES ('IPADAIR3', 'MTB', 'APP', 'Ipad Air 3', 8000000, 'http://localhost:8080/web_mobile/img/tablet/ipad-air-3.jpg', 1000);
INSERT INTO `product` VALUES ('IPADMINI5', 'MTB', 'APP', 'Ipad Mini 5', 6000000, 'http://localhost:8080/web_mobile/img/tablet/ipad-mini-5.jpg', 1000);
INSERT INTO `product` VALUES ('IPD11', 'MTB', 'APP', 'Ipad Pro 11', 22000000, 'http://localhost:8080/web_mobile/img/tablet/ipad-pro-11.jpg', 1000);
INSERT INTO `product` VALUES ('IPX', 'DT', 'APP', 'Iphone X', 20000000, 'http://localhost:8080/web_mobile/img/phone/IphoneX.jpg', 1000);
INSERT INTO `product` VALUES ('MAC12', 'LT', 'APP', 'Macbook 12', 20000000, 'http://localhost:8080/web_mobile/img/laptop/macbook-12.jpg', 1000);
INSERT INTO `product` VALUES ('MACAIR13', 'LT', 'APP', 'Macbook Air 13', 25000000, 'http://localhost:8080/web_mobile/img/laptop/macbook-air-13.jpg', 1000);
INSERT INTO `product` VALUES ('MACAIR15', 'LT', 'APP', 'Macbook Air 15', 30000000, 'http://localhost:8080/web_mobile/img/laptop/macbook-air15.jpg', 1000);
INSERT INTO `product` VALUES ('MACPRO13', 'LT', 'APP', 'Macbook Pro 13', 40000000, 'http://localhost:8080/web_mobile/img/laptop/macbook-pro-13.jpg', 1000);
INSERT INTO `product` VALUES ('MACPRO15', 'LT', 'APP', 'Macbook Pro 15', 60000000, 'http://localhost:8080/web_mobile/img/laptop/macbook-pro-15.jpg', 1000);
INSERT INTO `product` VALUES ('MI10', 'DT', 'XIA', 'Mi 10', 10090000, 'http://localhost:8080/web_mobile/img/phone/mi10.jpg', 1000);
INSERT INTO `product` VALUES ('MI6', 'DT', 'XIA', 'Mi 6', 4590000, 'http://localhost:8080/web_mobile/img/phone/mi6.jpg', 1000);
INSERT INTO `product` VALUES ('MI7', 'DT', 'XIA', 'Mi 7', 6690000, 'http://localhost:8080/web_mobile/img/phone/mi7.jpg', 1000);
INSERT INTO `product` VALUES ('MI8', 'DT', 'XIA', 'Mi 8', 8090000, 'http://localhost:8080/web_mobile/img/phone/mi8.jpg', 1000);
INSERT INTO `product` VALUES ('MI9', 'DT', 'XIA', 'Mi 9', 9890000, 'http://localhost:8080/web_mobile/img/phone/mi9.jpg', 1000);
INSERT INTO `product` VALUES ('TABA10', 'MTB', 'SAM', 'Galaxy A10', 10000000, 'http://localhost:8080/web_mobile/img/tablet/tab-a10.jpg', 1000);
INSERT INTO `product` VALUES ('TABA8', 'MTB', 'SAM', 'Galaxy A8', 7000000, 'http://localhost:8080/web_mobile/img/tablet/tab-a8.jpg', 1000);
INSERT INTO `product` VALUES ('TABS5', 'MTB', 'SAM', 'Galaxy S5', 15000000, 'http://localhost:8080/web_mobile/img/tablet/tab-s5.jpg', 1000);
INSERT INTO `product` VALUES ('TABS6', 'MTB', 'SAM', 'Galaxy S6', 20000000, 'http://localhost:8080/web_mobile/img/tablet/tab-s6.jpg', 1000);

-- ----------------------------
-- Table structure for slide
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide`  (
  `ID_SLIDE` int(11) NOT NULL AUTO_INCREMENT,
  `IMG_SLIDE` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_SLIDE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 791 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES (1, 'http://localhost:8080/web_mobile/img/slide/xiaomi-air-2-1.jpg');
INSERT INTO `slide` VALUES (2, 'http://localhost:8080/web_mobile/img/slide/tuyendung.jpg');
INSERT INTO `slide` VALUES (3, 'http://localhost:8080/web_mobile/img/slide/banner-web-lap-1.jpg');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `ID_SUPPLIER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_SUPPLIER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_SUPPLIER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('APP', 'Apple');
INSERT INTO `supplier` VALUES ('ASU', 'Asus');
INSERT INTO `supplier` VALUES ('DEL', 'Dell');
INSERT INTO `supplier` VALUES ('HP', 'Hp');
INSERT INTO `supplier` VALUES ('SAM', 'Samsung');
INSERT INTO `supplier` VALUES ('XIA', 'Xiaomi');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `USER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FULLNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PHONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PRIVILEGES` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ( 'hoanghuy', '123456', 'Hoang Huy', 'hoanghuy@gmail.com', '013245987', 'KH');
INSERT INTO `user` VALUES ('admin1', 'admin', 'ADMIN', 'admin@gmail.com', '0123456789', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
