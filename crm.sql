/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50133
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50133
File Encoding         : 65001

Date: 2019-10-06 20:33:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `clue`
-- ----------------------------
DROP TABLE IF EXISTS `clue`;
CREATE TABLE `clue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `company` varchar(64) NOT NULL,
  `post` varchar(64) NOT NULL,
  `sex` int(11) NOT NULL,
  `phone` varchar(64) NOT NULL,
  `remarks` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clue
-- ----------------------------
INSERT INTO `clue` VALUES ('1', '0', '钢铁侠', '贾维斯', '管理', '0', '1785', '复仇者');

-- ----------------------------
-- Table structure for `contract`
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `userid` int(11) NOT NULL,
  `approvalname` varchar(64) NOT NULL,
  `customerid` int(11) NOT NULL,
  `amount` double(11,0) NOT NULL,
  `signtime` varchar(64) NOT NULL,
  `begintime` varchar(64) NOT NULL,
  `endtime` varchar(64) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `goodsname` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES ('4', '20190923-2', '手机王', '1', '管理员', '1', '19600', '2019-09-02', '2019-09-28', '2020-09-25', '1', '手机');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `userid` int(11) NOT NULL,
  `nexttime` varchar(64) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `custypeid` int(11) NOT NULL,
  `province` varchar(64) NOT NULL,
  `city` varchar(64) NOT NULL,
  `area` varchar(64) NOT NULL,
  `address` varchar(64) NOT NULL,
  `level` int(11) NOT NULL,
  `contacts` varchar(64) NOT NULL,
  `sex` int(11) NOT NULL,
  `phone` varchar(64) NOT NULL,
  `role` int(11) NOT NULL,
  `post` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `free` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '123', '1', '未指定', '0', '1', '北京', '市辖区', '东城区', '123', '0', '55', '0', '123', '0', '123', '1', '1');
INSERT INTO `customer` VALUES ('2', 'ko', '0', '未指定', '1', '1', '北京', '市辖区', '西城区', 'zhan', '0', '55', '0', '178', '0', '123', '1', '0');

-- ----------------------------
-- Table structure for `custype`
-- ----------------------------
DROP TABLE IF EXISTS `custype`;
CREATE TABLE `custype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custype
-- ----------------------------
INSERT INTO `custype` VALUES ('1', '自媒体');

-- ----------------------------
-- Table structure for `c_client`
-- ----------------------------
DROP TABLE IF EXISTS `c_client`;
CREATE TABLE `c_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `sex` int(11) NOT NULL,
  `tel` varchar(32) NOT NULL,
  `qq` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `infos` varchar(255) NOT NULL,
  `linkstatus` int(11) NOT NULL DEFAULT '0',
  `clientstatus` int(11) NOT NULL DEFAULT '0',
  `purposestatus` int(11) NOT NULL DEFAULT '0',
  `assessstatus` int(11) NOT NULL DEFAULT '0',
  `execstatus` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `clienttypeid` int(11) NOT NULL,
  `operatorids` varchar(255) NOT NULL,
  `createoperatorid` int(11) NOT NULL,
  `createdate` varchar(32) NOT NULL,
  `srcid` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `comments` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_client
-- ----------------------------

-- ----------------------------
-- Table structure for `c_clienttype`
-- ----------------------------
DROP TABLE IF EXISTS `c_clienttype`;
CREATE TABLE `c_clienttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_clienttype
-- ----------------------------

-- ----------------------------
-- Table structure for `c_operator`
-- ----------------------------
DROP TABLE IF EXISTS `c_operator`;
CREATE TABLE `c_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(32) NOT NULL,
  `pass` varchar(128) NOT NULL,
  `name` varchar(32) NOT NULL,
  `groupid` int(11) NOT NULL,
  `power` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_operator
-- ----------------------------

-- ----------------------------
-- Table structure for `c_orderdetails`
-- ----------------------------
DROP TABLE IF EXISTS `c_orderdetails`;
CREATE TABLE `c_orderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `count` double(11,2) NOT NULL,
  `amount` double(11,2) NOT NULL,
  `desc` double(11,2) NOT NULL,
  `comments` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_orderdetails
-- ----------------------------

-- ----------------------------
-- Table structure for `c_product`
-- ----------------------------
DROP TABLE IF EXISTS `c_product`;
CREATE TABLE `c_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `amount` double NOT NULL,
  `info` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_product
-- ----------------------------

-- ----------------------------
-- Table structure for `c_src`
-- ----------------------------
DROP TABLE IF EXISTS `c_src`;
CREATE TABLE `c_src` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_src
-- ----------------------------

-- ----------------------------
-- Table structure for `c_workgroup`
-- ----------------------------
DROP TABLE IF EXISTS `c_workgroup`;
CREATE TABLE `c_workgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_workgroup
-- ----------------------------

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '市场部');
INSERT INTO `dept` VALUES ('2', '广告部');

