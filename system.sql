/*
 Navicat MySQL Data Transfer

 Source Server         : 030418
 Source Server Type    : MySQL
 Source Server Version : 80044
 Source Host           : localhost:3306
 Source Schema         : system

 Target Server Type    : MySQL
 Target Server Version : 80044
 File Encoding         : 65001

 Date: 04/01/2026 01:09:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', '管理员', 'http://localhost:9090/files/download/avatar.png', 'ADMIN');

-- ----------------------------
-- Table structure for choice
-- ----------------------------
DROP TABLE IF EXISTS `choice`;
CREATE TABLE `choice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程名称',
  `teacher_id` int(0) NULL DEFAULT NULL COMMENT '授课教师',
  `student_id` int(0) NULL DEFAULT NULL COMMENT '选课学生',
  `course_id` int(0) NULL DEFAULT NULL COMMENT '课程ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '选课信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of choice
-- ----------------------------
INSERT INTO `choice` VALUES (39, '高等数学', 5, 1, 5);

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学院名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '学院描述',
  `score` int(0) NULL DEFAULT NULL COMMENT '最低学分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学院信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (1, '文化与传播学院', '网络与新媒体、新闻学、广告学、汉语言文学', 90);
INSERT INTO `college` VALUES (2, '外国语学院', '日语、商务英语、英语', 88);
INSERT INTO `college` VALUES (3, '数学与金融学院', '金融工程、数学与应用数学(师范)', 85);
INSERT INTO `college` VALUES (4, '环境与生物工程学院', '生物技术、食品质量与安全、环境工程、应用化学', 80);
INSERT INTO `college` VALUES (5, '智能制造学院', '机械设计制造及其自动化、测控技术与仪器、电气工程及其自动化、生物医学工程、机器人工程', 95);
INSERT INTO `college` VALUES (6, '土木工程学院', '工程管理、工程造价、城乡规划、土木工程', 87);
INSERT INTO `college` VALUES (7, '工艺美术学院', '绘画、美术学(师范)、视觉传达设计(闽台合作)、环境设计、工艺美术、视觉传达设计', 85);
INSERT INTO `college` VALUES (8, '音乐学院', '音乐学(师范类)', 90);
INSERT INTO `college` VALUES (9, '体育学院', '休闲体育、体育教育(师范类)', 86);
INSERT INTO `college` VALUES (10, '护理学院', '护理学、护理学(闽台)、助产学', 92);
INSERT INTO `college` VALUES (11, '药学与医学技术学院', '医学影像技术、药学、医学检验技术', 93);
INSERT INTO `college` VALUES (12, '管理学院', '健康服务与管理、旅游管理、人力资源管理、公共事业管理(医疗健康产业管理方向)、公共事业管理', 89);
INSERT INTO `college` VALUES (13, '商学院', '电子商务、会计学、市场营销、财务管理学', 88);
INSERT INTO `college` VALUES (14, '基础教育学院', '学前教育(师范)、小学教育(师范)', 84);
INSERT INTO `college` VALUES (15, '基础医学院', '口腔医学、临床医学(含定向)', 91);
INSERT INTO `college` VALUES (16, '计算机与大数据学院', '数据科学与大数据技术、软件工程、计算机科学与技术', 94);
INSERT INTO `college` VALUES (17, '人工智能学院', '电子信息工程、物联网工程、通信工程、智能科学与技术', 90);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '课程介绍',
  `score` int(0) NULL DEFAULT NULL COMMENT '课程学分',
  `teacher_id` int(0) NULL DEFAULT NULL COMMENT '授课教师',
  `num` int(0) NULL DEFAULT NULL COMMENT '开班人数',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课时间',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课地点',
  `college_id` int(0) NULL DEFAULT NULL COMMENT '所属学院',
  `already_num` int(0) NULL DEFAULT 0 COMMENT '已选人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '课程信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '新媒体传播学', '学习新媒体传播理论、社交媒体运营、内容创作等知识', 3, 1, 50, '周一 1-2节', '文传楼101', 1, 1);
INSERT INTO `course` VALUES (2, '新闻采访与写作', '掌握新闻采访技巧、新闻写作规范、报道伦理等', 3, 2, 45, '周二 3-4节', '文传楼201', 1, 0);
INSERT INTO `course` VALUES (3, '高级日语', '深入学习日语语法、会话、阅读和写作技能', 3, 3, 40, '周三 5-6节', '外语楼301', 2, 0);
INSERT INTO `course` VALUES (4, '商务英语', '学习商务英语沟通、外贸函电、商务谈判等', 3, 4, 35, '周四 7-8节', '外语楼202', 2, 0);
INSERT INTO `course` VALUES (5, '高等数学', '学习微积分、极限、导数、积分等数学基础', 4, 5, 60, '周一 3-4节', '数理楼101', 3, 2);
INSERT INTO `course` VALUES (6, '金融工程导论', '介绍金融工程基本概念、金融衍生品定价', 3, 6, 40, '周二 5-6节', '数理楼301', 3, 0);
INSERT INTO `course` VALUES (7, '环境工程原理', '学习环境污染控制、环境监测与评价', 3, 7, 45, '周三 1-2节', '环生楼101', 4, 0);
INSERT INTO `course` VALUES (8, '生物化学', '学习生物大分子结构、代谢途径、酶学等', 4, 8, 40, '周四 3-4节', '环生楼201', 4, 0);
INSERT INTO `course` VALUES (9, '机械设计基础', '学习机械零件设计、机构分析、CAD制图', 3, 9, 50, '周一 5-6节', '机电楼101', 5, 0);
INSERT INTO `course` VALUES (10, '自动控制原理', '学习控制系统分析、PID控制、系统稳定性', 4, 10, 45, '周二 7-8节', '机电楼301', 5, 0);
INSERT INTO `course` VALUES (11, '结构力学', '学习结构受力分析、强度计算、稳定性', 4, 11, 50, '周三 3-4节', '土木楼101', 6, 0);
INSERT INTO `course` VALUES (12, '工程造价管理', '学习工程概预算、成本控制、招投标', 3, 12, 40, '周四 5-6节', '土木楼201', 6, 0);
INSERT INTO `course` VALUES (13, '素描基础', '学习素描技法、透视原理、明暗关系', 3, 13, 30, '周一 7-8节', '艺术楼101', 7, 0);
INSERT INTO `course` VALUES (14, '色彩构成', '学习色彩理论、配色方法、色彩心理学', 3, 14, 30, '周二 1-2节', '艺术楼301', 7, 0);
INSERT INTO `course` VALUES (15, '音乐理论基础', '学习乐理知识、和声学、曲式分析', 3, 15, 35, '周三 7-8节', '音乐楼101', 8, 0);
INSERT INTO `course` VALUES (16, '体育教育学', '学习体育教学理论、训练方法、课程设计', 3, 16, 40, '周四 1-2节', '体育馆101', 9, 0);
INSERT INTO `course` VALUES (17, '运动生理学', '学习运动对人体生理功能的影响', 3, 17, 35, '周五 3-4节', '体育馆201', 9, 0);
INSERT INTO `course` VALUES (18, '基础护理学', '学习基本护理技能、病人护理规范', 4, 18, 45, '周一 3-4节', '护理楼101', 10, 0);
INSERT INTO `course` VALUES (19, '内科护理学', '学习内科疾病护理、用药指导', 3, 19, 40, '周二 5-6节', '护理楼201', 10, 0);
INSERT INTO `course` VALUES (20, '药理学', '学习药物作用机制、药物代谢、不良反应', 4, 20, 50, '周三 1-2节', '医药楼101', 11, 0);
INSERT INTO `course` VALUES (21, '医学影像技术', '学习医学影像原理、设备操作、诊断', 3, 21, 40, '周四 3-4节', '医药楼301', 11, 0);
INSERT INTO `course` VALUES (22, '人力资源管理', '学习招聘、培训、绩效管理等HR职能', 3, 22, 45, '周一 5-6节', '管理楼101', 12, 0);
INSERT INTO `course` VALUES (23, '旅游规划与管理', '学习旅游资源开发、景区管理、旅游营销', 3, 23, 35, '周二 7-8节', '管理楼201', 12, 0);
INSERT INTO `course` VALUES (24, '会计学原理', '学习会计基础、财务报表分析、会计准则', 4, 24, 50, '周三 3-4节', '商学楼101', 13, 0);
INSERT INTO `course` VALUES (25, '市场营销学', '学习市场分析、营销策略、品牌管理', 3, 25, 45, '周四 5-6节', '商学楼201', 13, 0);
INSERT INTO `course` VALUES (26, '教育心理学', '学习学习理论、发展心理学、教学心理', 3, 26, 40, '周一 7-8节', '教育楼101', 14, 0);
INSERT INTO `course` VALUES (27, '课程与教学论', '学习课程设计、教学方法、评价体系', 3, 27, 35, '周二 1-2节', '教育楼201', 14, 0);
INSERT INTO `course` VALUES (28, '人体解剖学', '学习人体结构、器官系统、解剖技术', 4, 28, 40, '周三 5-6节', '医学楼101', 15, 0);
INSERT INTO `course` VALUES (29, '数据结构与算法', '学习线性表、树、图等数据结构及算法', 4, 29, 50, '周四 1-2节', '计算机楼101', 16, 0);
INSERT INTO `course` VALUES (30, '数据库原理', '学习关系数据库、SQL语言、数据库设计', 3, 30, 45, '周五 3-4节', '计算机楼201', 16, 0);
INSERT INTO `course` VALUES (31, '机器学习基础', '学习监督学习、无监督学习、神经网络', 4, 31, 40, '周一 3-4节', '智能楼101', 17, 1);
INSERT INTO `course` VALUES (32, '物联网技术', '学习传感器网络、嵌入式系统、物联网应用', 3, 32, 35, '周二 5-6节', '智能楼201', 17, 0);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '公告内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '开工大吉', '开工大吉', '2025-12-30 12:17:47');

-- ----------------------------
-- Table structure for speciality
-- ----------------------------
DROP TABLE IF EXISTS `speciality`;
CREATE TABLE `speciality`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '专业名称',
  `college_id` int(0) NULL DEFAULT NULL COMMENT '学院ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '专业信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of speciality
-- ----------------------------
INSERT INTO `speciality` VALUES (1, '网络与新媒体', 1);
INSERT INTO `speciality` VALUES (2, '新闻学', 1);
INSERT INTO `speciality` VALUES (3, '广告学', 1);
INSERT INTO `speciality` VALUES (4, '汉语言文学', 1);
INSERT INTO `speciality` VALUES (5, '日语', 2);
INSERT INTO `speciality` VALUES (6, '商务英语', 2);
INSERT INTO `speciality` VALUES (7, '英语', 2);
INSERT INTO `speciality` VALUES (8, '金融工程', 3);
INSERT INTO `speciality` VALUES (9, '数学与应用数学(师范)', 3);
INSERT INTO `speciality` VALUES (10, '生物技术', 4);
INSERT INTO `speciality` VALUES (11, '食品质量与安全', 4);
INSERT INTO `speciality` VALUES (12, '环境工程', 4);
INSERT INTO `speciality` VALUES (13, '应用化学', 4);
INSERT INTO `speciality` VALUES (14, '机械设计制造及其自动化', 5);
INSERT INTO `speciality` VALUES (15, '测控技术与仪器', 5);
INSERT INTO `speciality` VALUES (16, '电气工程及其自动化', 5);
INSERT INTO `speciality` VALUES (17, '生物医学工程', 5);
INSERT INTO `speciality` VALUES (18, '机器人工程', 5);
INSERT INTO `speciality` VALUES (19, '工程管理', 6);
INSERT INTO `speciality` VALUES (20, '工程造价', 6);
INSERT INTO `speciality` VALUES (21, '城乡规划', 6);
INSERT INTO `speciality` VALUES (22, '土木工程', 6);
INSERT INTO `speciality` VALUES (23, '绘画', 7);
INSERT INTO `speciality` VALUES (24, '美术学(师范)', 7);
INSERT INTO `speciality` VALUES (25, '视觉传达设计(闽台合作)', 7);
INSERT INTO `speciality` VALUES (26, '环境设计', 7);
INSERT INTO `speciality` VALUES (27, '工艺美术', 7);
INSERT INTO `speciality` VALUES (28, '视觉传达设计', 7);
INSERT INTO `speciality` VALUES (29, '音乐学(师范类)', 8);
INSERT INTO `speciality` VALUES (30, '休闲体育', 9);
INSERT INTO `speciality` VALUES (31, '体育教育(师范类)', 9);
INSERT INTO `speciality` VALUES (32, '护理学', 10);
INSERT INTO `speciality` VALUES (33, '护理学(闽台)', 10);
INSERT INTO `speciality` VALUES (34, '助产学', 10);
INSERT INTO `speciality` VALUES (35, '医学影像技术', 11);
INSERT INTO `speciality` VALUES (36, '药学', 11);
INSERT INTO `speciality` VALUES (37, '医学检验技术', 11);
INSERT INTO `speciality` VALUES (38, '健康服务与管理', 12);
INSERT INTO `speciality` VALUES (39, '旅游管理', 12);
INSERT INTO `speciality` VALUES (40, '人力资源管理', 12);
INSERT INTO `speciality` VALUES (41, '公共事业管理(医疗健康产业管理方向)', 12);
INSERT INTO `speciality` VALUES (42, '公共事业管理', 12);
INSERT INTO `speciality` VALUES (43, '电子商务', 13);
INSERT INTO `speciality` VALUES (44, '会计学', 13);
INSERT INTO `speciality` VALUES (45, '市场营销', 13);
INSERT INTO `speciality` VALUES (46, '财务管理学', 13);
INSERT INTO `speciality` VALUES (47, '学前教育(师范)', 14);
INSERT INTO `speciality` VALUES (48, '小学教育(师范)', 14);
INSERT INTO `speciality` VALUES (49, '口腔医学', 15);
INSERT INTO `speciality` VALUES (50, '临床医学(含定向)', 15);
INSERT INTO `speciality` VALUES (51, '数据科学与大数据技术', 16);
INSERT INTO `speciality` VALUES (52, '软件工程', 16);
INSERT INTO `speciality` VALUES (53, '计算机科学与技术', 16);
INSERT INTO `speciality` VALUES (54, '电子信息工程', 17);
INSERT INTO `speciality` VALUES (55, '物联网工程', 17);
INSERT INTO `speciality` VALUES (56, '通信工程', 17);
INSERT INTO `speciality` VALUES (57, '智能科学与技术', 17);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学号',
  `college_id` int(0) NULL DEFAULT NULL COMMENT '学院ID',
  `score` int(0) NULL DEFAULT NULL COMMENT '学分',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'student1', '123456', '张杰', 'STUDENT', '男', 'code1', 1, 90, NULL);
INSERT INTO `student` VALUES (2, 'student2', '123456', '李敏', 'STUDENT', '女', 'code2', 17, 90, NULL);
INSERT INTO `student` VALUES (3, 'student3', '123456', '王浩', 'STUDENT', '女', 'code3', 2, 88, NULL);
INSERT INTO `student` VALUES (4, 'student4', '123456', '刘六', 'STUDENT', '男', 'code4', 7, 85, NULL);
INSERT INTO `student` VALUES (5, 'student5', '123456', '陈辉', 'STUDENT', '男', 'code5', 3, 85, NULL);
INSERT INTO `student` VALUES (6, 'student6', '123456', '杨洁', 'STUDENT', '男', 'code6', 7, 85, NULL);
INSERT INTO `student` VALUES (7, 'student7', '123456', '赵强', 'STUDENT', '女', 'code7', 16, 94, NULL);
INSERT INTO `student` VALUES (8, 'student8', '123456', '黄静', 'STUDENT', '男', 'code8', 13, 88, NULL);
INSERT INTO `student` VALUES (9, 'student9', '123456', '周洋', 'STUDENT', '女', 'code9', 2, 88, NULL);
INSERT INTO `student` VALUES (10, 'student10', '123456', '吴杰', 'STUDENT', '女', 'code10', 6, 87, NULL);
INSERT INTO `student` VALUES (11, 'student11', '123456', '张三', 'STUDENT', '女', 'code11', 13, 88, NULL);
INSERT INTO `student` VALUES (12, 'student12', '123456', '李四', 'STUDENT', '男', 'code12', 7, 85, NULL);
INSERT INTO `student` VALUES (13, 'student13', '123456', '王勇', 'STUDENT', '男', 'code13', 7, 85, NULL);
INSERT INTO `student` VALUES (14, 'student14', '123456', '刘颖', 'STUDENT', '男', 'code14', 15, 91, NULL);
INSERT INTO `student` VALUES (15, 'student15', '123456', '陈博', 'STUDENT', '女', 'code15', 13, 88, NULL);
INSERT INTO `student` VALUES (16, 'student16', '123456', '杨莹', 'STUDENT', '女', 'code16', 9, 86, NULL);
INSERT INTO `student` VALUES (17, 'student17', '123456', '赵刚', 'STUDENT', '女', 'code17', 10, 92, NULL);
INSERT INTO `student` VALUES (18, 'student18', '123456', '黄丽', 'STUDENT', '女', 'code18', 14, 84, NULL);
INSERT INTO `student` VALUES (19, 'student19', '123456', '周平', 'STUDENT', '男', 'code19', 6, 87, NULL);
INSERT INTO `student` VALUES (20, 'student20', '123456', '吴亮', 'STUDENT', '男', 'code20', 11, 93, NULL);
INSERT INTO `student` VALUES (21, 'student21', '123456', '张三', 'STUDENT', '男', 'code21', 17, 90, NULL);
INSERT INTO `student` VALUES (22, 'student22', '123456', '李娜', 'STUDENT', '男', 'code22', 7, 85, NULL);
INSERT INTO `student` VALUES (23, 'student23', '123456', '王浩', 'STUDENT', '女', 'code23', 15, 91, NULL);
INSERT INTO `student` VALUES (24, 'student24', '123456', '刘雯', 'STUDENT', '女', 'code24', 3, 85, NULL);
INSERT INTO `student` VALUES (25, 'student25', '123456', '陈峰', 'STUDENT', '女', 'code25', 11, 93, NULL);
INSERT INTO `student` VALUES (26, 'student26', '123456', '杨莹', 'STUDENT', '女', 'code26', 8, 90, NULL);
INSERT INTO `student` VALUES (27, 'student27', '123456', '赵九', 'STUDENT', '女', 'code27', 10, 92, NULL);
INSERT INTO `student` VALUES (28, 'student28', '123456', '黄敏', 'STUDENT', '女', 'code28', 11, 93, NULL);
INSERT INTO `student` VALUES (29, 'student29', '123456', '周明', 'STUDENT', '男', 'code29', 7, 85, NULL);
INSERT INTO `student` VALUES (30, 'student30', '123456', '吴杰', 'STUDENT', '女', 'code30', 15, 91, NULL);
INSERT INTO `student` VALUES (31, 'student31', '123456', '张杰', 'STUDENT', '男', 'code31', 15, 91, NULL);
INSERT INTO `student` VALUES (32, 'student32', '123456', '李芳', 'STUDENT', '男', 'code32', 7, 85, NULL);
INSERT INTO `student` VALUES (33, 'student33', '123456', '王五', 'STUDENT', '男', 'code33', 12, 89, NULL);
INSERT INTO `student` VALUES (34, 'student34', '123456', '刘雪', 'STUDENT', '女', 'code34', 15, 91, NULL);
INSERT INTO `student` VALUES (35, 'student35', '123456', '陈辉', 'STUDENT', '女', 'code35', 13, 88, NULL);
INSERT INTO `student` VALUES (36, 'student36', '123456', '杨怡', 'STUDENT', '男', 'code36', 14, 84, NULL);
INSERT INTO `student` VALUES (37, 'student37', '123456', '赵九', 'STUDENT', '女', 'code37', 6, 87, NULL);
INSERT INTO `student` VALUES (38, 'student38', '123456', '黄燕', 'STUDENT', '男', 'code38', 4, 80, NULL);
INSERT INTO `student` VALUES (39, 'student39', '123456', '周华', 'STUDENT', '男', 'code39', 12, 89, NULL);
INSERT INTO `student` VALUES (40, 'student40', '123456', '吴超', 'STUDENT', '男', 'code40', 9, 86, NULL);
INSERT INTO `student` VALUES (41, 'student41', '123456', '张杰', 'STUDENT', '男', 'code41', 11, 93, NULL);
INSERT INTO `student` VALUES (42, 'student42', '123456', '李芳', 'STUDENT', '男', 'code42', 6, 87, NULL);
INSERT INTO `student` VALUES (43, 'student43', '123456', '王洋', 'STUDENT', '女', 'code43', 7, 85, NULL);
INSERT INTO `student` VALUES (44, 'student44', '123456', '刘雯', 'STUDENT', '女', 'code44', 10, 92, NULL);
INSERT INTO `student` VALUES (45, 'student45', '123456', '陈鑫', 'STUDENT', '男', 'code45', 14, 84, NULL);
INSERT INTO `student` VALUES (46, 'student46', '123456', '杨莹', 'STUDENT', '男', 'code46', 14, 84, NULL);
INSERT INTO `student` VALUES (47, 'student47', '123456', '赵强', 'STUDENT', '男', 'code47', 7, 85, NULL);
INSERT INTO `student` VALUES (48, 'student48', '123456', '黄敏', 'STUDENT', '女', 'code48', 12, 89, NULL);
INSERT INTO `student` VALUES (49, 'student49', '123456', '周宇', 'STUDENT', '女', 'code49', 5, 95, NULL);
INSERT INTO `student` VALUES (50, 'student50', '123456', '吴晨', 'STUDENT', '女', 'code50', 3, 85, NULL);
INSERT INTO `student` VALUES (51, 'student51', '123456', '张三', 'STUDENT', '女', 'code51', 7, 85, NULL);
INSERT INTO `student` VALUES (52, 'student52', '123456', '李艳', 'STUDENT', '女', 'code52', 12, 89, NULL);
INSERT INTO `student` VALUES (53, 'student53', '123456', '王鹏', 'STUDENT', '女', 'code53', 2, 88, NULL);
INSERT INTO `student` VALUES (54, 'student54', '123456', '刘悦', 'STUDENT', '女', 'code54', 3, 85, NULL);
INSERT INTO `student` VALUES (55, 'student55', '123456', '陈龙', 'STUDENT', '男', 'code55', 9, 86, NULL);
INSERT INTO `student` VALUES (56, 'student56', '123456', '杨芳', 'STUDENT', '男', 'code56', 16, 94, NULL);
INSERT INTO `student` VALUES (57, 'student57', '123456', '赵九', 'STUDENT', '男', 'code57', 5, 95, NULL);
INSERT INTO `student` VALUES (58, 'student58', '123456', '黄静', 'STUDENT', '女', 'code58', 6, 87, NULL);
INSERT INTO `student` VALUES (59, 'student59', '123456', '周平', 'STUDENT', '女', 'code59', 10, 92, NULL);
INSERT INTO `student` VALUES (60, 'student60', '123456', '吴超', 'STUDENT', '女', 'code60', 14, 84, NULL);
INSERT INTO `student` VALUES (61, 'student61', '123456', '张强', 'STUDENT', '女', 'code61', 14, 84, NULL);
INSERT INTO `student` VALUES (62, 'student62', '123456', '李敏', 'STUDENT', '男', 'code62', 10, 92, NULL);
INSERT INTO `student` VALUES (63, 'student63', '123456', '王勇', 'STUDENT', '男', 'code63', 6, 87, NULL);
INSERT INTO `student` VALUES (64, 'student64', '123456', '刘六', 'STUDENT', '女', 'code64', 10, 92, NULL);
INSERT INTO `student` VALUES (65, 'student65', '123456', '陈七', 'STUDENT', '女', 'code65', 8, 90, NULL);
INSERT INTO `student` VALUES (66, 'student66', '123456', '杨洁', 'STUDENT', '男', 'code66', 16, 94, NULL);
INSERT INTO `student` VALUES (67, 'student67', '123456', '赵勇', 'STUDENT', '女', 'code67', 13, 88, NULL);
INSERT INTO `student` VALUES (68, 'student68', '123456', '黄娟', 'STUDENT', '男', 'code68', 14, 84, NULL);
INSERT INTO `student` VALUES (69, 'student69', '123456', '周洋', 'STUDENT', '女', 'code69', 2, 88, NULL);
INSERT INTO `student` VALUES (70, 'student70', '123456', '吴鑫', 'STUDENT', '男', 'code70', 1, 90, NULL);
INSERT INTO `student` VALUES (71, 'student71', '123456', '张强', 'STUDENT', '女', 'code71', 10, 92, NULL);
INSERT INTO `student` VALUES (72, 'student72', '123456', '李娟', 'STUDENT', '男', 'code72', 5, 95, NULL);
INSERT INTO `student` VALUES (73, 'student73', '123456', '王超', 'STUDENT', '女', 'code73', 12, 89, NULL);
INSERT INTO `student` VALUES (74, 'student74', '123456', '刘六', 'STUDENT', '男', 'code74', 11, 93, NULL);
INSERT INTO `student` VALUES (75, 'student75', '123456', '陈阳', 'STUDENT', '男', 'code75', 3, 85, NULL);
INSERT INTO `student` VALUES (76, 'student76', '123456', '杨怡', 'STUDENT', '女', 'code76', 1, 90, NULL);
INSERT INTO `student` VALUES (77, 'student77', '123456', '赵刚', 'STUDENT', '女', 'code77', 3, 85, NULL);
INSERT INTO `student` VALUES (78, 'student78', '123456', '黄燕', 'STUDENT', '女', 'code78', 14, 84, NULL);
INSERT INTO `student` VALUES (79, 'student79', '123456', '周平', 'STUDENT', '女', 'code79', 14, 84, NULL);
INSERT INTO `student` VALUES (80, 'student80', '123456', '吴晨', 'STUDENT', '女', 'code80', 7, 85, NULL);
INSERT INTO `student` VALUES (81, 'student81', '123456', '张明', 'STUDENT', '男', 'code81', 14, 84, NULL);
INSERT INTO `student` VALUES (82, 'student82', '123456', '李四', 'STUDENT', '男', 'code82', 6, 87, NULL);
INSERT INTO `student` VALUES (83, 'student83', '123456', '王浩', 'STUDENT', '女', 'code83', 16, 94, NULL);
INSERT INTO `student` VALUES (84, 'student84', '123456', '刘欣', 'STUDENT', '女', 'code84', 10, 92, NULL);
INSERT INTO `student` VALUES (85, 'student85', '123456', '陈辉', 'STUDENT', '男', 'code85', 10, 92, NULL);
INSERT INTO `student` VALUES (86, 'student86', '123456', '杨敏', 'STUDENT', '女', 'code86', 9, 86, NULL);
INSERT INTO `student` VALUES (87, 'student87', '123456', '赵杰', 'STUDENT', '男', 'code87', 1, 90, NULL);
INSERT INTO `student` VALUES (88, 'student88', '123456', '黄娟', 'STUDENT', '男', 'code88', 1, 90, NULL);
INSERT INTO `student` VALUES (89, 'student89', '123456', '周涛', 'STUDENT', '女', 'code89', 14, 84, NULL);
INSERT INTO `student` VALUES (90, 'student90', '123456', '吴杰', 'STUDENT', '男', 'code90', 1, 90, NULL);
INSERT INTO `student` VALUES (91, 'student91', '123456', '张强', 'STUDENT', '女', 'code91', 13, 88, NULL);
INSERT INTO `student` VALUES (92, 'student92', '123456', '李四', 'STUDENT', '男', 'code92', 5, 95, NULL);
INSERT INTO `student` VALUES (93, 'student93', '123456', '王勇', 'STUDENT', '女', 'code93', 3, 85, NULL);
INSERT INTO `student` VALUES (94, 'student94', '123456', '刘欣', 'STUDENT', '男', 'code94', 6, 87, NULL);
INSERT INTO `student` VALUES (95, 'student95', '123456', '陈辉', 'STUDENT', '女', 'code95', 1, 90, NULL);
INSERT INTO `student` VALUES (96, 'student96', '123456', '杨芳', 'STUDENT', '女', 'code96', 13, 88, NULL);
INSERT INTO `student` VALUES (97, 'student97', '123456', '赵伟', 'STUDENT', '男', 'code97', 12, 89, NULL);
INSERT INTO `student` VALUES (98, 'student98', '123456', '黄敏', 'STUDENT', '男', 'code98', 17, 90, NULL);
INSERT INTO `student` VALUES (99, 'student99', '123456', '周宇', 'STUDENT', '女', 'code99', 4, 80, NULL);
INSERT INTO `student` VALUES (100, 'student100', '123456', '吴博', 'STUDENT', '男', 'code100', 14, 84, NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职称',
  `speciality_id` int(0) NULL DEFAULT NULL COMMENT '专业',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'teacher001', '123456', '张三', '男', '教授', 1, 'TEACHER', 'http://localhost:9090/files/download/1767068405643-1762304336242-1762101057272-屏幕截图 2025-11-03 003002.png');
INSERT INTO `teacher` VALUES (2, 'teacher002', '123456', '李四', '女', '副教授', 2, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (3, 'teacher003', '123456', '王五', '男', '讲师', 5, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (4, 'teacher004', '123456', '赵六', '女', '讲师', 6, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (5, 'teacher005', '123456', '孙七', '男', '教授', 9, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (6, 'teacher006', '123456', '周八', '女', '副教授', 8, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (7, 'teacher007', '123456', '吴九', '男', '教授', 12, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (8, 'teacher008', '123456', '郑十', '女', '讲师', 13, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (9, 'teacher009', '123456', '钱十一', '男', '副教授', 15, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (10, 'teacher010', '123456', '刘十二', '女', '教授', 14, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (11, 'teacher011', '123456', '吴十三', '男', '副教授', 22, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (12, 'teacher012', '123456', '郑十四', '女', '讲师', 20, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (13, 'teacher013', '123456', '李十五', '男', '教授', 23, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (14, 'teacher014', '123456', '陈十六', '女', '副教授', 24, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (15, 'teacher015', '123456', '王十七', '男', '讲师', 29, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (16, 'teacher016', '123456', '张十八', '男', '副教授', 31, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (17, 'teacher017', '123456', '李十九', '女', '讲师', 30, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (18, 'teacher018', '123456', '陈二十', '女', '副教授', 32, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (19, 'teacher019', '123456', '黄二十一', '男', '讲师', 33, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (20, 'teacher020', '123456', '张二十二', '女', '教授', 36, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (21, 'teacher021', '123456', '郑二十三', '男', '副教授', 35, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (22, 'teacher022', '123456', '赵二十四', '男', '讲师', 40, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (23, 'teacher023', '123456', '孙二十五', '女', '副教授', 39, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (24, 'teacher024', '123456', '李二十六', '男', '教授', 44, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (25, 'teacher025', '123456', '黄二十七', '女', '讲师', 45, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (26, 'teacher026', '123456', '吴二十八', '男', '副教授', 48, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (27, 'teacher027', '123456', '张二十九', '女', '讲师', 47, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (28, 'teacher028', '123456', '刘三十', '男', '教授', 50, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (29, 'teacher029', '123456', '陈三十一', '女', '副教授', 51, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (30, 'teacher030', '123456', '郑三十二', '男', '讲师', 52, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (31, 'teacher031', '123456', '王三十三', '男', '教授', 53, 'TEACHER', NULL);
INSERT INTO `teacher` VALUES (32, 'teacher032', '123456', '李三十四', '女', '副教授', 55, 'TEACHER', NULL);

SET FOREIGN_KEY_CHECKS = 1;
