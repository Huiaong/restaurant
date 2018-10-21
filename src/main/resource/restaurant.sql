/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : restaurant

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-10-21 13:22:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `admin_password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `admin_enable_status` int(2) NOT NULL DEFAULT '0' COMMENT '//0:普通用户 1:店铺管理员用户 2:超级管理员用户',
  `create_time` datetime NOT NULL,
  `end_edit_time` datetime NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'admin', 'admin', '2', '2018-09-23 15:03:25', '2018-09-23 15:03:29');
INSERT INTO `tb_admin` VALUES ('2', 'storeAdmin', 'storeAdmin', '1', '2018-09-23 15:04:38', '2018-09-23 15:04:40');

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `product_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `end_edit_time` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `fk_tb_cart_tb_user` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tb_cart
-- ----------------------------
INSERT INTO `tb_cart` VALUES ('1', '1', '', '0000-00-00 00:00:00');
INSERT INTO `tb_cart` VALUES ('2', '2', '', '2018-10-17 21:57:45');
INSERT INTO `tb_cart` VALUES ('3', '3', null, '2018-10-12 22:04:11');
INSERT INTO `tb_cart` VALUES ('4', '4', null, '2018-10-17 21:58:40');
INSERT INTO `tb_cart` VALUES ('5', '5', null, '2018-09-13 22:06:29');
INSERT INTO `tb_cart` VALUES ('6', '6', null, '2018-10-18 22:03:51');
INSERT INTO `tb_cart` VALUES ('7', '7', null, '2018-10-20 22:06:40');

-- ----------------------------
-- Table structure for tb_customer
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_username` varchar(255) NOT NULL,
  `customer_password` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_gender` varchar(255) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `fk_customer_cart` FOREIGN KEY (`customer_id`) REFERENCES `tb_cart` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tb_customer
-- ----------------------------
INSERT INTO `tb_customer` VALUES ('1', 'Huiaong', '666666ddh', 'Huiaong', '男', '江西九江');
INSERT INTO `tb_customer` VALUES ('2', 'vip', '666666', '小薇', '女', '江西九江');
INSERT INTO `tb_customer` VALUES ('3', 'low', '123456', '张泉', '男', '江苏苏州');
INSERT INTO `tb_customer` VALUES ('4', 'cle', '123456', '张', '男', '江苏苏州');
INSERT INTO `tb_customer` VALUES ('5', 'svip', '123456', '张强', '男', '江苏苏州');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `product_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_customer` (`customer_id`),
  CONSTRAINT `fk_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `tb_customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1', '1', '1,2,3,4', '2018-09-28 16:21:30');
INSERT INTO `tb_order` VALUES ('2', '1', '36,35,38,37', '2018-09-29 16:21:34');
INSERT INTO `tb_order` VALUES ('3', '1', '36,35,38,37', '2018-10-09 16:21:38');
INSERT INTO `tb_order` VALUES ('4', '1', '36,35,38,37', '2018-10-10 16:21:41');
INSERT INTO `tb_order` VALUES ('5', '1', '36,35,38,37', '2018-10-11 16:21:46');
INSERT INTO `tb_order` VALUES ('6', '1', '36,35,38,37', '2018-10-12 16:21:50');
INSERT INTO `tb_order` VALUES ('7', '1', '36,35,38,37', '2018-10-13 16:21:53');
INSERT INTO `tb_order` VALUES ('8', '1', '36,35,38,37', '2018-10-14 16:21:57');
INSERT INTO `tb_order` VALUES ('9', '1', '35,34,33', '2018-10-15 16:22:00');
INSERT INTO `tb_order` VALUES ('10', '1', '35,34,33', '2018-10-16 16:22:04');
INSERT INTO `tb_order` VALUES ('11', '1', '36,35,38,37', '2018-10-17 16:22:06');
INSERT INTO `tb_order` VALUES ('12', '1', '35,34,33', '2018-10-18 16:22:10');
INSERT INTO `tb_order` VALUES ('13', '1', '33,38', '2018-10-19 16:30:07');
INSERT INTO `tb_order` VALUES ('14', '1', '27,28', '2018-10-19 10:03:32');
INSERT INTO `tb_order` VALUES ('15', '1', '1,5,33,35,36', '2018-10-20 17:02:04');
INSERT INTO `tb_order` VALUES ('16', '1', '36,35,38,9', '2018-10-20 17:04:15');
INSERT INTO `tb_order` VALUES ('17', '1', '31,6,35,34,38', '2018-10-20 17:05:58');
INSERT INTO `tb_order` VALUES ('18', '1', '13,12,11,7,8', '2018-10-20 17:06:04');
INSERT INTO `tb_order` VALUES ('19', '1', '9,10,17,16,15', '2018-10-20 17:06:11');
INSERT INTO `tb_order` VALUES ('20', '1', '21,20,18,22', '2018-10-20 17:06:17');
INSERT INTO `tb_order` VALUES ('21', '1', '26,25,24,29,28', '2018-10-20 17:06:23');
INSERT INTO `tb_order` VALUES ('22', '2', '4,3,2,31', '2018-10-21 13:07:13');

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `product_id` int(4) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_flavor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_repertory` int(4) NOT NULL,
  `product_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_price` decimal(4,0) NOT NULL,
  `product_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_enable_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
