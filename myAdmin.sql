/*
 Navicat Premium Data Transfer

 Source Server         : 10.1.2.189(docker) mysql5.7
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : 10.1.2.189:3307
 Source Schema         : myAdmin

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 06/11/2020 16:58:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(10) NOT NULL COMMENT '用户',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'URL',
  `log_method` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '不记录' COMMENT '记录日志方法',
  `log_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作IP',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '操作时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1028 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '后台操作日志' ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for admin_log_data
-- ----------------------------
DROP TABLE IF EXISTS `admin_log_data`;
CREATE TABLE `admin_log_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_log_id` int(11) NOT NULL COMMENT '日志ID',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日志内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1018 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '后台操作日志数据' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父级菜单',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'url',
  `icon` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fa-list' COMMENT '图标',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '等级',
  `sort_id` int(10) NOT NULL DEFAULT 1000 COMMENT '排序',
  `log_method` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '不记录' COMMENT '记录日志方法',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_url`(`url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '后台菜单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, '后台首页', 'admin/index/index', 'fa-home', 1, 99, '不记录');
INSERT INTO `admin_menu` VALUES (2, 0, '系统管理', 'admin/sys', 'fa-desktop', 1, 1099, '不记录');
INSERT INTO `admin_menu` VALUES (3, 2, '用户管理', 'admin/admin_user/index', 'fa-user', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (4, 3, '添加用户界面', 'admin/admin_user/add', 'fa-plus', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (5, 3, '修改用户界面', 'admin/admin_user/edit', 'fa-edit', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (6, 3, '删除用户', 'admin/admin_user/del', 'fa-close', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (7, 2, '角色管理', 'admin/admin_role/index', 'fa-group', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (8, 7, '添加角色界面', 'admin/admin_role/add', 'fa-plus', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (9, 7, '修改角色界面', 'admin/admin_role/edit', 'fa-edit', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (10, 7, '删除角色', 'admin/admin_role/del', 'fa-close', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (11, 7, '角色授权界面', 'admin/admin_role/access', 'fa-key', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (12, 2, '菜单管理', 'admin/admin_menu/index', 'fa-align-justify', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (13, 12, '添加菜单界面', 'admin/admin_menu/add', 'fa-plus', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (14, 12, '修改菜单界面', 'admin/admin_menu/edit', 'fa-edit', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (15, 12, '删除菜单', 'admin/admin_menu/del', 'fa-close', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (16, 2, '操作日志', 'admin/admin_log/index', 'fa-keyboard-o', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (17, 16, '查看操作日志详情', 'admin/admin_log/view', 'fa-search-plus', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (18, 2, '个人资料', 'admin/admin_user/profile', 'fa-smile-o', 1, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (19, 0, '用户管理', 'admin/user/mange', 'fa-users', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (20, 19, '用户管理', 'admin/user/index', 'fa-user', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (21, 20, '添加用户界面', 'admin/user/add', 'fa-plus', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (22, 20, '修改用户界面', 'admin/user/edit', 'fa-pencil', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (23, 20, '删除用户', 'admin/user/del', 'fa-trash', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (24, 20, '启用用户', 'admin/user/enable', 'fa-circle', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (25, 20, '禁用用户', 'admin/user/disable', 'fa-circle', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (26, 19, '用户等级管理', 'admin/user_level/index', 'fa-th-list', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (27, 26, '添加用户等级界面', 'admin/user_level/add', 'fa-plus', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (28, 26, '修改用户等级界面', 'admin/user_level/edit', 'fa-pencil', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (29, 26, '删除用户等级', 'admin/user_level/del', 'fa-trash', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (30, 26, '启用用户等级', 'admin/user_level/enable', 'fa-circle', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (31, 26, '禁用用户等级', 'admin/user_level/disable', 'fa-circle', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (32, 2, '开发管理', 'admin/develop/manager', 'fa-code', 1, 1005, '不记录');
INSERT INTO `admin_menu` VALUES (43, 0, '设置中心', 'admin/setting/center', 'fa-cogs', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (47, 43, '后台设置', 'admin/setting/admin', 'fa-adjust', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (48, 43, '更新设置', 'admin/setting/update', 'fa-pencil', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (49, 32, '数据维护', 'admin/database/table', 'fa-database', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (50, 49, '查看表详情', 'admin/database/view', 'fa-eye', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (51, 49, '优化表', 'admin/database/optimize', 'fa-refresh', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (52, 49, '修复表', 'admin/database/repair', 'fa-circle-o-notch', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (53, 20, '创建用户', 'admin/user/create', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (54, 20, '修改用户', 'admin/user/update', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (55, 3, '修改头像', 'admin/admin_user/update_avatar', 'fa-list', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (56, 3, '添加用户', 'admin/admin_user/create', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (57, 3, '修改用户', 'admin/admin_user/update', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (58, 3, '用户启用', 'admin/admin_user/enable', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (59, 3, '用户禁用', 'admin/admin_user/disable', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (60, 3, '修改昵称', 'admin/admin_user/update_nickname', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (61, 3, '修改密码', 'admin/admin_user/update_password', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (62, 7, '创建角色', 'admin/admin_role/create', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (63, 7, '修改角色', 'admin/admin_role/update', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (64, 7, '启用角色', 'admin/admin_role/enable', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (65, 7, '禁用角色', 'admin/admin_role/disable', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (66, 7, '角色授权', 'admin/admin_role/access_operate', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (67, 12, '创建菜单', 'admin/admin_menu/create', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (68, 12, '修改菜单', 'admin/admin_menu/update', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (71, 47, '修改设置', 'admin/setting/info', 'fa-list', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (76, 20, '导出用户', 'admin/user/export', 'fa-list', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (77, 26, '创建用户等级', 'admin/user_level/create', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (78, 26, '更新用户等级', 'admin/user_level/update', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (79, 26, '用户等级导出', 'admin/user_level/export', 'fa-list', 0, 1000, '不记录');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '简介',
  `url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '后台角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, '管理员', '后台管理员角色', '1,19,20,21,22,23,24,25,53,54,76', 1);
INSERT INTO `admin_role` VALUES (2, '测试01', '测试01', '1,2,18,19,20,21,22,23,24,25,26,27,28,29,30,31', 1);
INSERT INTO `admin_role` VALUES (6, '测试02', '测试02', '1,2,16,17,18,43,48', 1);

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'JDJ5JDEwJGdjdHRSODl0bVN3RTlBUDdXVFdDZmVuUThQck5nWWphYWlyekdMNG1uWU8uTC95Z1lHUGZP' COMMENT '密码',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `role` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用 0：否 1：是',
  `delete_time` int(10) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '后台用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, 'super_admin', 'JDJhJDEwJGdMTC80bkp1T0MzWjhXcFhwVUdCVC40bkliMGV1WW5oeW51bHJsUC5UMk1kZ2l0djRzSlUy', '超级管理员', '/static/uploads/attachment/aecb9fb7-871b-43fc-9414-a4265d0cb72d.png', '1', 1, 0);
INSERT INTO `admin_user` VALUES (2, 'test01', 'JDJ5JDEwJGhVbXFoeExxUklZZDZBSDc4UU1VSWVwZjRJQnlOV3FCN1ZaUEpkSzhndVJFaW9sZk11MXh5', '测试人员', '/storage/attachment/UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', '2,3', 1, 0);
INSERT INTO `admin_user` VALUES (3, 'test03', 'JDJhJDEwJGFNbjdBeGJXcDRwWXg4ZHJ0QXE4UWVGRUt1d1M1SHhEemkzeXl3NXIwamZpL2lsVVFvUU1D', 'test03', '/static/admin/images/avatar.png', '2', 1, 0);

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '后台用户ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '前台用户ID',
  `original_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原文件名',
  `save_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '保存文件名',
  `save_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '系统完整路径',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '系统完整路径',
  `extension` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '后缀',
  `mime` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型',
  `size` bigint(20) NOT NULL DEFAULT 0 COMMENT '大小',
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'MD5',
  `sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(10) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES (1, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'WccgsnlYCMZDSS3t3LKR612f0ApATmnPJhEGgQfC.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/WccgsnlYCMZDSS3t3LKR612f0ApATmnPJhEGgQfC.png', '/storage/attachment/WccgsnlYCMZDSS3t3LKR612f0ApATmnPJhEGgQfC.png', 'png', 'image/png', 1933, '34e108c8af3d188ed67cade12161adee', '5c28e6e7661f7db99394528f396f2668599af19b', 1589253485, 1589253485, 0);
INSERT INTO `attachment` VALUES (2, 0, 0, '56644a9f283c058cd371316e186ef48a.png', '74FRJBLOfHp9i3coiWcCtfcpamPQQejLdveaXF83.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/74FRJBLOfHp9i3coiWcCtfcpamPQQejLdveaXF83.png', '/storage/attachment/74FRJBLOfHp9i3coiWcCtfcpamPQQejLdveaXF83.png', 'png', 'image/png', 1933, '2f7c28d905c4c126c7866feec52ed898', '50f100b4157c8bdfb7b75d6203cce148d208e9a1', 1589253549, 1589253549, 0);
INSERT INTO `attachment` VALUES (3, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', '/storage/attachment/UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', 'png', 'image/png', 1933, '33a2b255a31b2c76bc37998efcc55149', '1bd9af4271379d024c90f4e7af53c010f2e5c522', 1589253691, 1589253691, 0);
INSERT INTO `attachment` VALUES (4, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'vQ3l6X8egranupO4HCOyLIa1YIT0xutiK5W4lWTy.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/vQ3l6X8egranupO4HCOyLIa1YIT0xutiK5W4lWTy.png', '/storage/attachment/vQ3l6X8egranupO4HCOyLIa1YIT0xutiK5W4lWTy.png', 'png', 'image/png', 1933, '20d43ab3fc55a25b8a3c08e920c6509e', '32b5fb0900277e0fc73dc75324061c516652cf87', 1589253747, 1589253747, 0);
INSERT INTO `attachment` VALUES (5, 0, 0, 'ChMlWl62EoOIfNQZAByZfHC_ztYAAO9lQOSb3oAHJmU210.jpg', 'WAcipipNSyfyegJHOdB82TxBrBpqryO2dKVsgy8y.jpeg', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/WAcipipNSyfyegJHOdB82TxBrBpqryO2dKVsgy8y.jpeg', '/storage/attachment/WAcipipNSyfyegJHOdB82TxBrBpqryO2dKVsgy8y.jpeg', 'jpg', 'image/jpeg', 186112, 'accf4525967aee7bf01e92c02edfbc86', 'da11566cfcce96c0b99e678939bec97dca59c2b0', 1589445459, 1589445459, 0);
INSERT INTO `attachment` VALUES (6, 1, 0, 'ChMlWl62EoOIfNQZAByZfHC_ztYAAO9lQOSb3oAHJmU210.jpg', 'QVwFjuX19nTBVZdvENbDhrnFAJHNIOvDPai0aVun.jpeg', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/QVwFjuX19nTBVZdvENbDhrnFAJHNIOvDPai0aVun.jpeg', '/storage/attachment/QVwFjuX19nTBVZdvENbDhrnFAJHNIOvDPai0aVun.jpeg', 'jpg', 'image/jpeg', 186112, '25cba8953d51ca91e3a4d5d42958e51b', '04641ede249ec0ad939495f372a82baed5b44bc8', 1589446625, 1589446625, 0);
INSERT INTO `attachment` VALUES (7, 1, 0, 'f0a7cd43074283b428b0a33ecfca5f9d.png', 'CzRAFicjODm9LcbS5WPJ57MbPQlpugMOuaYFljb1.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/CzRAFicjODm9LcbS5WPJ57MbPQlpugMOuaYFljb1.png', '/storage/attachment/CzRAFicjODm9LcbS5WPJ57MbPQlpugMOuaYFljb1.png', 'png', 'image/png', 3699, 'ef0ad1ee26205b1277706689a833b9ea', '614264895fc8bff328d06ea7e5cd460c247fdde1', 1589510272, 1589510272, 0);
INSERT INTO `attachment` VALUES (8, 1, 0, 'e144023adba5d6b2bf2d2b8c552f9263.png', 'AnXpJzhbTRYKLzjTmBAulsKPzTI6cgleOZhsE30C.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/AnXpJzhbTRYKLzjTmBAulsKPzTI6cgleOZhsE30C.png', '/storage/attachment/AnXpJzhbTRYKLzjTmBAulsKPzTI6cgleOZhsE30C.png', 'png', 'image/png', 2119, '3bbfe1d67ed9893a0c7deca36d6c9c31', '967515f2205fc2f43e689b6cbb89f9a27acc63df', 1589510463, 1589510463, 0);
INSERT INTO `attachment` VALUES (9, 1, 0, 'e144023adba5d6b2bf2d2b8c552f9263.png', 'T1HMD2yNKGeE8TGG03Ql4mCrZ6jjsoG9hNXQVVIe.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/T1HMD2yNKGeE8TGG03Ql4mCrZ6jjsoG9hNXQVVIe.png', '/storage/attachment/T1HMD2yNKGeE8TGG03Ql4mCrZ6jjsoG9hNXQVVIe.png', 'png', 'image/png', 2119, '095a2a848ec63e068162d23e04a0fc3b', '9b39dbb355b1be0d945ead0182029f525fe1f9f6', 1589510536, 1589510536, 0);
INSERT INTO `attachment` VALUES (10, 1, 0, 'e144023adba5d6b2bf2d2b8c552f9263.png', 'HzzOJstp5iWIdk9936ckFJcPpnVJHSjVG561cZDp.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/HzzOJstp5iWIdk9936ckFJcPpnVJHSjVG561cZDp.png', '/storage/attachment/HzzOJstp5iWIdk9936ckFJcPpnVJHSjVG561cZDp.png', 'png', 'image/png', 2119, '5409a33b28b164d196888520e5b09e89', '44781cf49536ac7e9e648e9b7300fa07bb0d934a', 1589510685, 1589510685, 0);
INSERT INTO `attachment` VALUES (11, 1, 0, '1771ce624eccb96aad992df540126d3b.png', 'IXEZQdYkesJEHDSMYsFkSoDQr49kVDAnhPo3e10B.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/IXEZQdYkesJEHDSMYsFkSoDQr49kVDAnhPo3e10B.png', '/storage/attachment/IXEZQdYkesJEHDSMYsFkSoDQr49kVDAnhPo3e10B.png', 'png', 'image/png', 2545, '2d4043d86b04c2e6d67a0b5165b868bd', 'd98c67b3adc8a08c8c8a83b2650450f4fa8d7de0', 1589510698, 1589510698, 0);
INSERT INTO `attachment` VALUES (12, 1, 0, '72031bafedeba534d1e862b8d717f8db.png', '4Xr4f93zHIamjplAeaPbo4IwV8W9gFdWZUSt6tqZ.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/4Xr4f93zHIamjplAeaPbo4IwV8W9gFdWZUSt6tqZ.png', '/storage/attachment/4Xr4f93zHIamjplAeaPbo4IwV8W9gFdWZUSt6tqZ.png', 'png', 'image/png', 1702, 'fe07a7f8830d4235e68e0dd413e08077', 'd50626830bfede785e0e6e195c042b7decea8af5', 1589510713, 1589510713, 0);
INSERT INTO `attachment` VALUES (13, 1, 0, 'f0a7cd43074283b428b0a33ecfca5f9d.png', 'aA8IIphwuEdZdhb8M24yGEURKPAzk0ctBTr8dE9h.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/aA8IIphwuEdZdhb8M24yGEURKPAzk0ctBTr8dE9h.png', '/storage/attachment/aA8IIphwuEdZdhb8M24yGEURKPAzk0ctBTr8dE9h.png', 'png', 'image/png', 3699, '81bb1efe059d217f1384210be00d2bce', '460b610801e698e5b0ea81c8f4b1fcc557b454ca', 1589510729, 1589510729, 0);
INSERT INTO `attachment` VALUES (14, 1, 0, '6dcc15ea1701c449e63e6856f0931e2a.png', 'oLCSpNXrsYj0Gm6DkivCCn4yaXyGTg6LnihYeX4Z.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/oLCSpNXrsYj0Gm6DkivCCn4yaXyGTg6LnihYeX4Z.png', '/storage/attachment/oLCSpNXrsYj0Gm6DkivCCn4yaXyGTg6LnihYeX4Z.png', 'png', 'image/png', 1733, '0e62cb5d1b29aaded28b8b0b5b1d1041', 'efa12cc9f3fa193a5f3d26ab15cc18c82e1a9081', 1589511248, 1589511248, 0);
INSERT INTO `attachment` VALUES (15, 1, 0, '02fce9aecd6cadf6e019e988ad8703ce.png', 'jGmkRCGjuOHvdQdJcLXhwzKw2f53nbVxqgp9weYd.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/jGmkRCGjuOHvdQdJcLXhwzKw2f53nbVxqgp9weYd.png', '/storage/attachment/jGmkRCGjuOHvdQdJcLXhwzKw2f53nbVxqgp9weYd.png', 'png', 'image/png', 2614, '90fbb7f13d7c0241342e828fbe3778eb', '053f0ccaa95ad6d9620d8a1704f56d2169402c43', 1589521579, 1589521579, 0);
INSERT INTO `attachment` VALUES (16, 1, 0, '6dcc15ea1701c449e63e6856f0931e2a.png', 'EuBTtXhkHgQYTmAv0xTCiVgv9ikmJtYRRIAnuigx.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/EuBTtXhkHgQYTmAv0xTCiVgv9ikmJtYRRIAnuigx.png', '/storage/attachment/EuBTtXhkHgQYTmAv0xTCiVgv9ikmJtYRRIAnuigx.png', 'png', 'image/png', 1733, '54f588a46c4f84b465265448eef68ba9', '2dc51e4a47a62f60a0a21ba43518c2c0d78e69fb', 1589521647, 1589521647, 0);
INSERT INTO `attachment` VALUES (17, 1, 0, '72031bafedeba534d1e862b8d717f8db.png', 'wsEP8xKtWDOUAhcjSYbjxNJYpCy2KVil0J1HTRr3.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/wsEP8xKtWDOUAhcjSYbjxNJYpCy2KVil0J1HTRr3.png', '/storage/attachment/wsEP8xKtWDOUAhcjSYbjxNJYpCy2KVil0J1HTRr3.png', 'png', 'image/png', 1702, 'd4e59f60d950a70bf1168f5ce1391997', '29a7817d8c07749ab48e6aba7c0c87331df0120c', 1589521691, 1589521691, 0);
INSERT INTO `attachment` VALUES (18, 1, 0, '6dcc15ea1701c449e63e6856f0931e2a.png', 'cPxmQGCS50aMljpMJzbzYsdx9daK39g35AIo29Um.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/cPxmQGCS50aMljpMJzbzYsdx9daK39g35AIo29Um.png', '/storage/attachment/cPxmQGCS50aMljpMJzbzYsdx9daK39g35AIo29Um.png', 'png', 'image/png', 1733, '288d3f01a7a0ad96df5f93d722c9ae3f', 'bc1b4aeb2986b0554d18a15d0d7deba4ee877596', 1589521702, 1589521702, 0);
INSERT INTO `attachment` VALUES (19, 1, 0, '65e4ad92ece9fdb7f3822ba4fc322bf6.png', 'MLQRNGchfA3gRXz1LgFlVtci0ej2stNEHUY5X2Nr.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/MLQRNGchfA3gRXz1LgFlVtci0ej2stNEHUY5X2Nr.png', '/storage/attachment/MLQRNGchfA3gRXz1LgFlVtci0ej2stNEHUY5X2Nr.png', 'png', 'image/png', 1444, '39936049cac2b0e023ce0f3056f838d8', '7bfc521828376f771fd6f928526c8391e6235e3d', 1589521712, 1589521712, 0);
INSERT INTO `attachment` VALUES (20, 1, 0, 'd0b153352b15ea7097403c563e9c3be4.png', 'rxwVFPWkIM34HY6cyLuEw4CUs8BUah22eEUZts48.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/rxwVFPWkIM34HY6cyLuEw4CUs8BUah22eEUZts48.png', '/storage/attachment/rxwVFPWkIM34HY6cyLuEw4CUs8BUah22eEUZts48.png', 'png', 'image/png', 1705, 'f320421a05ff23d34fce76410dbe453c', 'da5b02f5f29fdb53835a0a83912b331ba061a276', 1589521722, 1589521722, 0);
INSERT INTO `attachment` VALUES (21, 1, 0, '65e4ad92ece9fdb7f3822ba4fc322bf6.png', 'v57lVvdc76ru5tpQX77GX3UMeE600vgE3B3D8Afu.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/v57lVvdc76ru5tpQX77GX3UMeE600vgE3B3D8Afu.png', '/storage/attachment/v57lVvdc76ru5tpQX77GX3UMeE600vgE3B3D8Afu.png', 'png', 'image/png', 1444, 'd4d86c27ae8d41c07f5cc4276276baa2', 'd42c0df7e91324a0e684448cd3dc159b8f58b394', 1589521755, 1589521755, 0);
INSERT INTO `attachment` VALUES (22, 1, 0, '6dcc15ea1701c449e63e6856f0931e2a.png', '2iu0A7RsCh6k6eWjJe2Fd9gGB6ASMT8JoNPRPPDv.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/2iu0A7RsCh6k6eWjJe2Fd9gGB6ASMT8JoNPRPPDv.png', '/storage/attachment/2iu0A7RsCh6k6eWjJe2Fd9gGB6ASMT8JoNPRPPDv.png', 'png', 'image/png', 1733, '6cb8f79a89b463b445805bc054615e27', '4cc0746e9e0c1fe7f5c053e1f93dfdc283d6cb5e', 1589521772, 1589521772, 0);
INSERT INTO `attachment` VALUES (23, 1, 0, '65e4ad92ece9fdb7f3822ba4fc322bf6.png', 'vc4h1dTIkWomlLCGYY3RayrDOMvmhz0xZr7Ygjh7.png', '/usr/local/nginx/html/laravel76/storage/app/public/attachment/vc4h1dTIkWomlLCGYY3RayrDOMvmhz0xZr7Ygjh7.png', '/storage/attachment/vc4h1dTIkWomlLCGYY3RayrDOMvmhz0xZr7Ygjh7.png', 'png', 'image/png', 1444, '00b1c1ac8742ee0d01fed824df84d18b', 'b5c86cfc070e72d86d005e6cab069859f6bc0b8f', 1589521783, 1589521783, 0);
INSERT INTO `attachment` VALUES (24, 1, 0, '56644a9f283c058cd371316e186ef48a.png', '6F075HC5tqmDS9RpH7NuKVMoeHUbo3BqQmTXO8W2.png', '/var/www/html/laravel76/storage/app/public/attachment/6F075HC5tqmDS9RpH7NuKVMoeHUbo3BqQmTXO8W2.png', '/storage/attachment/6F075HC5tqmDS9RpH7NuKVMoeHUbo3BqQmTXO8W2.png', 'png', 'image/png', 1933, '210b846289f96d731663e1004d1d1a01', 'ba69f1746d8368e9a20b0ff105d83366b4e30b71', 1591084706, 1591084706, 0);
INSERT INTO `attachment` VALUES (25, 1, 0, '56644a9f283c058cd371316e186ef48a.png', 'P2WepK36NDa1SmLKEDPqDNCDYiOzaWo2i0nsgsMg.png', '/var/www/html/laravel76/storage/app/public/attachment/P2WepK36NDa1SmLKEDPqDNCDYiOzaWo2i0nsgsMg.png', '/storage/attachment/P2WepK36NDa1SmLKEDPqDNCDYiOzaWo2i0nsgsMg.png', 'png', 'image/png', 1933, '77a98ede53af441bc0d3a9c4006d375b', '065d4a63ad7b30f4633bca42d6209d5958d46e69', 1591086909, 1591086909, 0);
INSERT INTO `attachment` VALUES (26, 1, 0, 'banner01.jpg', 'JAa8aWq9iiCuJ2B1B1WFiqzkGXgwV373BcYgUXZn.jpeg', '/var/www/html/laravel76/storage/app/public/attachment/JAa8aWq9iiCuJ2B1B1WFiqzkGXgwV373BcYgUXZn.jpeg', '/storage/attachment/JAa8aWq9iiCuJ2B1B1WFiqzkGXgwV373BcYgUXZn.jpeg', 'jpg', 'image/jpeg', 257304, 'a28a63be39c474148090b739e09427a3', '30226734e1dca6b29bc7e7e9237aa0576fe9199e', 1591086945, 1591086945, 0);
INSERT INTO `attachment` VALUES (27, 1, 0, '56644a9f283c058cd371316e186ef48a.png', 'AG96e3IVJEoPe8PMn7xxgX8Ke0pXTWdjJz1rlzso.png', '/var/www/html/laravel76/storage/app/public/attachment/AG96e3IVJEoPe8PMn7xxgX8Ke0pXTWdjJz1rlzso.png', '/storage/attachment/AG96e3IVJEoPe8PMn7xxgX8Ke0pXTWdjJz1rlzso.png', 'png', 'image/png', 1933, '09a4558a90e2c762af28c3f4cc9c4729', '1f68cd2121eb961c11ced05fc52bab78f2bfad15', 1591090012, 1591090012, 0);
INSERT INTO `attachment` VALUES (28, 1, 0, '56644a9f283c058cd371316e186ef48a.png', '5woXcHdkqNdS52AFElTQntPLOTjfDpI3cCIyQStn.png', '/var/www/html/laravel76/storage/app/public/attachment/5woXcHdkqNdS52AFElTQntPLOTjfDpI3cCIyQStn.png', '/storage/attachment/5woXcHdkqNdS52AFElTQntPLOTjfDpI3cCIyQStn.png', 'png', 'image/png', 1933, '8464e95865c388ba33cd029d3f9d93d5', '1aa82e4f1aee22f8e1027c25ce8a83be5ebbf3c3', 1591090026, 1591090026, 0);
INSERT INTO `attachment` VALUES (29, 1, 0, '56644a9f283c058cd371316e186ef48a.png', '6gdv3ktOwUVp6Ux3ts6pjqU2xq43QmRRtPRqAdTl.png', '/var/www/html/laravel76/storage/app/public/attachment/6gdv3ktOwUVp6Ux3ts6pjqU2xq43QmRRtPRqAdTl.png', '/storage/attachment/6gdv3ktOwUVp6Ux3ts6pjqU2xq43QmRRtPRqAdTl.png', 'png', 'image/png', 1933, '18854519c093c45a1595ec5e0ae5cfda', 'aded38287091b6b78eee43e61f6ac62b19671bc6', 1591091735, 1591091735, 0);
INSERT INTO `attachment` VALUES (30, 1, 0, '56644a9f283c058cd371316e186ef48a.png', 'VSwmtBYDvIUc4M3x0luoPkNsSqVSpcD5QLdG1Oee.png', '/var/www/html/laravel76/storage/app/public/attachment/VSwmtBYDvIUc4M3x0luoPkNsSqVSpcD5QLdG1Oee.png', '/storage/attachment/VSwmtBYDvIUc4M3x0luoPkNsSqVSpcD5QLdG1Oee.png', 'png', 'image/png', 1933, 'd48ca5b115211dae722e09c2879077b4', '23a55de92a3775c2bf18690ad231c5bbde822f9f', 1591256299, 1591256299, 0);
INSERT INTO `attachment` VALUES (31, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'FdYB4T3CuyaItjCyzx0pnXsOdNdbVXbdKD3ZbHLJ.png', '/var/www/html/laravel-admin/storage/app/public/attachment/FdYB4T3CuyaItjCyzx0pnXsOdNdbVXbdKD3ZbHLJ.png', '/storage/attachment/FdYB4T3CuyaItjCyzx0pnXsOdNdbVXbdKD3ZbHLJ.png', 'png', 'image/png', 1933, 'e226aa80847f9d0da1de605257554797', 'd3c4873f301d7cfa242a22a48e3d7943b27df71c', 1591685071, 1591685071, 0);
INSERT INTO `attachment` VALUES (32, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'N4YH5GsXhHFCZgksRxP35fDNXCq6z8lq6o4HNLwi.png', '/var/www/html/laravel-admin/storage/app/public/attachment/N4YH5GsXhHFCZgksRxP35fDNXCq6z8lq6o4HNLwi.png', '/storage/attachment/N4YH5GsXhHFCZgksRxP35fDNXCq6z8lq6o4HNLwi.png', 'png', 'image/png', 1933, 'e1e9c214df64d4794c0ae1e14d375e45', '1ae1a18f30b02f5302b6e88209e8e4368a78e726', 1591685095, 1591685095, 0);
INSERT INTO `attachment` VALUES (33, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'b0qLkhggbJR0U01lrcFmN4fG67p3PeNDfTDCucqE.png', '/var/www/html/laravel-admin/storage/app/public/attachment/b0qLkhggbJR0U01lrcFmN4fG67p3PeNDfTDCucqE.png', '/storage/attachment/b0qLkhggbJR0U01lrcFmN4fG67p3PeNDfTDCucqE.png', 'png', 'image/png', 1933, '53cf1f47fa5fff8f59e271a0e38290e6', 'e8bb0eb8d04d17c9b1570d581846e2f4a03c335d', 1591685111, 1591685111, 0);
INSERT INTO `attachment` VALUES (34, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'avSbaEJdrjLI9jpj8LgnJDja6jJczF0yWzSqjdvh.png', '/var/www/html/laravel-admin/storage/app/public/attachment/avSbaEJdrjLI9jpj8LgnJDja6jJczF0yWzSqjdvh.png', '/storage/attachment/avSbaEJdrjLI9jpj8LgnJDja6jJczF0yWzSqjdvh.png', 'png', 'image/png', 1933, '4cac2fed9516280c5ded4a0ad9a97e29', '97c5c9f44607da5a297da1e0079cdb32e3bc86be', 1591685244, 1591685244, 0);
INSERT INTO `attachment` VALUES (35, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'QODmab6xeKRIfU7oHPvaNsp8IS1wj8494YtLBHzV.png', '/var/www/html/laravel-admin/storage/app/public/attachment/QODmab6xeKRIfU7oHPvaNsp8IS1wj8494YtLBHzV.png', '/storage/attachment/QODmab6xeKRIfU7oHPvaNsp8IS1wj8494YtLBHzV.png', 'png', 'image/png', 1933, '068109e0ff989e153df59ef1637c3d99', 'c4b4841070f44580fff930e21954d46eeae8f2da', 1591685287, 1591685287, 0);
INSERT INTO `attachment` VALUES (36, 0, 0, 'guwen02.jpg', 'cFYc5D9G32I5h3ycKnEdyxPbcDUumwmSliKP9Plz.jpeg', '/var/www/html/laravel-admin/storage/app/public/attachment/cFYc5D9G32I5h3ycKnEdyxPbcDUumwmSliKP9Plz.jpeg', '/storage/attachment/cFYc5D9G32I5h3ycKnEdyxPbcDUumwmSliKP9Plz.jpeg', 'jpg', 'image/jpeg', 15029, 'aa8960e8d87649c2335aceec6bd06300', '527065e4cd3e8ad37a82657fc95deb3a321cbca0', 1591685566, 1591685566, 0);
INSERT INTO `attachment` VALUES (37, 0, 0, 'guwen06.jpg', 'e15gYgotK6jOChAoTrKxcnIVY3daEspTmUgzELmD.jpeg', '/var/www/html/laravel-admin/storage/app/public/attachment/e15gYgotK6jOChAoTrKxcnIVY3daEspTmUgzELmD.jpeg', '/storage/attachment/e15gYgotK6jOChAoTrKxcnIVY3daEspTmUgzELmD.jpeg', 'jpg', 'image/jpeg', 12998, '0ada54bba9ec500794c9e25d4d1a9153', '9c8c93191df3ea730adb22ff279e189f4508efce', 1591685601, 1591685601, 0);
INSERT INTO `attachment` VALUES (38, 0, 0, '56644a9f283c058cd371316e186ef48a.png', '3qMSzvq9U6rliFdJzkikBJK4RXXEF5nFNMnkjeFO.png', '/var/www/html/laravel-admin/storage/app/public/attachment/3qMSzvq9U6rliFdJzkikBJK4RXXEF5nFNMnkjeFO.png', '/storage/attachment/3qMSzvq9U6rliFdJzkikBJK4RXXEF5nFNMnkjeFO.png', 'png', 'image/png', 1933, 'e4c5ae80756733adea83757faf8575b4', '71bc23119f31b48874fcd1efb43d66d95e1f322d', 1591685694, 1591685694, 0);
INSERT INTO `attachment` VALUES (39, 0, 0, '56644a9f283c058cd371316e186ef48a.png', '2ClSlNaSKim0Otlgz3NOvxm8Um0HMiRGEYeHoB0t.png', '/var/www/html/laravel-admin/storage/app/public/attachment/2ClSlNaSKim0Otlgz3NOvxm8Um0HMiRGEYeHoB0t.png', '/storage/attachment/2ClSlNaSKim0Otlgz3NOvxm8Um0HMiRGEYeHoB0t.png', 'png', 'image/png', 1933, 'f6c5bf1709518e92201fcbb2ee726ec9', '6e5bef208ca37fc6d0920928198aa61d3b728567', 1592385747, 1592385747, 0);
INSERT INTO `attachment` VALUES (40, 0, 0, '56644a9f283c058cd371316e186ef48a.png', '4ohjlUhtmGGs7RMMMv2ANVvhAkMDQULAu6Q5vfPR.png', '/var/www/html/laravel-admin/storage/app/public/attachment/4ohjlUhtmGGs7RMMMv2ANVvhAkMDQULAu6Q5vfPR.png', '/storage/attachment/4ohjlUhtmGGs7RMMMv2ANVvhAkMDQULAu6Q5vfPR.png', 'png', 'image/png', 1933, 'a82bd5ac20d3dcba171470b4e616f77d', '73543ebc1f6189b5fce25f4d24d75dc9ffe43093', 1592386512, 1592386512, 0);
INSERT INTO `attachment` VALUES (41, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'ZsB3vPRp8Szq8gBYeswmXWYOzUWP4xI8bXN55GMI.png', '/var/www/html/laravel-admin/storage/app/public/attachment/ZsB3vPRp8Szq8gBYeswmXWYOzUWP4xI8bXN55GMI.png', '/storage/attachment/ZsB3vPRp8Szq8gBYeswmXWYOzUWP4xI8bXN55GMI.png', 'png', 'image/png', 1933, 'b93bec2af6b61e0f73d51df4c78b2e66', '63f3190decebc2f4dee1a9f361e6ad017cb7a155', 1595489426, 1595489426, 0);
INSERT INTO `attachment` VALUES (42, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'lhCkRT7cN42sFYG2X24qbUC5mTgOwxBDK8w99w7X.png', '/var/www/html/laravel-admin/storage/app/public/attachment/lhCkRT7cN42sFYG2X24qbUC5mTgOwxBDK8w99w7X.png', '/storage/attachment/lhCkRT7cN42sFYG2X24qbUC5mTgOwxBDK8w99w7X.png', 'png', 'image/png', 1933, 'a6f17da586c8b7f0065ee7c4ced802d5', '4893bbe008e7fcc221d806bd4c28c29b2d23248a', 1595491059, 1595491059, 0);
INSERT INTO `attachment` VALUES (43, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'lA5bv1w6sMHad04vo0tDWGnTHUsQsPPZIBYqbuej.png', '/var/www/html/laravel-admin/storage/app/public/attachment/lA5bv1w6sMHad04vo0tDWGnTHUsQsPPZIBYqbuej.png', '/storage/attachment/lA5bv1w6sMHad04vo0tDWGnTHUsQsPPZIBYqbuej.png', 'png', 'image/png', 1933, '77096c3f779707e1ecd05ddb4005e937', '2efae1631c23c8292785c77e87a189950988585a', 1595491081, 1595491081, 0);
INSERT INTO `attachment` VALUES (44, 0, 0, '56644a9f283c058cd371316e186ef48a.png', '47mAgIgcqjL36Od6SXNL48puaR0s3ZSFxq017BVT.png', '/var/www/html/laravel-admin/storage/app/public/attachment/47mAgIgcqjL36Od6SXNL48puaR0s3ZSFxq017BVT.png', '/storage/attachment/47mAgIgcqjL36Od6SXNL48puaR0s3ZSFxq017BVT.png', 'png', 'image/png', 1933, '52d7ab56ffc65166a7705943eedb2635', '0638aba7bf34bd66c29a533ac3e6a36bb068d33c', 1595491096, 1595491096, 0);
INSERT INTO `attachment` VALUES (45, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'XhGoZETVDfZ7Mz04gDD1U8vvpQyIPmZYtVPgTyTg.png', '/var/www/html/laravel-admin/storage/app/public/attachment/XhGoZETVDfZ7Mz04gDD1U8vvpQyIPmZYtVPgTyTg.png', '/storage/attachment/XhGoZETVDfZ7Mz04gDD1U8vvpQyIPmZYtVPgTyTg.png', 'png', 'image/png', 1933, 'fdea61251c92aae048aa41e38da38d47', '1c6cc040de18353bab062999531d3e76f9bc3694', 1595491104, 1595491104, 0);
INSERT INTO `attachment` VALUES (46, 0, 0, 'timg (1).jpg', 'bUGWlU7XvCgFYQ2ZreVaD4FtTpumeftPNl1GLUfF.jpeg', '/var/www/html/laravel-admin/storage/app/public/attachment/bUGWlU7XvCgFYQ2ZreVaD4FtTpumeftPNl1GLUfF.jpeg', '/storage/attachment/bUGWlU7XvCgFYQ2ZreVaD4FtTpumeftPNl1GLUfF.jpeg', 'jpg', 'image/jpeg', 98544, 'fdee6d0b5fc929e01a53d5b8dd818101', '9baff67a297db0e15a2f8d92ea16ad6636b8c017', 1595556703, 1595556703, 0);
INSERT INTO `attachment` VALUES (47, 0, 0, '56644a9f283c058cd371316e186ef48a.png', '4HtcpCclUg50dnXDeWzSUZdi71gl1mYYknKoPysR.png', '/var/www/html/laravel-admin/storage/app/public/attachment/4HtcpCclUg50dnXDeWzSUZdi71gl1mYYknKoPysR.png', '/storage/attachment/4HtcpCclUg50dnXDeWzSUZdi71gl1mYYknKoPysR.png', 'png', 'image/png', 1933, '3d2d34b042564e21d845c6d26cf451e5', 'e2d0d4b05650d6b667a367b39ad49544cdf85381', 1596004617, 1596004617, 0);
INSERT INTO `attachment` VALUES (48, 0, 0, '56644a9f283c058cd371316e186ef48a.png', '1THtrWjH2eawYFZpZRqBxXuW0n1epDG5ck86Jh8I.png', '/var/www/html/laravel-admin/storage/app/public/attachment/1THtrWjH2eawYFZpZRqBxXuW0n1epDG5ck86Jh8I.png', '/storage/attachment/1THtrWjH2eawYFZpZRqBxXuW0n1epDG5ck86Jh8I.png', 'png', 'image/png', 1933, 'fb4bac998e8da8b7f5d52cf82d61b5c7', 'da906339e7278eb363e8033fa36b7248064804c0', 1596004855, 1596004855, 0);
INSERT INTO `attachment` VALUES (49, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'ZB6TbTDknr6cieolcSM8CIW1xAGKI7isaDkHnL5U.png', '/var/www/html/laravel-admin/storage/app/public/attachment/ZB6TbTDknr6cieolcSM8CIW1xAGKI7isaDkHnL5U.png', '/storage/attachment/ZB6TbTDknr6cieolcSM8CIW1xAGKI7isaDkHnL5U.png', 'png', 'image/png', 1933, 'cd6271d76f6b4cb89099cac06c320a51', '777f9a0319672731242e049deefa70298f6ff8a3', 1596004968, 1596004968, 0);
INSERT INTO `attachment` VALUES (50, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'xHqlsyh1PEgqBv7avfl7Cnesd9qKXZ8uAUiwoAvz.png', '/var/www/html/laravel-admin/storage/app/public/attachment/xHqlsyh1PEgqBv7avfl7Cnesd9qKXZ8uAUiwoAvz.png', '/storage/attachment/xHqlsyh1PEgqBv7avfl7Cnesd9qKXZ8uAUiwoAvz.png', 'png', 'image/png', 1933, '84671c15891624392e2ead15573394a8', 'dd10daa166c283c180b741a346c9151f6697bb81', 1596004985, 1596004985, 0);
INSERT INTO `attachment` VALUES (51, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'QcAIudzblfsyFsLF1FLO2VA2Um78LgYNalUM3OGv.png', '/var/www/html/laravel-admin/storage/app/public/attachment/QcAIudzblfsyFsLF1FLO2VA2Um78LgYNalUM3OGv.png', '/storage/attachment/QcAIudzblfsyFsLF1FLO2VA2Um78LgYNalUM3OGv.png', 'png', 'image/png', 1933, '3ac6a79fcf33f1793f7d88318420c929', 'df812fc1409786f635124558fd5ca4899cac68dd', 1596004996, 1596004996, 0);
INSERT INTO `attachment` VALUES (52, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'vIEyubvqvRPxc9u9x0n5qcYd22gTXGQdLLNlJPVX.png', '/var/www/html/laravel-admin/storage/app/public/attachment/vIEyubvqvRPxc9u9x0n5qcYd22gTXGQdLLNlJPVX.png', '/storage/attachment/vIEyubvqvRPxc9u9x0n5qcYd22gTXGQdLLNlJPVX.png', 'png', 'image/png', 1933, 'f482f083074e02f18f22dd77c6c4e510', 'ce9086e4c275aa2117db970567c3ddcdd9eca912', 1596005186, 1596005186, 0);
INSERT INTO `attachment` VALUES (53, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'axBsOHwS6TwSBEsAIRniYAUWxJ3Nusr1mDHhxR5B.png', '/var/www/html/laravel-admin/storage/app/public/attachment/axBsOHwS6TwSBEsAIRniYAUWxJ3Nusr1mDHhxR5B.png', '/storage/attachment/axBsOHwS6TwSBEsAIRniYAUWxJ3Nusr1mDHhxR5B.png', 'png', 'image/png', 1933, '97f80e18d6f9f2ed174ac1c873591a8e', '70786ee6676acd2cb5379c832a48468766b1e1f7', 1596008111, 1596008111, 0);
INSERT INTO `attachment` VALUES (54, 0, 0, '56644a9f283c058cd371316e186ef48a.png', 'c3Th21BQfwgJF1UWpJowuHQMSqOtUu5KTz3dObRH.png', '/var/www/html/laravel-admin/storage/app/public/attachment/c3Th21BQfwgJF1UWpJowuHQMSqOtUu5KTz3dObRH.png', '/storage/attachment/c3Th21BQfwgJF1UWpJowuHQMSqOtUu5KTz3dObRH.png', 'png', 'image/png', 1933, '9088dfc7a4660a615af68cfb148fc874', 'c2df4924d1b2a197b2908cc759760ef23b20c5ca', 1596008153, 1596008153, 0);
INSERT INTO `attachment` VALUES (55, 1, 0, '56644a9f283c058cd371316e186ef48a.png', '6d40b131-341a-497a-b712-da1d1a24a91f', 'static/uploads/attachment/6d40b131-341a-497a-b712-da1d1a24a91f.png', '/static/uploads/attachment/6d40b131-341a-497a-b712-da1d1a24a91f.png', 'png', 'image/png', 1933, '207d9dd501da7cad94df1f26f569e972', 'c192700a4efa7bdd82cbd117f772e4a6e585d4f1', 1602579498, 1602579498, 0);
INSERT INTO `attachment` VALUES (56, 1, 0, 'touxiang.jpg', 'c838a0bc-a3d7-4596-8a93-288c6364f1fc', 'D:/Go/src/beego-admin/static/uploads/attachment/c838a0bc-a3d7-4596-8a93-288c6364f1fc.jpg', '/static/uploads/attachment/c838a0bc-a3d7-4596-8a93-288c6364f1fc.jpg', 'jpg', 'image/jpeg', 12700, 'b3907b24c6a3bdddb6ead9c5f0af3859', 'dccb79b0d6bdba5b3ae833a6b8948f5bbe9fd2f8', 1602579715, 1602579715, 0);
INSERT INTO `attachment` VALUES (57, 1, 0, '56644a9f283c058cd371316e186ef48a.png', 'aecb9fb7-871b-43fc-9414-a4265d0cb72d', 'D:/Go/src/beego-admin/static/uploads/attachment/aecb9fb7-871b-43fc-9414-a4265d0cb72d.png', '/static/uploads/attachment/aecb9fb7-871b-43fc-9414-a4265d0cb72d.png', 'png', 'image/png', 1933, '9e6cc15c8fcf5b58141b2dead81982d2', 'e532ec3fef8264806212809452a840afc8e17e2c', 1602579833, 1602579833, 0);
INSERT INTO `attachment` VALUES (58, 1, 0, 'timg (2).jpg', 'ba450a52-0e63-4f0b-93aa-b19c312d1034', 'D:/Go/src/beego-admin/static/uploads/attachment/ba450a52-0e63-4f0b-93aa-b19c312d1034.jpg', '/static/uploads/attachment/ba450a52-0e63-4f0b-93aa-b19c312d1034.jpg', 'jpg', 'image/jpeg', 256514, '05de0fd2268116b475d49e172c03510e', '43a2066e22c5d84158a6600ff52c03cf91b6e016', 1603852752, 1603852752, 0);
INSERT INTO `attachment` VALUES (59, 1, 0, 'timg (1).jpg', '2dcd08fc-9fcc-4c4f-85d9-8fe0600db1f7', 'D:/Go/src/beego-admin/static/uploads/attachment/2dcd08fc-9fcc-4c4f-85d9-8fe0600db1f7.jpg', '/static/uploads/attachment/2dcd08fc-9fcc-4c4f-85d9-8fe0600db1f7.jpg', 'jpg', 'image/jpeg', 98544, '745cd958d444ece9bcad3ddfb7ede342', '702f6825ab0b79f1a169ea4700e7e525308ae4f1', 1603862327, 1603862327, 0);
INSERT INTO `attachment` VALUES (60, 1, 0, 'timg (3).jpg', 'd4c95df3-ea7d-4b90-94d6-9b756293ce4f', 'D:/Go/src/beego-admin/static/uploads/attachment/d4c95df3-ea7d-4b90-94d6-9b756293ce4f.jpg', '/static/uploads/attachment/d4c95df3-ea7d-4b90-94d6-9b756293ce4f.jpg', 'jpg', 'image/jpeg', 60186, 'f65b66ad7dae44138328b9eedd26b736', '62e9c1d79f8374bd494220d051f803cf94582ed2', 1603862942, 1603862942, 0);
INSERT INTO `attachment` VALUES (61, 1, 0, 'timg (1).jpg', 'c43f3ba8-242e-4d87-972a-39380e81eb70', 'D:/Go/src/beego-admin/static/uploads/attachment/c43f3ba8-242e-4d87-972a-39380e81eb70.jpg', '/static/uploads/attachment/c43f3ba8-242e-4d87-972a-39380e81eb70.jpg', 'jpg', 'image/jpeg', 98544, '43278c889afb284c1d5b9d947c3b7035', '82171bca152300ab0a44123f484caa53062d9383', 1603864318, 1603864318, 0);
INSERT INTO `attachment` VALUES (62, 1, 0, 'timg (3).jpg', '7a25ac9e-4c1e-4109-b67f-79f14f5a781b', 'D:/Go/src/beego-admin/static/uploads/attachment/7a25ac9e-4c1e-4109-b67f-79f14f5a781b.jpg', '/static/uploads/attachment/7a25ac9e-4c1e-4109-b67f-79f14f5a781b.jpg', 'jpg', 'image/jpeg', 60186, 'bde2603991104015f92071f379d9a930', 'aba14f280fedc5639f871bc6e4f881b0793461eb', 1603864605, 1603864605, 0);
INSERT INTO `attachment` VALUES (63, 1, 0, 'timg (1).jpg', 'ea08c391-0eb4-4c6a-8e4f-9846c51d61cc', 'D:/Go/src/beego-admin/static/uploads/attachment/ea08c391-0eb4-4c6a-8e4f-9846c51d61cc.jpg', '/static/uploads/attachment/ea08c391-0eb4-4c6a-8e4f-9846c51d61cc.jpg', 'jpg', 'image/jpeg', 98544, 'a6ef70cb91d6650906e4daa7cdd15e23', '6d7ffee210d3acef266fcaf7fca239319d080c13', 1603864898, 1603864898, 0);
INSERT INTO `attachment` VALUES (64, 1, 0, 'touxiang.jpg', '05446cad-e3a9-47e9-92cd-7a0a11867d50', 'D:/Go/src/beego-admin/static/uploads/attachment/05446cad-e3a9-47e9-92cd-7a0a11867d50.jpg', '/static/uploads/attachment/05446cad-e3a9-47e9-92cd-7a0a11867d50.jpg', 'jpg', 'image/jpeg', 12700, '586acfd808d6bdc75994aab25ef0f5b3', 'aba289b63e3127b34b5b0fa11460850633ede4c0', 1604044712, 1604044712, 0);
INSERT INTO `attachment` VALUES (65, 1, 0, '56644a9f283c058cd371316e186ef48a.png', 'f3857879-e1a2-4fd3-91d7-31f7ac27cb93', 'D:/Go/src/beego-admin/static/uploads/attachment/f3857879-e1a2-4fd3-91d7-31f7ac27cb93.png', '/static/uploads/attachment/f3857879-e1a2-4fd3-91d7-31f7ac27cb93.png', 'png', 'image/png', 1933, 'ddd159e517ba49f123cdaad5087faca5', '2d5ec1c65e3c2ce193c5276b18c6290a7a2b6529', 1604046311, 1604046311, 0);
INSERT INTO `attachment` VALUES (66, 1, 0, 'touxiang.jpg', 'c9d647d6-b0c7-4dc7-98a6-632597e5e4c7', 'D:/Go/src/beego-admin/static/uploads/attachment/c9d647d6-b0c7-4dc7-98a6-632597e5e4c7.jpg', '/static/uploads/attachment/c9d647d6-b0c7-4dc7-98a6-632597e5e4c7.jpg', 'jpg', 'image/jpeg', 12700, 'c3e065ee3056a9fa019e7c54b5f0a965', '918a99e1cbad53d859e4071506af9312b420acc4', 1604047000, 1604047000, 0);
INSERT INTO `attachment` VALUES (67, 1, 0, '56644a9f283c058cd371316e186ef48a.png', 'd79d90b9-9ddc-4109-921d-8e493ca03d61', 'D:/Go/src/beego-admin/static/uploads/attachment/d79d90b9-9ddc-4109-921d-8e493ca03d61.png', '/static/uploads/attachment/d79d90b9-9ddc-4109-921d-8e493ca03d61.png', 'png', 'image/png', 1933, '81f197338df3a7c83d2e43f230cf62b7', '43c46c62d03f563418fd1988d8693fd47df8b4fe', 1604306078, 1604306078, 0);
INSERT INTO `attachment` VALUES (68, 1, 0, 'touxiang.jpg', 'aeed3011-8626-4c36-b232-0390edfa77a5', 'D:/Go/src/beego-admin/static/uploads/attachment/aeed3011-8626-4c36-b232-0390edfa77a5.jpg', '/static/uploads/attachment/aeed3011-8626-4c36-b232-0390edfa77a5.jpg', 'jpg', 'image/jpeg', 12700, '3834aaf387f027929b4c8aa9e94464de', '9a835d38c9cbd2733945b801bd72c60cbef451c5', 1604307558, 1604307558, 0);
INSERT INTO `attachment` VALUES (69, 1, 0, 'touxiang.jpg', '05bdd082-3858-437e-a439-43c9a3c45280', 'D:/Go/src/beego-admin/static/uploads/attachment/05bdd082-3858-437e-a439-43c9a3c45280.jpg', '/static/uploads/attachment/05bdd082-3858-437e-a439-43c9a3c45280.jpg', 'jpg', 'image/jpeg', 12700, '4582abadaf3151a77ca4c2b064d57bdc', '1ef9634f6b9c55b0a694f1a0a2995f79ddff95f7', 1604307570, 1604307570, 0);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `start_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `breakpoint` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (20190302092540, 'AdminMenu', '2020-04-26 13:44:30', '2020-04-26 13:44:30', 0);
INSERT INTO `migrations` VALUES (20190302094849, 'AdminUser', '2020-04-26 13:44:30', '2020-04-26 13:44:30', 0);
INSERT INTO `migrations` VALUES (20190302094853, 'AdminLog', '2020-04-26 13:44:30', '2020-04-26 13:44:30', 0);
INSERT INTO `migrations` VALUES (20190302094933, 'AdminRole', '2020-04-26 13:44:30', '2020-04-26 13:44:30', 0);
INSERT INTO `migrations` VALUES (20190312021143, 'AdminLogData', '2020-04-26 13:44:30', '2020-04-26 13:44:30', 0);
INSERT INTO `migrations` VALUES (20190518030432, 'Attachment', '2020-04-26 13:44:30', '2020-04-26 13:44:30', 0);
INSERT INTO `migrations` VALUES (20190615081122, 'User', '2020-04-26 13:44:30', '2020-04-26 13:44:31', 0);
INSERT INTO `migrations` VALUES (20190822082112, 'UserLevel', '2020-04-26 13:44:31', '2020-04-26 13:44:31', 0);
INSERT INTO `migrations` VALUES (20191001081329, 'Setting', '2020-04-26 13:44:31', '2020-04-26 13:44:31', 0);
INSERT INTO `migrations` VALUES (20191001081340, 'SettingGroup', '2020-04-26 13:44:31', '2020-04-26 13:44:31', 0);
INSERT INTO `migrations` VALUES (20191012005355, 'Test', '2020-04-26 13:44:31', '2020-04-26 13:44:31', 0);

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_group_id` int(10) NOT NULL DEFAULT 0 COMMENT '所属分组',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '代码',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '设置配置及内容',
  `sort_number` int(10) NOT NULL DEFAULT 1000 COMMENT '排序',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(10) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '设置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, 1, '基本设置', '后台的基本信息设置', 'base', '[{\"Name\":\"后台名称\",\"Field\":\"name\",\"Type\":\"text\",\"Content\":\"beego通用后台系统\",\"Option\":\"\",\"Form\":\"\"},{\"Name\":\"后台简称\",\"Field\":\"short_name\",\"Type\":\"text\",\"Content\":\"beego通用后台系统\",\"Option\":\"\",\"Form\":\"\"},{\"Name\":\"后台作者\",\"Field\":\"author\",\"Type\":\"text\",\"Content\":\"虞行飞\",\"Option\":\"\",\"Form\":\"\"},{\"Name\":\"后台版本\",\"Field\":\"version\",\"Type\":\"text\",\"Content\":\"0.1\",\"Option\":\"\",\"Form\":\"\"}]', 1000, 1587879871, 1596008207, 0);
INSERT INTO `setting` VALUES (2, 1, '登录设置', '后台登录相关设置', 'login', '[{\"Name\":\"登录token验证\",\"Field\":\"token\",\"Type\":\"switch\",\"Content\":\"1\",\"Option\":\"\",\"Form\":\"\"},{\"Name\":\"验证码\",\"Field\":\"captcha\",\"Type\":\"select\",\"Content\":\"1\",\"Option\":\"0||不开启\\r\\n1||图形验证码\",\"Form\":\"\"},{\"Name\":\"登录背景\",\"Field\":\"background\",\"Type\":\"image\",\"Content\":\"/static/uploads/attachment/ea08c391-0eb4-4c6a-8e4f-9846c51d61cc.jpg\",\"Option\":\"\",\"Form\":\"\"}]', 1, 1587879871, 1595556703, 0);
INSERT INTO `setting` VALUES (3, 1, '首页设置', '后台首页参数设置', 'index', '[{\"Name\":\"默认密码警告\",\"Field\":\"password_warning\",\"Type\":\"switch\",\"Content\":\"1\",\"Option\":\"\",\"Form\":\"\"},{\"Name\":\"是否显示提示信息\",\"Field\":\"show_notice\",\"Type\":\"switch\",\"Content\":\"1\",\"Option\":\"\",\"Form\":\"\"},{\"Name\":\"提示信息内容\",\"Field\":\"notice_content\",\"Type\":\"text\",\"Content\":\"欢迎来到使用本系统，左侧为菜单区域，右侧为功能区。\",\"Option\":\"\",\"Form\":\"\"}]', 1, 1587879871, 1596008219, 0);

-- ----------------------------
-- Table structure for setting_group
-- ----------------------------
DROP TABLE IF EXISTS `setting_group`;
CREATE TABLE `setting_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '作用模块',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '代码',
  `sort_number` int(10) NOT NULL DEFAULT 1000 COMMENT '排序',
  `auto_create_menu` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动生成菜单',
  `auto_create_file` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动生成配置文件',
  `icon` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fa-list' COMMENT '图标',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(10) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '设置分组' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of setting_group
-- ----------------------------
INSERT INTO `setting_group` VALUES (1, 'admin', '后台设置', '后台管理方面的设置', 'admin', 1000, 1, 1, 'fa-adjust', 1587879871, 1587879871, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/static/index/images/avatar.png' COMMENT '头像',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `user_level_id` int(10) NOT NULL DEFAULT 1 COMMENT '用户等级',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'JDJ5JDEwJDF3RjJYYUx2SHdhYUVJeUh6UEhZU3VINHJHMHpmd0UydXVLZ0lYLjQ1VW9iQS94bkZDbm1x' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '描述',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(10) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (3, '/storage/attachment/xHqlsyh1PEgqBv7avfl7Cnesd9qKXZ8uAUiwoAvz.png', '小女孩', '小女孩', '18653165683', 4, 'JDJ5JDEwJHlaM2tXelMuRUxUVnIuZWNJVmZpY2VtZldRTzhDTk15bjJZVFl4azFQN0FoNnpqUjRYWk02', 0, NULL, 1587879871, 1596004985, 0);
INSERT INTO `user` VALUES (4, '/static/uploads/attachment/05bdd082-3858-437e-a439-43c9a3c45280.jpg', '普通用户', '普通用户', '13638392923', 1, 'JDJ5JDEwJFBUaDhzaGNKcEtnaEUxVXI3RTJyNk9NdkhPV1Nxekt1QzZaR0pWT3dmdVFKc2RkcDU3OHVp', 1, '', 1587879871, 1604307570, 0);
INSERT INTO `user` VALUES (7, '/static/uploads/attachment/aeed3011-8626-4c36-b232-0390edfa77a5.jpg', 'test888', 'test888', '13800000000', 4, 'JDJ5JDEwJG9ka09mQ0hBUFo0Ly5wTTJoVC9HZ096bWJ2MWs0TjFFTFljRlZkQlFoTlRTT3N0ZlZ6QW9t', 1, '', 1591256299, 1604307558, 0);
INSERT INTO `user` VALUES (8, '/static/uploads/attachment/d79d90b9-9ddc-4109-921d-8e493ca03d61.png', 'rongyao', '荣耀01', '18588888877', 5, 'JDJhJDEwJGhRa2V2TXRNSzBVWjdUYUJUamdock9LeEVjdWkuUk9oeXM3S3VyRHhuYXdyZGIxQUZ6Nzl5', 1, '', 1604306078, 1604644553, 0);

-- ----------------------------
-- Table structure for user_level
-- ----------------------------
DROP TABLE IF EXISTS `user_level`;
CREATE TABLE `user_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '简介',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/static/index/images/user_level_default.png' COMMENT '图片',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(10) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户等级' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_level
-- ----------------------------
INSERT INTO `user_level` VALUES (1, '普通用户', '普通用户', '/storage/attachment/XhGoZETVDfZ7Mz04gDD1U8vvpQyIPmZYtVPgTyTg.png', 1, 1587879871, 1595491385, 0);
INSERT INTO `user_level` VALUES (3, '白银会员', '白银会员', '/storage/attachment/lhCkRT7cN42sFYG2X24qbUC5mTgOwxBDK8w99w7X.png', 1, 1587879871, 1595491385, 0);
INSERT INTO `user_level` VALUES (4, '黄金会员', '黄金会员', '/static/uploads/attachment/f3857879-e1a2-4fd3-91d7-31f7ac27cb93.png', 1, 1587879871, 1604046725, 0);
INSERT INTO `user_level` VALUES (5, '荣耀', '荣耀等级', '/static/uploads/attachment/05446cad-e3a9-47e9-92cd-7a0a11867d50.jpg', 1, 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
