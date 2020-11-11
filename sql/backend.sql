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

 Date: 11/11/2020 16:35:23
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (1, 0, '男装', '男装', 0, '2020-11-10 18:16:31', '2020-11-10 18:16:31');
INSERT INTO `t_category` VALUES (2, 0, '女装', '女装', 0, '2020-11-10 18:16:31', '2020-11-10 18:16:31');
INSERT INTO `t_category` VALUES (3, 1, 'T恤', 'T恤', 0, '2020-11-10 18:16:31', '2020-11-10 18:16:31');
INSERT INTO `t_category` VALUES (4, 1, '牛仔裤', '牛仔裤', 0, '2020-11-10 18:16:31', '2020-11-10 18:16:31');
INSERT INTO `t_category` VALUES (5, 2, 'T恤', 'T恤', 0, '2020-11-10 18:16:31', '2020-11-10 18:16:31');
INSERT INTO `t_category` VALUES (6, 2, '连衣裙', '连衣裙', 0, '2020-11-10 18:16:31', '2020-11-10 18:16:31');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `pk_log_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `operate_type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作类型(3增2删1改0查)',
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
INSERT INTO `t_log` VALUES (12, 3, '增', 'bbb', 0, '2020-10-29 11:42:25', '2020-10-29 11:42:25');
INSERT INTO `t_log` VALUES (13, 4, 'bbb成功登录', 'bbb', 0, '2020-10-29 11:51:22', '2020-10-29 11:51:22');
INSERT INTO `t_log` VALUES (14, 4, 'kkk成功登录', 'kkk', 0, '2020-10-29 12:15:32', '2020-10-29 12:15:32');
INSERT INTO `t_log` VALUES (15, 4, 'kkk成功登录', 'kkk', 0, '2020-10-29 12:18:52', '2020-10-29 12:18:52');
INSERT INTO `t_log` VALUES (16, 4, 'kkk成功登录', 'kkk', 0, '2020-10-29 20:09:29', '2020-10-29 20:09:29');
INSERT INTO `t_log` VALUES (17, 4, 'user1成功登录', 'user1', 0, '2020-10-30 14:43:47', '2020-10-30 14:43:47');
INSERT INTO `t_log` VALUES (18, 4, 'admin2成功登录', 'admin2', 0, '2020-10-30 14:44:24', '2020-10-30 14:44:24');
INSERT INTO `t_log` VALUES (19, 4, 'user1成功登录', 'user1', 0, '2020-10-30 20:04:14', '2020-10-30 20:04:14');
INSERT INTO `t_log` VALUES (20, 4, 'admin1成功登录', 'admin1', 0, '2020-10-30 20:04:54', '2020-10-30 20:04:54');
INSERT INTO `t_log` VALUES (21, 4, 'user1成功登录', 'user1', 0, '2020-10-30 20:05:51', '2020-10-30 20:05:51');
INSERT INTO `t_log` VALUES (22, 4, 'user1成功登录', 'user1', 0, '2020-10-30 20:06:20', '2020-10-30 20:06:20');
INSERT INTO `t_log` VALUES (23, 4, 'user002成功登录', 'user002', 0, '2020-11-02 11:39:41', '2020-11-02 11:39:41');
INSERT INTO `t_log` VALUES (28, 4, 'user003成功登录', 'user003', 0, '2020-11-02 11:55:45', '2020-11-02 11:55:45');
INSERT INTO `t_log` VALUES (29, 4, 'user001成功登录', 'user001', 0, '2020-11-02 11:57:46', '2020-11-02 11:57:46');
INSERT INTO `t_log` VALUES (30, 4, 'admin002成功登录', 'admin002', 0, '2020-11-02 12:01:02', '2020-11-02 12:01:02');
INSERT INTO `t_log` VALUES (31, 4, 'admin002成功登录', 'admin002', 0, '2020-11-02 12:01:58', '2020-11-02 12:01:58');
INSERT INTO `t_log` VALUES (32, 4, 'admin002成功登录', 'admin002', 0, '2020-11-02 12:02:18', '2020-11-02 12:02:18');
INSERT INTO `t_log` VALUES (33, 5, 'newUser002成功注册', 'newUser002', 0, '2020-11-02 15:47:02', '2020-11-02 15:47:02');
INSERT INTO `t_log` VALUES (34, 4, 'admin003成功登录', 'admin003', 0, '2020-11-03 10:55:47', '2020-11-03 10:55:47');
INSERT INTO `t_log` VALUES (35, 4, 'admin003成功登录', 'admin003', 0, '2020-11-03 10:55:54', '2020-11-03 10:55:54');
INSERT INTO `t_log` VALUES (36, 4, 'admin003成功登录', 'admin003', 0, '2020-11-03 10:57:58', '2020-11-03 10:57:58');
INSERT INTO `t_log` VALUES (37, 4, 'admin003成功登录', 'admin003', 0, '2020-11-03 11:01:44', '2020-11-03 11:01:44');
INSERT INTO `t_log` VALUES (38, 4, 'admin001成功登录', 'admin001', 0, '2020-11-03 11:06:45', '2020-11-03 11:06:45');
INSERT INTO `t_log` VALUES (39, 4, 'admin001成功登录', 'admin001', 0, '2020-11-03 11:07:16', '2020-11-03 11:07:16');
INSERT INTO `t_log` VALUES (40, 4, 'admin001成功登录', 'admin001', 0, '2020-11-03 11:09:29', '2020-11-03 11:09:29');
INSERT INTO `t_log` VALUES (41, 4, 'admin001成功登录', 'admin001', 0, '2020-11-03 11:09:53', '2020-11-03 11:09:53');
INSERT INTO `t_log` VALUES (42, 4, 'admin001成功登录', 'admin001', 0, '2020-11-03 11:10:44', '2020-11-03 11:10:44');
INSERT INTO `t_log` VALUES (43, 4, 'admin001成功登录', 'admin001', 0, '2020-11-03 11:11:28', '2020-11-03 11:11:28');
INSERT INTO `t_log` VALUES (44, 4, 'admin001成功登录', 'admin001', 0, '2020-11-03 11:12:47', '2020-11-03 11:12:47');
INSERT INTO `t_log` VALUES (45, 4, 'admin001成功登录', 'admin001', 0, '2020-11-03 11:13:23', '2020-11-03 11:13:23');
INSERT INTO `t_log` VALUES (46, 4, 'admin003成功登录', 'admin003', 0, '2020-11-03 11:16:19', '2020-11-03 11:16:19');
INSERT INTO `t_log` VALUES (47, 4, 'admin003成功登录', 'admin003', 0, '2020-11-03 11:21:24', '2020-11-03 11:21:24');
INSERT INTO `t_log` VALUES (48, 4, 'admin003成功登录', 'admin003', 0, '2020-11-03 11:22:29', '2020-11-03 11:22:29');
INSERT INTO `t_log` VALUES (49, 4, 'admin003成功登录', 'admin003', 0, '2020-11-03 11:24:26', '2020-11-03 11:24:26');
INSERT INTO `t_log` VALUES (50, 4, 'admin003成功登录', 'admin003', 0, '2020-11-03 11:33:28', '2020-11-03 11:33:28');
INSERT INTO `t_log` VALUES (51, 4, 'admin003成功登录', 'admin003', 0, '2020-11-03 11:36:40', '2020-11-03 11:36:40');
INSERT INTO `t_log` VALUES (52, 4, 'admin002成功登录', 'admin002', 0, '2020-11-03 18:44:22', '2020-11-03 18:44:22');
INSERT INTO `t_log` VALUES (53, 4, 'admin002成功登录', 'admin002', 0, '2020-11-03 18:45:29', '2020-11-03 18:45:29');
INSERT INTO `t_log` VALUES (54, 4, 'admin003成功登录', 'admin003', 0, '2020-11-03 18:46:48', '2020-11-03 18:46:48');
INSERT INTO `t_log` VALUES (55, 4, 'admin003成功登录', 'admin003', 0, '2020-11-03 18:51:14', '2020-11-03 18:51:14');
INSERT INTO `t_log` VALUES (56, 4, 'admin002成功登录', 'admin002', 0, '2020-11-03 18:57:30', '2020-11-03 18:57:30');
INSERT INTO `t_log` VALUES (57, 4, 'admin001成功登录', 'admin001', 0, '2020-11-03 18:59:08', '2020-11-03 18:59:08');
INSERT INTO `t_log` VALUES (58, 5, 'newUser003成功注册', 'newUser003', 0, '2020-11-03 20:11:32', '2020-11-03 20:11:32');
INSERT INTO `t_log` VALUES (59, 4, 'newUser003成功登录', 'newUser003', 0, '2020-11-03 20:12:06', '2020-11-03 20:12:06');
INSERT INTO `t_log` VALUES (60, 4, 'admin002成功登录', 'admin002', 0, '2020-11-03 20:12:48', '2020-11-03 20:12:48');
INSERT INTO `t_log` VALUES (61, 4, 'admin003成功登录', 'admin003', 0, '2020-11-04 18:59:53', '2020-11-04 18:59:53');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (1, 27, 'aaa', 'aaa', 'aaa', 233, 0, '2020-11-10 18:22:03', 0, '2020-11-10 18:22:03', '2020-11-10 18:22:03');
INSERT INTO `t_order` VALUES (2, 27, 'bbb', 'bbb', 'bbb', 666, 0, '2020-11-10 18:22:03', 0, '2020-11-10 18:22:03', '2020-11-10 18:22:03');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
INSERT INTO `t_order_detail` VALUES (4, 1, 5, 'aaa', '', 2200, 3, 6600, 0, '2020-11-10 18:24:34', '2020-11-10 18:24:34');
INSERT INTO `t_order_detail` VALUES (5, 1, 7, 'bbb', '', 6600, 10, 66000, 0, '2020-11-10 18:24:34', '2020-11-10 18:24:34');
INSERT INTO `t_order_detail` VALUES (6, 2, 8, 'ccc', '', 9900, 10, 99000, 0, '2020-11-10 18:24:34', '2020-11-10 18:24:34');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (5, 3, '男装T恤1', '男装T恤1', '', 2200, 0, 0, '2020-11-10 18:18:58', '2020-11-10 18:18:58');
INSERT INTO `t_product` VALUES (6, 4, '男装牛仔裤1', '男装牛仔裤1', '', 3300, 0, 0, '2020-11-10 18:18:58', '2020-11-10 18:18:58');
INSERT INTO `t_product` VALUES (7, 5, '女装T恤1', '女装T恤1', '', 6600, 0, 0, '2020-11-10 18:18:58', '2020-11-10 18:18:58');
INSERT INTO `t_product` VALUES (8, 6, '女装连衣裙1', '女装连衣裙1', '', 9900, 0, 0, '2020-11-10 18:18:58', '2020-11-10 18:18:58');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product_promotion_relation
-- ----------------------------
INSERT INTO `t_product_promotion_relation` VALUES (1, 5, 1, 0, '2020-11-10 18:20:19', '2020-11-10 18:20:19');
INSERT INTO `t_product_promotion_relation` VALUES (2, 6, 2, 0, '2020-11-10 18:20:19', '2020-11-10 18:20:19');
INSERT INTO `t_product_promotion_relation` VALUES (3, 8, 3, 0, '2020-11-10 18:20:19', '2020-11-10 18:20:19');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_promotion
-- ----------------------------
INSERT INTO `t_promotion` VALUES (1, '半价', '半价', 50, '2020-11-10 18:19:34', '2020-11-10 18:19:34', 0, '2020-11-10 18:19:34', '2020-11-10 18:19:34');
INSERT INTO `t_promotion` VALUES (2, '八折', '八折', 80, '2020-11-10 18:19:34', '2020-11-10 18:19:34', 0, '2020-11-10 18:19:34', '2020-11-10 18:19:34');
INSERT INTO `t_promotion` VALUES (3, '九折', '九折', 90, '2020-11-10 18:19:34', '2020-11-10 18:19:34', 0, '2020-11-10 18:19:34', '2020-11-10 18:19:34');

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
INSERT INTO `t_right` VALUES (11, 0, '添加商品', '添加商品', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (12, 0, '删除商品', '删除商品', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (13, 0, '修改商品', '修改商品', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (14, 0, '查询商品', '查询商品', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (15, 0, '添加用户', '添加用户', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (16, 0, '删除用户', '删除用户', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (17, 0, '修改用户', '修改用户', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (18, 0, '查询用户', '查询用户', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (19, 0, '添加角色', '添加角色', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (20, 0, '删除角色', '删除角色', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (21, 0, '修改角色', '修改角色', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (22, 0, '查询角色', '查询角色', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (23, 0, '添加订单', '添加订单', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (24, 0, '删除订单', '删除订单', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (25, 0, '修改订单', '修改订单', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (26, 0, '查询订单', '查询订单', 0, '2020-11-04 19:39:48', '2020-11-04 19:39:48');
INSERT INTO `t_right` VALUES (27, 0, '添加商品', '添加商品', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (28, 0, '删除商品', '删除商品', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (29, 0, '修改商品', '修改商品', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (30, 0, '查询商品', '查询商品', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (31, 0, '添加用户', '添加用户', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (32, 0, '删除用户', '删除用户', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (33, 0, '修改用户', '修改用户', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (34, 0, '查询用户', '查询用户', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (35, 0, '添加角色', '添加角色', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (36, 0, '删除角色', '删除角色', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (37, 0, '修改角色', '修改角色', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (38, 0, '查询角色', '查询角色', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (39, 0, '添加订单', '添加订单', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (40, 0, '删除订单', '删除订单', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (41, 0, '修改订单', '修改订单', 0, '2020-11-11 16:20:03', '2020-11-11 16:20:03');
INSERT INTO `t_right` VALUES (42, 0, 'aaa', 'aaa', 1, '2020-11-11 16:20:03', '2020-11-11 16:20:03');

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
INSERT INTO `t_role` VALUES (5, 0, '超级管理员', '拥有后台所有功能访问、授权权限，不能进入商城页面', 0, '2020-11-04 14:33:55', '2020-11-04 14:33:55');
INSERT INTO `t_role` VALUES (6, 5, '商品管理员', '拥有后台商品增删改查功能的访问权限，只显示商品管理菜单，不能进入商城页面', 0, '2020-11-04 14:33:55', '2020-11-04 14:33:55');
INSERT INTO `t_role` VALUES (7, 5, '用户管理员', '拥有后台用户增删改查功能的访问权限，只显示用户管理菜单，不能进入商城页面', 0, '2020-11-04 14:33:55', '2020-11-04 14:33:55');
INSERT INTO `t_role` VALUES (8, 5, '角色管理员', '拥有后台角色增删改查功能的访问权限，只显示角色管理菜单，不能进入商城页面', 0, '2020-11-04 14:33:55', '2020-11-04 14:33:55');
INSERT INTO `t_role` VALUES (9, 5, '订单管理员', '拥有后台订单改查功能的访问权限，只显示订单管理菜单，不能进入商城页面', 0, '2020-11-04 14:33:55', '2020-11-04 14:33:55');
INSERT INTO `t_role` VALUES (10, 0, '普通用户', '拥有进入商城页面、查看商品信息、新增/删除订单权限，不能进入后台管理页面', 0, '2020-11-04 14:33:55', '2020-11-04 14:33:55');
INSERT INTO `t_role` VALUES (11, 0, '超级管理员', '拥有后台所有功能访问、授权权限，不能进入商城页面', 0, '2020-11-11 15:46:52', '2020-11-11 15:46:52');
INSERT INTO `t_role` VALUES (12, 0, '商品管理员', '拥有后台商品增删改查功能的访问权限，只显示商品管理菜单，不能进入商城页面', 0, '2020-11-11 15:46:52', '2020-11-11 15:46:52');
INSERT INTO `t_role` VALUES (13, 0, '用户管理员', '拥有后台用户增删改查功能的访问权限，只显示用户管理菜单，不能进入商城页面', 0, '2020-11-11 15:46:52', '2020-11-11 15:46:52');
INSERT INTO `t_role` VALUES (14, 0, '角色管理员', '拥有后台角色增删改查功能的访问权限，只显示角色管理菜单，不能进入商城页面', 0, '2020-11-11 15:46:52', '2020-11-11 15:46:52');
INSERT INTO `t_role` VALUES (15, 0, '订单管理员', '拥有后台订单改查功能的访问权限，只显示订单管理菜单，不能进入商城页面', 0, '2020-11-11 15:46:52', '2020-11-11 15:46:52');
INSERT INTO `t_role` VALUES (16, 0, 'bbb', 'bbb', 1, '2020-11-11 15:46:52', '2020-11-11 15:46:52');

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
INSERT INTO `t_role_right_relation` VALUES (13, 5, 11, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (14, 5, 12, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (15, 5, 13, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (16, 5, 14, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (17, 5, 15, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (18, 5, 16, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (19, 5, 17, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (20, 5, 18, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (21, 5, 19, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (22, 5, 20, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (23, 5, 21, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (24, 5, 22, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (25, 5, 23, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (26, 5, 24, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (27, 5, 25, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (28, 5, 26, 1, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (29, 6, 11, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (30, 6, 12, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (31, 6, 13, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (32, 6, 14, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (33, 7, 15, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (34, 7, 16, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (35, 7, 17, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (36, 7, 18, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (37, 8, 19, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (38, 8, 20, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (39, 8, 21, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (40, 8, 22, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (41, 9, 25, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (42, 9, 26, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (43, 10, 23, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');
INSERT INTO `t_role_right_relation` VALUES (44, 10, 24, 0, 0, '2020-11-04 19:51:45', '2020-11-04 19:51:45');

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
  `is_delete` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`pk_user_id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (2, '张三', '9ab0d88431732957a618d4a469a0d4c3', '13000000000', 'aaa@aa.aa', '2020-10-29 10:31:49', '2020-10-29 10:31:49', 1, 0, 1, '2020-10-22 11:03:36', '2020-10-22 11:03:36');
INSERT INTO `t_user` VALUES (3, '李四', '250cf8b51c773f3f8dc8b4be867a9a02', '13000000000', 'aaa@aa.aa', '2020-10-22 11:03:36', '2020-10-22 11:03:36', 0, 0, 0, '2020-10-22 11:03:36', '2020-10-22 11:03:36');
INSERT INTO `t_user` VALUES (4, '王五', 'e165421110ba03099a1c0393373c5b43', '13000000000', 'aaa@aa.aa', '2020-10-22 11:03:36', '2020-10-22 11:03:36', 0, 0, 0, '2020-10-22 11:03:36', '2020-10-22 11:03:36');
INSERT INTO `t_user` VALUES (5, '赵六', 'fae0b27c451c728867a567e8c1bb4e53', '13000000000', 'aaa@aa.aa', '2020-10-22 11:03:36', '2020-10-22 11:03:36', 0, 0, 0, '2020-10-22 11:03:36', '2020-10-22 11:03:36');
INSERT INTO `t_user` VALUES (10, 'aaa', '08f8e0260c64418510cefb2b06eee5cd', '13000000000', 'aaa@aa.aa', '2020-10-22 14:52:17', '2020-10-22 14:52:17', 0, 0, 1, '2020-10-22 14:52:17', '2020-10-22 14:52:17');
INSERT INTO `t_user` VALUES (12, 'bbb', '08f8e0260c64418510cefb2b06eee5cd', '13000000000', 'aaa@aa.aa', '2020-10-29 11:51:22', '2020-10-29 11:50:53', 4, 0, 0, '2020-10-22 19:53:06', '2020-10-22 19:53:06');
INSERT INTO `t_user` VALUES (13, '666', 'b706835de79a2b4e80506f582af3676a', '13000000000', 'aaa@aa.aa', '2020-10-27 13:01:48', '2020-10-27 13:01:48', 0, 0, 1, '2020-10-27 13:01:48', '2020-10-27 13:01:48');
INSERT INTO `t_user` VALUES (14, 'kkk', 'cb42e130d1471239a27fca6228094f0e', '13000000000', 'aaa@aa.aa', '2020-10-29 20:09:29', '2020-10-29 12:18:52', 3, 0, 0, '2020-10-29 11:58:26', '2020-10-29 11:58:26');
INSERT INTO `t_user` VALUES (21, 'user1', '24c9e15e52afc47c225b757e7bee1f9d', '13000000000', 'aaa@aa.aa', '2020-10-30 20:06:20', '2020-10-30 20:05:51', 4, 0, 0, '2020-10-30 14:37:21', '2020-10-30 14:37:21');
INSERT INTO `t_user` VALUES (22, 'user2', '7e58d63b60197ceb55a1c487989a3720', '13000000000', 'aaa@aa.aa', '2020-10-30 14:37:21', '2020-10-30 14:37:21', 0, 0, 0, '2020-10-30 14:37:21', '2020-10-30 14:37:21');
INSERT INTO `t_user` VALUES (23, 'user3', '92877af70a45fd6a2ed7fe81e1236b78', '13000000000', 'aaa@aa.aa', '2020-10-30 14:37:21', '2020-10-30 14:37:21', 0, 0, 0, '2020-10-30 14:37:21', '2020-10-30 14:37:21');
INSERT INTO `t_user` VALUES (24, 'admin1', 'e00cf25ad42683b3df678c61f42c6bda', '13000000000', 'aaa@aa.aa', '2020-10-30 20:04:54', '2020-10-30 14:37:21', 1, 1, 0, '2020-10-30 14:37:21', '2020-10-30 14:37:21');
INSERT INTO `t_user` VALUES (25, 'admin2', 'c84258e9c39059a89ab77d846ddab909', '13000000000', 'aaa@aa.aa', '2020-10-30 14:44:24', '2020-10-30 14:37:21', 1, 1, 0, '2020-10-30 14:37:21', '2020-10-30 14:37:21');
INSERT INTO `t_user` VALUES (26, 'admin3', '32cacb2f994f6b42183a1300d9a3e8d6', '13000000000', 'aaa@aa.aa', '2020-10-30 14:37:21', '2020-10-30 14:37:21', 0, 1, 0, '2020-10-30 14:37:21', '2020-10-30 14:37:21');
INSERT INTO `t_user` VALUES (27, 'user001', '97f3c717da19b4697ae9884e67aabce6', '13000000001', 'a@a.a', '2020-11-02 11:57:45', '2020-11-02 11:33:01', 1, 0, 0, '2020-11-02 11:33:01', '2020-11-02 11:33:01');
INSERT INTO `t_user` VALUES (28, 'user002', '8b63b2922634ffaeab2019e50f13dd20', '13000000002', 'b@b.b', '2020-11-02 11:39:41', '2020-11-02 11:33:01', 1, 0, 0, '2020-11-02 11:33:01', '2020-11-02 11:33:01');
INSERT INTO `t_user` VALUES (29, 'user003', 'e16f3b20872b973a50a3c2a1ac996d99', '13000000003', 'c@c.c', '2020-11-02 11:55:45', '2020-11-02 11:55:01', 5, 0, 0, '2020-11-02 11:33:01', '2020-11-02 11:33:01');
INSERT INTO `t_user` VALUES (30, 'admin001', '4eef1e1ea34879a2ae60c60815927ed9', '13000000010', 'aa@aa.aa', '2020-11-03 18:59:07', '2020-11-03 11:13:22', 9, 1, 0, '2020-11-02 11:38:43', '2020-11-02 11:38:43');
INSERT INTO `t_user` VALUES (31, 'admin002', '40b9408eaf5dc1c195ba7175a97b5f8c', '13000000020', 'bb@bb.bb', '2020-11-03 20:12:48', '2020-11-03 18:57:30', 7, 1, 0, '2020-11-02 11:38:43', '2020-11-02 11:38:43');
INSERT INTO `t_user` VALUES (32, 'admin003', 'e71432aed2d17acc8b77d253531c818e', '13000000030', 'cc@cc.cc', '2020-11-04 18:59:52', '2020-11-03 18:51:14', 13, 1, 0, '2020-11-02 11:38:43', '2020-11-02 11:38:43');
INSERT INTO `t_user` VALUES (33, 'newUser001', '6328c9c12e952e34245395f9f18f818b', '13666666666', '666@666.com', '2020-11-02 15:42:43', '2020-11-02 15:42:43', 0, 0, 0, '2020-11-02 15:42:43', '2020-11-02 15:42:43');
INSERT INTO `t_user` VALUES (34, 'newUser002', 'b1b11a9c77e597b76ee2cfb9a619f13e', '13666666667', '777@77.com', '2020-11-02 15:47:02', '2020-11-02 15:47:02', 0, 0, 0, '2020-11-02 15:47:02', '2020-11-02 15:47:02');
INSERT INTO `t_user` VALUES (35, 'newUser003', '509718e7947b38736fe8fef29b59757c', '13666667777', 'kk@kk.kk', '2020-11-03 20:12:06', '2020-11-03 20:11:32', 1, 0, 0, '2020-11-03 20:11:32', '2020-11-03 20:11:32');

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
INSERT INTO `t_user_role_relation` VALUES (5, 27, 10, 0, '2020-11-04 19:43:14', '2020-11-04 19:43:14');
INSERT INTO `t_user_role_relation` VALUES (6, 28, 10, 0, '2020-11-04 19:43:14', '2020-11-04 19:43:14');
INSERT INTO `t_user_role_relation` VALUES (7, 29, 10, 0, '2020-11-04 19:43:14', '2020-11-04 19:43:14');
INSERT INTO `t_user_role_relation` VALUES (8, 30, 5, 0, '2020-11-04 19:43:14', '2020-11-04 19:43:14');
INSERT INTO `t_user_role_relation` VALUES (9, 31, 5, 0, '2020-11-04 19:43:14', '2020-11-04 19:43:14');
INSERT INTO `t_user_role_relation` VALUES (10, 32, 5, 0, '2020-11-04 19:43:14', '2020-11-04 19:43:14');

SET FOREIGN_KEY_CHECKS = 1;
