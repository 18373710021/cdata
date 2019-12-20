/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.12.49_3306
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 192.168.12.49:3306
 Source Schema         : cdata

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 20/12/2019 17:57:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('DefaultQuartzScheduler', 'beOnDutyTrigger', 'beOnDutyTriggerGroup', '00 00 09 * * ? *', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('DefaultQuartzScheduler', 'dailyOrderStatisticsTrigger', 'dailyOrderStatisticsTriggerGroup', '00 00 02 * * ? *', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('DefaultQuartzScheduler', 'offDutyTrigger', 'offDutyTriggerGroup', '00 30 18 * * ? *', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('DefaultQuartzScheduler', '上班', 'beOnDutyGroup', NULL, 'com.hydosky.hydoskycdata.quartz.job.BeOnDutyJob', '0', '0', '0', '0', 0x230A23546875204465632031392032303A35363A35302043535420323031390A);
INSERT INTO `qrtz_job_details` VALUES ('DefaultQuartzScheduler', '下班', 'offDutyGroup', NULL, 'com.hydosky.hydoskycdata.quartz.job.OffDutyJob', '0', '0', '0', '0', 0x230A23546875204465632031392032303A35363A35302043535420323031390A);
INSERT INTO `qrtz_job_details` VALUES ('DefaultQuartzScheduler', '每日订单统计', 'dailyOrderStatisticsGroup', NULL, 'com.hydosky.hydoskycdata.quartz.job.DailyOrderStatisticsJob', '0', '0', '0', '0', 0x230A23546875204465632031392032303A35363A30372043535420323031390A);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('DefaultQuartzScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('DefaultQuartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('DefaultQuartzScheduler', '701d3ab7b1411576758689301', 1576835290084, 20000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('DefaultQuartzScheduler', 'beOnDutyTrigger', 'beOnDutyTriggerGroup', '上班', 'beOnDutyGroup', NULL, 1576890000000, 1576803600000, 5, 'WAITING', 'CRON', 1576760210000, 0, NULL, 0, '');
INSERT INTO `qrtz_triggers` VALUES ('DefaultQuartzScheduler', 'dailyOrderStatisticsTrigger', 'dailyOrderStatisticsTriggerGroup', '每日订单统计', 'dailyOrderStatisticsGroup', NULL, 1576864800000, 1576778400000, 5, 'WAITING', 'CRON', 1576760167000, 0, NULL, 0, '');
INSERT INTO `qrtz_triggers` VALUES ('DefaultQuartzScheduler', 'offDutyTrigger', 'offDutyTriggerGroup', '下班', 'offDutyGroup', NULL, 1576837800000, -1, 5, 'WAITING', 'CRON', 1576760210000, 0, NULL, 0, '');

-- ----------------------------
-- Table structure for t_cargo_breakdown
-- ----------------------------
DROP TABLE IF EXISTS `t_cargo_breakdown`;
CREATE TABLE `t_cargo_breakdown`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间默认当前时间',
  `latest_update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最近的修改时间根据操作自动更新时间',
  `cargo_breakdown_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品类名称',
  `level` int(11) NULL DEFAULT NULL COMMENT '级别级别：1,2',
  `parent_cargo_breakdown_id` int(11) NULL DEFAULT NULL COMMENT '上级品类',
  `min_price` int(11) NULL DEFAULT NULL COMMENT '最低价默认1',
  `max_price` int(11) NULL DEFAULT NULL COMMENT '最高价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '货物分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cargo_breakdown
-- ----------------------------
INSERT INTO `t_cargo_breakdown` VALUES (1, '2019-11-28 18:52:35', '2019-11-28 18:52:35', '汽摩配件', 1, NULL, NULL, NULL);
INSERT INTO `t_cargo_breakdown` VALUES (2, '2019-11-28 18:52:35', '2019-11-28 18:53:32', '五金机电', 1, NULL, NULL, NULL);
INSERT INTO `t_cargo_breakdown` VALUES (3, '2019-11-28 18:52:35', '2019-11-28 18:53:32', '建材家居', 1, NULL, NULL, NULL);
INSERT INTO `t_cargo_breakdown` VALUES (4, '2019-11-28 18:52:35', '2019-11-28 18:53:32', '日用百货', 1, NULL, NULL, NULL);
INSERT INTO `t_cargo_breakdown` VALUES (5, '2019-11-28 18:52:35', '2019-11-28 18:53:32', '服装鞋包', 1, NULL, NULL, NULL);
INSERT INTO `t_cargo_breakdown` VALUES (6, '2019-11-28 18:52:35', '2019-11-28 18:53:32', '农资农机', 1, NULL, NULL, NULL);
INSERT INTO `t_cargo_breakdown` VALUES (7, '2019-11-28 18:52:35', '2019-11-28 18:53:32', '粮油副食', 1, NULL, NULL, NULL);
INSERT INTO `t_cargo_breakdown` VALUES (8, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '汽车配件', 2, 1, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (9, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '汽车用品', 2, 1, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (10, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '汽保工具', 2, 1, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (11, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '汽车电器', 2, 1, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (12, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '汽车整车', 2, 1, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (13, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '摩电整车', 2, 1, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (14, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '五金工具', 2, 2, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (15, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '机械设备', 2, 2, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (16, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '日用五金', 2, 2, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (17, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '水暖五金', 2, 2, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (18, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '建筑五金', 2, 2, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (19, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '卫浴家装', 2, 3, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (20, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '建材配件', 2, 3, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (21, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '安防器材', 2, 3, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (22, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '厨房家装', 2, 3, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (23, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '办公家具', 2, 3, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (24, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '户外家具', 2, 3, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (25, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '成套家具', 2, 3, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (26, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '家用电器', 2, 4, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (27, '2019-11-28 18:55:25', '2019-12-12 22:12:24', '日化用品', 2, 4, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (28, '2019-11-28 18:55:25', '2019-12-12 22:12:25', '日杂百货', 2, 4, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (29, '2019-11-28 18:55:25', '2019-12-12 22:12:25', '小家电', 2, 4, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (30, '2019-11-28 18:55:25', '2019-12-12 22:12:25', '针织家纺', 2, 4, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (31, '2019-11-28 18:55:25', '2019-12-12 22:12:25', '窗帘布艺', 2, 4, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (32, '2019-11-28 18:55:25', '2019-12-12 22:12:25', '玩具益智', 2, 4, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (33, '2019-11-28 18:55:25', '2019-12-12 22:12:25', '文体用品', 2, 4, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (34, '2019-11-28 18:55:25', '2019-12-12 22:12:25', '箱包皮具', 2, 5, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (35, '2019-11-28 18:55:25', '2019-12-12 22:12:25', '图书音像', 2, 5, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (36, '2019-11-28 18:55:25', '2019-12-12 22:12:25', '服装饰品', 2, 5, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (37, '2019-11-28 18:55:25', '2019-12-12 22:12:25', '农机农资', 2, 6, 10, 200);
INSERT INTO `t_cargo_breakdown` VALUES (38, '2019-11-28 18:55:25', '2019-12-12 22:12:25', '粮油副食', 2, 7, 10, 200);

-- ----------------------------
-- Table structure for t_cargo_breakdown_order_stats
-- ----------------------------
DROP TABLE IF EXISTS `t_cargo_breakdown_order_stats`;
CREATE TABLE `t_cargo_breakdown_order_stats`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间默认当前时间',
  `latest_update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最近的修改时间根据操作自动更新时间',
  `one_level_cargo_breakdown` int(11) NULL DEFAULT NULL COMMENT '一级货物品类',
  `two_level_cargo_breakdown` int(11) NULL DEFAULT NULL COMMENT '二级货物品类',
  `cargo_count` int(11) NULL DEFAULT NULL COMMENT '货物总量',
  `freight_count` int(11) NULL DEFAULT NULL COMMENT '运费总额',
  `order_count` int(11) NULL DEFAULT NULL COMMENT '订单总量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `two_level_cargo_breakdown`(`two_level_cargo_breakdown`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 351 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '货物品类订单统计信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cargo_breakdown_order_stats
-- ----------------------------
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (320, '2019-12-03 16:15:14', '2019-12-20 12:57:00', 1, 8, 2299, 146174, 910);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (321, '2019-12-03 16:15:14', '2019-12-20 12:52:48', 1, 9, 2127, 142064, 877);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (322, '2019-12-03 16:15:15', '2019-12-20 13:02:58', 1, 10, 2138, 134800, 860);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (323, '2019-12-03 16:15:15', '2019-12-20 12:59:46', 1, 11, 2155, 133659, 899);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (324, '2019-12-03 16:15:15', '2019-12-20 12:57:02', 1, 12, 2199, 134313, 885);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (325, '2019-12-03 16:15:15', '2019-12-20 12:59:46', 1, 13, 2059, 129409, 845);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (326, '2019-12-03 16:15:15', '2019-12-20 12:56:50', 2, 14, 2204, 138315, 870);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (327, '2019-12-03 16:15:15', '2019-12-20 12:50:44', 2, 15, 2152, 128168, 864);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (328, '2019-12-03 16:15:15', '2019-12-20 12:58:22', 2, 16, 2119, 132056, 841);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (329, '2019-12-03 16:15:15', '2019-12-20 13:02:02', 2, 17, 2211, 143077, 873);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (330, '2019-12-03 16:15:15', '2019-12-20 12:53:30', 2, 18, 2259, 143186, 908);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (331, '2019-12-03 16:15:15', '2019-12-20 13:02:58', 3, 19, 2282, 140060, 884);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (332, '2019-12-03 16:15:15', '2019-12-20 12:58:42', 3, 20, 2130, 136491, 837);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (333, '2019-12-03 16:15:15', '2019-12-20 12:55:16', 3, 21, 2149, 138263, 848);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (334, '2019-12-03 16:15:15', '2019-12-20 12:58:42', 3, 22, 2188, 136499, 895);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (335, '2019-12-03 16:15:15', '2019-12-20 13:03:18', 3, 23, 2177, 143712, 897);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (336, '2019-12-03 16:15:15', '2019-12-20 12:52:48', 3, 24, 2197, 139752, 876);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (337, '2019-12-03 16:15:15', '2019-12-20 12:59:46', 3, 25, 2243, 153950, 896);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (338, '2019-12-03 16:15:15', '2019-12-20 12:56:08', 4, 26, 2101, 134404, 840);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (339, '2019-12-03 16:15:15', '2019-12-20 12:58:16', 4, 27, 2225, 133861, 867);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (340, '2019-12-03 16:15:15', '2019-12-20 13:03:18', 4, 28, 2220, 142064, 892);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (341, '2019-12-03 16:15:15', '2019-12-20 12:57:28', 4, 29, 2258, 133978, 893);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (342, '2019-12-03 16:15:15', '2019-12-20 13:02:02', 4, 30, 2152, 141550, 901);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (343, '2019-12-03 16:15:15', '2019-12-20 12:59:46', 4, 31, 2275, 139474, 914);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (344, '2019-12-03 16:15:15', '2019-12-20 13:02:58', 4, 32, 2233, 151560, 886);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (345, '2019-12-03 16:15:15', '2019-12-20 13:00:48', 4, 33, 1957, 125427, 787);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (346, '2019-12-03 16:15:15', '2019-12-20 12:57:28', 5, 34, 2129, 140311, 876);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (347, '2019-12-03 16:15:15', '2019-12-20 13:03:18', 5, 35, 2113, 134042, 872);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (348, '2019-12-03 16:15:15', '2019-12-20 13:01:20', 5, 36, 2185, 146123, 887);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (349, '2019-12-03 16:15:15', '2019-12-20 13:02:08', 6, 37, 2182, 138646, 866);
INSERT INTO `t_cargo_breakdown_order_stats` VALUES (350, '2019-12-03 16:15:16', '2019-12-20 12:58:16', 7, 38, 2321, 138920, 944);

-- ----------------------------
-- Table structure for t_day_order_stats
-- ----------------------------
DROP TABLE IF EXISTS `t_day_order_stats`;
CREATE TABLE `t_day_order_stats`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间默认当前时间',
  `latest_update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最近的修改时间根据操作自动更新时间',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `cargo_count` int(11) NULL DEFAULT NULL COMMENT '货物总量',
  `freight_count` int(11) NULL DEFAULT NULL COMMENT '运费总额',
  `order_count` int(11) NULL DEFAULT NULL COMMENT '订单总量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `date`(`date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日订单统计信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_day_order_stats
-- ----------------------------
INSERT INTO `t_day_order_stats` VALUES (5, '2019-12-04 10:34:04', '2019-12-04 10:34:04', '2019-12-03', 1868, 97978, 763);
INSERT INTO `t_day_order_stats` VALUES (6, '2019-12-05 01:00:00', '2019-12-05 01:00:00', '2019-12-04', 3865, 212000, 1536);
INSERT INTO `t_day_order_stats` VALUES (7, '2019-12-06 01:00:00', '2019-12-06 01:00:00', '2019-12-05', 3797, 208041, 1521);
INSERT INTO `t_day_order_stats` VALUES (8, '2019-12-07 01:00:00', '2019-12-07 01:00:00', '2019-12-06', 3855, 208851, 1561);
INSERT INTO `t_day_order_stats` VALUES (9, '2019-12-08 01:00:00', '2019-12-08 01:00:00', '2019-12-07', 3923, 56902, 1570);
INSERT INTO `t_day_order_stats` VALUES (10, '2019-12-09 01:00:00', '2019-12-09 01:00:00', '2019-12-08', 3758, 54606, 1523);
INSERT INTO `t_day_order_stats` VALUES (11, '2019-12-10 01:00:00', '2019-12-10 01:00:00', '2019-12-09', 3936, 57112, 1590);
INSERT INTO `t_day_order_stats` VALUES (12, '2019-12-11 01:00:00', '2019-12-11 01:00:00', '2019-12-10', 3882, 56024, 1580);
INSERT INTO `t_day_order_stats` VALUES (13, '2019-12-12 01:00:00', '2019-12-12 01:00:00', '2019-12-11', 3829, 55525, 1539);
INSERT INTO `t_day_order_stats` VALUES (14, '2019-12-13 01:00:00', '2019-12-13 01:00:00', '2019-12-12', 3908, 57010, 1567);
INSERT INTO `t_day_order_stats` VALUES (15, '2019-12-14 01:00:00', '2019-12-14 01:00:00', '2019-12-13', 3987, 416190, 1601);
INSERT INTO `t_day_order_stats` VALUES (16, '2019-12-15 01:00:00', '2019-12-15 01:00:00', '2019-12-14', 3787, 385512, 1528);
INSERT INTO `t_day_order_stats` VALUES (17, '2019-12-16 01:00:00', '2019-12-16 01:00:00', '2019-12-15', 3850, 400421, 1534);
INSERT INTO `t_day_order_stats` VALUES (18, '2019-12-17 01:00:00', '2019-12-17 01:00:00', '2019-12-16', 3996, 419495, 1600);
INSERT INTO `t_day_order_stats` VALUES (19, '2019-12-18 01:00:00', '2019-12-18 01:00:00', '2019-12-17', 3971, 426038, 1581);
INSERT INTO `t_day_order_stats` VALUES (20, '2019-12-19 01:00:00', '2019-12-19 01:00:00', '2019-12-18', 3942, 408896, 1564);
INSERT INTO `t_day_order_stats` VALUES (21, '2019-12-20 02:00:00', '2019-12-20 02:00:00', '2019-12-19', 3722, 382446, 1508);

-- ----------------------------
-- Table structure for t_order_info
-- ----------------------------
DROP TABLE IF EXISTS `t_order_info`;
CREATE TABLE `t_order_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间默认当前时间',
  `latest_update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最近的修改时间根据操作自动更新时间',
  `one_level_cargo_breakdown` int(11) NULL DEFAULT NULL COMMENT '一级货物品类',
  `two_level_cargo_breakdown` int(11) NULL DEFAULT NULL COMMENT '二级货物品类',
  `cargo_number` int(11) NULL DEFAULT NULL COMMENT '货物数量',
  `freight` int(11) NULL DEFAULT NULL COMMENT '运费',
  `shopping_mall_id` int(11) NULL DEFAULT NULL COMMENT '所属商城',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39093 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_info
-- ----------------------------
INSERT INTO `t_order_info` VALUES (38569, '2019-12-20 11:44:42', '2019-12-20 11:44:42', 3, 19, 3, 78, 9);
INSERT INTO `t_order_info` VALUES (38570, '2019-12-20 11:44:42', '2019-12-20 11:44:42', 1, 11, 3, 459, 5);
INSERT INTO `t_order_info` VALUES (38571, '2019-12-20 11:44:48', '2019-12-20 11:44:48', 4, 32, 2, 62, 6);
INSERT INTO `t_order_info` VALUES (38572, '2019-12-20 11:44:48', '2019-12-20 11:44:48', 3, 20, 4, 132, 6);
INSERT INTO `t_order_info` VALUES (38573, '2019-12-20 11:44:48', '2019-12-20 11:44:48', 2, 17, 3, 351, 4);
INSERT INTO `t_order_info` VALUES (38574, '2019-12-20 11:45:30', '2019-12-20 11:45:30', 7, 38, 4, 636, 9);
INSERT INTO `t_order_info` VALUES (38575, '2019-12-20 11:45:30', '2019-12-20 11:45:30', 4, 27, 3, 516, 5);
INSERT INTO `t_order_info` VALUES (38576, '2019-12-20 11:45:30', '2019-12-20 11:45:30', 2, 15, 4, 488, 9);
INSERT INTO `t_order_info` VALUES (38577, '2019-12-20 11:45:30', '2019-12-20 11:45:30', 3, 22, 1, 15, 9);
INSERT INTO `t_order_info` VALUES (38578, '2019-12-20 11:45:48', '2019-12-20 11:45:48', 2, 17, 2, 34, 5);
INSERT INTO `t_order_info` VALUES (38579, '2019-12-20 11:45:48', '2019-12-20 11:45:48', 7, 38, 1, 14, 5);
INSERT INTO `t_order_info` VALUES (38580, '2019-12-20 11:45:48', '2019-12-20 11:45:48', 1, 8, 1, 31, 5);
INSERT INTO `t_order_info` VALUES (38581, '2019-12-20 11:46:32', '2019-12-20 11:46:32', 5, 34, 2, 294, 6);
INSERT INTO `t_order_info` VALUES (38582, '2019-12-20 11:46:32', '2019-12-20 11:46:32', 6, 37, 3, 228, 6);
INSERT INTO `t_order_info` VALUES (38583, '2019-12-20 11:46:38', '2019-12-20 11:46:38', 4, 32, 1, 133, 4);
INSERT INTO `t_order_info` VALUES (38584, '2019-12-20 11:46:38', '2019-12-20 11:46:38', 4, 31, 2, 120, 6);
INSERT INTO `t_order_info` VALUES (38585, '2019-12-20 11:47:12', '2019-12-20 11:47:12', 6, 37, 3, 372, 4);
INSERT INTO `t_order_info` VALUES (38586, '2019-12-20 11:47:40', '2019-12-20 11:47:40', 1, 11, 1, 55, 4);
INSERT INTO `t_order_info` VALUES (38587, '2019-12-20 11:47:40', '2019-12-20 11:47:40', 1, 12, 3, 42, 5);
INSERT INTO `t_order_info` VALUES (38588, '2019-12-20 11:48:00', '2019-12-20 11:48:00', 1, 11, 1, 124, 6);
INSERT INTO `t_order_info` VALUES (38589, '2019-12-20 11:48:00', '2019-12-20 11:48:00', 3, 25, 2, 354, 6);
INSERT INTO `t_order_info` VALUES (38590, '2019-12-20 11:48:22', '2019-12-20 11:48:22', 2, 18, 4, 788, 4);
INSERT INTO `t_order_info` VALUES (38591, '2019-12-20 11:48:22', '2019-12-20 11:48:22', 3, 22, 2, 130, 4);
INSERT INTO `t_order_info` VALUES (38592, '2019-12-20 11:48:22', '2019-12-20 11:48:22', 3, 19, 1, 15, 4);
INSERT INTO `t_order_info` VALUES (38593, '2019-12-20 11:48:46', '2019-12-20 11:48:46', 3, 21, 3, 459, 4);
INSERT INTO `t_order_info` VALUES (38594, '2019-12-20 11:48:46', '2019-12-20 11:48:46', 1, 8, 1, 71, 4);
INSERT INTO `t_order_info` VALUES (38595, '2019-12-20 11:48:46', '2019-12-20 11:48:46', 3, 20, 1, 133, 4);
INSERT INTO `t_order_info` VALUES (38596, '2019-12-20 11:48:46', '2019-12-20 11:48:46', 4, 30, 2, 186, 4);
INSERT INTO `t_order_info` VALUES (38597, '2019-12-20 11:48:48', '2019-12-20 11:48:48', 3, 19, 2, 350, 9);
INSERT INTO `t_order_info` VALUES (38598, '2019-12-20 11:48:48', '2019-12-20 11:48:48', 3, 24, 4, 128, 4);
INSERT INTO `t_order_info` VALUES (38599, '2019-12-20 11:48:48', '2019-12-20 11:48:48', 2, 14, 2, 94, 4);
INSERT INTO `t_order_info` VALUES (38600, '2019-12-20 11:48:56', '2019-12-20 11:48:56', 3, 25, 2, 38, 4);
INSERT INTO `t_order_info` VALUES (38601, '2019-12-20 11:48:56', '2019-12-20 11:48:56', 2, 16, 4, 780, 6);
INSERT INTO `t_order_info` VALUES (38602, '2019-12-20 11:48:56', '2019-12-20 11:48:56', 4, 29, 3, 222, 8);
INSERT INTO `t_order_info` VALUES (38603, '2019-12-20 11:48:56', '2019-12-20 11:48:56', 2, 17, 3, 396, 8);
INSERT INTO `t_order_info` VALUES (38604, '2019-12-20 11:49:04', '2019-12-20 11:49:04', 1, 8, 1, 85, 5);
INSERT INTO `t_order_info` VALUES (38605, '2019-12-20 11:49:04', '2019-12-20 11:49:04', 2, 17, 4, 708, 8);
INSERT INTO `t_order_info` VALUES (38606, '2019-12-20 11:49:04', '2019-12-20 11:49:04', 5, 35, 4, 708, 5);
INSERT INTO `t_order_info` VALUES (38607, '2019-12-20 11:49:28', '2019-12-20 11:49:28', 3, 25, 3, 144, 8);
INSERT INTO `t_order_info` VALUES (38608, '2019-12-20 11:49:28', '2019-12-20 11:49:28', 1, 12, 1, 159, 8);
INSERT INTO `t_order_info` VALUES (38609, '2019-12-20 11:49:28', '2019-12-20 11:49:28', 3, 23, 4, 232, 4);
INSERT INTO `t_order_info` VALUES (38610, '2019-12-20 11:49:28', '2019-12-20 11:49:28', 1, 9, 1, 127, 7);
INSERT INTO `t_order_info` VALUES (38611, '2019-12-20 11:50:06', '2019-12-20 11:50:06', 2, 17, 2, 192, 6);
INSERT INTO `t_order_info` VALUES (38612, '2019-12-20 11:50:06', '2019-12-20 11:50:06', 3, 23, 2, 110, 7);
INSERT INTO `t_order_info` VALUES (38613, '2019-12-20 11:50:22', '2019-12-20 11:50:22', 3, 20, 2, 380, 5);
INSERT INTO `t_order_info` VALUES (38614, '2019-12-20 11:51:20', '2019-12-20 11:51:20', 4, 30, 3, 588, 6);
INSERT INTO `t_order_info` VALUES (38615, '2019-12-20 11:51:20', '2019-12-20 11:51:20', 5, 34, 1, 24, 4);
INSERT INTO `t_order_info` VALUES (38616, '2019-12-20 11:51:20', '2019-12-20 11:51:20', 1, 12, 3, 36, 6);
INSERT INTO `t_order_info` VALUES (38617, '2019-12-20 11:52:02', '2019-12-20 11:52:02', 2, 16, 1, 50, 5);
INSERT INTO `t_order_info` VALUES (38618, '2019-12-20 11:52:02', '2019-12-20 11:52:02', 2, 17, 1, 158, 4);
INSERT INTO `t_order_info` VALUES (38619, '2019-12-20 11:52:02', '2019-12-20 11:52:02', 2, 17, 1, 123, 4);
INSERT INTO `t_order_info` VALUES (38620, '2019-12-20 11:52:02', '2019-12-20 11:52:02', 3, 22, 1, 54, 6);
INSERT INTO `t_order_info` VALUES (38621, '2019-12-20 11:52:12', '2019-12-20 11:52:12', 5, 34, 1, 129, 4);
INSERT INTO `t_order_info` VALUES (38622, '2019-12-20 11:52:12', '2019-12-20 11:52:12', 1, 11, 1, 75, 8);
INSERT INTO `t_order_info` VALUES (38623, '2019-12-20 11:52:12', '2019-12-20 11:52:12', 1, 9, 1, 64, 6);
INSERT INTO `t_order_info` VALUES (38624, '2019-12-20 11:52:12', '2019-12-20 11:52:12', 1, 10, 4, 312, 4);
INSERT INTO `t_order_info` VALUES (38625, '2019-12-20 11:52:14', '2019-12-20 11:52:14', 4, 32, 4, 692, 5);
INSERT INTO `t_order_info` VALUES (38626, '2019-12-20 11:52:14', '2019-12-20 11:52:14', 2, 16, 1, 134, 5);
INSERT INTO `t_order_info` VALUES (38627, '2019-12-20 11:52:14', '2019-12-20 11:52:14', 4, 27, 3, 585, 5);
INSERT INTO `t_order_info` VALUES (38628, '2019-12-20 11:52:14', '2019-12-20 11:52:14', 4, 31, 2, 76, 5);
INSERT INTO `t_order_info` VALUES (38629, '2019-12-20 11:52:40', '2019-12-20 11:52:40', 4, 29, 2, 254, 8);
INSERT INTO `t_order_info` VALUES (38630, '2019-12-20 11:52:50', '2019-12-20 11:52:50', 2, 15, 1, 77, 9);
INSERT INTO `t_order_info` VALUES (38631, '2019-12-20 11:52:50', '2019-12-20 11:52:50', 4, 32, 1, 47, 4);
INSERT INTO `t_order_info` VALUES (38632, '2019-12-20 11:52:56', '2019-12-20 11:52:56', 1, 10, 3, 126, 5);
INSERT INTO `t_order_info` VALUES (38633, '2019-12-20 11:53:16', '2019-12-20 11:53:16', 4, 27, 2, 50, 6);
INSERT INTO `t_order_info` VALUES (38634, '2019-12-20 11:53:16', '2019-12-20 11:53:16', 2, 14, 3, 387, 6);
INSERT INTO `t_order_info` VALUES (38635, '2019-12-20 11:53:16', '2019-12-20 11:53:16', 5, 34, 1, 169, 6);
INSERT INTO `t_order_info` VALUES (38636, '2019-12-20 11:53:16', '2019-12-20 11:53:16', 5, 35, 4, 524, 4);
INSERT INTO `t_order_info` VALUES (38637, '2019-12-20 11:53:28', '2019-12-20 11:53:28', 6, 37, 4, 652, 4);
INSERT INTO `t_order_info` VALUES (38638, '2019-12-20 11:53:28', '2019-12-20 11:53:28', 3, 25, 1, 111, 5);
INSERT INTO `t_order_info` VALUES (38639, '2019-12-20 11:53:28', '2019-12-20 11:53:28', 4, 31, 1, 61, 5);
INSERT INTO `t_order_info` VALUES (38640, '2019-12-20 11:53:28', '2019-12-20 11:53:28', 4, 29, 2, 124, 5);
INSERT INTO `t_order_info` VALUES (38641, '2019-12-20 11:53:30', '2019-12-20 11:53:30', 2, 17, 3, 225, 9);
INSERT INTO `t_order_info` VALUES (38642, '2019-12-20 11:53:30', '2019-12-20 11:53:30', 2, 18, 2, 174, 9);
INSERT INTO `t_order_info` VALUES (38643, '2019-12-20 11:53:30', '2019-12-20 11:53:30', 4, 32, 2, 224, 4);
INSERT INTO `t_order_info` VALUES (38644, '2019-12-20 11:53:30', '2019-12-20 11:53:30', 1, 8, 3, 36, 9);
INSERT INTO `t_order_info` VALUES (38645, '2019-12-20 11:54:58', '2019-12-20 11:54:58', 5, 35, 2, 186, 4);
INSERT INTO `t_order_info` VALUES (38646, '2019-12-20 11:55:30', '2019-12-20 11:55:30', 4, 32, 3, 153, 5);
INSERT INTO `t_order_info` VALUES (38647, '2019-12-20 11:55:30', '2019-12-20 11:55:30', 5, 34, 3, 531, 4);
INSERT INTO `t_order_info` VALUES (38648, '2019-12-20 11:55:30', '2019-12-20 11:55:30', 4, 32, 4, 172, 7);
INSERT INTO `t_order_info` VALUES (38649, '2019-12-20 11:55:30', '2019-12-20 11:55:30', 3, 21, 4, 436, 4);
INSERT INTO `t_order_info` VALUES (38650, '2019-12-20 11:55:56', '2019-12-20 11:55:56', 5, 34, 4, 304, 6);
INSERT INTO `t_order_info` VALUES (38651, '2019-12-20 11:56:18', '2019-12-20 11:56:18', 7, 38, 3, 384, 8);
INSERT INTO `t_order_info` VALUES (38652, '2019-12-20 11:56:18', '2019-12-20 11:56:18', 2, 18, 2, 74, 7);
INSERT INTO `t_order_info` VALUES (38653, '2019-12-20 11:56:18', '2019-12-20 11:56:18', 1, 8, 4, 332, 4);
INSERT INTO `t_order_info` VALUES (38654, '2019-12-20 11:56:18', '2019-12-20 11:56:18', 1, 11, 1, 46, 7);
INSERT INTO `t_order_info` VALUES (38655, '2019-12-20 11:56:24', '2019-12-20 11:56:24', 3, 24, 3, 396, 4);
INSERT INTO `t_order_info` VALUES (38656, '2019-12-20 11:56:24', '2019-12-20 11:56:24', 7, 38, 1, 29, 4);
INSERT INTO `t_order_info` VALUES (38657, '2019-12-20 11:56:34', '2019-12-20 11:56:34', 2, 16, 2, 200, 8);
INSERT INTO `t_order_info` VALUES (38658, '2019-12-20 11:56:34', '2019-12-20 11:56:34', 1, 11, 2, 80, 7);
INSERT INTO `t_order_info` VALUES (38659, '2019-12-20 11:56:34', '2019-12-20 11:56:34', 6, 37, 1, 164, 8);
INSERT INTO `t_order_info` VALUES (38660, '2019-12-20 11:56:34', '2019-12-20 11:56:34', 3, 22, 4, 136, 10);
INSERT INTO `t_order_info` VALUES (38661, '2019-12-20 11:56:38', '2019-12-20 11:56:38', 1, 11, 1, 198, 4);
INSERT INTO `t_order_info` VALUES (38662, '2019-12-20 11:56:38', '2019-12-20 11:56:38', 1, 12, 3, 426, 4);
INSERT INTO `t_order_info` VALUES (38663, '2019-12-20 11:56:48', '2019-12-20 11:56:48', 1, 12, 2, 340, 8);
INSERT INTO `t_order_info` VALUES (38664, '2019-12-20 11:56:48', '2019-12-20 11:56:48', 4, 28, 4, 48, 8);
INSERT INTO `t_order_info` VALUES (38665, '2019-12-20 11:56:48', '2019-12-20 11:56:48', 3, 25, 1, 198, 4);
INSERT INTO `t_order_info` VALUES (38666, '2019-12-20 11:57:18', '2019-12-20 11:57:18', 1, 8, 3, 591, 6);
INSERT INTO `t_order_info` VALUES (38667, '2019-12-20 11:57:18', '2019-12-20 11:57:18', 4, 26, 2, 60, 4);
INSERT INTO `t_order_info` VALUES (38668, '2019-12-20 11:57:18', '2019-12-20 11:57:18', 4, 27, 3, 246, 5);
INSERT INTO `t_order_info` VALUES (38669, '2019-12-20 11:57:18', '2019-12-20 11:57:18', 2, 17, 1, 196, 5);
INSERT INTO `t_order_info` VALUES (38670, '2019-12-20 11:58:10', '2019-12-20 11:58:10', 2, 18, 3, 408, 8);
INSERT INTO `t_order_info` VALUES (38671, '2019-12-20 11:58:10', '2019-12-20 11:58:10', 6, 37, 3, 570, 8);
INSERT INTO `t_order_info` VALUES (38672, '2019-12-20 11:58:10', '2019-12-20 11:58:10', 3, 20, 2, 22, 8);
INSERT INTO `t_order_info` VALUES (38673, '2019-12-20 11:58:38', '2019-12-20 11:58:38', 5, 34, 2, 300, 6);
INSERT INTO `t_order_info` VALUES (38674, '2019-12-20 11:58:52', '2019-12-20 11:58:52', 1, 13, 3, 492, 4);
INSERT INTO `t_order_info` VALUES (38675, '2019-12-20 11:58:52', '2019-12-20 11:58:52', 3, 19, 4, 460, 4);
INSERT INTO `t_order_info` VALUES (38676, '2019-12-20 11:59:10', '2019-12-20 11:59:10', 5, 35, 2, 184, 5);
INSERT INTO `t_order_info` VALUES (38677, '2019-12-20 11:59:10', '2019-12-20 11:59:10', 4, 26, 1, 60, 4);
INSERT INTO `t_order_info` VALUES (38678, '2019-12-20 11:59:10', '2019-12-20 11:59:10', 1, 13, 4, 148, 4);
INSERT INTO `t_order_info` VALUES (38679, '2019-12-20 12:00:22', '2019-12-20 12:00:22', 3, 19, 4, 128, 4);
INSERT INTO `t_order_info` VALUES (38680, '2019-12-20 12:00:22', '2019-12-20 12:00:22', 4, 26, 3, 183, 4);
INSERT INTO `t_order_info` VALUES (38681, '2019-12-20 12:00:22', '2019-12-20 12:00:22', 1, 12, 2, 346, 4);
INSERT INTO `t_order_info` VALUES (38682, '2019-12-20 12:00:40', '2019-12-20 12:00:40', 1, 11, 2, 264, 8);
INSERT INTO `t_order_info` VALUES (38683, '2019-12-20 12:00:40', '2019-12-20 12:00:40', 1, 10, 4, 588, 4);
INSERT INTO `t_order_info` VALUES (38684, '2019-12-20 12:00:40', '2019-12-20 12:00:40', 5, 36, 3, 510, 4);
INSERT INTO `t_order_info` VALUES (38685, '2019-12-20 12:00:48', '2019-12-20 12:00:48', 5, 34, 1, 172, 11);
INSERT INTO `t_order_info` VALUES (38686, '2019-12-20 12:00:48', '2019-12-20 12:00:48', 1, 12, 1, 144, 11);
INSERT INTO `t_order_info` VALUES (38687, '2019-12-20 12:01:00', '2019-12-20 12:01:00', 3, 20, 3, 342, 4);
INSERT INTO `t_order_info` VALUES (38688, '2019-12-20 12:01:00', '2019-12-20 12:01:00', 3, 24, 4, 204, 4);
INSERT INTO `t_order_info` VALUES (38689, '2019-12-20 12:01:00', '2019-12-20 12:01:00', 4, 26, 3, 246, 4);
INSERT INTO `t_order_info` VALUES (38690, '2019-12-20 12:01:00', '2019-12-20 12:01:00', 2, 18, 3, 390, 4);
INSERT INTO `t_order_info` VALUES (38691, '2019-12-20 12:01:18', '2019-12-20 12:01:18', 4, 27, 2, 202, 5);
INSERT INTO `t_order_info` VALUES (38692, '2019-12-20 12:01:18', '2019-12-20 12:01:18', 1, 9, 1, 149, 9);
INSERT INTO `t_order_info` VALUES (38693, '2019-12-20 12:01:18', '2019-12-20 12:01:18', 1, 11, 2, 366, 9);
INSERT INTO `t_order_info` VALUES (38694, '2019-12-20 12:01:36', '2019-12-20 12:01:36', 4, 31, 1, 48, 7);
INSERT INTO `t_order_info` VALUES (38695, '2019-12-20 12:01:36', '2019-12-20 12:01:36', 5, 36, 4, 776, 8);
INSERT INTO `t_order_info` VALUES (38696, '2019-12-20 12:02:32', '2019-12-20 12:02:32', 4, 27, 4, 620, 4);
INSERT INTO `t_order_info` VALUES (38697, '2019-12-20 12:02:32', '2019-12-20 12:02:32', 2, 18, 2, 26, 4);
INSERT INTO `t_order_info` VALUES (38698, '2019-12-20 12:03:04', '2019-12-20 12:03:04', 4, 32, 3, 297, 4);
INSERT INTO `t_order_info` VALUES (38699, '2019-12-20 12:03:04', '2019-12-20 12:03:04', 3, 20, 1, 184, 4);
INSERT INTO `t_order_info` VALUES (38700, '2019-12-20 12:03:04', '2019-12-20 12:03:04', 6, 37, 2, 146, 4);
INSERT INTO `t_order_info` VALUES (38701, '2019-12-20 12:03:16', '2019-12-20 12:03:16', 1, 11, 2, 52, 4);
INSERT INTO `t_order_info` VALUES (38702, '2019-12-20 12:03:18', '2019-12-20 12:03:18', 4, 28, 2, 262, 6);
INSERT INTO `t_order_info` VALUES (38703, '2019-12-20 12:03:58', '2019-12-20 12:03:58', 1, 9, 4, 108, 5);
INSERT INTO `t_order_info` VALUES (38704, '2019-12-20 12:03:58', '2019-12-20 12:03:58', 4, 33, 3, 33, 8);
INSERT INTO `t_order_info` VALUES (38705, '2019-12-20 12:03:58', '2019-12-20 12:03:58', 3, 22, 1, 193, 5);
INSERT INTO `t_order_info` VALUES (38706, '2019-12-20 12:03:58', '2019-12-20 12:03:58', 1, 9, 2, 242, 8);
INSERT INTO `t_order_info` VALUES (38707, '2019-12-20 12:04:40', '2019-12-20 12:04:40', 1, 10, 4, 100, 5);
INSERT INTO `t_order_info` VALUES (38708, '2019-12-20 12:04:40', '2019-12-20 12:04:40', 3, 19, 3, 105, 4);
INSERT INTO `t_order_info` VALUES (38709, '2019-12-20 12:04:40', '2019-12-20 12:04:40', 2, 17, 4, 272, 4);
INSERT INTO `t_order_info` VALUES (38710, '2019-12-20 12:04:40', '2019-12-20 12:04:40', 3, 20, 4, 596, 5);
INSERT INTO `t_order_info` VALUES (38711, '2019-12-20 12:05:48', '2019-12-20 12:05:48', 1, 13, 4, 172, 5);
INSERT INTO `t_order_info` VALUES (38712, '2019-12-20 12:05:48', '2019-12-20 12:05:48', 1, 13, 1, 165, 5);
INSERT INTO `t_order_info` VALUES (38713, '2019-12-20 12:05:48', '2019-12-20 12:05:48', 4, 33, 1, 59, 5);
INSERT INTO `t_order_info` VALUES (38714, '2019-12-20 12:06:06', '2019-12-20 12:06:06', 3, 21, 2, 374, 4);
INSERT INTO `t_order_info` VALUES (38715, '2019-12-20 12:06:06', '2019-12-20 12:06:06', 5, 34, 1, 117, 8);
INSERT INTO `t_order_info` VALUES (38716, '2019-12-20 12:06:22', '2019-12-20 12:06:22', 1, 10, 4, 568, 7);
INSERT INTO `t_order_info` VALUES (38717, '2019-12-20 12:06:22', '2019-12-20 12:06:22', 4, 31, 4, 252, 7);
INSERT INTO `t_order_info` VALUES (38718, '2019-12-20 12:06:22', '2019-12-20 12:06:22', 3, 22, 2, 48, 4);
INSERT INTO `t_order_info` VALUES (38719, '2019-12-20 12:06:36', '2019-12-20 12:06:36', 1, 10, 2, 260, 4);
INSERT INTO `t_order_info` VALUES (38720, '2019-12-20 12:06:36', '2019-12-20 12:06:36', 4, 30, 2, 396, 8);
INSERT INTO `t_order_info` VALUES (38721, '2019-12-20 12:06:52', '2019-12-20 12:06:52', 5, 36, 4, 668, 9);
INSERT INTO `t_order_info` VALUES (38722, '2019-12-20 12:06:52', '2019-12-20 12:06:52', 7, 38, 1, 93, 4);
INSERT INTO `t_order_info` VALUES (38723, '2019-12-20 12:06:52', '2019-12-20 12:06:52', 3, 23, 2, 222, 6);
INSERT INTO `t_order_info` VALUES (38724, '2019-12-20 12:06:56', '2019-12-20 12:06:56', 3, 21, 3, 399, 5);
INSERT INTO `t_order_info` VALUES (38725, '2019-12-20 12:06:56', '2019-12-20 12:06:56', 5, 35, 4, 116, 4);
INSERT INTO `t_order_info` VALUES (38726, '2019-12-20 12:06:56', '2019-12-20 12:06:56', 4, 28, 2, 378, 5);
INSERT INTO `t_order_info` VALUES (38727, '2019-12-20 12:07:46', '2019-12-20 12:07:46', 4, 30, 1, 102, 6);
INSERT INTO `t_order_info` VALUES (38728, '2019-12-20 12:07:46', '2019-12-20 12:07:46', 7, 38, 2, 206, 4);
INSERT INTO `t_order_info` VALUES (38729, '2019-12-20 12:07:46', '2019-12-20 12:07:46', 7, 38, 1, 113, 6);
INSERT INTO `t_order_info` VALUES (38730, '2019-12-20 12:08:04', '2019-12-20 12:08:04', 3, 23, 2, 176, 5);
INSERT INTO `t_order_info` VALUES (38731, '2019-12-20 12:08:06', '2019-12-20 12:08:06', 5, 36, 1, 45, 5);
INSERT INTO `t_order_info` VALUES (38732, '2019-12-20 12:08:06', '2019-12-20 12:08:06', 4, 26, 3, 312, 4);
INSERT INTO `t_order_info` VALUES (38733, '2019-12-20 12:08:06', '2019-12-20 12:08:06', 1, 11, 2, 366, 5);
INSERT INTO `t_order_info` VALUES (38734, '2019-12-20 12:08:26', '2019-12-20 12:08:26', 5, 35, 1, 115, 7);
INSERT INTO `t_order_info` VALUES (38735, '2019-12-20 12:08:26', '2019-12-20 12:08:26', 3, 21, 2, 342, 4);
INSERT INTO `t_order_info` VALUES (38736, '2019-12-20 12:08:26', '2019-12-20 12:08:26', 4, 26, 1, 33, 5);
INSERT INTO `t_order_info` VALUES (38737, '2019-12-20 12:08:46', '2019-12-20 12:08:46', 4, 29, 3, 189, 8);
INSERT INTO `t_order_info` VALUES (38738, '2019-12-20 12:08:56', '2019-12-20 12:08:56', 6, 37, 2, 274, 4);
INSERT INTO `t_order_info` VALUES (38739, '2019-12-20 12:08:56', '2019-12-20 12:08:56', 1, 8, 4, 604, 4);
INSERT INTO `t_order_info` VALUES (38740, '2019-12-20 12:08:56', '2019-12-20 12:08:56', 3, 25, 2, 396, 4);
INSERT INTO `t_order_info` VALUES (38741, '2019-12-20 12:08:56', '2019-12-20 12:08:56', 2, 18, 2, 326, 4);
INSERT INTO `t_order_info` VALUES (38742, '2019-12-20 12:09:36', '2019-12-20 12:09:36', 4, 28, 4, 284, 5);
INSERT INTO `t_order_info` VALUES (38743, '2019-12-20 12:09:36', '2019-12-20 12:09:36', 2, 15, 3, 552, 7);
INSERT INTO `t_order_info` VALUES (38744, '2019-12-20 12:09:38', '2019-12-20 12:09:38', 6, 37, 2, 26, 4);
INSERT INTO `t_order_info` VALUES (38745, '2019-12-20 12:09:38', '2019-12-20 12:09:38', 1, 11, 1, 87, 4);
INSERT INTO `t_order_info` VALUES (38746, '2019-12-20 12:09:38', '2019-12-20 12:09:38', 2, 15, 2, 202, 9);
INSERT INTO `t_order_info` VALUES (38747, '2019-12-20 12:09:46', '2019-12-20 12:09:46', 4, 28, 4, 96, 4);
INSERT INTO `t_order_info` VALUES (38748, '2019-12-20 12:09:46', '2019-12-20 12:09:46', 5, 34, 3, 468, 4);
INSERT INTO `t_order_info` VALUES (38749, '2019-12-20 12:10:18', '2019-12-20 12:10:18', 2, 16, 1, 60, 5);
INSERT INTO `t_order_info` VALUES (38750, '2019-12-20 12:10:18', '2019-12-20 12:10:18', 4, 30, 1, 47, 11);
INSERT INTO `t_order_info` VALUES (38751, '2019-12-20 12:10:18', '2019-12-20 12:10:18', 5, 34, 4, 120, 11);
INSERT INTO `t_order_info` VALUES (38752, '2019-12-20 12:10:24', '2019-12-20 12:10:24', 1, 10, 4, 396, 5);
INSERT INTO `t_order_info` VALUES (38753, '2019-12-20 12:10:24', '2019-12-20 12:10:24', 5, 34, 4, 588, 5);
INSERT INTO `t_order_info` VALUES (38754, '2019-12-20 12:10:40', '2019-12-20 12:10:40', 4, 27, 2, 94, 5);
INSERT INTO `t_order_info` VALUES (38755, '2019-12-20 12:10:40', '2019-12-20 12:10:40', 4, 27, 1, 191, 5);
INSERT INTO `t_order_info` VALUES (38756, '2019-12-20 12:10:40', '2019-12-20 12:10:40', 3, 19, 4, 84, 4);
INSERT INTO `t_order_info` VALUES (38757, '2019-12-20 12:10:40', '2019-12-20 12:10:40', 3, 24, 3, 183, 5);
INSERT INTO `t_order_info` VALUES (38758, '2019-12-20 12:10:44', '2019-12-20 12:10:44', 1, 13, 3, 360, 5);
INSERT INTO `t_order_info` VALUES (38759, '2019-12-20 12:10:44', '2019-12-20 12:10:44', 4, 31, 3, 462, 7);
INSERT INTO `t_order_info` VALUES (38760, '2019-12-20 12:10:44', '2019-12-20 12:10:44', 2, 15, 1, 101, 4);
INSERT INTO `t_order_info` VALUES (38761, '2019-12-20 12:10:44', '2019-12-20 12:10:44', 5, 36, 2, 130, 4);
INSERT INTO `t_order_info` VALUES (38762, '2019-12-20 12:10:50', '2019-12-20 12:10:50', 5, 35, 1, 194, 9);
INSERT INTO `t_order_info` VALUES (38763, '2019-12-20 12:10:50', '2019-12-20 12:10:50', 2, 16, 4, 308, 9);
INSERT INTO `t_order_info` VALUES (38764, '2019-12-20 12:10:50', '2019-12-20 12:10:50', 7, 38, 4, 620, 9);
INSERT INTO `t_order_info` VALUES (38765, '2019-12-20 12:10:52', '2019-12-20 12:10:52', 3, 23, 3, 87, 11);
INSERT INTO `t_order_info` VALUES (38766, '2019-12-20 12:11:18', '2019-12-20 12:11:18', 2, 18, 4, 52, 4);
INSERT INTO `t_order_info` VALUES (38767, '2019-12-20 12:11:18', '2019-12-20 12:11:18', 4, 30, 1, 68, 9);
INSERT INTO `t_order_info` VALUES (38768, '2019-12-20 12:12:32', '2019-12-20 12:12:32', 3, 24, 3, 39, 4);
INSERT INTO `t_order_info` VALUES (38769, '2019-12-20 12:13:38', '2019-12-20 12:13:38', 2, 16, 4, 768, 8);
INSERT INTO `t_order_info` VALUES (38770, '2019-12-20 12:13:38', '2019-12-20 12:13:38', 3, 20, 4, 436, 5);
INSERT INTO `t_order_info` VALUES (38771, '2019-12-20 12:14:26', '2019-12-20 12:14:26', 3, 19, 3, 243, 11);
INSERT INTO `t_order_info` VALUES (38772, '2019-12-20 12:14:34', '2019-12-20 12:14:34', 1, 10, 4, 160, 6);
INSERT INTO `t_order_info` VALUES (38773, '2019-12-20 12:14:34', '2019-12-20 12:14:34', 2, 16, 4, 332, 6);
INSERT INTO `t_order_info` VALUES (38774, '2019-12-20 12:14:34', '2019-12-20 12:14:34', 4, 28, 3, 570, 6);
INSERT INTO `t_order_info` VALUES (38775, '2019-12-20 12:14:50', '2019-12-20 12:14:50', 3, 22, 2, 142, 6);
INSERT INTO `t_order_info` VALUES (38776, '2019-12-20 12:14:50', '2019-12-20 12:14:50', 3, 23, 3, 147, 8);
INSERT INTO `t_order_info` VALUES (38777, '2019-12-20 12:16:14', '2019-12-20 12:16:14', 3, 19, 1, 33, 4);
INSERT INTO `t_order_info` VALUES (38778, '2019-12-20 12:16:14', '2019-12-20 12:16:14', 3, 20, 2, 344, 4);
INSERT INTO `t_order_info` VALUES (38779, '2019-12-20 12:16:14', '2019-12-20 12:16:14', 4, 33, 1, 27, 4);
INSERT INTO `t_order_info` VALUES (38780, '2019-12-20 12:16:34', '2019-12-20 12:16:34', 4, 33, 1, 154, 6);
INSERT INTO `t_order_info` VALUES (38781, '2019-12-20 12:16:34', '2019-12-20 12:16:34', 4, 28, 3, 312, 6);
INSERT INTO `t_order_info` VALUES (38782, '2019-12-20 12:16:42', '2019-12-20 12:16:42', 4, 26, 2, 28, 7);
INSERT INTO `t_order_info` VALUES (38783, '2019-12-20 12:16:46', '2019-12-20 12:16:46', 1, 11, 1, 190, 5);
INSERT INTO `t_order_info` VALUES (38784, '2019-12-20 12:16:46', '2019-12-20 12:16:46', 2, 14, 4, 140, 7);
INSERT INTO `t_order_info` VALUES (38785, '2019-12-20 12:16:46', '2019-12-20 12:16:46', 4, 26, 2, 224, 7);
INSERT INTO `t_order_info` VALUES (38786, '2019-12-20 12:18:00', '2019-12-20 12:18:00', 1, 10, 3, 144, 8);
INSERT INTO `t_order_info` VALUES (38787, '2019-12-20 12:18:00', '2019-12-20 12:18:00', 2, 17, 2, 68, 5);
INSERT INTO `t_order_info` VALUES (38788, '2019-12-20 12:18:00', '2019-12-20 12:18:00', 3, 19, 1, 175, 4);
INSERT INTO `t_order_info` VALUES (38789, '2019-12-20 12:18:00', '2019-12-20 12:18:00', 3, 25, 2, 148, 4);
INSERT INTO `t_order_info` VALUES (38790, '2019-12-20 12:18:14', '2019-12-20 12:18:14', 4, 29, 4, 416, 4);
INSERT INTO `t_order_info` VALUES (38791, '2019-12-20 12:18:14', '2019-12-20 12:18:14', 4, 26, 2, 208, 4);
INSERT INTO `t_order_info` VALUES (38792, '2019-12-20 12:18:14', '2019-12-20 12:18:14', 3, 22, 3, 381, 4);
INSERT INTO `t_order_info` VALUES (38793, '2019-12-20 12:18:34', '2019-12-20 12:18:34', 4, 27, 3, 243, 5);
INSERT INTO `t_order_info` VALUES (38794, '2019-12-20 12:18:34', '2019-12-20 12:18:34', 1, 9, 3, 189, 11);
INSERT INTO `t_order_info` VALUES (38795, '2019-12-20 12:18:46', '2019-12-20 12:18:46', 4, 27, 1, 73, 4);
INSERT INTO `t_order_info` VALUES (38796, '2019-12-20 12:18:46', '2019-12-20 12:18:46', 2, 14, 2, 94, 4);
INSERT INTO `t_order_info` VALUES (38797, '2019-12-20 12:18:56', '2019-12-20 12:18:56', 3, 20, 2, 144, 8);
INSERT INTO `t_order_info` VALUES (38798, '2019-12-20 12:18:56', '2019-12-20 12:18:56', 2, 17, 3, 534, 11);
INSERT INTO `t_order_info` VALUES (38799, '2019-12-20 12:19:54', '2019-12-20 12:19:54', 4, 31, 3, 105, 6);
INSERT INTO `t_order_info` VALUES (38800, '2019-12-20 12:19:54', '2019-12-20 12:19:54', 1, 9, 3, 477, 6);
INSERT INTO `t_order_info` VALUES (38801, '2019-12-20 12:19:54', '2019-12-20 12:19:54', 3, 20, 2, 250, 5);
INSERT INTO `t_order_info` VALUES (38802, '2019-12-20 12:19:54', '2019-12-20 12:19:54', 4, 32, 4, 656, 5);
INSERT INTO `t_order_info` VALUES (38803, '2019-12-20 12:20:00', '2019-12-20 12:20:00', 1, 8, 3, 330, 4);
INSERT INTO `t_order_info` VALUES (38804, '2019-12-20 12:20:14', '2019-12-20 12:20:14', 1, 13, 1, 73, 4);
INSERT INTO `t_order_info` VALUES (38805, '2019-12-20 12:20:14', '2019-12-20 12:20:14', 5, 36, 4, 600, 7);
INSERT INTO `t_order_info` VALUES (38806, '2019-12-20 12:20:14', '2019-12-20 12:20:14', 4, 29, 2, 386, 4);
INSERT INTO `t_order_info` VALUES (38807, '2019-12-20 12:20:14', '2019-12-20 12:20:14', 6, 37, 3, 186, 9);
INSERT INTO `t_order_info` VALUES (38808, '2019-12-20 12:20:40', '2019-12-20 12:20:40', 2, 15, 4, 264, 7);
INSERT INTO `t_order_info` VALUES (38809, '2019-12-20 12:20:40', '2019-12-20 12:20:40', 2, 14, 1, 182, 7);
INSERT INTO `t_order_info` VALUES (38810, '2019-12-20 12:20:48', '2019-12-20 12:20:48', 4, 31, 3, 447, 5);
INSERT INTO `t_order_info` VALUES (38811, '2019-12-20 12:20:56', '2019-12-20 12:20:56', 3, 25, 2, 46, 4);
INSERT INTO `t_order_info` VALUES (38812, '2019-12-20 12:20:56', '2019-12-20 12:20:56', 4, 30, 1, 196, 4);
INSERT INTO `t_order_info` VALUES (38813, '2019-12-20 12:21:50', '2019-12-20 12:21:50', 7, 38, 1, 129, 6);
INSERT INTO `t_order_info` VALUES (38814, '2019-12-20 12:21:50', '2019-12-20 12:21:50', 2, 15, 3, 255, 4);
INSERT INTO `t_order_info` VALUES (38815, '2019-12-20 12:21:50', '2019-12-20 12:21:50', 4, 31, 2, 360, 7);
INSERT INTO `t_order_info` VALUES (38816, '2019-12-20 12:22:04', '2019-12-20 12:22:04', 4, 32, 4, 328, 8);
INSERT INTO `t_order_info` VALUES (38817, '2019-12-20 12:22:04', '2019-12-20 12:22:04', 2, 14, 4, 572, 8);
INSERT INTO `t_order_info` VALUES (38818, '2019-12-20 12:22:16', '2019-12-20 12:22:16', 4, 29, 4, 248, 4);
INSERT INTO `t_order_info` VALUES (38819, '2019-12-20 12:22:16', '2019-12-20 12:22:16', 4, 33, 3, 159, 7);
INSERT INTO `t_order_info` VALUES (38820, '2019-12-20 12:22:16', '2019-12-20 12:22:16', 4, 27, 2, 238, 7);
INSERT INTO `t_order_info` VALUES (38821, '2019-12-20 12:22:16', '2019-12-20 12:22:16', 3, 21, 2, 80, 8);
INSERT INTO `t_order_info` VALUES (38822, '2019-12-20 12:22:40', '2019-12-20 12:22:40', 4, 31, 3, 546, 4);
INSERT INTO `t_order_info` VALUES (38823, '2019-12-20 12:22:40', '2019-12-20 12:22:40', 2, 16, 3, 351, 6);
INSERT INTO `t_order_info` VALUES (38824, '2019-12-20 12:22:40', '2019-12-20 12:22:40', 3, 23, 4, 628, 6);
INSERT INTO `t_order_info` VALUES (38825, '2019-12-20 12:22:52', '2019-12-20 12:22:52', 1, 12, 3, 273, 9);
INSERT INTO `t_order_info` VALUES (38826, '2019-12-20 12:22:52', '2019-12-20 12:22:52', 4, 29, 4, 144, 9);
INSERT INTO `t_order_info` VALUES (38827, '2019-12-20 12:22:52', '2019-12-20 12:22:52', 6, 37, 2, 214, 9);
INSERT INTO `t_order_info` VALUES (38828, '2019-12-20 12:24:38', '2019-12-20 12:24:38', 5, 36, 4, 184, 7);
INSERT INTO `t_order_info` VALUES (38829, '2019-12-20 12:24:56', '2019-12-20 12:24:56', 5, 35, 4, 436, 11);
INSERT INTO `t_order_info` VALUES (38830, '2019-12-20 12:24:56', '2019-12-20 12:24:56', 3, 24, 4, 212, 8);
INSERT INTO `t_order_info` VALUES (38831, '2019-12-20 12:25:18', '2019-12-20 12:25:18', 3, 23, 4, 364, 8);
INSERT INTO `t_order_info` VALUES (38832, '2019-12-20 12:25:18', '2019-12-20 12:25:18', 6, 37, 4, 40, 8);
INSERT INTO `t_order_info` VALUES (38833, '2019-12-20 12:25:18', '2019-12-20 12:25:18', 4, 26, 4, 280, 8);
INSERT INTO `t_order_info` VALUES (38834, '2019-12-20 12:25:54', '2019-12-20 12:25:54', 4, 32, 1, 158, 4);
INSERT INTO `t_order_info` VALUES (38835, '2019-12-20 12:25:54', '2019-12-20 12:25:54', 4, 29, 2, 246, 4);
INSERT INTO `t_order_info` VALUES (38836, '2019-12-20 12:25:54', '2019-12-20 12:25:54', 5, 36, 1, 174, 4);
INSERT INTO `t_order_info` VALUES (38837, '2019-12-20 12:26:08', '2019-12-20 12:26:08', 2, 16, 1, 12, 7);
INSERT INTO `t_order_info` VALUES (38838, '2019-12-20 12:26:08', '2019-12-20 12:26:08', 2, 16, 4, 320, 5);
INSERT INTO `t_order_info` VALUES (38839, '2019-12-20 12:26:14', '2019-12-20 12:26:14', 2, 16, 1, 149, 4);
INSERT INTO `t_order_info` VALUES (38840, '2019-12-20 12:27:38', '2019-12-20 12:27:38', 4, 26, 4, 344, 4);
INSERT INTO `t_order_info` VALUES (38841, '2019-12-20 12:27:38', '2019-12-20 12:27:38', 2, 18, 3, 336, 11);
INSERT INTO `t_order_info` VALUES (38842, '2019-12-20 12:27:38', '2019-12-20 12:27:38', 5, 34, 3, 504, 4);
INSERT INTO `t_order_info` VALUES (38843, '2019-12-20 12:27:38', '2019-12-20 12:27:38', 7, 38, 1, 130, 4);
INSERT INTO `t_order_info` VALUES (38844, '2019-12-20 12:27:54', '2019-12-20 12:27:54', 5, 35, 2, 230, 4);
INSERT INTO `t_order_info` VALUES (38845, '2019-12-20 12:27:54', '2019-12-20 12:27:54', 5, 36, 4, 744, 9);
INSERT INTO `t_order_info` VALUES (38846, '2019-12-20 12:27:54', '2019-12-20 12:27:54', 1, 12, 3, 387, 9);
INSERT INTO `t_order_info` VALUES (38847, '2019-12-20 12:27:54', '2019-12-20 12:27:54', 2, 17, 4, 288, 4);
INSERT INTO `t_order_info` VALUES (38848, '2019-12-20 12:28:00', '2019-12-20 12:28:00', 3, 24, 3, 591, 7);
INSERT INTO `t_order_info` VALUES (38849, '2019-12-20 12:28:00', '2019-12-20 12:28:00', 4, 30, 2, 106, 5);
INSERT INTO `t_order_info` VALUES (38850, '2019-12-20 12:28:00', '2019-12-20 12:28:00', 4, 33, 3, 315, 5);
INSERT INTO `t_order_info` VALUES (38851, '2019-12-20 12:28:02', '2019-12-20 12:28:02', 3, 24, 4, 372, 8);
INSERT INTO `t_order_info` VALUES (38852, '2019-12-20 12:28:02', '2019-12-20 12:28:02', 1, 8, 3, 558, 4);
INSERT INTO `t_order_info` VALUES (38853, '2019-12-20 12:28:22', '2019-12-20 12:28:22', 1, 10, 4, 244, 4);
INSERT INTO `t_order_info` VALUES (38854, '2019-12-20 12:28:22', '2019-12-20 12:28:22', 2, 17, 4, 336, 4);
INSERT INTO `t_order_info` VALUES (38855, '2019-12-20 12:28:22', '2019-12-20 12:28:22', 1, 8, 2, 320, 5);
INSERT INTO `t_order_info` VALUES (38856, '2019-12-20 12:28:22', '2019-12-20 12:28:22', 5, 35, 1, 15, 5);
INSERT INTO `t_order_info` VALUES (38857, '2019-12-20 12:28:54', '2019-12-20 12:28:54', 2, 18, 4, 644, 4);
INSERT INTO `t_order_info` VALUES (38858, '2019-12-20 12:28:54', '2019-12-20 12:28:54', 1, 9, 4, 592, 4);
INSERT INTO `t_order_info` VALUES (38859, '2019-12-20 12:28:54', '2019-12-20 12:28:54', 4, 33, 3, 384, 7);
INSERT INTO `t_order_info` VALUES (38860, '2019-12-20 12:28:54', '2019-12-20 12:28:54', 4, 33, 3, 183, 7);
INSERT INTO `t_order_info` VALUES (38861, '2019-12-20 12:29:10', '2019-12-20 12:29:10', 1, 9, 3, 528, 5);
INSERT INTO `t_order_info` VALUES (38862, '2019-12-20 12:29:10', '2019-12-20 12:29:10', 4, 32, 3, 72, 7);
INSERT INTO `t_order_info` VALUES (38863, '2019-12-20 12:29:10', '2019-12-20 12:29:10', 4, 27, 2, 58, 8);
INSERT INTO `t_order_info` VALUES (38864, '2019-12-20 12:29:22', '2019-12-20 12:29:22', 2, 16, 2, 100, 4);
INSERT INTO `t_order_info` VALUES (38865, '2019-12-20 12:29:56', '2019-12-20 12:29:56', 5, 34, 2, 230, 5);
INSERT INTO `t_order_info` VALUES (38866, '2019-12-20 12:29:56', '2019-12-20 12:29:56', 4, 33, 2, 334, 5);
INSERT INTO `t_order_info` VALUES (38867, '2019-12-20 12:30:48', '2019-12-20 12:30:48', 3, 24, 3, 378, 4);
INSERT INTO `t_order_info` VALUES (38868, '2019-12-20 12:30:48', '2019-12-20 12:30:48', 2, 17, 3, 150, 4);
INSERT INTO `t_order_info` VALUES (38869, '2019-12-20 12:30:48', '2019-12-20 12:30:48', 4, 31, 3, 186, 5);
INSERT INTO `t_order_info` VALUES (38870, '2019-12-20 12:31:14', '2019-12-20 12:31:14', 3, 23, 2, 302, 7);
INSERT INTO `t_order_info` VALUES (38871, '2019-12-20 12:31:14', '2019-12-20 12:31:14', 1, 9, 3, 585, 9);
INSERT INTO `t_order_info` VALUES (38872, '2019-12-20 12:31:14', '2019-12-20 12:31:14', 4, 28, 2, 78, 11);
INSERT INTO `t_order_info` VALUES (38873, '2019-12-20 12:31:20', '2019-12-20 12:31:20', 3, 23, 2, 320, 5);
INSERT INTO `t_order_info` VALUES (38874, '2019-12-20 12:31:20', '2019-12-20 12:31:20', 3, 25, 1, 83, 5);
INSERT INTO `t_order_info` VALUES (38875, '2019-12-20 12:31:20', '2019-12-20 12:31:20', 3, 23, 2, 366, 8);
INSERT INTO `t_order_info` VALUES (38876, '2019-12-20 12:31:20', '2019-12-20 12:31:20', 4, 26, 3, 495, 5);
INSERT INTO `t_order_info` VALUES (38877, '2019-12-20 12:31:26', '2019-12-20 12:31:26', 1, 9, 4, 308, 10);
INSERT INTO `t_order_info` VALUES (38878, '2019-12-20 12:31:26', '2019-12-20 12:31:26', 2, 15, 3, 468, 8);
INSERT INTO `t_order_info` VALUES (38879, '2019-12-20 12:31:26', '2019-12-20 12:31:26', 4, 26, 4, 48, 8);
INSERT INTO `t_order_info` VALUES (38880, '2019-12-20 12:32:04', '2019-12-20 12:32:04', 1, 8, 4, 320, 5);
INSERT INTO `t_order_info` VALUES (38881, '2019-12-20 12:32:04', '2019-12-20 12:32:04', 2, 17, 1, 93, 5);
INSERT INTO `t_order_info` VALUES (38882, '2019-12-20 12:32:04', '2019-12-20 12:32:04', 4, 33, 4, 432, 4);
INSERT INTO `t_order_info` VALUES (38883, '2019-12-20 12:32:36', '2019-12-20 12:32:36', 3, 20, 1, 30, 5);
INSERT INTO `t_order_info` VALUES (38884, '2019-12-20 12:32:36', '2019-12-20 12:32:36', 4, 28, 4, 504, 6);
INSERT INTO `t_order_info` VALUES (38885, '2019-12-20 12:32:36', '2019-12-20 12:32:36', 1, 10, 3, 582, 5);
INSERT INTO `t_order_info` VALUES (38886, '2019-12-20 12:32:40', '2019-12-20 12:32:40', 3, 24, 4, 736, 7);
INSERT INTO `t_order_info` VALUES (38887, '2019-12-20 12:32:40', '2019-12-20 12:32:40', 7, 38, 4, 408, 7);
INSERT INTO `t_order_info` VALUES (38888, '2019-12-20 12:32:56', '2019-12-20 12:32:56', 4, 33, 3, 183, 5);
INSERT INTO `t_order_info` VALUES (38889, '2019-12-20 12:33:28', '2019-12-20 12:33:28', 1, 13, 4, 264, 4);
INSERT INTO `t_order_info` VALUES (38890, '2019-12-20 12:33:28', '2019-12-20 12:33:28', 5, 34, 3, 207, 4);
INSERT INTO `t_order_info` VALUES (38891, '2019-12-20 12:33:28', '2019-12-20 12:33:28', 4, 30, 2, 316, 4);
INSERT INTO `t_order_info` VALUES (38892, '2019-12-20 12:33:56', '2019-12-20 12:33:56', 2, 15, 1, 152, 4);
INSERT INTO `t_order_info` VALUES (38893, '2019-12-20 12:33:56', '2019-12-20 12:33:56', 4, 32, 3, 102, 8);
INSERT INTO `t_order_info` VALUES (38894, '2019-12-20 12:33:56', '2019-12-20 12:33:56', 2, 14, 1, 87, 8);
INSERT INTO `t_order_info` VALUES (38895, '2019-12-20 12:34:10', '2019-12-20 12:34:10', 6, 37, 1, 85, 8);
INSERT INTO `t_order_info` VALUES (38896, '2019-12-20 12:34:32', '2019-12-20 12:34:32', 4, 26, 2, 260, 7);
INSERT INTO `t_order_info` VALUES (38897, '2019-12-20 12:34:32', '2019-12-20 12:34:32', 7, 38, 1, 26, 7);
INSERT INTO `t_order_info` VALUES (38898, '2019-12-20 12:34:46', '2019-12-20 12:34:46', 1, 8, 4, 596, 5);
INSERT INTO `t_order_info` VALUES (38899, '2019-12-20 12:35:08', '2019-12-20 12:35:08', 5, 34, 3, 273, 6);
INSERT INTO `t_order_info` VALUES (38900, '2019-12-20 12:35:08', '2019-12-20 12:35:08', 1, 8, 4, 116, 6);
INSERT INTO `t_order_info` VALUES (38901, '2019-12-20 12:35:08', '2019-12-20 12:35:08', 4, 30, 3, 150, 4);
INSERT INTO `t_order_info` VALUES (38902, '2019-12-20 12:35:08', '2019-12-20 12:35:08', 2, 16, 3, 297, 4);
INSERT INTO `t_order_info` VALUES (38903, '2019-12-20 12:35:24', '2019-12-20 12:35:24', 2, 18, 1, 138, 4);
INSERT INTO `t_order_info` VALUES (38904, '2019-12-20 12:36:32', '2019-12-20 12:36:32', 4, 32, 3, 477, 6);
INSERT INTO `t_order_info` VALUES (38905, '2019-12-20 12:36:32', '2019-12-20 12:36:32', 1, 12, 2, 106, 5);
INSERT INTO `t_order_info` VALUES (38906, '2019-12-20 12:36:32', '2019-12-20 12:36:32', 2, 17, 3, 108, 5);
INSERT INTO `t_order_info` VALUES (38907, '2019-12-20 12:36:52', '2019-12-20 12:36:52', 2, 17, 4, 116, 7);
INSERT INTO `t_order_info` VALUES (38908, '2019-12-20 12:36:52', '2019-12-20 12:36:52', 1, 12, 1, 133, 4);
INSERT INTO `t_order_info` VALUES (38909, '2019-12-20 12:36:52', '2019-12-20 12:36:52', 5, 34, 3, 516, 8);
INSERT INTO `t_order_info` VALUES (38910, '2019-12-20 12:36:52', '2019-12-20 12:36:52', 1, 9, 4, 184, 4);
INSERT INTO `t_order_info` VALUES (38911, '2019-12-20 12:37:22', '2019-12-20 12:37:22', 1, 13, 1, 37, 4);
INSERT INTO `t_order_info` VALUES (38912, '2019-12-20 12:37:22', '2019-12-20 12:37:22', 3, 25, 4, 452, 7);
INSERT INTO `t_order_info` VALUES (38913, '2019-12-20 12:37:36', '2019-12-20 12:37:36', 5, 35, 2, 50, 11);
INSERT INTO `t_order_info` VALUES (38914, '2019-12-20 12:37:36', '2019-12-20 12:37:36', 1, 12, 4, 304, 6);
INSERT INTO `t_order_info` VALUES (38915, '2019-12-20 12:37:36', '2019-12-20 12:37:36', 5, 35, 3, 138, 6);
INSERT INTO `t_order_info` VALUES (38916, '2019-12-20 12:38:00', '2019-12-20 12:38:00', 1, 12, 1, 23, 5);
INSERT INTO `t_order_info` VALUES (38917, '2019-12-20 12:38:00', '2019-12-20 12:38:00', 1, 9, 4, 108, 4);
INSERT INTO `t_order_info` VALUES (38918, '2019-12-20 12:38:00', '2019-12-20 12:38:00', 1, 13, 2, 26, 9);
INSERT INTO `t_order_info` VALUES (38919, '2019-12-20 12:38:00', '2019-12-20 12:38:00', 2, 16, 3, 153, 4);
INSERT INTO `t_order_info` VALUES (38920, '2019-12-20 12:38:02', '2019-12-20 12:38:02', 3, 24, 1, 197, 4);
INSERT INTO `t_order_info` VALUES (38921, '2019-12-20 12:38:02', '2019-12-20 12:38:02', 2, 17, 2, 302, 4);
INSERT INTO `t_order_info` VALUES (38922, '2019-12-20 12:38:08', '2019-12-20 12:38:08', 4, 32, 1, 50, 7);
INSERT INTO `t_order_info` VALUES (38923, '2019-12-20 12:38:08', '2019-12-20 12:38:08', 4, 26, 2, 122, 4);
INSERT INTO `t_order_info` VALUES (38924, '2019-12-20 12:38:32', '2019-12-20 12:38:32', 4, 32, 2, 376, 8);
INSERT INTO `t_order_info` VALUES (38925, '2019-12-20 12:38:56', '2019-12-20 12:38:56', 3, 22, 2, 146, 7);
INSERT INTO `t_order_info` VALUES (38926, '2019-12-20 12:38:56', '2019-12-20 12:38:56', 1, 8, 3, 183, 9);
INSERT INTO `t_order_info` VALUES (38927, '2019-12-20 12:38:56', '2019-12-20 12:38:56', 5, 34, 2, 316, 9);
INSERT INTO `t_order_info` VALUES (38928, '2019-12-20 12:39:04', '2019-12-20 12:39:04', 4, 27, 4, 332, 11);
INSERT INTO `t_order_info` VALUES (38929, '2019-12-20 12:39:04', '2019-12-20 12:39:04', 3, 23, 3, 582, 4);
INSERT INTO `t_order_info` VALUES (38930, '2019-12-20 12:39:08', '2019-12-20 12:39:08', 2, 16, 2, 188, 7);
INSERT INTO `t_order_info` VALUES (38931, '2019-12-20 12:39:08', '2019-12-20 12:39:08', 4, 33, 2, 238, 8);
INSERT INTO `t_order_info` VALUES (38932, '2019-12-20 12:39:08', '2019-12-20 12:39:08', 1, 10, 4, 332, 7);
INSERT INTO `t_order_info` VALUES (38933, '2019-12-20 12:39:08', '2019-12-20 12:39:08', 2, 15, 4, 772, 8);
INSERT INTO `t_order_info` VALUES (38934, '2019-12-20 12:39:20', '2019-12-20 12:39:20', 3, 21, 1, 42, 5);
INSERT INTO `t_order_info` VALUES (38935, '2019-12-20 12:39:28', '2019-12-20 12:39:28', 4, 33, 3, 183, 4);
INSERT INTO `t_order_info` VALUES (38936, '2019-12-20 12:40:54', '2019-12-20 12:40:54', 5, 35, 1, 74, 8);
INSERT INTO `t_order_info` VALUES (38937, '2019-12-20 12:40:54', '2019-12-20 12:40:54', 1, 10, 1, 145, 8);
INSERT INTO `t_order_info` VALUES (38938, '2019-12-20 12:40:54', '2019-12-20 12:40:54', 4, 28, 2, 322, 8);
INSERT INTO `t_order_info` VALUES (38939, '2019-12-20 12:41:16', '2019-12-20 12:41:16', 3, 25, 1, 28, 4);
INSERT INTO `t_order_info` VALUES (38940, '2019-12-20 12:41:16', '2019-12-20 12:41:16', 3, 19, 4, 192, 11);
INSERT INTO `t_order_info` VALUES (38941, '2019-12-20 12:41:16', '2019-12-20 12:41:16', 4, 26, 1, 154, 11);
INSERT INTO `t_order_info` VALUES (38942, '2019-12-20 12:41:42', '2019-12-20 12:41:42', 3, 23, 1, 47, 7);
INSERT INTO `t_order_info` VALUES (38943, '2019-12-20 12:41:42', '2019-12-20 12:41:42', 4, 26, 1, 104, 5);
INSERT INTO `t_order_info` VALUES (38944, '2019-12-20 12:41:42', '2019-12-20 12:41:42', 3, 23, 1, 185, 7);
INSERT INTO `t_order_info` VALUES (38945, '2019-12-20 12:41:50', '2019-12-20 12:41:50', 2, 16, 4, 404, 4);
INSERT INTO `t_order_info` VALUES (38946, '2019-12-20 12:41:50', '2019-12-20 12:41:50', 7, 38, 2, 112, 4);
INSERT INTO `t_order_info` VALUES (38947, '2019-12-20 12:41:50', '2019-12-20 12:41:50', 1, 11, 3, 63, 4);
INSERT INTO `t_order_info` VALUES (38948, '2019-12-20 12:41:54', '2019-12-20 12:41:54', 4, 28, 4, 568, 8);
INSERT INTO `t_order_info` VALUES (38949, '2019-12-20 12:42:10', '2019-12-20 12:42:10', 2, 17, 4, 620, 5);
INSERT INTO `t_order_info` VALUES (38950, '2019-12-20 12:42:10', '2019-12-20 12:42:10', 1, 11, 3, 57, 8);
INSERT INTO `t_order_info` VALUES (38951, '2019-12-20 12:42:10', '2019-12-20 12:42:10', 1, 11, 1, 133, 8);
INSERT INTO `t_order_info` VALUES (38952, '2019-12-20 12:42:14', '2019-12-20 12:42:14', 5, 35, 2, 64, 5);
INSERT INTO `t_order_info` VALUES (38953, '2019-12-20 12:42:14', '2019-12-20 12:42:14', 1, 11, 1, 157, 5);
INSERT INTO `t_order_info` VALUES (38954, '2019-12-20 12:42:30', '2019-12-20 12:42:30', 4, 26, 2, 162, 4);
INSERT INTO `t_order_info` VALUES (38955, '2019-12-20 12:42:38', '2019-12-20 12:42:38', 4, 31, 3, 330, 4);
INSERT INTO `t_order_info` VALUES (38956, '2019-12-20 12:42:38', '2019-12-20 12:42:38', 3, 23, 1, 64, 4);
INSERT INTO `t_order_info` VALUES (38957, '2019-12-20 12:42:38', '2019-12-20 12:42:38', 1, 8, 3, 282, 4);
INSERT INTO `t_order_info` VALUES (38958, '2019-12-20 12:42:38', '2019-12-20 12:42:38', 3, 23, 4, 772, 6);
INSERT INTO `t_order_info` VALUES (38959, '2019-12-20 12:42:56', '2019-12-20 12:42:56', 1, 10, 2, 364, 4);
INSERT INTO `t_order_info` VALUES (38960, '2019-12-20 12:43:34', '2019-12-20 12:43:34', 2, 16, 3, 141, 4);
INSERT INTO `t_order_info` VALUES (38961, '2019-12-20 12:43:34', '2019-12-20 12:43:34', 1, 12, 1, 38, 4);
INSERT INTO `t_order_info` VALUES (38962, '2019-12-20 12:43:34', '2019-12-20 12:43:34', 1, 13, 3, 531, 4);
INSERT INTO `t_order_info` VALUES (38963, '2019-12-20 12:44:34', '2019-12-20 12:44:34', 7, 38, 4, 728, 4);
INSERT INTO `t_order_info` VALUES (38964, '2019-12-20 12:44:34', '2019-12-20 12:44:34', 1, 10, 2, 280, 7);
INSERT INTO `t_order_info` VALUES (38965, '2019-12-20 12:44:34', '2019-12-20 12:44:34', 1, 9, 2, 162, 4);
INSERT INTO `t_order_info` VALUES (38966, '2019-12-20 12:44:34', '2019-12-20 12:44:34', 7, 38, 4, 500, 4);
INSERT INTO `t_order_info` VALUES (38967, '2019-12-20 12:45:04', '2019-12-20 12:45:04', 2, 15, 2, 72, 7);
INSERT INTO `t_order_info` VALUES (38968, '2019-12-20 12:45:04', '2019-12-20 12:45:04', 1, 12, 4, 600, 7);
INSERT INTO `t_order_info` VALUES (38969, '2019-12-20 12:46:40', '2019-12-20 12:46:40', 4, 30, 2, 282, 5);
INSERT INTO `t_order_info` VALUES (38970, '2019-12-20 12:47:10', '2019-12-20 12:47:10', 4, 27, 2, 250, 11);
INSERT INTO `t_order_info` VALUES (38971, '2019-12-20 12:47:10', '2019-12-20 12:47:10', 2, 14, 4, 408, 5);
INSERT INTO `t_order_info` VALUES (38972, '2019-12-20 12:47:10', '2019-12-20 12:47:10', 5, 34, 4, 152, 5);
INSERT INTO `t_order_info` VALUES (38973, '2019-12-20 12:47:10', '2019-12-20 12:47:10', 2, 15, 1, 148, 4);
INSERT INTO `t_order_info` VALUES (38974, '2019-12-20 12:47:18', '2019-12-20 12:47:18', 3, 23, 3, 330, 4);
INSERT INTO `t_order_info` VALUES (38975, '2019-12-20 12:47:18', '2019-12-20 12:47:18', 4, 31, 2, 22, 4);
INSERT INTO `t_order_info` VALUES (38976, '2019-12-20 12:47:18', '2019-12-20 12:47:18', 4, 28, 4, 704, 4);
INSERT INTO `t_order_info` VALUES (38977, '2019-12-20 12:47:28', '2019-12-20 12:47:28', 2, 16, 1, 75, 9);
INSERT INTO `t_order_info` VALUES (38978, '2019-12-20 12:47:44', '2019-12-20 12:47:44', 3, 19, 2, 296, 9);
INSERT INTO `t_order_info` VALUES (38979, '2019-12-20 12:48:00', '2019-12-20 12:48:00', 6, 37, 1, 48, 8);
INSERT INTO `t_order_info` VALUES (38980, '2019-12-20 12:48:00', '2019-12-20 12:48:00', 1, 9, 3, 408, 4);
INSERT INTO `t_order_info` VALUES (38981, '2019-12-20 12:48:12', '2019-12-20 12:48:12', 4, 32, 3, 183, 4);
INSERT INTO `t_order_info` VALUES (38982, '2019-12-20 12:48:12', '2019-12-20 12:48:12', 2, 16, 1, 162, 4);
INSERT INTO `t_order_info` VALUES (38983, '2019-12-20 12:48:12', '2019-12-20 12:48:12', 2, 18, 4, 428, 4);
INSERT INTO `t_order_info` VALUES (38984, '2019-12-20 12:48:16', '2019-12-20 12:48:16', 2, 18, 2, 22, 4);
INSERT INTO `t_order_info` VALUES (38985, '2019-12-20 12:48:44', '2019-12-20 12:48:44', 4, 30, 2, 210, 9);
INSERT INTO `t_order_info` VALUES (38986, '2019-12-20 12:48:44', '2019-12-20 12:48:44', 3, 22, 3, 54, 5);
INSERT INTO `t_order_info` VALUES (38987, '2019-12-20 12:48:44', '2019-12-20 12:48:44', 1, 8, 4, 684, 9);
INSERT INTO `t_order_info` VALUES (38988, '2019-12-20 12:48:44', '2019-12-20 12:48:44', 1, 9, 3, 111, 6);
INSERT INTO `t_order_info` VALUES (38989, '2019-12-20 12:48:56', '2019-12-20 12:48:56', 4, 27, 1, 186, 5);
INSERT INTO `t_order_info` VALUES (38990, '2019-12-20 12:48:56', '2019-12-20 12:48:56', 4, 33, 1, 168, 5);
INSERT INTO `t_order_info` VALUES (38991, '2019-12-20 12:48:56', '2019-12-20 12:48:56', 2, 15, 4, 624, 5);
INSERT INTO `t_order_info` VALUES (38992, '2019-12-20 12:49:28', '2019-12-20 12:49:28', 1, 13, 2, 278, 7);
INSERT INTO `t_order_info` VALUES (38993, '2019-12-20 12:49:28', '2019-12-20 12:49:28', 1, 9, 4, 256, 7);
INSERT INTO `t_order_info` VALUES (38994, '2019-12-20 12:49:52', '2019-12-20 12:49:52', 1, 10, 1, 63, 8);
INSERT INTO `t_order_info` VALUES (38995, '2019-12-20 12:49:52', '2019-12-20 12:49:52', 5, 35, 2, 190, 8);
INSERT INTO `t_order_info` VALUES (38996, '2019-12-20 12:49:52', '2019-12-20 12:49:52', 5, 36, 1, 113, 8);
INSERT INTO `t_order_info` VALUES (38997, '2019-12-20 12:50:00', '2019-12-20 12:50:00', 2, 16, 4, 636, 4);
INSERT INTO `t_order_info` VALUES (38998, '2019-12-20 12:50:00', '2019-12-20 12:50:00', 1, 8, 2, 24, 4);
INSERT INTO `t_order_info` VALUES (38999, '2019-12-20 12:50:00', '2019-12-20 12:50:00', 3, 23, 3, 333, 4);
INSERT INTO `t_order_info` VALUES (39000, '2019-12-20 12:50:00', '2019-12-20 12:50:00', 1, 10, 2, 26, 4);
INSERT INTO `t_order_info` VALUES (39001, '2019-12-20 12:50:18', '2019-12-20 12:50:18', 2, 18, 3, 576, 5);
INSERT INTO `t_order_info` VALUES (39002, '2019-12-20 12:50:18', '2019-12-20 12:50:18', 4, 29, 4, 472, 6);
INSERT INTO `t_order_info` VALUES (39003, '2019-12-20 12:50:18', '2019-12-20 12:50:18', 1, 13, 2, 208, 4);
INSERT INTO `t_order_info` VALUES (39004, '2019-12-20 12:50:26', '2019-12-20 12:50:26', 4, 32, 4, 224, 8);
INSERT INTO `t_order_info` VALUES (39005, '2019-12-20 12:50:40', '2019-12-20 12:50:40', 4, 26, 4, 352, 5);
INSERT INTO `t_order_info` VALUES (39006, '2019-12-20 12:50:40', '2019-12-20 12:50:40', 3, 22, 1, 117, 5);
INSERT INTO `t_order_info` VALUES (39007, '2019-12-20 12:50:40', '2019-12-20 12:50:40', 4, 27, 4, 556, 6);
INSERT INTO `t_order_info` VALUES (39008, '2019-12-20 12:50:44', '2019-12-20 12:50:44', 2, 15, 2, 290, 11);
INSERT INTO `t_order_info` VALUES (39009, '2019-12-20 12:50:44', '2019-12-20 12:50:44', 3, 23, 1, 124, 11);
INSERT INTO `t_order_info` VALUES (39010, '2019-12-20 12:51:50', '2019-12-20 12:51:50', 3, 25, 1, 152, 6);
INSERT INTO `t_order_info` VALUES (39011, '2019-12-20 12:52:00', '2019-12-20 12:52:00', 2, 16, 1, 89, 9);
INSERT INTO `t_order_info` VALUES (39012, '2019-12-20 12:52:00', '2019-12-20 12:52:00', 3, 23, 1, 46, 9);
INSERT INTO `t_order_info` VALUES (39013, '2019-12-20 12:52:44', '2019-12-20 12:52:44', 4, 27, 2, 294, 4);
INSERT INTO `t_order_info` VALUES (39014, '2019-12-20 12:52:48', '2019-12-20 12:52:48', 3, 21, 4, 84, 5);
INSERT INTO `t_order_info` VALUES (39015, '2019-12-20 12:52:48', '2019-12-20 12:52:48', 1, 8, 4, 400, 8);
INSERT INTO `t_order_info` VALUES (39016, '2019-12-20 12:52:48', '2019-12-20 12:52:48', 3, 24, 2, 38, 8);
INSERT INTO `t_order_info` VALUES (39017, '2019-12-20 12:52:48', '2019-12-20 12:52:48', 1, 9, 4, 604, 8);
INSERT INTO `t_order_info` VALUES (39018, '2019-12-20 12:53:14', '2019-12-20 12:53:14', 6, 37, 4, 756, 6);
INSERT INTO `t_order_info` VALUES (39019, '2019-12-20 12:53:30', '2019-12-20 12:53:30', 1, 12, 2, 66, 4);
INSERT INTO `t_order_info` VALUES (39020, '2019-12-20 12:53:30', '2019-12-20 12:53:30', 5, 35, 1, 23, 4);
INSERT INTO `t_order_info` VALUES (39021, '2019-12-20 12:53:30', '2019-12-20 12:53:30', 2, 18, 1, 67, 4);
INSERT INTO `t_order_info` VALUES (39022, '2019-12-20 12:54:10', '2019-12-20 12:54:10', 3, 23, 1, 193, 4);
INSERT INTO `t_order_info` VALUES (39023, '2019-12-20 12:54:10', '2019-12-20 12:54:10', 2, 16, 2, 146, 5);
INSERT INTO `t_order_info` VALUES (39024, '2019-12-20 12:54:10', '2019-12-20 12:54:10', 2, 17, 3, 357, 4);
INSERT INTO `t_order_info` VALUES (39025, '2019-12-20 12:54:10', '2019-12-20 12:54:10', 3, 21, 4, 108, 6);
INSERT INTO `t_order_info` VALUES (39026, '2019-12-20 12:54:12', '2019-12-20 12:54:12', 2, 16, 4, 148, 5);
INSERT INTO `t_order_info` VALUES (39027, '2019-12-20 12:54:12', '2019-12-20 12:54:12', 2, 16, 4, 344, 8);
INSERT INTO `t_order_info` VALUES (39028, '2019-12-20 12:54:12', '2019-12-20 12:54:12', 5, 34, 1, 25, 4);
INSERT INTO `t_order_info` VALUES (39029, '2019-12-20 12:54:12', '2019-12-20 12:54:12', 4, 32, 2, 182, 5);
INSERT INTO `t_order_info` VALUES (39030, '2019-12-20 12:54:46', '2019-12-20 12:54:46', 3, 20, 4, 444, 5);
INSERT INTO `t_order_info` VALUES (39031, '2019-12-20 12:55:06', '2019-12-20 12:55:06', 4, 28, 2, 392, 4);
INSERT INTO `t_order_info` VALUES (39032, '2019-12-20 12:55:16', '2019-12-20 12:55:16', 2, 16, 3, 282, 4);
INSERT INTO `t_order_info` VALUES (39033, '2019-12-20 12:55:16', '2019-12-20 12:55:16', 3, 20, 2, 186, 7);
INSERT INTO `t_order_info` VALUES (39034, '2019-12-20 12:55:16', '2019-12-20 12:55:16', 3, 21, 4, 700, 7);
INSERT INTO `t_order_info` VALUES (39035, '2019-12-20 12:55:38', '2019-12-20 12:55:38', 4, 31, 1, 114, 8);
INSERT INTO `t_order_info` VALUES (39036, '2019-12-20 12:55:38', '2019-12-20 12:55:38', 7, 38, 1, 126, 6);
INSERT INTO `t_order_info` VALUES (39037, '2019-12-20 12:55:52', '2019-12-20 12:55:52', 4, 33, 3, 102, 9);
INSERT INTO `t_order_info` VALUES (39038, '2019-12-20 12:55:54', '2019-12-20 12:55:54', 3, 19, 3, 159, 8);
INSERT INTO `t_order_info` VALUES (39039, '2019-12-20 12:55:54', '2019-12-20 12:55:54', 2, 16, 3, 303, 8);
INSERT INTO `t_order_info` VALUES (39040, '2019-12-20 12:55:54', '2019-12-20 12:55:54', 3, 22, 2, 282, 8);
INSERT INTO `t_order_info` VALUES (39041, '2019-12-20 12:56:08', '2019-12-20 12:56:08', 4, 26, 3, 246, 5);
INSERT INTO `t_order_info` VALUES (39042, '2019-12-20 12:56:42', '2019-12-20 12:56:42', 5, 36, 3, 561, 4);
INSERT INTO `t_order_info` VALUES (39043, '2019-12-20 12:56:42', '2019-12-20 12:56:42', 4, 30, 3, 168, 7);
INSERT INTO `t_order_info` VALUES (39044, '2019-12-20 12:56:42', '2019-12-20 12:56:42', 1, 13, 1, 45, 8);
INSERT INTO `t_order_info` VALUES (39045, '2019-12-20 12:56:42', '2019-12-20 12:56:42', 1, 11, 1, 34, 4);
INSERT INTO `t_order_info` VALUES (39046, '2019-12-20 12:56:50', '2019-12-20 12:56:50', 1, 8, 2, 122, 6);
INSERT INTO `t_order_info` VALUES (39047, '2019-12-20 12:56:50', '2019-12-20 12:56:50', 2, 14, 4, 572, 10);
INSERT INTO `t_order_info` VALUES (39048, '2019-12-20 12:56:50', '2019-12-20 12:56:50', 2, 16, 3, 501, 6);
INSERT INTO `t_order_info` VALUES (39049, '2019-12-20 12:56:50', '2019-12-20 12:56:50', 3, 20, 2, 294, 10);
INSERT INTO `t_order_info` VALUES (39050, '2019-12-20 12:57:00', '2019-12-20 12:57:00', 5, 34, 1, 150, 4);
INSERT INTO `t_order_info` VALUES (39051, '2019-12-20 12:57:00', '2019-12-20 12:57:00', 3, 22, 1, 101, 4);
INSERT INTO `t_order_info` VALUES (39052, '2019-12-20 12:57:00', '2019-12-20 12:57:00', 1, 8, 4, 612, 4);
INSERT INTO `t_order_info` VALUES (39053, '2019-12-20 12:57:02', '2019-12-20 12:57:02', 5, 35, 4, 96, 7);
INSERT INTO `t_order_info` VALUES (39054, '2019-12-20 12:57:02', '2019-12-20 12:57:02', 1, 12, 3, 396, 6);
INSERT INTO `t_order_info` VALUES (39055, '2019-12-20 12:57:02', '2019-12-20 12:57:02', 3, 25, 4, 740, 6);
INSERT INTO `t_order_info` VALUES (39056, '2019-12-20 12:57:28', '2019-12-20 12:57:28', 4, 29, 2, 236, 4);
INSERT INTO `t_order_info` VALUES (39057, '2019-12-20 12:57:28', '2019-12-20 12:57:28', 5, 34, 2, 292, 4);
INSERT INTO `t_order_info` VALUES (39058, '2019-12-20 12:57:28', '2019-12-20 12:57:28', 4, 31, 2, 344, 4);
INSERT INTO `t_order_info` VALUES (39059, '2019-12-20 12:58:16', '2019-12-20 12:58:16', 3, 22, 3, 66, 4);
INSERT INTO `t_order_info` VALUES (39060, '2019-12-20 12:58:16', '2019-12-20 12:58:16', 7, 38, 1, 176, 5);
INSERT INTO `t_order_info` VALUES (39061, '2019-12-20 12:58:16', '2019-12-20 12:58:16', 6, 37, 4, 344, 5);
INSERT INTO `t_order_info` VALUES (39062, '2019-12-20 12:58:16', '2019-12-20 12:58:16', 4, 27, 3, 549, 5);
INSERT INTO `t_order_info` VALUES (39063, '2019-12-20 12:58:22', '2019-12-20 12:58:22', 2, 16, 3, 222, 4);
INSERT INTO `t_order_info` VALUES (39064, '2019-12-20 12:58:22', '2019-12-20 12:58:22', 3, 22, 4, 372, 4);
INSERT INTO `t_order_info` VALUES (39065, '2019-12-20 12:58:22', '2019-12-20 12:58:22', 2, 16, 2, 26, 8);
INSERT INTO `t_order_info` VALUES (39066, '2019-12-20 12:58:22', '2019-12-20 12:58:22', 1, 13, 2, 348, 8);
INSERT INTO `t_order_info` VALUES (39067, '2019-12-20 12:58:26', '2019-12-20 12:58:26', 1, 13, 3, 249, 6);
INSERT INTO `t_order_info` VALUES (39068, '2019-12-20 12:58:42', '2019-12-20 12:58:42', 3, 22, 1, 150, 6);
INSERT INTO `t_order_info` VALUES (39069, '2019-12-20 12:58:42', '2019-12-20 12:58:42', 3, 20, 2, 348, 5);
INSERT INTO `t_order_info` VALUES (39070, '2019-12-20 12:59:46', '2019-12-20 12:59:46', 3, 25, 2, 306, 7);
INSERT INTO `t_order_info` VALUES (39071, '2019-12-20 12:59:46', '2019-12-20 12:59:46', 1, 11, 4, 540, 4);
INSERT INTO `t_order_info` VALUES (39072, '2019-12-20 12:59:46', '2019-12-20 12:59:46', 4, 31, 4, 560, 4);
INSERT INTO `t_order_info` VALUES (39073, '2019-12-20 12:59:46', '2019-12-20 12:59:46', 1, 13, 3, 105, 7);
INSERT INTO `t_order_info` VALUES (39074, '2019-12-20 13:00:48', '2019-12-20 13:00:48', 4, 33, 2, 170, 4);
INSERT INTO `t_order_info` VALUES (39075, '2019-12-20 13:00:48', '2019-12-20 13:00:48', 1, 10, 3, 438, 6);
INSERT INTO `t_order_info` VALUES (39076, '2019-12-20 13:01:14', '2019-12-20 13:01:14', 2, 17, 3, 108, 10);
INSERT INTO `t_order_info` VALUES (39077, '2019-12-20 13:01:14', '2019-12-20 13:01:14', 1, 10, 4, 312, 10);
INSERT INTO `t_order_info` VALUES (39078, '2019-12-20 13:01:14', '2019-12-20 13:01:14', 5, 36, 1, 174, 4);
INSERT INTO `t_order_info` VALUES (39079, '2019-12-20 13:01:14', '2019-12-20 13:01:14', 3, 19, 3, 420, 10);
INSERT INTO `t_order_info` VALUES (39080, '2019-12-20 13:01:20', '2019-12-20 13:01:20', 5, 36, 3, 246, 9);
INSERT INTO `t_order_info` VALUES (39081, '2019-12-20 13:02:02', '2019-12-20 13:02:02', 4, 30, 1, 48, 9);
INSERT INTO `t_order_info` VALUES (39082, '2019-12-20 13:02:02', '2019-12-20 13:02:02', 5, 35, 3, 189, 4);
INSERT INTO `t_order_info` VALUES (39083, '2019-12-20 13:02:02', '2019-12-20 13:02:02', 5, 35, 2, 64, 9);
INSERT INTO `t_order_info` VALUES (39084, '2019-12-20 13:02:02', '2019-12-20 13:02:02', 2, 17, 4, 40, 9);
INSERT INTO `t_order_info` VALUES (39085, '2019-12-20 13:02:08', '2019-12-20 13:02:08', 6, 37, 4, 320, 7);
INSERT INTO `t_order_info` VALUES (39086, '2019-12-20 13:02:58', '2019-12-20 13:02:58', 3, 19, 4, 640, 4);
INSERT INTO `t_order_info` VALUES (39087, '2019-12-20 13:02:58', '2019-12-20 13:02:58', 4, 32, 4, 556, 4);
INSERT INTO `t_order_info` VALUES (39088, '2019-12-20 13:02:58', '2019-12-20 13:02:58', 1, 10, 4, 736, 4);
INSERT INTO `t_order_info` VALUES (39089, '2019-12-20 13:02:58', '2019-12-20 13:02:58', 3, 19, 1, 106, 4);
INSERT INTO `t_order_info` VALUES (39090, '2019-12-20 13:03:18', '2019-12-20 13:03:18', 4, 28, 3, 36, 4);
INSERT INTO `t_order_info` VALUES (39091, '2019-12-20 13:03:18', '2019-12-20 13:03:18', 5, 35, 4, 736, 8);
INSERT INTO `t_order_info` VALUES (39092, '2019-12-20 13:03:18', '2019-12-20 13:03:18', 3, 23, 2, 170, 8);

-- ----------------------------
-- Table structure for t_shopping_mall
-- ----------------------------
DROP TABLE IF EXISTS `t_shopping_mall`;
CREATE TABLE `t_shopping_mall`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间默认当前时间',
  `latest_update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最近的修改时间根据操作自动更新时间',
  `shopping_mall_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商城名称',
  `province_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属省份',
  `city_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属城市',
  `longitude` double NULL DEFAULT NULL COMMENT '经度',
  `latitude` double NULL DEFAULT NULL COMMENT '纬度',
  `parameter` int(11) NULL DEFAULT NULL COMMENT '参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商城信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shopping_mall
-- ----------------------------
INSERT INTO `t_shopping_mall` VALUES (4, '2019-11-28 10:11:04', '2019-11-28 19:01:26', '绵阳毅德城', '四川省', '绵阳', 104.722408, 31.441036, 1137921);
INSERT INTO `t_shopping_mall` VALUES (5, '2019-11-28 10:11:04', '2019-11-28 19:02:55', '赣州毅德城', '江西省', '赣州', 114.877755, 25.758279, 682745);
INSERT INTO `t_shopping_mall` VALUES (6, '2019-11-28 10:11:04', '2019-11-28 19:01:33', '长沙毅德城', '湖南省', '长沙', 112.534649, 28.260809, 229827);
INSERT INTO `t_shopping_mall` VALUES (7, '2019-11-28 10:11:04', '2019-11-28 19:02:53', '兰州毅德城', '甘肃省', '兰州', 103.950546, 35.998245, 427545);
INSERT INTO `t_shopping_mall` VALUES (8, '2019-11-28 10:11:04', '2019-11-28 19:02:26', '柳州毅德城', '广西壮族自治区', '柳州', 109.37864, 24.248032, 378414);
INSERT INTO `t_shopping_mall` VALUES (9, '2019-11-28 10:11:04', '2019-11-28 19:01:55', '济宁毅德城', '山东省', '济宁', 116.526418, 35.399822, 259146);
INSERT INTO `t_shopping_mall` VALUES (10, '2019-11-28 10:11:04', '2019-11-28 19:01:46', '菏泽毅德城', '山东省', '菏泽', 115.412429, 35.225945, 45107);
INSERT INTO `t_shopping_mall` VALUES (11, '2019-11-28 10:11:04', '2019-11-28 19:01:37', '衡阳毅德城', '湖南省', '衡阳', 112.567083, 26.895463, 61217);

-- ----------------------------
-- Table structure for t_shopping_mall_stat
-- ----------------------------
DROP TABLE IF EXISTS `t_shopping_mall_stat`;
CREATE TABLE `t_shopping_mall_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间默认当前时间',
  `latest_update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最近的修改时间根据操作自动更新时间',
  `shopping_mall_id` int(11) NULL DEFAULT NULL COMMENT '商城',
  `year` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年份',
  `cargo_count` int(11) NULL DEFAULT NULL COMMENT '货物总量',
  `freight_count` int(11) NULL DEFAULT NULL COMMENT '运费总额',
  `order_count` int(11) NULL DEFAULT NULL COMMENT '订单总量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `shopping_mall_id`(`shopping_mall_id`, `year`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商城统计信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shopping_mall_stat
-- ----------------------------
INSERT INTO `t_shopping_mall_stat` VALUES (107, '2019-12-03 16:15:14', '2019-12-20 13:03:18', 4, '2019', 23974, 1522926, 9610);
INSERT INTO `t_shopping_mall_stat` VALUES (108, '2019-12-03 16:15:14', '2019-12-20 12:58:42', 5, '2019', 14257, 893300, 5769);
INSERT INTO `t_shopping_mall_stat` VALUES (109, '2019-12-03 16:15:14', '2019-12-20 13:02:08', 7, '2019', 8883, 562118, 3556);
INSERT INTO `t_shopping_mall_stat` VALUES (110, '2019-12-03 16:15:14', '2019-12-20 13:03:18', 8, '2019', 7948, 505403, 3166);
INSERT INTO `t_shopping_mall_stat` VALUES (111, '2019-12-03 16:15:14', '2019-12-20 13:02:02', 9, '2019', 5407, 345551, 2189);
INSERT INTO `t_shopping_mall_stat` VALUES (112, '2019-12-03 16:15:14', '2019-12-20 13:00:48', 6, '2019', 4872, 322115, 1973);
INSERT INTO `t_shopping_mall_stat` VALUES (113, '2019-12-03 16:15:14', '2019-12-20 12:50:44', 11, '2019', 1384, 85789, 574);
INSERT INTO `t_shopping_mall_stat` VALUES (114, '2019-12-03 16:15:14', '2019-12-20 13:01:14', 10, '2019', 914, 57106, 353);

-- ----------------------------
-- Table structure for t_system_setting
-- ----------------------------
DROP TABLE IF EXISTS `t_system_setting`;
CREATE TABLE `t_system_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间默认当前时间',
  `latest_update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最近的修改时间根据操作自动更新时间',
  `business_hours` time(0) NULL DEFAULT NULL COMMENT '上班时间',
  `closing_time` time(0) NULL DEFAULT NULL COMMENT '下班时间',
  `min_order_num` int(11) NULL DEFAULT NULL COMMENT '最小订单数',
  `max_order_num` int(11) NULL DEFAULT NULL COMMENT '最大订单数',
  `control_number` int(12) NULL DEFAULT NULL COMMENT '控制数',
  `control_base` int(13) NULL DEFAULT NULL COMMENT '控制基数',
  `generate_order_num` int(14) NULL DEFAULT NULL COMMENT '每次生成最大订单数',
  `generate_cargo_num` int(15) NULL DEFAULT NULL COMMENT '每次生成最大货物数',
  `interval_time` int(16) NULL DEFAULT NULL COMMENT ' 每次生成订单间隔时长单位：秒，最大59秒',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_system_setting
-- ----------------------------
INSERT INTO `t_system_setting` VALUES (1, '2019-11-28 19:05:21', '2019-12-19 20:56:50', '09:00:00', '18:30:00', 1500, 2100, 925, 10000, 5, 5, 2);

SET FOREIGN_KEY_CHECKS = 1;
