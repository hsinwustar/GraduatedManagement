/*
 Navicat Premium Data Transfer

 Source Server         : do
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : gmsdu

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 29/05/2019 12:19:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` int(12) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_role_id` int(11) NOT NULL COMMENT '权限外键',
  PRIMARY KEY (`admin_id`) USING BTREE,
  INDEX `teacher_role_id`(`admin_role_id`) USING BTREE,
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`admin_role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', 3);

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `college_id` int(12) NOT NULL AUTO_INCREMENT,
  `college_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`college_id`) USING BTREE,
  UNIQUE INDEX `college_name`(`college_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (2, '四川大学');
INSERT INTO `college` VALUES (1, '四川大学锦江学院');

-- ----------------------------
-- Table structure for enterprise
-- ----------------------------
DROP TABLE IF EXISTS `enterprise`;
CREATE TABLE `enterprise`  (
  `enterprise_id` int(12) NOT NULL AUTO_INCREMENT,
  `enterprise_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业名',
  `enterprise_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `enterprise_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `enterprise_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业地址',
  `enterprise_contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业联系人',
  `enterprise_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业联系电话',
  `enterprise_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业邮箱',
  `enterprise_website` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业网址',
  `enterprise_scale` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业规模',
  `enterprise_nature` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业性质',
  `enterprise_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '企业简介',
  `enterprise_role_id` int(11) NULL DEFAULT NULL COMMENT '权限外键',
  `enterprise_industry_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业行业外键',
  `enterprise_state` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业审核状况',
  PRIMARY KEY (`enterprise_id`) USING BTREE,
  INDEX `enterprise_role_id`(`enterprise_role_id`) USING BTREE,
  INDEX `enterprise_industry_name`(`enterprise_industry_name`) USING BTREE,
  CONSTRAINT `enterprise_ibfk_1` FOREIGN KEY (`enterprise_role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `enterprise_ibfk_2` FOREIGN KEY (`enterprise_industry_name`) REFERENCES `industry` (`industry_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of enterprise
-- ----------------------------
INSERT INTO `enterprise` VALUES (7, NULL, '123', 'test1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `enterprise` VALUES (8, '联想', '123', 'test', '深圳', 'lianxiang', '185664', '1526@162.com', 'www.lianxiang.com', '50人以下', '国营企业', '联想', 2, 'IT/通信/电子/互联网', '通过');
INSERT INTO `enterprise` VALUES (11, '万科', 'wanke', 'wanke', '北京', '李文', '15148562586', 'WK@163.com', 'https://www.baidu.com/', '50人以下', '民营', '全国50强', 2, 'IT/通信/电子/互联网', '待审核');

-- ----------------------------
-- Table structure for industry
-- ----------------------------
DROP TABLE IF EXISTS `industry`;
CREATE TABLE `industry`  (
  `industry_id` int(12) NOT NULL AUTO_INCREMENT,
  `industry_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`industry_id`) USING BTREE,
  UNIQUE INDEX `industry_name`(`industry_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of industry
-- ----------------------------
INSERT INTO `industry` VALUES (7, 'IT/通信/电子/互联网');
INSERT INTO `industry` VALUES (3, '交通/运输/物流/仓储');
INSERT INTO `industry` VALUES (12, '农/林/牧/鱼/其他');
INSERT INTO `industry` VALUES (6, '基金/证券/期货/投资');
INSERT INTO `industry` VALUES (9, '房地产/建筑业');
INSERT INTO `industry` VALUES (5, '政府/非盈利机构');
INSERT INTO `industry` VALUES (1, '文化/传媒/娱乐/体育');
INSERT INTO `industry` VALUES (11, '服务业');
INSERT INTO `industry` VALUES (2, '生产/加工/制造');
INSERT INTO `industry` VALUES (4, '能源/矿产/环保');
INSERT INTO `industry` VALUES (10, '贸易/批发/零售/租赁业');
INSERT INTO `industry` VALUES (8, '金融业');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `major_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major_colloge_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`major_id`) USING BTREE,
  INDEX `col_waijian`(`major_colloge_name`) USING BTREE,
  INDEX `major_name`(`major_name`) USING BTREE,
  CONSTRAINT `col_waijian` FOREIGN KEY (`major_colloge_name`) REFERENCES `college` (`college_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '软件工程', '四川大学锦江学院');
INSERT INTO `major` VALUES (2, '软件工程', '四川大学');
INSERT INTO `major` VALUES (3, '土木工程', '四川大学锦江学院');
INSERT INTO `major` VALUES (4, '土木工程', '四川大学');
INSERT INTO `major` VALUES (6, '会计', '四川大学锦江学院');

-- ----------------------------
-- Table structure for notic
-- ----------------------------
DROP TABLE IF EXISTS `notic`;
CREATE TABLE `notic`  (
  `notic_id` int(12) NOT NULL AUTO_INCREMENT,
  `notic_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notic_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notic_creattime` date NULL DEFAULT NULL COMMENT '发布日期',
  PRIMARY KEY (`notic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `position_id` int(12) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位名',
  `position_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作地点',
  `position_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作时间',
  `position_num` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '招聘人数',
  `position_edu` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学历要求',
  `position_experience` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经验要求',
  `position_salary` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '薪资说明',
  `position_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位要求',
  `position_duty` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '岗位职责',
  `position_start_time` date NULL DEFAULT NULL COMMENT '发布日期',
  `position_end_time` date NULL DEFAULT NULL COMMENT '结束日期',
  `position_edit_time` date NULL DEFAULT NULL COMMENT '编辑日期',
  `position_enterprise_id` int(12) NOT NULL COMMENT '公司id外键',
  `position_publish_state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布状态',
  `position_state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招聘状态',
  PRIMARY KEY (`position_id`) USING BTREE,
  UNIQUE INDEX `position_id`(`position_id`) USING BTREE,
  INDEX `position_enterprise_id`(`position_enterprise_id`) USING BTREE,
  CONSTRAINT `position_ibfk_1` FOREIGN KEY (`position_enterprise_id`) REFERENCES `enterprise` (`enterprise_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (2, '后端工程师', '北京', '2019.6.23早上八点报到', '20', '大学本科', '有一年工作经验', '3000', '熟悉MVC，Spring', '吃苦耐劳', '2019-06-24', '2019-08-17', '2019-05-22', 11, '已发布', '招聘中');
INSERT INTO `position` VALUES (8, 'java工程师', '成都', '985', '10', '本科', '无', '5000', '无', 'java', '2019-05-14', '2019-05-21', NULL, 8, '已发布', '招聘结束');
INSERT INTO `position` VALUES (9, 'php工程师', '成都', '985', '8', '本科', '无', '3000', '无', 'java', NULL, NULL, NULL, 8, '未发布', '招聘中');
INSERT INTO `position` VALUES (14, '3222', '2', '2', '2', '2', '2', '2', '2', '2', '2020-10-01', '2020-10-08', NULL, 8, '已发布', '招聘中');

-- ----------------------------
-- Table structure for recruit
-- ----------------------------
DROP TABLE IF EXISTS `recruit`;
CREATE TABLE `recruit`  (
  `recruit_id` int(12) NOT NULL AUTO_INCREMENT,
  `recruit_position_id` int(12) NOT NULL,
  `recruit_enterprise_id` int(12) NOT NULL,
  `recruit_stu_id` int(12) NOT NULL,
  `recruit_resum_id` int(12) NOT NULL,
  `recruit_state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`recruit_id`) USING BTREE,
  INDEX `recruit`(`recruit_resum_id`) USING BTREE,
  INDEX `positionidfkey`(`recruit_position_id`) USING BTREE,
  CONSTRAINT `positionidfkey` FOREIGN KEY (`recruit_position_id`) REFERENCES `position` (`position_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recruit
-- ----------------------------
INSERT INTO `recruit` VALUES (2, 9, 8, 0, 5, '已查看');

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `resume_id` int(12) NOT NULL AUTO_INCREMENT,
  `resume_stu_id` int(12) UNSIGNED NOT NULL COMMENT '学号',
  `resume_stu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `resume_stu_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `resume_stu_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `resume_stu_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `resume_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简历名称',
  `resume_school` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校',
  `resume_major` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `resume_edu` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学历',
  `resume_start_school` date NULL DEFAULT NULL COMMENT '在校时间',
  `resume_end_school` date NULL DEFAULT NULL COMMENT '结束在校时间',
  `resume_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个人描述',
  `resume_internship` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '实习经历',
  `resume_practice` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '校园实践',
  `resume_skill` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '专业技能',
  `resume_hobby` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '兴趣爱好',
  `resume_works` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '作品展示',
  `resume_time` date NULL DEFAULT NULL COMMENT '投递时间',
  PRIMARY KEY (`resume_id`) USING BTREE,
  INDEX `resume_stu_id`(`resume_stu_id`) USING BTREE,
  INDEX `resume_stu_name`(`resume_stu_name`) USING BTREE,
  INDEX `resume_stu_sex`(`resume_stu_sex`) USING BTREE,
  INDEX `resume_stu_phone`(`resume_stu_phone`) USING BTREE,
  INDEX `resume_stu_email`(`resume_stu_email`) USING BTREE,
  CONSTRAINT `resume_ibfk_2` FOREIGN KEY (`resume_stu_name`) REFERENCES `student` (`stu_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resume_ibfk_3` FOREIGN KEY (`resume_stu_sex`) REFERENCES `student` (`stu_sex`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resume_ibfk_4` FOREIGN KEY (`resume_stu_phone`) REFERENCES `student` (`stu_phone`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resume_ibfk_5` FOREIGN KEY (`resume_stu_email`) REFERENCES `student` (`stu_email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resumefkstuid` FOREIGN KEY (`resume_stu_id`) REFERENCES `student` (`stu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES (3, 160520155, '吴慧鑫', '女', '17729875641', 'heaven1158114976@163.com', 'web', '四川大学锦江学院', '软件工程', '本科', '2016-09-01', '2020-06-06', '1', '1', '1', '1', '1', '1', NULL);
INSERT INTO `resume` VALUES (5, 160520160, '周仁洁', '女', '21634014015', '216401540@qq.com', 'php', '四川大学锦江学院', '软件工程', '本科', '2016-09-01', '2020-06-06', '', '', '', '', '', '', NULL);
INSERT INTO `resume` VALUES (6, 160520155, '吴慧鑫', '女', '17729875641', 'heaven1158114976@163.com', 'c', '四川大学锦江学院', '软件工程', '本科', '2016-09-01', '2020-06-06', 'llllllllllllllllllllllllllllllll', 'lllllllllllllllllllllllllllllllllll', 'lllllllllllllllllllllllllllllllllllllllll', 'llllllllllllllllllllllllllllllll', 'lllllllllllllllllllllllllllllllllll', 'lllllllllllllllllllllllllllllll', NULL);
INSERT INTO `resume` VALUES (7, 160520155, '吴慧鑫', '女', '17729875641', 'heaven1158114976@163.com', 'c++', '四川大学锦江学院', '软件工程', '本科', '2016-09-01', '2020-06-06', '11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111v', '11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', NULL);
INSERT INTO `resume` VALUES (8, 160520155, '吴慧鑫', '女', '17729875641', 'heaven1158114976@163.com', '1111111', '四川大学锦江学院', '软件工程', '本科', '2016-09-01', '2020-06-06', '1', '1', '1', '1', '1', '1', NULL);
INSERT INTO `resume` VALUES (9, 160520155, '吴慧鑫', '女', '17729875641', 'heaven1158114976@163.com', '4444', '四川大学锦江学院', '软件工程', '本科', '2016-09-01', '2016-06-06', '4', '4', '4', '4', '4', '4', NULL);
INSERT INTO `resume` VALUES (10, 160520155, '吴慧鑫', '女', '17729875641', 'heaven1158114976@163.com', '888', '四川大学锦江学院', '软件工程', '本科', '2016-09-01', '2016-06-06', '8', '8', '8', '8', '8', '8', NULL);
INSERT INTO `resume` VALUES (11, 160520155, '吴慧鑫', '女', '17729875641', 'heaven1158114976@163.com', '3333', '四川大学锦江学院', '软件工程', '本科', '2016-09-01', '2016-06-06', '3', '3', '3', '3', '3', '3', NULL);
INSERT INTO `resume` VALUES (12, 160520155, '吴慧鑫', '女', '17729875641', 'heaven1158114976@163.com', '666', '四川大学锦江学院', '软件工程', '本科', '2016-09-01', '2020-06-06', '6', '6', '6', '6', '6', '6', NULL);
INSERT INTO `resume` VALUES (13, 160520155, '吴慧鑫', '女', '17729875641', 'heaven1158114976@163.com', '7777', '四川大学锦江学院', '软件工程', '本科', '2016-09-01', '2020-06-06', '7', '7', '7', '7', '7', '7', NULL);
INSERT INTO `resume` VALUES (19, 160520160, '周仁洁', '女', '21634014015', '216401540@qq.com', '4545', '四川大学锦江学院', '软件工程', '本科', '2019-05-07', '2019-05-25', 'gsdsdg', 'gsdagsd', 'gsda', 'dsga', '', '', NULL);
INSERT INTO `resume` VALUES (20, 160520160, '周仁洁', '女', '21634014015', '216401540@qq.com', 'sdf', '四川大学锦江学院', '软件工程', '本科', '2019-05-08', '2019-05-24', '', '', '', '', '', '', NULL);
INSERT INTO `resume` VALUES (21, 160520160, '周仁洁', '女', '21634014015', '216401540@qq.com', 'java', '四川大学锦江学院', '软件工程', '本科', '2019-05-01', '2019-05-31', '', '', '', '', '', '', NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_name`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (2, '企业');
INSERT INTO `role` VALUES (1, '学生');
INSERT INTO `role` VALUES (3, '管理员');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stu_num` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(12) UNSIGNED NULL DEFAULT NULL,
  `stu_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_age` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_college_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_major_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_role_id` int(11) NULL DEFAULT NULL COMMENT '权限外键',
  PRIMARY KEY (`stu_num`) USING BTREE,
  UNIQUE INDEX `stu_phone`(`stu_phone`) USING BTREE,
  UNIQUE INDEX `stu_id`(`stu_id`) USING BTREE,
  UNIQUE INDEX `stu_email`(`stu_email`) USING BTREE,
  INDEX `stu_college_name`(`stu_college_name`) USING BTREE,
  INDEX `stu_major_name`(`stu_major_name`) USING BTREE,
  INDEX `stu_role_id`(`stu_role_id`) USING BTREE,
  INDEX `stu_name`(`stu_name`) USING BTREE,
  INDEX `stu_sex`(`stu_sex`) USING BTREE,
  CONSTRAINT `major_waijian` FOREIGN KEY (`stu_major_name`) REFERENCES `major` (`major_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`stu_college_name`) REFERENCES `college` (`college_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`stu_role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (3, 160520101, '冬狮郎', '男', '15', 'DSL@163.com', '15145238796', 'dongshilang', '四川大学锦江学院', '土木工程', 1);
INSERT INTO `student` VALUES (4, 160520102, '楸木', '女', '17', 'XM@163.com', '18452323365', 'xiumu', '四川大学', '土木工程', 1);
INSERT INTO `student` VALUES (5, 160520103, '粥安', '女', '16', 'ZA@163.com', '15125632363', 'zhouan', '四川大学', '土木工程', 1);
INSERT INTO `student` VALUES (6, 160520104, '吴哈哈', '女', '18', 'WHH@163.com', '15126563022', 'wuhaha', '四川大学', '软件工程', 1);
INSERT INTO `student` VALUES (7, 160520105, '孔一', '男', '20', 'KY@163.com', '13158426658', 'kongyi', '四川大学', '软件工程', 1);
INSERT INTO `student` VALUES (8, 160520133, '杜显国', '男', '21', 'DXG@163.com', '15184568956', 'duxianguo', '四川大学锦江学院', '软件工程', 1);
INSERT INTO `student` VALUES (9, 160520152, '甘宁', '男', '21', 'GN@163.com', '17755463569', 'ganning', '四川大学锦江学院', '软件工程', 1);
INSERT INTO `student` VALUES (10, 160520154, '刘玲会', '女', '20', 'LLH@163.com', '18154263995', 'liulinghui', '四川大学锦江学院', '软件工程', 1);
INSERT INTO `student` VALUES (11, 160520155, '吴慧鑫', '女', '20', 'heaven1158114976@163.com', '17729875641', 'wuhuixin', '四川大学锦江学院', '软件工程', 1);
INSERT INTO `student` VALUES (12, 160520156, '金瑞羽', '女', '20', 'JRY@163.com', '15487596235', 'jinruiyu', '四川大学锦江学院', '软件工程', 1);
INSERT INTO `student` VALUES (13, 160520160, '周仁洁', '女', '20', '216401540@qq.com', '21634014015', 'zhourenjie', '四川大学锦江学院', '软件工程', 1);

SET FOREIGN_KEY_CHECKS = 1;
