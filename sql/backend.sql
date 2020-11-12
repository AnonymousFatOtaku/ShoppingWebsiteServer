/*
 Navicat MySQL Data Transfer

 Source Server         : testdb
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : backend

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 12/11/2020 12:33:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `pk_category_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
  `parent_category_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '父分类id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类名',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类描述',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`pk_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `pk_log_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `operate_type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作类型',
  `operate_content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作内容',
  `fk_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作人',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`pk_log_id`) USING BTREE,
  INDEX `fk_username`(`fk_username`) USING BTREE,
  CONSTRAINT `t_log_ibfk_1` FOREIGN KEY (`fk_username`) REFERENCES `t_user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (1, 5, '成功注册', 'testuser001', 0, '2020-11-12 12:24:57', '2020-11-12 12:24:57');
INSERT INTO `t_log` VALUES (2, 4, '成功登录', 'testuser001', 0, '2020-11-12 12:25:39', '2020-11-12 12:25:39');
INSERT INTO `t_log` VALUES (3, 4, '成功登录', 'admin002', 0, '2020-11-12 12:32:22', '2020-11-12 12:32:22');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `pk_order_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `fk_user_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '买家名字',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '买家电话',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '买家地址',
  `payment` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单总价',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单状态',
  `order_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '下单时间',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`pk_order_id`) USING BTREE,
  INDEX `fk_user_id`(`fk_user_id`) USING BTREE,
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `t_user` (`pk_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail`  (
  `pk_order_detail_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单商品id',
  `fk_order_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单id',
  `fk_product_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商品名',
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商品缩略图',
  `price` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品单价',
  `quantity` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品数量',
  `total_price` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品总价',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`pk_order_detail_id`) USING BTREE,
  INDEX `fk_order_id`(`fk_order_id`) USING BTREE,
  INDEX `fk_product_id`(`fk_product_id`) USING BTREE,
  CONSTRAINT `t_order_detail_ibfk_1` FOREIGN KEY (`fk_order_id`) REFERENCES `t_order` (`pk_order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_order_detail_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `t_product` (`pk_product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `pk_product_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `fk_category_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品分类id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商品名',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品描述',
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商品缩略图',
  `price` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品售价',
  `saleable` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品状态',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`pk_product_id`) USING BTREE,
  INDEX `fk_category_id`(`fk_category_id`) USING BTREE,
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`fk_category_id`) REFERENCES `t_category` (`pk_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product
-- ----------------------------

-- ----------------------------
-- Table structure for t_product_promotion_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_product_promotion_relation`;
CREATE TABLE `t_product_promotion_relation`  (
  `pk_product_promotion_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录标识',
  `fk_product_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `fk_promotion_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动id',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`pk_product_promotion_id`) USING BTREE,
  INDEX `fk_product_id`(`fk_product_id`) USING BTREE,
  INDEX `fk_promotion_id`(`fk_promotion_id`) USING BTREE,
  CONSTRAINT `t_product_promotion_relation_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `t_product` (`pk_product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_product_promotion_relation_ibfk_2` FOREIGN KEY (`fk_promotion_id`) REFERENCES `t_promotion` (`pk_promotion_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product_promotion_relation
-- ----------------------------

-- ----------------------------
-- Table structure for t_promotion
-- ----------------------------
DROP TABLE IF EXISTS `t_promotion`;
CREATE TABLE `t_promotion`  (
  `pk_promotion_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '活动名',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '活动描述',
  `discount` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '折扣',
  `start_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '开始时间',
  `end_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '结束时间',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`pk_promotion_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for t_right
-- ----------------------------
DROP TABLE IF EXISTS `t_right`;
CREATE TABLE `t_right`  (
  `pk_right_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `parent_right_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级权限ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '权限名称',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '权限描述',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`pk_right_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_right
-- ----------------------------
INSERT INTO `t_right` VALUES (1, 0, '进入后台管理系统', '进入后台管理系统', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (2, 0, '进入商城页面', '进入商城页面', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (3, 1, '管理商品', '管理商品', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (4, 3, '添加商品', '添加商品', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (5, 3, '删除商品', '删除商品', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (6, 3, '修改商品', '修改商品', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (7, 3, '查询商品', '查询商品', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (8, 1, '管理用户', '管理用户', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (9, 8, '添加用户', '添加用户', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (10, 8, '删除用户', '删除用户', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (11, 8, '修改用户', '修改用户', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (12, 8, '查询用户', '查询用户', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (13, 1, '管理角色', '管理角色', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (14, 13, '添加角色', '添加角色', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (15, 13, '删除角色', '删除角色', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (16, 13, '修改角色', '修改角色', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (17, 13, '查询角色', '查询角色', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (18, 1, '管理订单', '管理订单', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (19, 18, '修改订单', '修改订单', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (20, 18, '查询订单', '查询订单', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (21, 2, '添加订单', '添加订单', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');
INSERT INTO `t_right` VALUES (22, 2, '删除订单', '删除订单', 0, '2020-11-12 11:54:44', '2020-11-12 11:54:44');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `pk_role_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `parent_role_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级角色ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`pk_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 0, '超级管理员', '拥有后台所有功能访问、授权权限，不能进入商城页面', 0, '2020-11-12 11:40:46', '2020-11-12 11:40:46');
INSERT INTO `t_role` VALUES (2, 1, '商品管理员', '拥有后台商品增删改查功能的访问权限，只显示商品管理菜单，不能进入商城页面', 0, '2020-11-12 11:40:46', '2020-11-12 11:40:46');
INSERT INTO `t_role` VALUES (3, 1, '用户管理员', '拥有后台用户增删改查功能的访问权限，只显示用户管理菜单，不能进入商城页面', 0, '2020-11-12 11:40:46', '2020-11-12 11:40:46');
INSERT INTO `t_role` VALUES (4, 1, '角色管理员', '拥有后台角色增删改查功能的访问权限，只显示角色管理菜单，不能进入商城页面', 0, '2020-11-12 11:40:46', '2020-11-12 11:40:46');
INSERT INTO `t_role` VALUES (5, 1, '订单管理员', '拥有后台订单改查功能的访问权限，只显示订单管理菜单，不能进入商城页面', 0, '2020-11-12 11:40:46', '2020-11-12 11:40:46');
INSERT INTO `t_role` VALUES (6, 0, '普通用户', '拥有进入商城页面、查看商品信息、新增/删除订单权限，不能进入后台管理页面', 0, '2020-11-12 11:40:46', '2020-11-12 11:40:46');

-- ----------------------------
-- Table structure for t_role_right_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_role_right_relation`;
CREATE TABLE `t_role_right_relation`  (
  `pk_role_right_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录标识',
  `fk_role_id` bigint UNSIGNED NOT NULL COMMENT '角色ID',
  `fk_right_id` bigint UNSIGNED NOT NULL COMMENT '权限ID',
  `right_type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '权限类型',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`pk_role_right_id`) USING BTREE,
  INDEX `fk_role_id`(`fk_role_id`) USING BTREE,
  INDEX `fk_right_id`(`fk_right_id`) USING BTREE,
  CONSTRAINT `t_role_right_relation_ibfk_1` FOREIGN KEY (`fk_role_id`) REFERENCES `t_role` (`pk_role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_role_right_relation_ibfk_2` FOREIGN KEY (`fk_right_id`) REFERENCES `t_right` (`pk_right_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_right_relation
-- ----------------------------
INSERT INTO `t_role_right_relation` VALUES (1, 1, 1, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (2, 1, 3, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (3, 1, 4, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (4, 1, 5, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (5, 1, 6, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (6, 1, 7, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (7, 1, 8, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (8, 1, 9, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (9, 1, 10, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (10, 1, 11, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (11, 1, 12, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (12, 1, 13, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (13, 1, 14, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (14, 1, 15, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (15, 1, 16, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (16, 1, 17, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (17, 1, 18, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (18, 1, 19, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (19, 1, 20, 1, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (20, 2, 1, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (21, 2, 3, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (22, 2, 4, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (23, 2, 5, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (24, 2, 6, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (25, 2, 7, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (26, 3, 1, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (27, 3, 8, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (28, 3, 9, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (29, 3, 10, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (30, 3, 11, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (31, 3, 12, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (32, 4, 1, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (33, 4, 13, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (34, 4, 14, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (35, 4, 15, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (36, 4, 16, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (37, 4, 17, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (38, 5, 1, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (39, 5, 18, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (40, 5, 19, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (41, 5, 20, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (42, 6, 2, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (43, 6, 21, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');
INSERT INTO `t_role_right_relation` VALUES (44, 6, 22, 0, 0, '2020-11-12 12:04:53', '2020-11-12 12:04:53');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `pk_user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `login_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登录时间',
  `last_login_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '上次登录时间',
  `login_count` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户权限标识',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`pk_user_id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'user001', '97f3c717da19b4697ae9884e67aabce6', '13000000001', 'aaa@aa.aa', '2020-11-12 11:36:51', '2020-11-12 11:36:51', 0, 0, 0, '2020-11-12 11:36:51', '2020-11-12 11:36:51');
INSERT INTO `t_user` VALUES (2, 'user002', '8b63b2922634ffaeab2019e50f13dd20', '13000000002', 'bbb@bb.bb', '2020-11-12 11:36:51', '2020-11-12 11:36:51', 0, 0, 0, '2020-11-12 11:36:51', '2020-11-12 11:36:51');
INSERT INTO `t_user` VALUES (3, 'user003', 'e16f3b20872b973a50a3c2a1ac996d99', '13000000003', 'ccc@cc.cc', '2020-11-12 11:36:51', '2020-11-12 11:36:51', 0, 0, 0, '2020-11-12 11:36:51', '2020-11-12 11:36:51');
INSERT INTO `t_user` VALUES (7, 'admin001', '4eef1e1ea34879a2ae60c60815927ed9', '13000000010', 'aa@aa.aa', '2020-11-12 11:37:06', '2020-11-12 11:37:06', 0, 1, 0, '2020-11-12 11:37:06', '2020-11-12 11:37:06');
INSERT INTO `t_user` VALUES (8, 'admin002', '40b9408eaf5dc1c195ba7175a97b5f8c', '13000000020', 'bb@bb.bb', '2020-11-12 12:32:22', '2020-11-12 11:37:06', 1, 1, 0, '2020-11-12 11:37:06', '2020-11-12 11:37:06');
INSERT INTO `t_user` VALUES (9, 'admin003', 'e71432aed2d17acc8b77d253531c818e', '13000000030', 'cc@cc.cc', '2020-11-12 11:37:06', '2020-11-12 11:37:06', 0, 1, 0, '2020-11-12 11:37:06', '2020-11-12 11:37:06');
INSERT INTO `t_user` VALUES (10, 'testuser001', '44ca33df04bc0536d071fa7789639b4f', '13666666666', 'testuser001@aa.aa', '2020-11-12 12:25:39', '2020-11-12 12:24:57', 1, 0, 0, '2020-11-12 12:24:57', '2020-11-12 12:24:57');

-- ----------------------------
-- Table structure for t_user_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role_relation`;
CREATE TABLE `t_user_role_relation`  (
  `pk_user_role_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录标识',
  `fk_user_id` bigint UNSIGNED NOT NULL COMMENT '用户ID',
  `fk_role_id` bigint UNSIGNED NOT NULL COMMENT '角色ID',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`pk_user_role_id`) USING BTREE,
  INDEX `fk_user_id`(`fk_user_id`) USING BTREE,
  INDEX `fk_role_id`(`fk_role_id`) USING BTREE,
  CONSTRAINT `t_user_role_relation_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `t_user` (`pk_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_user_role_relation_ibfk_2` FOREIGN KEY (`fk_role_id`) REFERENCES `t_role` (`pk_role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role_relation
-- ----------------------------
INSERT INTO `t_user_role_relation` VALUES (7, 1, 6, 0, '2020-11-12 11:57:21', '2020-11-12 11:57:21');
INSERT INTO `t_user_role_relation` VALUES (8, 2, 6, 0, '2020-11-12 11:57:21', '2020-11-12 11:57:21');
INSERT INTO `t_user_role_relation` VALUES (9, 3, 6, 0, '2020-11-12 11:57:21', '2020-11-12 11:57:21');
INSERT INTO `t_user_role_relation` VALUES (10, 7, 1, 0, '2020-11-12 11:57:21', '2020-11-12 11:57:21');
INSERT INTO `t_user_role_relation` VALUES (11, 8, 1, 0, '2020-11-12 11:57:21', '2020-11-12 11:57:21');
INSERT INTO `t_user_role_relation` VALUES (12, 9, 1, 0, '2020-11-12 11:57:21', '2020-11-12 11:57:21');

SET FOREIGN_KEY_CHECKS = 1;
