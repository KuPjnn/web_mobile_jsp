/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : blogspringmvc

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 26/04/2020 16:06:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, NULL, NULL, NULL, NULL, 'the-thao', 'Thể thao');
INSERT INTO `category` VALUES (2, NULL, NULL, NULL, NULL, 'chinh-tri', 'Chính trị');
INSERT INTO `category` VALUES (3, NULL, NULL, NULL, NULL, 'xa-hoi', 'Xã hội');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortdescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_b7msf90eg2qug5akjhc5g9al0`(`categoryid`) USING BTREE,
  CONSTRAINT `FK_b7msf90eg2qug5akjhc5g9al0` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, NULL, NULL, NULL, NULL, '1', '1', '1', '1', 1);
INSERT INTO `news` VALUES (2, NULL, NULL, NULL, NULL, '2', '2', '2', '2', 1);
INSERT INTO `news` VALUES (3, NULL, NULL, NULL, NULL, '3', '3', '3', '3', 1);
INSERT INTO `news` VALUES (4, NULL, NULL, NULL, NULL, '4', '4', '4', '4', 1);
INSERT INTO `news` VALUES (5, NULL, NULL, NULL, NULL, '1', '1', '1', '1', 1);
INSERT INTO `news` VALUES (6, NULL, NULL, NULL, NULL, '2', '2', '2', '2', 1);
INSERT INTO `news` VALUES (7, NULL, NULL, NULL, NULL, '3', '3', '3', '3', 1);
INSERT INTO `news` VALUES (8, NULL, NULL, NULL, NULL, '4', '4', '4', '4', 1);
INSERT INTO `news` VALUES (9, NULL, NULL, NULL, NULL, '1', '1', '1', '1', 1);
INSERT INTO `news` VALUES (10, NULL, NULL, NULL, NULL, '2', '2', '2', '2', 1);
INSERT INTO `news` VALUES (11, NULL, NULL, NULL, NULL, '3', '3', '3', '3', 1);
INSERT INTO `news` VALUES (12, NULL, NULL, NULL, NULL, '4', '4', '4', '4', 1);
INSERT INTO `news` VALUES (13, NULL, NULL, NULL, NULL, '1', '1', '1', '1', 1);
INSERT INTO `news` VALUES (14, NULL, NULL, NULL, NULL, '2', '2', '2', '2', 1);
INSERT INTO `news` VALUES (15, NULL, NULL, NULL, NULL, '3', '3', '3', '3', 1);
INSERT INTO `news` VALUES (16, NULL, NULL, NULL, NULL, '4', '4', '4', '4', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, NULL, NULL, NULL, NULL, 'ADMIN', 'Quản trị');
INSERT INTO `role` VALUES (2, NULL, NULL, NULL, NULL, 'USER', 'Người dùng');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, NULL, NULL, NULL, NULL, 'trương tùng lâm', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 'admin');
INSERT INTO `user` VALUES (2, NULL, NULL, NULL, NULL, 'nguyễn văn A', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 'nguyenvana');
INSERT INTO `user` VALUES (3, NULL, NULL, NULL, NULL, 'nguyễn văn B', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 'nguyenvanb');
INSERT INTO `user` VALUES (4, NULL, NULL, NULL, NULL, 'hobalri', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 'hobalri');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `userid` bigint(20) NOT NULL,
  `roleid` bigint(20) NOT NULL,
  INDEX `FK_jpkvqqgndeonhr2alguthv64e`(`roleid`) USING BTREE,
  INDEX `FK_jwv62hhuqojjk7pot7kaex3e1`(`userid`) USING BTREE,
  CONSTRAINT `FK_jpkvqqgndeonhr2alguthv64e` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_jwv62hhuqojjk7pot7kaex3e1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (2, 2);
INSERT INTO `user_role` VALUES (3, 2);
INSERT INTO `user_role` VALUES (4, 1);

SET FOREIGN_KEY_CHECKS = 1;
