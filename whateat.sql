/*
Navicat MySQL Data Transfer

Source Server         : qa
Source Server Version : 50713
Source Host           : 139.196.16.67:3306
Source Database       : whateat

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-09-27 14:35:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `goodsid` int(11) DEFAULT NULL,
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `like` int(11) DEFAULT NULL,
  `hate` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('oHvXDwy6pBW79D9QHtBc9ap7LNg0', '', null, null);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsid` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imageurl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`goodsid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '帕尔帝新疆美食', '漕宝路68号光大会展中心一楼', '30', null, 'http://m.dianping.com/appshare/shop/32548124', 'http://p1.meituan.net/deal/015a134e37a9fd9e6a515f56fdf2bd5c1147428.jpg');
INSERT INTO `goods` VALUES ('2', '大秦府陕西菜', '光大会展中心D座1喽', '30', null, 'http://m.dianping.com/appshare/shop/68039364', 'http://i1.s2.dpfile.com/pc/1f448a5cb48e9680048b625158bf4fb6(220c164)/thumb.jpg');
INSERT INTO `goods` VALUES ('3', '四海游龙', '漕宝路78号光大会展中心东馆一楼', '30', null, 'http://m.dianping.com/appshare/shop/4986437', 'http://qcloud.dpfile.com/pc/mnIyKWyaRhm-vQY7F6tj-o74g-WcM3kXlA3baoYwmtI32iHpQfqTt42Nj-6Xj6n-tOnd3gXQdDYlAqlaVaAFeZ0rYYyiRo_EhzufqWWjTjs.jpg');
INSERT INTO `goods` VALUES ('4', '先生的茶馆', '漕宝路68号光大会展中心一楼', '30', null, 'http://m.dianping.com/appshare/shop/19205294', 'http://qcloud.dpfile.com/pc/zK4yYuBaUmLQcSIyF-GzuLdgB0l0r7pDsTppFLgitZF2D-aWdrpf_hSIQXn7wiMotOnd3gXQdDYlAqlaVaAFeZ0rYYyiRo_EhzufqWWjTjs.jpg');
INSERT INTO `goods` VALUES ('5', '包旺锅贴', '漕宝路78号光大会展中心', '30', null, 'http://m.dianping.com/appshare/shop/5277062', 'http://qcloud.dpfile.com/pc/hzVAuONz7ndRJewnHC02cXtQOz4144i4G7hQbkUKO_nR7Vgtxuf-v_GOtsJd4pCAtOnd3gXQdDYlAqlaVaAFeZ0rYYyiRo_EhzufqWWjTjs.jpg');
INSERT INTO `goods` VALUES ('6', '帕尔帝烤吧', '漕宝路68号1层101室', '30', null, 'http://m.dianping.com/appshare/shop/32519496', 'http://qcloud.dpfile.com/pc/Ybqw4tXFFE2LUBWOvQkXLEDDzRkJkXDIdDNrcpg0WLV_kQU1XxpLvyT7Ek61DQZ1tOnd3gXQdDYlAqlaVaAFeZ0rYYyiRo_EhzufqWWjTjs.jpg');
INSERT INTO `goods` VALUES ('7', '蜀地冒菜', '漕宝路84号', '30', null, 'http://m.dianping.com/appshare/shop/68223235', 'http://qcloud.dpfile.com/pc/9r7C1uwN64u5x6E07uVyUdA8CYGt6hE3yr0cMZYOvvmVBubuiLj4PQk2zA8dmd3qtOnd3gXQdDYlAqlaVaAFeZ0rYYyiRo_EhzufqWWjTjs.jpg');
INSERT INTO `goods` VALUES ('8', '\r\n201\r\n老北桥过桥米线', '漕宝路82号光大会展中心西侧裙房', '30', null, 'http://m.dianping.com/appshare/shop/6028066', 'http://qcloud.dpfile.com/pc/9Ukm7wNHppVgzkjHexhTvqyPKc0WEzQ60Ne_MdonQ6AnC5tacyrnsfycSXExtz4DtOnd3gXQdDYlAqlaVaAFeZ0rYYyiRo_EhzufqWWjTjs.jpg');
INSERT INTO `goods` VALUES ('9', '小智慧卤肉饭', '漕宝路82号光大会展中心西侧裙房', '30', null, 'http://m.dianping.com/appshare/shop/24082445', 'http://qcloud.dpfile.com/pc/kT4UxCgzUpfkIHh76qs2gEa667B3AEQ99U-Rw8Z2QXC6yDO85r4c9iK1SxJXYVNntOnd3gXQdDYlAqlaVaAFeZ0rYYyiRo_EhzufqWWjTjs.jpg');
INSERT INTO `goods` VALUES ('10', '金源堡养生时尚餐厅·土牛智造', '漕宝路38号华夏宾馆一楼', '30', null, 'http://m.dianping.com/appshare/shop/50253709', 'http://qcloud.dpfile.com/pc/julMb0c7oxBvlqPzq4trtKz40BsjI7jUij_mn9VJwA_Rn75Un_SBhWR3Aox7KgcQtOnd3gXQdDYlAqlaVaAFeZ0rYYyiRo_EhzufqWWjTjs.jpg');
INSERT INTO `goods` VALUES ('11', '林东家炸酱面', '漕宝路82号光大会展中心西侧裙房', '30', null, 'http://m.dianping.com/appshare/shop/24993960', 'http://qcloud.dpfile.com/pc/A1KaApNfNVJi8iN0idMyvH_MfVqhRDUm3CBUqlSfg9aVBubuiLj4PQk2zA8dmd3qtOnd3gXQdDYlAqlaVaAFeZ0rYYyiRo_EhzufqWWjTjs.jpg');
INSERT INTO `goods` VALUES ('12', '桂林米粉', '习勤路22号', '30', null, 'http://m.dianping.com/appshare/shop/58803765', 'http://qcloud.dpfile.com/pc/53ILfQVBerw7ejR3ozkrxocSaPKZahTcc5BprwxJ44MoLz_lmsyLi2Jw3_LehKdUtOnd3gXQdDYlAqlaVaAFeZ0rYYyiRo_EhzufqWWjTjs.jpg');
INSERT INTO `goods` VALUES ('13', '粒香休闲餐厅', '漕宝路69号', '30', null, 'http://m.dianping.com/appshare/shop/10648180', 'http://qcloud.dpfile.com/pc/EBgKx9VSleBT6ydgGnt6VVzj0kvs3S-lfVZQcuH87a0MyUnxe74hwCXsA8S86qdXtOnd3gXQdDYlAqlaVaAFeZ0rYYyiRo_EhzufqWWjTjs.jpg');
INSERT INTO `goods` VALUES ('14', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for historical
-- ----------------------------
DROP TABLE IF EXISTS `historical`;
CREATE TABLE `historical` (
  `goodsid` int(11) NOT NULL,
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imageurl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `islike` int(11) DEFAULT '0',
  `hate` int(11) DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of historical
-- ----------------------------
INSERT INTO `historical` VALUES ('1', 'oHvXDw-SJ_UVXVfoK_K3fogqzEnI', 'http://p1.meituan.net/deal/015a134e37a9fd9e6a515f56fdf2bd5c1147428.jpg', '帕尔帝新疆美食', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expectprice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reminddate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remindtime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES ('oHvXDwy6pBW79D9QHtBc9ap7LNg0', '光大会展中心', '100-200', '周一, 周二, 周三, 周四, 周五', '11:00', null, null);
INSERT INTO `setting` VALUES ('oHvXDw-SJ_UVXVfoK_K3fogqzEnI', '光大会展中心', '50-100', null, '11:00', null, null);
INSERT INTO `setting` VALUES ('', '光大会展中心', '', '周一, 周二', '9:00', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', 'oHvXDw6do4m-SEAs1gAQKp2u3cIo', null, null);
INSERT INTO `user` VALUES ('4', 'oHvXDwy6pBW79D9QHtBc9ap7LNg0', null, null);
INSERT INTO `user` VALUES ('5', 'oHvXDw-SJ_UVXVfoK_K3fogqzEnI', null, null);
INSERT INTO `user` VALUES ('6', 'oHvXDw7DXqJClvMa28DtdV7eQq10', null, null);

-- ----------------------------
-- Table structure for whateat
-- ----------------------------
DROP TABLE IF EXISTS `whateat`;
CREATE TABLE `whateat` (
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `togo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` int(11) unsigned zerofill DEFAULT '00000000000',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of whateat
-- ----------------------------
INSERT INTO `whateat` VALUES ('oHvXDwy6pBW79D9QHtBc9ap7LNg0', '11', null, 'http://m.dianping.com/appshare/shop/32548124', '00000000000', null, null);
SET FOREIGN_KEY_CHECKS=1;
