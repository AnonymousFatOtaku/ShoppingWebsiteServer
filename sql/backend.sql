/*
Navicat MySQL Data Transfer

Source Server         : testdb
Source Server Version : 80021
Source Host           : localhost:3306
Source Database       : backend

Target Server Type    : MYSQL
Target Server Version : 80021
File Encoding         : 65001

Date: 2020-12-14 13:28:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `pk_category_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
  `parent_category_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父分类id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '分类名',
  `description` varchar(200) NOT NULL DEFAULT '' COMMENT '分类描述',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`pk_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '0', '家用电器', '家用电器', '0', '2020-12-14 11:51:42', '2020-12-14 11:51:42');
INSERT INTO `t_category` VALUES ('2', '0', '手机', '手机', '0', '2020-12-14 11:52:38', '2020-12-14 11:52:38');
INSERT INTO `t_category` VALUES ('3', '0', '电脑', '电脑', '0', '2020-12-14 11:52:46', '2020-12-14 11:52:46');
INSERT INTO `t_category` VALUES ('4', '0', '家具', '家具', '0', '2020-12-14 11:53:00', '2020-12-14 11:53:00');
INSERT INTO `t_category` VALUES ('5', '0', '服装', '服装', '0', '2020-12-14 11:53:16', '2020-12-14 11:53:16');
INSERT INTO `t_category` VALUES ('6', '0', '美妆个护', '美妆个护', '0', '2020-12-14 11:53:41', '2020-12-14 11:53:41');
INSERT INTO `t_category` VALUES ('7', '0', '箱包', '箱包', '0', '2020-12-14 11:54:00', '2020-12-14 11:54:00');
INSERT INTO `t_category` VALUES ('8', '0', '男鞋女鞋', '男鞋女鞋', '0', '2020-12-14 11:54:27', '2020-12-14 11:54:27');
INSERT INTO `t_category` VALUES ('9', '0', '汽车', '汽车', '0', '2020-12-14 11:54:43', '2020-12-14 11:54:43');
INSERT INTO `t_category` VALUES ('10', '0', '食品生鲜', '食品生鲜', '0', '2020-12-14 11:55:05', '2020-12-14 11:55:05');
INSERT INTO `t_category` VALUES ('11', '0', '图书', '图书', '0', '2020-12-14 11:55:21', '2020-12-14 11:55:21');
INSERT INTO `t_category` VALUES ('12', '1', '电视', '电视', '0', '2020-12-14 11:55:50', '2020-12-14 11:55:50');
INSERT INTO `t_category` VALUES ('13', '1', '空调', '空调', '0', '2020-12-14 11:55:59', '2020-12-14 11:55:59');
INSERT INTO `t_category` VALUES ('14', '1', '洗衣机', '洗衣机', '0', '2020-12-14 11:56:08', '2020-12-14 11:56:08');
INSERT INTO `t_category` VALUES ('15', '1', '冰箱', '冰箱', '0', '2020-12-14 11:56:16', '2020-12-14 11:56:16');
INSERT INTO `t_category` VALUES ('16', '2', '游戏手机', '游戏手机', '0', '2020-12-14 11:56:39', '2020-12-14 11:56:39');
INSERT INTO `t_category` VALUES ('17', '2', '5G手机', '5G手机', '0', '2020-12-14 11:56:47', '2020-12-14 11:56:47');
INSERT INTO `t_category` VALUES ('18', '2', '全面屏手机', '全面屏手机', '0', '2020-12-14 11:56:57', '2020-12-14 11:56:57');
INSERT INTO `t_category` VALUES ('19', '3', '笔记本电脑', '笔记本电脑', '0', '2020-12-14 11:57:26', '2020-12-14 11:57:26');
INSERT INTO `t_category` VALUES ('20', '3', '平板电脑', '平板电脑', '0', '2020-12-14 11:57:36', '2020-12-14 11:57:36');
INSERT INTO `t_category` VALUES ('21', '3', '台式机', '台式机', '0', '2020-12-14 11:57:46', '2020-12-14 11:57:46');
INSERT INTO `t_category` VALUES ('22', '3', '一体机', '一体机', '0', '2020-12-14 11:57:55', '2020-12-14 11:57:55');
INSERT INTO `t_category` VALUES ('23', '4', '厨具', '厨具', '0', '2020-12-14 11:58:19', '2020-12-14 11:58:19');
INSERT INTO `t_category` VALUES ('24', '4', '家纺', '家纺', '0', '2020-12-14 11:58:27', '2020-12-14 11:58:27');
INSERT INTO `t_category` VALUES ('25', '4', '灯具', '灯具', '0', '2020-12-14 11:58:34', '2020-12-14 11:58:34');
INSERT INTO `t_category` VALUES ('26', '5', '男装', '男装', '0', '2020-12-14 11:58:56', '2020-12-14 11:58:56');
INSERT INTO `t_category` VALUES ('27', '5', '女装', '女装', '0', '2020-12-14 11:59:03', '2020-12-14 11:59:03');
INSERT INTO `t_category` VALUES ('28', '5', '童装', '童装', '0', '2020-12-14 11:59:16', '2020-12-14 11:59:16');
INSERT INTO `t_category` VALUES ('29', '6', '美白', '美白', '0', '2020-12-14 11:59:43', '2020-12-14 11:59:43');
INSERT INTO `t_category` VALUES ('30', '6', '防晒', '防晒', '0', '2020-12-14 11:59:51', '2020-12-14 11:59:51');
INSERT INTO `t_category` VALUES ('31', '6', '面膜', '面膜', '0', '2020-12-14 11:59:58', '2020-12-14 11:59:58');
INSERT INTO `t_category` VALUES ('32', '7', '拉杆箱', '拉杆箱', '0', '2020-12-14 12:00:27', '2020-12-14 12:00:27');
INSERT INTO `t_category` VALUES ('33', '7', '书包', '书包', '0', '2020-12-14 12:00:34', '2020-12-14 12:00:34');
INSERT INTO `t_category` VALUES ('34', '7', '登山包', '登山包', '0', '2020-12-14 12:00:43', '2020-12-14 12:00:43');
INSERT INTO `t_category` VALUES ('35', '8', '凉鞋', '凉鞋', '0', '2020-12-14 12:01:05', '2020-12-14 12:01:05');
INSERT INTO `t_category` VALUES ('36', '8', '拖鞋', '拖鞋', '0', '2020-12-14 12:01:13', '2020-12-14 12:01:13');
INSERT INTO `t_category` VALUES ('37', '8', '高跟鞋', '高跟鞋', '0', '2020-12-14 12:01:22', '2020-12-14 12:01:22');
INSERT INTO `t_category` VALUES ('38', '9', '微型车', '微型车', '0', '2020-12-14 12:01:51', '2020-12-14 12:01:51');
INSERT INTO `t_category` VALUES ('39', '9', '小型车', '小型车', '0', '2020-12-14 12:01:58', '2020-12-14 12:01:58');
INSERT INTO `t_category` VALUES ('40', '9', '中型车', '中型车', '0', '2020-12-14 12:02:06', '2020-12-14 12:02:06');
INSERT INTO `t_category` VALUES ('41', '9', '大型车', '大型车', '0', '2020-12-14 12:02:14', '2020-12-14 12:02:14');
INSERT INTO `t_category` VALUES ('42', '10', '水果', '水果', '0', '2020-12-14 12:02:32', '2020-12-14 12:02:32');
INSERT INTO `t_category` VALUES ('43', '10', '蔬菜', '蔬菜', '0', '2020-12-14 12:02:39', '2020-12-14 12:02:39');
INSERT INTO `t_category` VALUES ('44', '10', '肉类', '肉类', '0', '2020-12-14 12:02:48', '2020-12-14 12:02:48');
INSERT INTO `t_category` VALUES ('45', '11', '文学', '文学', '0', '2020-12-14 12:03:11', '2020-12-14 12:03:11');
INSERT INTO `t_category` VALUES ('46', '11', '艺术', '艺术', '0', '2020-12-14 12:03:19', '2020-12-14 12:03:19');
INSERT INTO `t_category` VALUES ('47', '11', '科技', '科技', '0', '2020-12-14 12:03:39', '2020-12-14 12:03:39');
INSERT INTO `t_category` VALUES ('48', '11', '社科', '社科', '0', '2020-12-14 12:03:46', '2020-12-14 12:03:46');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `pk_log_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `operate_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '操作类型(0增1删2改3查4登录5注册6退出)',
  `operate_content` varchar(200) NOT NULL DEFAULT '' COMMENT '操作内容',
  `fk_user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`pk_log_id`),
  KEY `fk_user_id` (`fk_user_id`),
  CONSTRAINT `t_log_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `t_user` (`pk_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('2', '4', 'admin001成功登录', '4', '0', '2020-12-14 11:43:46', '2020-12-14 11:43:46');
INSERT INTO `t_log` VALUES ('3', '2', 'admin001更新了id为1的角色权限', '4', '0', '2020-12-14 11:45:21', '2020-12-14 11:45:21');
INSERT INTO `t_log` VALUES ('4', '4', 'admin001成功登录', '4', '0', '2020-12-14 11:45:26', '2020-12-14 11:45:26');
INSERT INTO `t_log` VALUES ('5', '2', 'admin001更新了id为2的角色权限', '4', '0', '2020-12-14 11:45:56', '2020-12-14 11:45:56');
INSERT INTO `t_log` VALUES ('6', '2', 'admin001更新了id为3的角色权限', '4', '0', '2020-12-14 11:46:01', '2020-12-14 11:46:01');
INSERT INTO `t_log` VALUES ('7', '2', 'admin001更新了id为4的角色权限', '4', '0', '2020-12-14 11:46:05', '2020-12-14 11:46:05');
INSERT INTO `t_log` VALUES ('8', '2', 'admin001更新了id为5的角色权限', '4', '0', '2020-12-14 11:46:08', '2020-12-14 11:46:08');
INSERT INTO `t_log` VALUES ('9', '2', 'admin001更新了id为5的角色权限', '4', '0', '2020-12-14 11:46:13', '2020-12-14 11:46:13');
INSERT INTO `t_log` VALUES ('10', '0', 'admin001创建了名为活动管理员的角色', '4', '0', '2020-12-14 11:49:49', '2020-12-14 11:49:49');
INSERT INTO `t_log` VALUES ('11', '2', 'admin001更新了id为7的角色权限', '4', '0', '2020-12-14 11:49:55', '2020-12-14 11:49:55');
INSERT INTO `t_log` VALUES ('12', '0', 'admin001创建了名为日志管理员的角色', '4', '0', '2020-12-14 11:50:06', '2020-12-14 11:50:06');
INSERT INTO `t_log` VALUES ('13', '2', 'admin001更新了id为8的角色权限', '4', '0', '2020-12-14 11:50:09', '2020-12-14 11:50:09');
INSERT INTO `t_log` VALUES ('14', '0', 'admin001新增了分类家用电器', '4', '0', '2020-12-14 11:51:42', '2020-12-14 11:51:42');
INSERT INTO `t_log` VALUES ('15', '0', 'admin001新增了分类手机', '4', '0', '2020-12-14 11:52:38', '2020-12-14 11:52:38');
INSERT INTO `t_log` VALUES ('16', '0', 'admin001新增了分类电脑', '4', '0', '2020-12-14 11:52:47', '2020-12-14 11:52:47');
INSERT INTO `t_log` VALUES ('17', '0', 'admin001新增了分类家具', '4', '0', '2020-12-14 11:53:01', '2020-12-14 11:53:01');
INSERT INTO `t_log` VALUES ('18', '0', 'admin001新增了分类服装', '4', '0', '2020-12-14 11:53:16', '2020-12-14 11:53:16');
INSERT INTO `t_log` VALUES ('19', '0', 'admin001新增了分类美妆个护', '4', '0', '2020-12-14 11:53:41', '2020-12-14 11:53:41');
INSERT INTO `t_log` VALUES ('20', '0', 'admin001新增了分类箱包', '4', '0', '2020-12-14 11:54:00', '2020-12-14 11:54:00');
INSERT INTO `t_log` VALUES ('21', '0', 'admin001新增了分类男鞋女鞋', '4', '0', '2020-12-14 11:54:28', '2020-12-14 11:54:28');
INSERT INTO `t_log` VALUES ('22', '0', 'admin001新增了分类汽车', '4', '0', '2020-12-14 11:54:44', '2020-12-14 11:54:44');
INSERT INTO `t_log` VALUES ('23', '0', 'admin001新增了分类食品生鲜', '4', '0', '2020-12-14 11:55:06', '2020-12-14 11:55:06');
INSERT INTO `t_log` VALUES ('24', '0', 'admin001新增了分类图书', '4', '0', '2020-12-14 11:55:22', '2020-12-14 11:55:22');
INSERT INTO `t_log` VALUES ('25', '0', 'admin001新增了分类电视', '4', '0', '2020-12-14 11:55:51', '2020-12-14 11:55:51');
INSERT INTO `t_log` VALUES ('26', '0', 'admin001新增了分类空调', '4', '0', '2020-12-14 11:56:00', '2020-12-14 11:56:00');
INSERT INTO `t_log` VALUES ('27', '0', 'admin001新增了分类洗衣机', '4', '0', '2020-12-14 11:56:08', '2020-12-14 11:56:08');
INSERT INTO `t_log` VALUES ('28', '0', 'admin001新增了分类冰箱', '4', '0', '2020-12-14 11:56:16', '2020-12-14 11:56:16');
INSERT INTO `t_log` VALUES ('29', '0', 'admin001新增了分类游戏手机', '4', '0', '2020-12-14 11:56:39', '2020-12-14 11:56:39');
INSERT INTO `t_log` VALUES ('30', '0', 'admin001新增了分类5G手机', '4', '0', '2020-12-14 11:56:48', '2020-12-14 11:56:48');
INSERT INTO `t_log` VALUES ('31', '0', 'admin001新增了分类全面屏手机', '4', '0', '2020-12-14 11:56:57', '2020-12-14 11:56:57');
INSERT INTO `t_log` VALUES ('32', '0', 'admin001新增了分类笔记本电脑', '4', '0', '2020-12-14 11:57:26', '2020-12-14 11:57:26');
INSERT INTO `t_log` VALUES ('33', '0', 'admin001新增了分类平板电脑', '4', '0', '2020-12-14 11:57:36', '2020-12-14 11:57:36');
INSERT INTO `t_log` VALUES ('34', '0', 'admin001新增了分类台式机', '4', '0', '2020-12-14 11:57:47', '2020-12-14 11:57:47');
INSERT INTO `t_log` VALUES ('35', '0', 'admin001新增了分类一体机', '4', '0', '2020-12-14 11:57:55', '2020-12-14 11:57:55');
INSERT INTO `t_log` VALUES ('36', '0', 'admin001新增了分类厨具', '4', '0', '2020-12-14 11:58:20', '2020-12-14 11:58:20');
INSERT INTO `t_log` VALUES ('37', '0', 'admin001新增了分类家纺', '4', '0', '2020-12-14 11:58:28', '2020-12-14 11:58:28');
INSERT INTO `t_log` VALUES ('38', '0', 'admin001新增了分类灯具', '4', '0', '2020-12-14 11:58:34', '2020-12-14 11:58:34');
INSERT INTO `t_log` VALUES ('39', '0', 'admin001新增了分类男装', '4', '0', '2020-12-14 11:58:56', '2020-12-14 11:58:56');
INSERT INTO `t_log` VALUES ('40', '0', 'admin001新增了分类女装', '4', '0', '2020-12-14 11:59:04', '2020-12-14 11:59:04');
INSERT INTO `t_log` VALUES ('41', '0', 'admin001新增了分类童装', '4', '0', '2020-12-14 11:59:17', '2020-12-14 11:59:17');
INSERT INTO `t_log` VALUES ('42', '0', 'admin001新增了分类美白', '4', '0', '2020-12-14 11:59:44', '2020-12-14 11:59:44');
INSERT INTO `t_log` VALUES ('43', '0', 'admin001新增了分类防晒', '4', '0', '2020-12-14 11:59:51', '2020-12-14 11:59:51');
INSERT INTO `t_log` VALUES ('44', '0', 'admin001新增了分类面膜', '4', '0', '2020-12-14 11:59:58', '2020-12-14 11:59:58');
INSERT INTO `t_log` VALUES ('45', '0', 'admin001新增了分类拉杆箱', '4', '0', '2020-12-14 12:00:27', '2020-12-14 12:00:27');
INSERT INTO `t_log` VALUES ('46', '0', 'admin001新增了分类书包', '4', '0', '2020-12-14 12:00:34', '2020-12-14 12:00:34');
INSERT INTO `t_log` VALUES ('47', '0', 'admin001新增了分类登山包', '4', '0', '2020-12-14 12:00:43', '2020-12-14 12:00:43');
INSERT INTO `t_log` VALUES ('48', '0', 'admin001新增了分类凉鞋', '4', '0', '2020-12-14 12:01:06', '2020-12-14 12:01:06');
INSERT INTO `t_log` VALUES ('49', '0', 'admin001新增了分类拖鞋', '4', '0', '2020-12-14 12:01:13', '2020-12-14 12:01:13');
INSERT INTO `t_log` VALUES ('50', '0', 'admin001新增了分类高跟鞋', '4', '0', '2020-12-14 12:01:22', '2020-12-14 12:01:22');
INSERT INTO `t_log` VALUES ('51', '0', 'admin001新增了分类微型车', '4', '0', '2020-12-14 12:01:52', '2020-12-14 12:01:52');
INSERT INTO `t_log` VALUES ('52', '0', 'admin001新增了分类小型车', '4', '0', '2020-12-14 12:01:59', '2020-12-14 12:01:59');
INSERT INTO `t_log` VALUES ('53', '0', 'admin001新增了分类中型车', '4', '0', '2020-12-14 12:02:07', '2020-12-14 12:02:07');
INSERT INTO `t_log` VALUES ('54', '0', 'admin001新增了分类大型车', '4', '0', '2020-12-14 12:02:14', '2020-12-14 12:02:14');
INSERT INTO `t_log` VALUES ('55', '0', 'admin001新增了分类水果', '4', '0', '2020-12-14 12:02:33', '2020-12-14 12:02:33');
INSERT INTO `t_log` VALUES ('56', '0', 'admin001新增了分类蔬菜', '4', '0', '2020-12-14 12:02:39', '2020-12-14 12:02:39');
INSERT INTO `t_log` VALUES ('57', '0', 'admin001新增了分类肉类', '4', '0', '2020-12-14 12:02:48', '2020-12-14 12:02:48');
INSERT INTO `t_log` VALUES ('58', '0', 'admin001新增了分类文学', '4', '0', '2020-12-14 12:03:11', '2020-12-14 12:03:11');
INSERT INTO `t_log` VALUES ('59', '0', 'admin001新增了分类艺术', '4', '0', '2020-12-14 12:03:19', '2020-12-14 12:03:19');
INSERT INTO `t_log` VALUES ('60', '0', 'admin001新增了分类科技', '4', '0', '2020-12-14 12:03:39', '2020-12-14 12:03:39');
INSERT INTO `t_log` VALUES ('61', '0', 'admin001新增了分类社科', '4', '0', '2020-12-14 12:03:46', '2020-12-14 12:03:46');
INSERT INTO `t_log` VALUES ('62', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 12:04:26', '2020-12-14 12:04:26');
INSERT INTO `t_log` VALUES ('63', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 12:04:34', '2020-12-14 12:04:34');
INSERT INTO `t_log` VALUES ('64', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 12:05:04', '2020-12-14 12:05:04');
INSERT INTO `t_log` VALUES ('65', '5', 'admin004成功注册', '7', '0', '2020-12-14 12:51:15', '2020-12-14 12:51:15');
INSERT INTO `t_log` VALUES ('66', '0', 'admin001新增了名为admin004的用户', '4', '0', '2020-12-14 12:51:16', '2020-12-14 12:51:16');
INSERT INTO `t_log` VALUES ('67', '5', 'admin005成功注册', '8', '0', '2020-12-14 12:51:34', '2020-12-14 12:51:34');
INSERT INTO `t_log` VALUES ('68', '0', 'admin001新增了名为admin005的用户', '4', '0', '2020-12-14 12:51:35', '2020-12-14 12:51:35');
INSERT INTO `t_log` VALUES ('69', '5', 'admin006成功注册', '9', '0', '2020-12-14 12:51:56', '2020-12-14 12:51:56');
INSERT INTO `t_log` VALUES ('70', '0', 'admin001新增了名为admin006的用户', '4', '0', '2020-12-14 12:51:57', '2020-12-14 12:51:57');
INSERT INTO `t_log` VALUES ('71', '5', 'admin007成功注册', '10', '0', '2020-12-14 12:52:15', '2020-12-14 12:52:15');
INSERT INTO `t_log` VALUES ('72', '0', 'admin001新增了名为admin007的用户', '4', '0', '2020-12-14 12:52:16', '2020-12-14 12:52:16');
INSERT INTO `t_log` VALUES ('73', '5', 'admin008成功注册', '11', '0', '2020-12-14 12:52:34', '2020-12-14 12:52:34');
INSERT INTO `t_log` VALUES ('74', '0', 'admin001新增了名为admin008的用户', '4', '0', '2020-12-14 12:52:35', '2020-12-14 12:52:35');
INSERT INTO `t_log` VALUES ('75', '3', 'admin001查看了全部订单', '4', '0', '2020-12-14 12:55:34', '2020-12-14 12:55:34');
INSERT INTO `t_log` VALUES ('76', '3', 'admin001查看了全部日志', '4', '0', '2020-12-14 12:55:35', '2020-12-14 12:55:35');
INSERT INTO `t_log` VALUES ('77', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 12:55:50', '2020-12-14 12:55:50');
INSERT INTO `t_log` VALUES ('78', '3', 'admin001查看了全部订单', '4', '0', '2020-12-14 12:55:54', '2020-12-14 12:55:54');
INSERT INTO `t_log` VALUES ('79', '3', 'admin001查看了全部日志', '4', '0', '2020-12-14 13:01:00', '2020-12-14 13:01:00');
INSERT INTO `t_log` VALUES ('80', '0', 'admin001新增了名为全场九折的活动', '4', '0', '2020-12-14 13:02:07', '2020-12-14 13:02:07');
INSERT INTO `t_log` VALUES ('81', '0', 'admin001新增了名为全场八折的活动', '4', '0', '2020-12-14 13:02:29', '2020-12-14 13:02:29');
INSERT INTO `t_log` VALUES ('82', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:02:46', '2020-12-14 13:02:46');
INSERT INTO `t_log` VALUES ('83', '0', 'admin001新增了商品TCL4K超高清电视', '4', '0', '2020-12-14 13:07:11', '2020-12-14 13:07:11');
INSERT INTO `t_log` VALUES ('84', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:07:11', '2020-12-14 13:07:11');
INSERT INTO `t_log` VALUES ('85', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:07:38', '2020-12-14 13:07:38');
INSERT INTO `t_log` VALUES ('86', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:07:43', '2020-12-14 13:07:43');
INSERT INTO `t_log` VALUES ('87', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:07:52', '2020-12-14 13:07:52');
INSERT INTO `t_log` VALUES ('88', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:07:58', '2020-12-14 13:07:58');
INSERT INTO `t_log` VALUES ('89', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:08:01', '2020-12-14 13:08:01');
INSERT INTO `t_log` VALUES ('90', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:08:31', '2020-12-14 13:08:31');
INSERT INTO `t_log` VALUES ('91', '2', 'admin001修改了id为1的商品', '4', '0', '2020-12-14 13:08:44', '2020-12-14 13:08:44');
INSERT INTO `t_log` VALUES ('92', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:08:44', '2020-12-14 13:08:44');
INSERT INTO `t_log` VALUES ('93', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:09:30', '2020-12-14 13:09:30');
INSERT INTO `t_log` VALUES ('94', '3', 'admin001查看了id为1的商品详情', '4', '0', '2020-12-14 13:09:51', '2020-12-14 13:09:51');
INSERT INTO `t_log` VALUES ('95', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:09:55', '2020-12-14 13:09:55');
INSERT INTO `t_log` VALUES ('96', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:10:19', '2020-12-14 13:10:19');
INSERT INTO `t_log` VALUES ('97', '3', 'admin001查看了id为1的商品详情', '4', '0', '2020-12-14 13:10:21', '2020-12-14 13:10:21');
INSERT INTO `t_log` VALUES ('98', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:10:24', '2020-12-14 13:10:24');
INSERT INTO `t_log` VALUES ('99', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:10:28', '2020-12-14 13:10:28');
INSERT INTO `t_log` VALUES ('100', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:11:12', '2020-12-14 13:11:12');
INSERT INTO `t_log` VALUES ('101', '0', 'admin001新增了商品vivoNeo3', '4', '0', '2020-12-14 13:13:47', '2020-12-14 13:13:47');
INSERT INTO `t_log` VALUES ('102', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:13:48', '2020-12-14 13:13:48');
INSERT INTO `t_log` VALUES ('103', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:14:07', '2020-12-14 13:14:07');
INSERT INTO `t_log` VALUES ('104', '0', 'admin001新增了商品iPadPro11', '4', '0', '2020-12-14 13:15:05', '2020-12-14 13:15:05');
INSERT INTO `t_log` VALUES ('105', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:15:06', '2020-12-14 13:15:06');
INSERT INTO `t_log` VALUES ('106', '0', 'admin001新增了商品炊大皇炒锅', '4', '0', '2020-12-14 13:16:30', '2020-12-14 13:16:30');
INSERT INTO `t_log` VALUES ('107', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:16:30', '2020-12-14 13:16:30');
INSERT INTO `t_log` VALUES ('108', '0', 'admin001新增了商品纽巴罗棉质长袖t恤', '4', '0', '2020-12-14 13:17:37', '2020-12-14 13:17:37');
INSERT INTO `t_log` VALUES ('109', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:17:37', '2020-12-14 13:17:37');
INSERT INTO `t_log` VALUES ('110', '0', 'admin001新增了商品烟酰胺原液亮肤面膜10片', '4', '0', '2020-12-14 13:18:52', '2020-12-14 13:18:52');
INSERT INTO `t_log` VALUES ('111', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:18:53', '2020-12-14 13:18:53');
INSERT INTO `t_log` VALUES ('112', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:19:00', '2020-12-14 13:19:00');
INSERT INTO `t_log` VALUES ('113', '0', 'admin001新增了商品地平线8号登机箱20英寸', '4', '0', '2020-12-14 13:20:01', '2020-12-14 13:20:01');
INSERT INTO `t_log` VALUES ('114', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:20:02', '2020-12-14 13:20:02');
INSERT INTO `t_log` VALUES ('115', '0', 'admin001新增了商品维布伦洞洞鞋', '4', '0', '2020-12-14 13:21:05', '2020-12-14 13:21:05');
INSERT INTO `t_log` VALUES ('116', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:21:05', '2020-12-14 13:21:05');
INSERT INTO `t_log` VALUES ('117', '0', 'admin001新增了商品四轮巡逻车', '4', '0', '2020-12-14 13:22:11', '2020-12-14 13:22:11');
INSERT INTO `t_log` VALUES ('118', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:22:12', '2020-12-14 13:22:12');
INSERT INTO `t_log` VALUES ('119', '0', 'admin001新增了商品一级黄冠梨', '4', '0', '2020-12-14 13:23:03', '2020-12-14 13:23:03');
INSERT INTO `t_log` VALUES ('120', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:23:04', '2020-12-14 13:23:04');
INSERT INTO `t_log` VALUES ('121', '0', 'admin001新增了商品曲中戏', '4', '0', '2020-12-14 13:26:36', '2020-12-14 13:26:36');
INSERT INTO `t_log` VALUES ('122', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:26:36', '2020-12-14 13:26:36');
INSERT INTO `t_log` VALUES ('123', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:26:39', '2020-12-14 13:26:39');
INSERT INTO `t_log` VALUES ('124', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:26:42', '2020-12-14 13:26:42');
INSERT INTO `t_log` VALUES ('125', '3', 'admin001查看了全部日志', '4', '0', '2020-12-14 13:27:14', '2020-12-14 13:27:14');
INSERT INTO `t_log` VALUES ('126', '3', 'admin001查看了全部订单', '4', '0', '2020-12-14 13:27:20', '2020-12-14 13:27:20');
INSERT INTO `t_log` VALUES ('127', '3', 'admin001查看了全部日志', '4', '0', '2020-12-14 13:27:26', '2020-12-14 13:27:26');
INSERT INTO `t_log` VALUES ('128', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:27:40', '2020-12-14 13:27:40');
INSERT INTO `t_log` VALUES ('129', '3', 'admin001查看了全部日志', '4', '0', '2020-12-14 13:28:33', '2020-12-14 13:28:33');
INSERT INTO `t_log` VALUES ('130', '3', 'admin001查看了全部订单', '4', '0', '2020-12-14 13:28:35', '2020-12-14 13:28:35');
INSERT INTO `t_log` VALUES ('131', '3', 'admin001查看了全部商品', '4', '0', '2020-12-14 13:28:39', '2020-12-14 13:28:39');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `pk_order_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `fk_user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '买家名字',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '买家电话',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '买家地址',
  `payment` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单总价',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `order_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`pk_order_id`),
  KEY `fk_user_id` (`fk_user_id`),
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `t_user` (`pk_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail` (
  `pk_order_detail_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '订单商品id',
  `fk_order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `fk_product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '商品名',
  `image` varchar(500) NOT NULL DEFAULT '' COMMENT '商品缩略图',
  `price` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商品单价',
  `quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
  `total_price` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商品总价',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`pk_order_detail_id`),
  KEY `fk_order_id` (`fk_order_id`),
  KEY `fk_product_id` (`fk_product_id`),
  CONSTRAINT `t_order_detail_ibfk_1` FOREIGN KEY (`fk_order_id`) REFERENCES `t_order` (`pk_order_id`),
  CONSTRAINT `t_order_detail_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `t_product` (`pk_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `pk_product_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `fk_category_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品名',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品描述',
  `image` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品缩略图',
  `price` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商品售价',
  `saleable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '商品状态',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`pk_product_id`),
  KEY `fk_category_id` (`fk_category_id`),
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`fk_category_id`) REFERENCES `t_category` (`pk_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '12', 'TCL4K超高清电视', '<p><span style=\"color: rgb(102,102,102);background-color: rgb(255,255,255);font-size: 16px;\">TCL 55L8 55英寸 4K超高清电视 智慧语音 超薄机身 杜比+DTS双解码 智能网络液晶电视</span>&nbsp;</p>\n', 'image-1607922384187.png', '219999', '0', '0', '2020-12-14 13:07:11', '2020-12-14 13:08:43');
INSERT INTO `t_product` VALUES ('2', '17', 'vivoNeo3', '<p><span style=\"color: rgb(102,102,102);background-color: rgb(255,255,255);font-size: 16px;font-family: Arial, \"microsoft yahei;\">vivo iQOO Neo3 5G 8GB+128GB 夜幕黑 高通骁龙865 144Hz竞速屏 立体双扬 44W闪充 双模5G全网通手机</span>&nbsp;</p>\n', 'image-1607922820545.png', '294800', '0', '0', '2020-12-14 13:13:47', '2020-12-14 13:13:47');
INSERT INTO `t_product` VALUES ('3', '20', 'iPadPro11', '<p><span style=\"color: rgb(102,102,102);background-color: rgb(255,255,255);font-size: 16px;font-family: Arial, \"microsoft yahei;\">Apple iPad Pro 11英寸平板电脑 2020年新款(256G WLAN版/全面屏/A12Z/Face ID/MXDC2CH/A) 深空灰色</span>&nbsp;</p>\n', 'image-1607922898804.png', '632900', '0', '0', '2020-12-14 13:15:05', '2020-12-14 13:15:05');
INSERT INTO `t_product` VALUES ('4', '23', '炊大皇炒锅', '<p><span style=\"color: rgb(102,102,102);background-color: rgb(255,255,255);font-size: 16px;font-family: Arial, \"microsoft yahei;\">炊大皇 炒锅 304不锈钢炒菜锅 不粘锅 平底锅 可用不锈钢锅铲 可立盖 燃气煤气灶电磁炉通用</span>&nbsp;</p>\n', 'image-1607922985053.png', '13900', '0', '0', '2020-12-14 13:16:29', '2020-12-14 13:16:29');
INSERT INTO `t_product` VALUES ('5', '26', '纽巴罗棉质长袖t恤', '<p><span style=\"color: rgb(102,102,102);background-color: rgb(255,255,255);font-size: 16px;font-family: Arial, \"microsoft yahei;\">纽巴罗 棉质长袖t恤男秋冬季新款纯色毛衣男士休闲修身加绒加厚卫衣男圆领上衣服男装打底衫秋衣保暖 混坊黑 M/165/不加绒款</span>&nbsp;</p>\n', 'image-1607923050954.png', '8600', '0', '0', '2020-12-14 13:17:37', '2020-12-14 13:17:37');
INSERT INTO `t_product` VALUES ('6', '31', '烟酰胺原液亮肤面膜10片', '<p><span style=\"color: rgb(102,102,102);background-color: rgb(255,255,255);font-size: 16px;font-family: Arial, \"microsoft yahei;\">亚缇克兰 Urtekram 烟酰胺原液亮肤面膜10片 （补水保湿男女士护肤化妆品）</span>&nbsp;</p>\n', 'image-1607923127326.png', '9990', '0', '0', '2020-12-14 13:18:52', '2020-12-14 13:18:52');
INSERT INTO `t_product` VALUES ('7', '32', '地平线8号登机箱20英寸', '<p><span style=\"color: rgb(102,102,102);background-color: rgb(255,255,255);font-size: 16px;font-family: Arial, \"microsoft yahei;\">地平线8号（LEVEL8）行李箱旅行箱登机箱20英寸德国科思创PC箱体男女拉杆箱 黑色（锤科出品）</span>&nbsp;</p>\n', 'image-1607923199747.png', '29900', '0', '0', '2020-12-14 13:20:01', '2020-12-14 13:20:01');
INSERT INTO `t_product` VALUES ('8', '35', '维布伦洞洞鞋', '<p><span style=\"color: rgb(102,102,102);background-color: rgb(255,255,255);font-size: 16px;font-family: Arial, \"microsoft yahei;\">veblen维布伦洞洞鞋女夏季新款凉鞋平跟软底印花果冻鞋防滑沙滩鞋海边度假凉拖鞋6902 6902泡泡糖 38标准码</span>&nbsp;</p>\n', 'image-1607923255065.png', '4980', '0', '0', '2020-12-14 13:21:04', '2020-12-14 13:21:04');
INSERT INTO `t_product` VALUES ('9', '38', '四轮巡逻车', '<p><span style=\"color: rgb(102,102,102);background-color: rgb(255,255,255);font-size: 16px;font-family: Arial, \"microsoft yahei;\">全款 四轮巡逻车 美的集采 【新车汽车买车新能源车电动特种车】 II型</span>&nbsp;</p>\n', 'image-1607923324088.png', '3300000', '0', '0', '2020-12-14 13:22:11', '2020-12-14 13:22:11');
INSERT INTO `t_product` VALUES ('10', '42', '一级黄冠梨', '<p><span style=\"color: rgb(102,102,102);background-color: rgb(255,255,255);font-size: 16px;font-family: Arial, \"microsoft yahei;\">长城果品 一级黄冠梨 净重10斤 梨子 新鲜水果</span>&nbsp;</p>\n', 'image-1607923379514.png', '6990', '0', '0', '2020-12-14 13:23:02', '2020-12-14 13:23:02');
INSERT INTO `t_product` VALUES ('11', '45', '曲中戏', '<p><span style=\"color: rgb(102,102,102);background-color: rgb(255,255,255);font-size: 16px;font-family: Arial, \"microsoft yahei;\">曲中戏：一场由误会引发的惊天密谋。机缘，还是宿命？曲中唱尽了谁的一生？</span>&nbsp;</p>\n', 'image-1607923588058.png', '3940', '0', '0', '2020-12-14 13:26:35', '2020-12-14 13:26:35');

-- ----------------------------
-- Table structure for t_product_promotion_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_product_promotion_relation`;
CREATE TABLE `t_product_promotion_relation` (
  `pk_product_promotion_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '记录标识',
  `fk_product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `fk_promotion_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '活动id',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`pk_product_promotion_id`),
  KEY `fk_product_id` (`fk_product_id`),
  KEY `fk_promotion_id` (`fk_promotion_id`),
  CONSTRAINT `t_product_promotion_relation_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `t_product` (`pk_product_id`),
  CONSTRAINT `t_product_promotion_relation_ibfk_2` FOREIGN KEY (`fk_promotion_id`) REFERENCES `t_promotion` (`pk_promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_product_promotion_relation
-- ----------------------------

-- ----------------------------
-- Table structure for t_promotion
-- ----------------------------
DROP TABLE IF EXISTS `t_promotion`;
CREATE TABLE `t_promotion` (
  `pk_promotion_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '活动名',
  `description` varchar(200) NOT NULL DEFAULT '' COMMENT '活动描述',
  `discount` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '折扣',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`pk_promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_promotion
-- ----------------------------
INSERT INTO `t_promotion` VALUES ('1', '全场九折', '全场九折', '90', '2020-12-15 13:01:22', '2020-12-16 13:01:22', '0', '2020-12-14 13:02:07', '2020-12-14 13:02:07');
INSERT INTO `t_promotion` VALUES ('2', '全场八折', '全场八折', '80', '2020-12-15 13:02:18', '2020-12-16 13:02:18', '0', '2020-12-14 13:02:29', '2020-12-14 13:02:29');

-- ----------------------------
-- Table structure for t_right
-- ----------------------------
DROP TABLE IF EXISTS `t_right`;
CREATE TABLE `t_right` (
  `pk_right_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `parent_right_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父级权限ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '权限名称',
  `description` varchar(200) NOT NULL DEFAULT '' COMMENT '权限描述',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`pk_right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_right
-- ----------------------------
INSERT INTO `t_right` VALUES ('1', '0', '进入后台管理系统', '进入后台管理系统', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('2', '0', '进入商城页面', '进入商城页面', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('3', '1', '管理商品', '管理商品', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('4', '3', '添加商品', '添加商品', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('5', '3', '删除商品', '删除商品', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('6', '3', '修改商品', '修改商品', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('7', '3', '查询商品', '查询商品', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('8', '1', '管理用户', '管理用户', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('9', '8', '添加用户', '添加用户', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('10', '8', '删除用户', '删除用户', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('11', '8', '修改用户', '修改用户', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('12', '8', '查询用户', '查询用户', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('13', '1', '管理角色', '管理角色', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('14', '13', '添加角色', '添加角色', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('15', '13', '删除角色', '删除角色', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('16', '13', '修改角色', '修改角色', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('17', '13', '查询角色', '查询角色', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('18', '1', '管理订单', '管理订单', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('19', '18', '修改订单', '修改订单', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('20', '18', '查询订单', '查询订单', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('21', '2', '添加订单', '添加订单', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('22', '2', '删除订单', '删除订单', '0', '2020-12-14 11:38:16', '2020-12-14 11:38:16');
INSERT INTO `t_right` VALUES ('23', '1', '管理活动', '管理活动', '0', '2020-12-14 11:38:46', '2020-12-14 11:38:46');
INSERT INTO `t_right` VALUES ('24', '23', '添加活动', '添加活动', '0', '2020-12-14 11:38:46', '2020-12-14 11:38:46');
INSERT INTO `t_right` VALUES ('25', '23', '删除活动', '删除活动', '0', '2020-12-14 11:38:46', '2020-12-14 11:38:46');
INSERT INTO `t_right` VALUES ('26', '23', '修改活动', '修改活动', '0', '2020-12-14 11:38:46', '2020-12-14 11:38:46');
INSERT INTO `t_right` VALUES ('27', '23', '查询活动', '查询活动', '0', '2020-12-14 11:38:46', '2020-12-14 11:38:46');
INSERT INTO `t_right` VALUES ('28', '1', '管理日志', '管理日志', '0', '2020-12-14 11:38:46', '2020-12-14 11:38:46');
INSERT INTO `t_right` VALUES ('29', '28', '添加日志', '添加日志', '0', '2020-12-14 11:38:46', '2020-12-14 11:38:46');
INSERT INTO `t_right` VALUES ('30', '28', '删除日志', '删除日志', '0', '2020-12-14 11:38:46', '2020-12-14 11:38:46');
INSERT INTO `t_right` VALUES ('31', '28', '修改日志', '修改日志', '0', '2020-12-14 11:38:46', '2020-12-14 11:38:46');
INSERT INTO `t_right` VALUES ('32', '28', '查询日志', '查询日志', '0', '2020-12-14 11:38:46', '2020-12-14 11:38:46');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `pk_role_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `parent_role_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父级角色ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(200) NOT NULL DEFAULT '' COMMENT '角色描述',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`pk_role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '0', '超级管理员', '拥有后台所有功能访问、授权权限，不能进入商城页面', '0', '2020-12-14 11:37:43', '2020-12-14 11:37:43');
INSERT INTO `t_role` VALUES ('2', '1', '商品管理员', '拥有后台商品增删改查功能的访问权限，只显示商品管理菜单，不能进入商城页面', '0', '2020-12-14 11:37:43', '2020-12-14 11:37:43');
INSERT INTO `t_role` VALUES ('3', '1', '用户管理员', '拥有后台用户增删改查功能的访问权限，只显示用户管理菜单，不能进入商城页面', '0', '2020-12-14 11:37:43', '2020-12-14 11:37:43');
INSERT INTO `t_role` VALUES ('4', '1', '角色管理员', '拥有后台角色增删改查功能的访问权限，只显示角色管理菜单，不能进入商城页面', '0', '2020-12-14 11:37:43', '2020-12-14 11:37:43');
INSERT INTO `t_role` VALUES ('5', '1', '订单管理员', '拥有后台订单改查功能的访问权限，只显示订单管理菜单，不能进入商城页面', '0', '2020-12-14 11:37:43', '2020-12-14 11:37:43');
INSERT INTO `t_role` VALUES ('6', '0', '普通用户', '拥有进入商城页面、查看商品信息、新增/删除订单权限，不能进入后台管理页面', '0', '2020-12-14 11:37:43', '2020-12-14 11:37:43');
INSERT INTO `t_role` VALUES ('7', '1', '活动管理员', '活动管理员', '0', '2020-12-14 11:49:49', '2020-12-14 11:49:49');
INSERT INTO `t_role` VALUES ('8', '1', '日志管理员', '日志管理员', '0', '2020-12-14 11:50:05', '2020-12-14 11:50:05');

-- ----------------------------
-- Table structure for t_role_right_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_role_right_relation`;
CREATE TABLE `t_role_right_relation` (
  `pk_role_right_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '记录标识',
  `fk_role_id` bigint unsigned NOT NULL COMMENT '角色ID',
  `fk_right_id` bigint unsigned NOT NULL COMMENT '权限ID',
  `right_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '权限类型',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`pk_role_right_id`),
  KEY `fk_role_id` (`fk_role_id`),
  KEY `fk_right_id` (`fk_right_id`),
  CONSTRAINT `t_role_right_relation_ibfk_1` FOREIGN KEY (`fk_role_id`) REFERENCES `t_role` (`pk_role_id`),
  CONSTRAINT `t_role_right_relation_ibfk_2` FOREIGN KEY (`fk_right_id`) REFERENCES `t_right` (`pk_right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_role_right_relation
-- ----------------------------
INSERT INTO `t_role_right_relation` VALUES ('1', '1', '1', '1', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('2', '1', '3', '1', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('3', '1', '4', '1', '1', '2020-12-14 11:40:22', '2020-12-14 11:45:20');
INSERT INTO `t_role_right_relation` VALUES ('4', '1', '5', '1', '1', '2020-12-14 11:40:22', '2020-12-14 11:45:20');
INSERT INTO `t_role_right_relation` VALUES ('5', '1', '6', '1', '1', '2020-12-14 11:40:22', '2020-12-14 11:45:20');
INSERT INTO `t_role_right_relation` VALUES ('6', '1', '7', '1', '1', '2020-12-14 11:40:22', '2020-12-14 11:45:20');
INSERT INTO `t_role_right_relation` VALUES ('7', '1', '8', '1', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('8', '1', '9', '1', '1', '2020-12-14 11:40:22', '2020-12-14 11:45:20');
INSERT INTO `t_role_right_relation` VALUES ('9', '1', '10', '1', '1', '2020-12-14 11:40:22', '2020-12-14 11:45:20');
INSERT INTO `t_role_right_relation` VALUES ('10', '1', '11', '1', '1', '2020-12-14 11:40:22', '2020-12-14 11:45:20');
INSERT INTO `t_role_right_relation` VALUES ('11', '1', '12', '1', '1', '2020-12-14 11:40:22', '2020-12-14 11:45:20');
INSERT INTO `t_role_right_relation` VALUES ('12', '1', '13', '1', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('13', '1', '14', '1', '1', '2020-12-14 11:40:22', '2020-12-14 11:45:20');
INSERT INTO `t_role_right_relation` VALUES ('14', '1', '15', '1', '1', '2020-12-14 11:40:22', '2020-12-14 11:45:21');
INSERT INTO `t_role_right_relation` VALUES ('15', '1', '16', '1', '1', '2020-12-14 11:40:22', '2020-12-14 11:45:21');
INSERT INTO `t_role_right_relation` VALUES ('16', '1', '17', '1', '1', '2020-12-14 11:40:22', '2020-12-14 11:45:21');
INSERT INTO `t_role_right_relation` VALUES ('17', '1', '18', '1', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('18', '1', '19', '1', '1', '2020-12-14 11:40:22', '2020-12-14 11:45:21');
INSERT INTO `t_role_right_relation` VALUES ('19', '1', '20', '1', '1', '2020-12-14 11:40:22', '2020-12-14 11:45:21');
INSERT INTO `t_role_right_relation` VALUES ('20', '2', '1', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('21', '2', '3', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('22', '2', '4', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('23', '2', '5', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('24', '2', '6', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('25', '2', '7', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('26', '3', '1', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('27', '3', '8', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('28', '3', '9', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('29', '3', '10', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('30', '3', '11', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('31', '3', '12', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('32', '4', '1', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('33', '4', '13', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('34', '4', '14', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('35', '4', '15', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('36', '4', '16', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('37', '4', '17', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('38', '5', '1', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('39', '5', '18', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('40', '5', '19', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('41', '5', '20', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('42', '6', '2', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('43', '6', '21', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('44', '6', '22', '0', '0', '2020-12-14 11:40:22', '2020-12-14 11:40:22');
INSERT INTO `t_role_right_relation` VALUES ('45', '1', '23', '0', '0', '2020-12-14 11:45:21', '2020-12-14 11:45:21');
INSERT INTO `t_role_right_relation` VALUES ('46', '1', '28', '0', '0', '2020-12-14 11:45:21', '2020-12-14 11:45:21');
INSERT INTO `t_role_right_relation` VALUES ('47', '7', '1', '0', '0', '2020-12-14 11:49:55', '2020-12-14 11:49:55');
INSERT INTO `t_role_right_relation` VALUES ('48', '7', '23', '0', '0', '2020-12-14 11:49:55', '2020-12-14 11:49:55');
INSERT INTO `t_role_right_relation` VALUES ('49', '8', '1', '0', '0', '2020-12-14 11:50:09', '2020-12-14 11:50:09');
INSERT INTO `t_role_right_relation` VALUES ('50', '8', '28', '0', '0', '2020-12-14 11:50:09', '2020-12-14 11:50:09');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `pk_user_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(320) NOT NULL DEFAULT '' COMMENT '邮箱',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `last_login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次登录时间',
  `login_count` bigint unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '用户权限标识',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`pk_user_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'user001', '97f3c717da19b4697ae9884e67aabce6', '13000000001', 'aaa@aa.aa', '2020-12-14 11:37:27', '2020-12-14 11:37:27', '0', '0', '0', '2020-12-14 11:37:27', '2020-12-14 11:37:27');
INSERT INTO `t_user` VALUES ('2', 'user002', '8b63b2922634ffaeab2019e50f13dd20', '13000000002', 'bbb@bb.bb', '2020-12-14 11:37:27', '2020-12-14 11:37:27', '0', '0', '0', '2020-12-14 11:37:27', '2020-12-14 11:37:27');
INSERT INTO `t_user` VALUES ('3', 'user003', 'e16f3b20872b973a50a3c2a1ac996d99', '13000000003', 'ccc@cc.cc', '2020-12-14 11:37:27', '2020-12-14 11:37:27', '0', '0', '0', '2020-12-14 11:37:27', '2020-12-14 11:37:27');
INSERT INTO `t_user` VALUES ('4', 'admin001', '4eef1e1ea34879a2ae60c60815927ed9', '13000000010', 'aa@aa.aa', '2020-12-14 11:45:26', '2020-12-14 11:43:46', '2', '1', '0', '2020-12-14 11:37:27', '2020-12-14 11:37:27');
INSERT INTO `t_user` VALUES ('5', 'admin002', '40b9408eaf5dc1c195ba7175a97b5f8c', '13000000020', 'bb@bb.bb', '2020-12-14 11:37:27', '2020-12-14 11:37:27', '0', '1', '0', '2020-12-14 11:37:27', '2020-12-14 11:37:27');
INSERT INTO `t_user` VALUES ('6', 'admin003', 'e71432aed2d17acc8b77d253531c818e', '13000000030', 'cc@cc.cc', '2020-12-14 11:37:27', '2020-12-14 11:37:27', '0', '1', '0', '2020-12-14 11:37:27', '2020-12-14 11:37:27');
INSERT INTO `t_user` VALUES ('7', 'admin004', '33c678db81ecd3daed05bb4520a59f13', '17000024242', 'admin004@aa.aa', '2020-12-14 12:51:15', '2020-12-14 12:51:15', '0', '1', '0', '2020-12-14 12:51:15', '2020-12-14 12:51:16');
INSERT INTO `t_user` VALUES ('8', 'admin005', '72dfbe253c3bcf9ef6d15172248c9986', '17000024234', 'admin005@aa.aa', '2020-12-14 12:51:34', '2020-12-14 12:51:34', '0', '1', '0', '2020-12-14 12:51:34', '2020-12-14 12:51:34');
INSERT INTO `t_user` VALUES ('9', 'admin006', '6b8dcbc554cbf7c4f330eddf42ee5fde', '17000025235', 'admin006@aa.aa', '2020-12-14 12:51:56', '2020-12-14 12:51:56', '0', '1', '0', '2020-12-14 12:51:56', '2020-12-14 12:51:57');
INSERT INTO `t_user` VALUES ('10', 'admin007', '98bfe7780b3044eba8560c4a35455a18', '17035353453', 'admin007@aa.aa', '2020-12-14 12:52:15', '2020-12-14 12:52:15', '0', '1', '0', '2020-12-14 12:52:15', '2020-12-14 12:52:16');
INSERT INTO `t_user` VALUES ('11', 'admin008', '775077f295cf6d6f5daba629971c73fe', '17002342342', 'admin008@aa.aa', '2020-12-14 12:52:33', '2020-12-14 12:52:33', '0', '1', '0', '2020-12-14 12:52:33', '2020-12-14 12:52:34');

-- ----------------------------
-- Table structure for t_user_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role_relation`;
CREATE TABLE `t_user_role_relation` (
  `pk_user_role_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '记录标识',
  `fk_user_id` bigint unsigned NOT NULL COMMENT '用户ID',
  `fk_role_id` bigint unsigned NOT NULL COMMENT '角色ID',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`pk_user_role_id`),
  KEY `fk_user_id` (`fk_user_id`),
  KEY `fk_role_id` (`fk_role_id`),
  CONSTRAINT `t_user_role_relation_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `t_user` (`pk_user_id`),
  CONSTRAINT `t_user_role_relation_ibfk_2` FOREIGN KEY (`fk_role_id`) REFERENCES `t_role` (`pk_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_user_role_relation
-- ----------------------------
INSERT INTO `t_user_role_relation` VALUES ('7', '1', '6', '0', '2020-12-14 11:39:41', '2020-12-14 11:39:41');
INSERT INTO `t_user_role_relation` VALUES ('8', '2', '6', '0', '2020-12-14 11:39:41', '2020-12-14 11:39:41');
INSERT INTO `t_user_role_relation` VALUES ('9', '3', '6', '0', '2020-12-14 11:39:41', '2020-12-14 11:39:41');
INSERT INTO `t_user_role_relation` VALUES ('10', '4', '1', '0', '2020-12-14 11:39:41', '2020-12-14 11:39:41');
INSERT INTO `t_user_role_relation` VALUES ('11', '5', '1', '0', '2020-12-14 11:39:41', '2020-12-14 11:39:41');
INSERT INTO `t_user_role_relation` VALUES ('12', '6', '1', '0', '2020-12-14 11:39:41', '2020-12-14 11:39:41');
INSERT INTO `t_user_role_relation` VALUES ('13', '7', '2', '0', '2020-12-14 12:51:15', '2020-12-14 12:51:16');
INSERT INTO `t_user_role_relation` VALUES ('14', '8', '3', '0', '2020-12-14 12:51:34', '2020-12-14 12:51:34');
INSERT INTO `t_user_role_relation` VALUES ('15', '9', '4', '0', '2020-12-14 12:51:56', '2020-12-14 12:51:57');
INSERT INTO `t_user_role_relation` VALUES ('16', '10', '5', '0', '2020-12-14 12:52:15', '2020-12-14 12:52:16');
INSERT INTO `t_user_role_relation` VALUES ('17', '11', '7', '0', '2020-12-14 12:52:34', '2020-12-14 12:52:34');
