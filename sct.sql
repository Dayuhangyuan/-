/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50724
Source Host           : 127.0.0.1:3306
Source Database       : sct

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2022-11-06 22:21:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'jiangguanliyuan', 'f379eaf3c831b04de153469d1bec345e', '江管理员');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
-- sct.course definition

CREATE TABLE `course` (
  `cId` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(50) DEFAULT NULL,
  `tId` int(11) DEFAULT NULL,
  `week` int(11) DEFAULT '1' COMMENT '星期',
  `cTime` int(11) DEFAULT NULL COMMENT '第几节结束',
  `cPlace` varchar(100) DEFAULT NULL COMMENT '地点',
  PRIMARY KEY (`cId`),
  KEY `FK_Reference_1` (`tId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`tId`) REFERENCES `teacher` (`tId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO sct.course
(cId, cName, tId, week, cTime, cPlace)
VALUES(1, '占卜', 1, 4, 2, 'j3-104');
INSERT INTO sct.course
(cId, cName, tId, week, cTime, cPlace)
VALUES(2, '麻瓜研究', 2, 1, 2, 'j2-103');
INSERT INTO sct.course
(cId, cName, tId, week, cTime, cPlace)
VALUES(3, '骑着扫帚飞', 4, 1, 5, 'j1-203');
INSERT INTO sct.course
(cId, cName, tId, week, cTime, cPlace)
VALUES(4, '天文学', 3, 3, 2, 'j1-303');
INSERT INTO sct.course
(cId, cName, tId, week, cTime, cPlace)
VALUES(5, '魔法史', 4, 5, 3, 'j1-403');
INSERT INTO sct.course
(cId, cName, tId, week, cTime, cPlace)
VALUES(6, '变形术', 2, 4, 2, 'j1-503');
INSERT INTO sct.course
(cId, cName, tId, week, cTime, cPlace)
VALUES(7, '黑魔法防御术', 1, 4, 2, 'j1-204');
INSERT INTO sct.course
(cId, cName, tId, week, cTime, cPlace)
VALUES(8, '魔咒', 5, 4, 2, 'j1-202');
INSERT INTO sct.course
(cId, cName, tId, week, cTime, cPlace)
VALUES(9, '狙击枪射击', 5, 5, 1, 'j1-201');
INSERT INTO sct.course
(cId, cName, tId, week, cTime, cPlace)
VALUES(10, '元气弹发射', 3, 5, 2, 'j2-204');
INSERT INTO sct.course
(cId, cName, tId, week, cTime, cPlace)
VALUES(18, '444', 1, 2, 2, '444');


-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
-- sct.sc definition

CREATE TABLE `sc` (
  `scId` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` int(11) DEFAULT NULL,
  `cId` int(11) DEFAULT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`scId`),
  KEY `FK_Reference_2` (`stuId`),
  KEY `FK_Reference_3` (`cId`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`stuId`) REFERENCES `student` (`stuId`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`cId`) REFERENCES `course` (`cId`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(16, 3, 5, 89.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(17, 3, 2, 91.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(18, 3, 7, 76.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(19, 3, 8, 78.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(20, 3, 9, 66.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(21, 3, 6, 81.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(22, 13, 9, 98.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(23, 4, 9, 89.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(24, 10, 9, 35.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(25, 12, 9, 58.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(26, 11, 9, 67.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(27, 5, 9, 77.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(28, 6, 9, 79.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(29, 7, 9, 88.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(30, 8, 9, 80.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(32, 4, 8, 66.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(33, 7, 8, 20.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(34, 20, 8, 92.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(47, 2, 1, 66.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(48, 2, 2, 12.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(49, 2, 3, 12.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(50, 2, 4, 12.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(51, 2, 5, 12.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(52, 2, 6, 12.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(53, 2, 7, 12.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(54, 2, 8, 12.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(55, 2, 9, 12.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(56, 2, 10, 12.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(157, 1, 1, 12.00);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(159, 1, 2, NULL);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(160, 1, 3, NULL);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(161, 1, 4, NULL);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(162, 1, 5, NULL);
INSERT INTO sct.sc
(scId, stuId, cId, score)
VALUES(163, 1, 18, 100.00);


-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stuId` int(11) NOT NULL AUTO_INCREMENT,
  `stuName` varchar(100) DEFAULT NULL,
  `stuNo` varchar(20) DEFAULT NULL,
  `stuPwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stuId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '布布种子', '0001', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('2', '魔焰猩猩', '0309', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('3', '艾里克桑', '0429', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('4', '该隐', '0475', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('5', '泰格尔', '0503', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('6', '依卡劳特', '0631', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('7', '迪符特', '0803', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('8', '魔狮迪露', '0187', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('10', '纳多雷', '0089', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('11', '哈莫雷特', '0216', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('12', '缪斯', '1632', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('13', '尤米娜', '1215', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('14', '瑞尔斯', '1045', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('15', '凯兮', '2402', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('16', '迈尔斯', '1204', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('17', '伊芙莉莎', '3844', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('18', '几米', '3582', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('19', '艾欧丽娅', '3437', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('20', '圣灵谱尼', '5000', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('21', '\r\n圣迈尔斯', '2347', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('22', '奥斯卡', '2006', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('23', '极光仙子', '4430', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('24', '寒凌', '3269', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('25', '冰·寒凌', '4084', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('26', '克拉尼特', '0538', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('27', '圣者炎龙', '1567', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('28', '莫妮卡', '3355', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('29', '虞姬', '3178', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('30', '雷伊', '0070', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('31', '雷神·雷伊', '2887', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('32', '王·雷伊', '3142', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('33', '未来·雷小伊', '4182', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('34', '库鲁', '0723', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('35', '亚伦斯', '0672', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('36', '步练师', '3385', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('37', '蒙娜丽莎', '2189', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('38', '魔域仙子', '1216', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('39', '生灵之主蒙娜丽莎', '2966', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('40', '魔灵仙女', '2798', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('41', '比巴卜花仙', '0877', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('42', '唐尼泰罗', '2140', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('43', '奥尔德', '1000', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('44', '谱尼', '0300', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `student` VALUES ('45', '帕格尼尼', '0266', 'f379eaf3c831b04de153469d1bec345e');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tId` int(11) NOT NULL AUTO_INCREMENT,
  `tName` varchar(20) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '李白', 'libai', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `teacher` VALUES ('2', '韩信', 'hanxin', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `teacher` VALUES ('3', '诸葛亮', 'zhugeliang', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `teacher` VALUES ('4', '司马懿', 'simayi', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `teacher` VALUES ('5', '百里守约', 'bailishouyue', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `teacher` VALUES ('6', '不知火融', 'buzhihuorong', 'f379eaf3c831b04de153469d1bec345e');