-- ----------------------------
-- Table structure for `done`
-- ----------------------------
DROP TABLE IF EXISTS `done`;
CREATE TABLE `done` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `trade` int(11) NOT NULL,
  `goods` int(11) NOT NULL,
  `address` varchar(64) NOT NULL,
  `phone` varchar(64) NOT NULL,
  `donetime` date NOT NULL,
  `status` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of done
-- ----------------------------

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `price` double(11,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '手机', '4000');

-- ----------------------------
-- Table structure for `goods_details`
-- ----------------------------
DROP TABLE IF EXISTS `goods_details`;
CREATE TABLE `goods_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) NOT NULL,
  `goodsname` varchar(64) NOT NULL,
  `price` double(11,2) NOT NULL,
  `contractnumber` varchar(11) NOT NULL,
  `discount` double(11,2) NOT NULL,
  `quantity` double(11,2) NOT NULL,
  `statistics` double(11,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_details
-- ----------------------------
INSERT INTO `goods_details` VALUES ('1', '1', '手机', '4000.00', '20190923-2', '51.00', '10.00', '19600.00');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'add');
INSERT INTO `permission` VALUES ('2', 'delete');
INSERT INTO `permission` VALUES ('3', 'edit');
INSERT INTO `permission` VALUES ('4', 'look');

-- ----------------------------
-- Table structure for `reserved`
-- ----------------------------
DROP TABLE IF EXISTS `reserved`;
CREATE TABLE `reserved` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) NOT NULL,
  `customername` varchar(64) NOT NULL,
  `createdate` varchar(32) NOT NULL,
  `userid` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `reservedate` varchar(32) NOT NULL,
  `execusername` varchar(64) NOT NULL,
  `status` int(11) NOT NULL,
  `execstatus` int(11) NOT NULL,
  `result` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reserved
-- ----------------------------

-- ----------------------------
-- Table structure for `revisit`
-- ----------------------------
DROP TABLE IF EXISTS `revisit`;
CREATE TABLE `revisit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(64) NOT NULL,
  `customerid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `linkstatus` int(11) NOT NULL DEFAULT '0',
  `customerstatus` int(11) NOT NULL DEFAULT '0',
  `purposestatus` int(11) NOT NULL DEFAULT '0',
  `assessstatus` int(11) NOT NULL DEFAULT '0',
  `askinfo` varchar(255) NOT NULL,
  `followinfo` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of revisit
-- ----------------------------
INSERT INTO `revisit` VALUES ('1', '2019-09-25', '1', '1', '管理员', '0', '0', '0', '0', '213', '123', '123');
INSERT INTO `revisit` VALUES ('3', '2019-09-24', '1', '1', '管理员', '2', '1', '1', '2', ' ', ' ', ' ');
INSERT INTO `revisit` VALUES ('4', '2019-09-30', '1', '1', '管理员', '1', '0', '0', '0', ' ', ' ', ' ');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', 'admin');
INSERT INTO `role` VALUES ('2', '部门负责', 'dadmin');
INSERT INTO `role` VALUES ('3', '员工', 'user');

-- ----------------------------
-- Table structure for `role__permission`
-- ----------------------------
DROP TABLE IF EXISTS `role__permission`;
CREATE TABLE `role__permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `permissionid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role__permission
-- ----------------------------
INSERT INTO `role__permission` VALUES ('1', '1', '1');
INSERT INTO `role__permission` VALUES ('2', '1', '2');
INSERT INTO `role__permission` VALUES ('3', '1', '3');
INSERT INTO `role__permission` VALUES ('4', '2', '1');
INSERT INTO `role__permission` VALUES ('5', '2', '2');
INSERT INTO `role__permission` VALUES ('6', '2', '3');
INSERT INTO `role__permission` VALUES ('7', '3', '4');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `login` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `status` int(11) NOT NULL,
  `sex` int(11) NOT NULL,
  `deptid` int(11) NOT NULL,
  `power` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '超级管理', '178', '123', '0', '0', '1', '1');
INSERT INTO `user` VALUES ('2', 'huhu', '1785', '123', '0', '0', '1', '2');
INSERT INTO `user` VALUES ('3', 'ming', '175', '123', '0', '0', '1', '3');
INSERT INTO `user` VALUES ('5', '无主', '123', '123', '0', '0', '1', '3');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('2', '2', '2');
INSERT INTO `user_role` VALUES ('3', '3', '3');
INSERT INTO `user_role` VALUES ('4', '1', '2');
INSERT INTO `user_role` VALUES ('6', '5', '3');