INSERT INTO `tb_product` VALUES ('1', '家常干锅排骨', '香辣味', '9997', 'http://localhost:8080/static/images/1c495c89.jpg', '138', '川菜', '', '1');
INSERT INTO `tb_product` VALUES ('2', '宫保鸡丁', '香辣味', '9995', 'http://localhost:8080/static/images/9480e76f.jpg', '138', '川菜', '', '1');
INSERT INTO `tb_product` VALUES ('3', '蚂蚁上树', '家常味', '9990', 'http://localhost:8080/static/images/b41be9c6.jpg', '138', '川菜', '有点辣', '1');
INSERT INTO `tb_product` VALUES ('4', '家常口水鸡', '香辣味', '9995', 'http://localhost:8080/static/images/d487012c.jpg', '138', '川菜', '', '1');
INSERT INTO `tb_product` VALUES ('5', '水煮鱼', '香辣味', '9998', 'http://localhost:8080/static/images/99428189.jpg', '138', '川菜', '', '1');
INSERT INTO `tb_product` VALUES ('6', '麻婆豆腐炒肉', '家常味', '9992', 'http://localhost:8080/static/images/e0d99a54.jpg', '138', '川菜', '', '1');
INSERT INTO `tb_product` VALUES ('7', '四喜丸子', '咸鲜味', '9997', 'http://localhost:8080/static/images/d878c72a.jpg', '138', '鲁菜', '', '1');
INSERT INTO `tb_product` VALUES ('8', '葱爆小酥肉', '咸鲜味', '9997', 'http://localhost:8080/static/images/273dff61.jpg', '138', '鲁菜', '', '1');
INSERT INTO `tb_product` VALUES ('9', '烧平鱼', '家常味', '9997', 'http://localhost:8080/static/images/1527003.jpg', '138', '鲁菜', '', '1');
INSERT INTO `tb_product` VALUES ('10', '醋溜土豆丝', '酸辣味', '9998', 'http://localhost:8080/static/images/cc781955.jpg', '138', '鲁菜', '', '1');
INSERT INTO `tb_product` VALUES ('11', '白萝卜丸子', '家常味', '9998', 'http://localhost:8080/static/images/df31037b.jpg', '138', '鲁菜', '', '1');
INSERT INTO `tb_product` VALUES ('12', '霸王肘子', '家常味', '9998', 'http://localhost:8080/static/images/44f5d2e.jpg', '138', '鲁菜', '', '1');
INSERT INTO `tb_product` VALUES ('13', '秘制黄焖鸡', '酱香味', '9998', 'http://localhost:8080/static/images/f61dbf7b.jpg', '138', '鲁菜', '', '1');
INSERT INTO `tb_product` VALUES ('14', '蒜蓉紫贝菜', '蒜香味', '9999', 'http://localhost:8080/static/images/511f877b.jpg', '138', '粤菜', '', '1');
INSERT INTO `tb_product` VALUES ('15', '香菇虾仁糯米烧麦', '咸鲜味', '9998', 'http://localhost:8080/static/images/b08c2b32.jpg', '138', '粤菜', '', '1');
INSERT INTO `tb_product` VALUES ('16', '白灼肥牛', '家常味', '9998', 'http://localhost:8080/static/images/b2a484cc.jpg', '138', '粤菜', '', '1');
INSERT INTO `tb_product` VALUES ('17', '菠萝咕老肉', '甜味', '9998', 'http://localhost:8080/static/images/bfcdc1c7.jpg', '138', '粤菜', '', '1');
INSERT INTO `tb_product` VALUES ('18', '酸菜烩牛杂', '酸辣味', '9998', 'http://localhost:8080/static/images/26ba56bc.jpg', '138', '粤菜', '', '1');
INSERT INTO `tb_product` VALUES ('19', '腊鸭芥菜煲', '咸鲜味', '9999', 'http://localhost:8080/static/images/ae1ccba.jpg', '138', '粤菜', '', '1');
INSERT INTO `tb_product` VALUES ('20', '脆皮烧肉', '咸鲜味', '9998', 'http://localhost:8080/static/images/be53bc84.jpg', '138', '粤菜', '', '1');
INSERT INTO `tb_product` VALUES ('21', '蜜汁叉烧包', '甜味', '9998', 'http://localhost:8080/static/images/1a83bb3f.jpg', '138', '粤菜', '', '1');
INSERT INTO `tb_product` VALUES ('22', '鸡仔饼', '家常味', '9998', 'http://localhost:8080/static/images/f1c01551.jpg', '138', '粤菜', '', '1');
INSERT INTO `tb_product` VALUES ('23', '大煮干丝', '咸鲜味', '9999', 'http://localhost:8080/static/images/9262b213.jpg', '138', '苏菜', '', '1');
INSERT INTO `tb_product` VALUES ('24', '无锡排骨', '茄汁味', '9998', 'http://localhost:8080/static/images/e0908e63.jpg', '138', '苏菜', '', '1');
INSERT INTO `tb_product` VALUES ('25', '四喜烤肉', '咸鲜味', '9998', 'http://localhost:8080/static/images/3d3ac093.jpg', '138', '苏菜', '', '1');
INSERT INTO `tb_product` VALUES ('26', '红烧狮子头', '家常味', '9993', 'http://localhost:8080/static/images/3011485b.jpg', '138', '苏菜', '', '1');
INSERT INTO `tb_product` VALUES ('27', '香菇面筋', '咸鲜味', '9998', 'http://localhost:8080/static/images/d7569792.jpg', '138', '苏菜', '', '1');
INSERT INTO `tb_product` VALUES ('28', '南京咸水鸭胸', '咸鲜味', '9997', 'http://localhost:8080/static/images/68f2b86b.jpg', '138', '苏菜', '', '1');
INSERT INTO `tb_product` VALUES ('29', '无锡酱排骨', '酱香味', '9998', 'http://localhost:8080/static/images/ca46e7b.jpg', '138', '苏菜', '', '1');
INSERT INTO `tb_product` VALUES ('30', '青团子', '甜味', '9999', 'http://localhost:8080/static/images/331673bf.jpg', '138', '苏菜', '', '1');
INSERT INTO `tb_product` VALUES ('31', '东坡肉', '咸甜味', '9991', 'http://localhost:8080/static/images/25897754.jpg', '138', '川菜', '', '1');
INSERT INTO `tb_product` VALUES ('32', '葱花炒蛋', '咸鲜味', '9997', 'http://localhost:8080/static/images/5552d706.jpg', '138', '川菜', '', '1');
INSERT INTO `tb_product` VALUES ('33', '懒人版无辣酸菜鱼', '咸鲜味', '9989', 'http://localhost:8080/static/images/a2fb6c2b.jpg', '138', '川菜', '', '1');
INSERT INTO `tb_product` VALUES ('34', '千贝边炖豆腐', '香辣味', '9993', 'http://localhost:8080/static/images/822c50c1.jpg', '138', '川菜', '', '1');
INSERT INTO `tb_product` VALUES ('35', '彩椒炒回锅肉', '咸鲜味', '9985', 'http://localhost:8080/static/images/b7e19a43.jpg', '138', '川菜', '', '1');
INSERT INTO `tb_product` VALUES ('36', '辣子鸡', '麻辣味', '9989', 'http://localhost:8080/static/images/6a4ccbab.jpg', '138', '川菜', '', '1');
INSERT INTO `tb_product` VALUES ('37', '鱼香肉丝', '家常味', '9993', 'http://localhost:8080/static/images/c75b789.jpg', '138', '川菜', '', '1');
INSERT INTO `tb_product` VALUES ('38', '啤酒鸭', '家常味', '9991', 'http://localhost:8080/static/images/f1d1820e.jpg', '138', '川菜', '', '1');
