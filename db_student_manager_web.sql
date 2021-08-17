/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : db_student_manager_web

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 25/06/2021 11:00:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for s_admin
-- ----------------------------
DROP TABLE IF EXISTS `s_admin`;
CREATE TABLE `s_admin`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of s_admin
-- ----------------------------
INSERT INTO `s_admin` VALUES (1, 'admin', 'admin', 1);

-- ----------------------------
-- Table structure for s_clazz
-- ----------------------------
DROP TABLE IF EXISTS `s_clazz`;
CREATE TABLE `s_clazz`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `info` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of s_clazz
-- ----------------------------
INSERT INTO `s_clazz` VALUES (1, '软件一班', '这是软件工程专业。');
INSERT INTO `s_clazz` VALUES (4, '数学一班', '大学数学专业');
INSERT INTO `s_clazz` VALUES (5, '计算机科学与技术一班', '计算机专业');

-- ----------------------------
-- Table structure for s_course
-- ----------------------------
DROP TABLE IF EXISTS `s_course`;
CREATE TABLE `s_course`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` int(5) NOT NULL,
  `course_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `selected_num` int(5) NOT NULL DEFAULT 0,
  `max_num` int(5) NOT NULL DEFAULT 50,
  `info` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_teacher_foreign`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of s_course
-- ----------------------------
INSERT INTO `s_course` VALUES (1, '大学英语', 9, '周三上午8点', 2, 50, '英语。');
INSERT INTO `s_course` VALUES (2, '大学数学', 10, '周三上午10点', 3, 50, '数学。');
INSERT INTO `s_course` VALUES (3, '计算机基础', 11, '周三上午', 2, 50, '计算机课程。');
INSERT INTO `s_course` VALUES (14, '网络工程', 11, '周五早上', 2, 56, '网络基础知识。');

-- ----------------------------
-- Table structure for s_selected_course
-- ----------------------------
DROP TABLE IF EXISTS `s_selected_course`;
CREATE TABLE `s_selected_course`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `student_id` int(5) NOT NULL,
  `course_id` int(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `selected_course_student_fk`(`student_id`) USING BTREE,
  INDEX `selected_course_course_fk`(`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of s_selected_course
-- ----------------------------
INSERT INTO `s_selected_course` VALUES (4, 1, 2);
INSERT INTO `s_selected_course` VALUES (6, 1, 14);
INSERT INTO `s_selected_course` VALUES (8, 2, 1);
INSERT INTO `s_selected_course` VALUES (9, 4, 3);
INSERT INTO `s_selected_course` VALUES (10, 9, 14);
INSERT INTO `s_selected_course` VALUES (11, 1, 3);
INSERT INTO `s_selected_course` VALUES (12, 4, 2);
INSERT INTO `s_selected_course` VALUES (13, 9, 1);
INSERT INTO `s_selected_course` VALUES (14, 2, 2);

-- ----------------------------
-- Table structure for s_student
-- ----------------------------
DROP TABLE IF EXISTS `s_student`;
CREATE TABLE `s_student`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clazz_id` int(5) NOT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男',
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_clazz_id_foreign`(`clazz_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of s_student
-- ----------------------------
INSERT INTO `s_student` VALUES (1, 'S11528202944239', '张三', '111111', 5, '男', '13918654525', '1193284480');
INSERT INTO `s_student` VALUES (2, 'S51528202992845', '李四', '123', 1, '女', '13545454548', '1332365656');
INSERT INTO `s_student` VALUES (4, 'S51528379586807', '王麻子', '111111', 5, '男', '13356565656', '123456');
INSERT INTO `s_student` VALUES (9, 'S41528633634989', '马冬梅', '1', 5, '男', '13333332133', '131313132323');

-- ----------------------------
-- Table structure for s_teacher
-- ----------------------------
DROP TABLE IF EXISTS `s_teacher`;
CREATE TABLE `s_teacher`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clazz_id` int(5) NOT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男',
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_clazz_id_foreign`(`clazz_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of s_teacher
-- ----------------------------
INSERT INTO `s_teacher` VALUES (9, 'T11528608730648', '张三老师', '111', 4, '男', '13918655656', '1193284480');
INSERT INTO `s_teacher` VALUES (10, 'T11528609224588', '李四老师', '111', 4, '男', '13656565656', '123456');
INSERT INTO `s_teacher` VALUES (11, 'T51528617262403', '李老师', '123456', 5, '女', '18989898989', '1456655565');

SET FOREIGN_KEY_CHECKS = 1;
