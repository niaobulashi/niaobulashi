/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50635
Source Host           : 127.0.0.1:3306
Source Database       : niaobulashi

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2019-06-05 17:17:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `delete_flag` varchar(1) DEFAULT NULL COMMENT '删除标志 0：未删除 1：已删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息', null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `delete_flag` varchar(1) DEFAULT NULL COMMENT '删除标志 0：未删除 1：已删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '人人开源集团', '0', null, null, null, null, null);
INSERT INTO `sys_dept` VALUES ('2', '1', '长沙分公司', '1', null, null, null, null, null);
INSERT INTO `sys_dept` VALUES ('3', '1', '上海分公司', '2', null, null, null, null, null);
INSERT INTO `sys_dept` VALUES ('4', '3', '技术部', '0', null, null, null, null, null);
INSERT INTO `sys_dept` VALUES ('5', '3', '销售部', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `type` varchar(100) NOT NULL COMMENT '字典类型',
  `code` varchar(100) NOT NULL COMMENT '字典码',
  `value` varchar(1000) NOT NULL COMMENT '字典值',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `delete_flag` varchar(1) DEFAULT NULL COMMENT '删除标志 0：未删除 1：已删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '性别', 'sex', '0', '女', '0', null, null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('2', '性别', 'sex', '1', '男', '1', null, null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('3', '性别', 'sex', '2', '未知', '3', null, null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('4', '1', '2', '3', '5', '6', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `sys_feedback`;
CREATE TABLE `sys_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `fb_type` varchar(11) DEFAULT NULL COMMENT '意见类型100001：新需求;100002：功能意见;100003：界面意见;100004：操作意见;100005：其他意见',
  `fb_info` varchar(500) DEFAULT NULL COMMENT '反馈内容',
  `fb_user` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `fb_email` varchar(30) DEFAULT NULL COMMENT '反馈邮箱',
  `session_id` varchar(128) DEFAULT NULL COMMENT 'sessionId',
  `result_flag` varchar(2) DEFAULT NULL COMMENT '处理结果0-未处理，1-已处理，2-忽略',
  `delete_flag` varchar(1) DEFAULT NULL COMMENT '删除标志',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `delete_flag` varchar(1) DEFAULT NULL COMMENT '删除标志 0：未删除 1：已删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":41,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"测试菜单\",\"url\":\"modules/sys/test.html\",\"type\":1,\"orderNum\":0}', '37', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('2', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":41,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"测试菜单\",\"url\":\"modules/sys/test.html\",\"type\":1,\"orderNum\":8}', '18', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('3', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":41,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"测试菜单\",\"url\":\"modules/sys/test.html\",\"type\":1,\"icon\":\"fa fa-book\",\"orderNum\":8}', '11', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('4', 'admin', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[2]', '27', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('5', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":41,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"代码生成器\",\"url\":\"modules/sys/generator.html\",\"type\":1,\"icon\":\"fa fa-book\",\"orderNum\":8}', '12', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('6', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":41,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"测试菜单\",\"url\":\"modules/sys/test.html\",\"type\":1,\"icon\":\"fa fa-book\",\"orderNum\":8}', '10', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('7', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":41,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"日报管理\",\"url\":\"modules/sys/tdaily.html\",\"type\":1,\"icon\":\"fa fa-book\",\"orderNum\":8}', '37', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('8', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":42,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"菜单详情\",\"url\":\"ddd\",\"type\":1,\"icon\":\"fa-paper-plane\",\"orderNum\":0}', '18', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('9', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":42,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"菜单详情\",\"url\":\"modules/sys/tdetaildaily.html\",\"type\":1,\"icon\":\"fa-paper-plane\",\"orderNum\":0}', '13', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('10', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":42,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"日报详情\",\"url\":\"modules/sys/tdetaildaily.html\",\"type\":1,\"icon\":\"fa-paper-plane\",\"orderNum\":9}', '12', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('11', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":42,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"日报详情\",\"url\":\"modules/sys/tdetaildaily.html\",\"type\":1,\"icon\":\"fa fa-paper-plane\",\"orderNum\":9}', '11', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('12', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":42,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"日报详情\",\"url\":\"modules/sys/tdailydetail.html\",\"type\":1,\"icon\":\"fa fa-paper-plane\",\"orderNum\":9}', '54', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('13', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '41', '56', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('14', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '42', '14', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('15', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":31,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"部门管理\",\"url\":\"modules/sys/dept.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":2}', '19', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('16', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":3,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"角色管理\",\"url\":\"modules/sys/role.html\",\"type\":1,\"icon\":\"fa fa-user-secret\",\"orderNum\":3}', '13', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('17', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":4,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"菜单管理\",\"url\":\"modules/sys/menu.html\",\"type\":1,\"icon\":\"fa fa-th-list\",\"orderNum\":4}', '12', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('18', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":5,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"SQL监控\",\"url\":\"druid/sql.html\",\"type\":1,\"icon\":\"fa fa-bug\",\"orderNum\":5}', '11', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('19', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":6,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"定时任务\",\"url\":\"modules/job/schedule.html\",\"type\":1,\"icon\":\"fa fa-tasks\",\"orderNum\":6}', '11', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('20', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":27,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"参数管理\",\"url\":\"modules/sys/config.html\",\"perms\":\"sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete\",\"type\":1,\"icon\":\"fa fa-sun-o\",\"orderNum\":7}', '11', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('21', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":30,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"文件上传\",\"url\":\"modules/oss/oss.html\",\"perms\":\"sys:oss:all\",\"type\":1,\"icon\":\"fa fa-file-image-o\",\"orderNum\":8}', '10', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('22', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":36,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"字典管理\",\"url\":\"modules/sys/dict.html\",\"type\":1,\"icon\":\"fa fa-bookmark-o\",\"orderNum\":9}', '11', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('23', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":29,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"系统日志\",\"url\":\"modules/sys/log.html\",\"perms\":\"sys:log:list\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":10}', '9', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('24', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":43,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"日报管理\",\"url\":\"modules/sys/tdaily.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":11}', '13', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('25', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":48,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"日报详情\",\"url\":\"modules/sys/tdailydetail.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '11', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('26', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":48,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"日报详情\",\"url\":\"modules/sys/tdailydetail.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":12}', '12', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('27', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":53,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"用户管理\",\"type\":0,\"icon\":\"fa fa-user\",\"orderNum\":2}', '71', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('28', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":2,\"parentId\":53,\"parentName\":\"用户管理\",\"name\":\"管理员管理\",\"url\":\"modules/sys/user.html\",\"type\":1,\"icon\":\"fa fa-user\",\"orderNum\":0}', '22', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('29', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":3,\"parentId\":53,\"parentName\":\"用户管理\",\"name\":\"角色管理\",\"url\":\"modules/sys/role.html\",\"type\":1,\"icon\":\"fa fa-user-secret\",\"orderNum\":1}', '14', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('30', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":31,\"parentId\":53,\"parentName\":\"用户管理\",\"name\":\"部门管理\",\"url\":\"modules/sys/dept.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":2}', '11', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('31', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":54,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"日报管理\",\"type\":0,\"icon\":\"fa fa-file-text-o\",\"orderNum\":2}', '8', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('32', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":43,\"parentId\":54,\"parentName\":\"日报管理\",\"name\":\"日报管理\",\"url\":\"modules/sys/tdaily.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '15', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('33', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":48,\"parentId\":54,\"parentName\":\"日报管理\",\"name\":\"日报详情\",\"url\":\"modules/sys/tdailydetail.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":1}', '12', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('34', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":53,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"用户管理\",\"type\":0,\"icon\":\"fa fa-user\",\"orderNum\":1}', '10', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('35', 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[1]', '220', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('36', 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[1]', '62', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('37', 'admin', '暂停定时任务', 'io.renren.modules.job.controller.ScheduleJobController.pause()', '[1]', '73', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('38', 'admin', '暂停定时任务', 'io.renren.modules.job.controller.ScheduleJobController.pause()', '[2]', '96', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('39', 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[1]', '83', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('40', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":2,\"username\":\"test\",\"password\":\"8e456be2d089bff403f5b5c7898b0c542131010efac8419ed432b6d875ed526d\",\"salt\":\"FgfYUWOmCliH581UtjLm\",\"email\":\"test@HH.test.com\",\"mobile\":\"13300000000\",\"status\":1,\"roleIdList\":[],\"createTime\":\"Jun 5, 2019, 3:54:26 PM\",\"deptId\":1,\"deptName\":\"人人开源集团\"}', '276', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('41', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"deptId\":1,\"deptName\":\"人人开源集团\",\"menuIdList\":[1,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,36,37,38,39,40,53,2,15,16,17,18,3,19,20,21,22,31,32,33,34,35,54,43,44,45,46,47,48,49,50,51,52],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jun 5, 2019, 3:58:42 PM\"}', '277', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('42', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Nov 11, 2016, 11:11:11 AM\",\"deptId\":1,\"deptName\":\"人人开源集团\"}', '85', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('43', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":2,\"username\":\"test\",\"salt\":\"FgfYUWOmCliH581UtjLm\",\"email\":\"test@HH.test.com\",\"mobile\":\"13300000000\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Jun 5, 2019, 3:54:26 PM\",\"deptId\":1,\"deptName\":\"人人开源集团\"}', '158', '0:0:0:0:0:0:0:1', null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `delete_flag` varchar(1) DEFAULT NULL COMMENT '删除标志 0：未删除 1：已删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('2', '53', '管理员管理', 'modules/sys/user.html', null, '1', 'fa fa-user', '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('3', '53', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '1', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '4', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '5', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', null, '1', 'fa fa-tasks', '6', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '7', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '10', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '8', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('31', '53', '部门管理', 'modules/sys/dept.html', null, '1', 'fa fa-file-code-o', '2', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('32', '31', '查看', null, 'sys:dept:list,sys:dept:info', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('33', '31', '新增', null, 'sys:dept:save,sys:dept:select', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('34', '31', '修改', null, 'sys:dept:update,sys:dept:select', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('35', '31', '删除', null, 'sys:dept:delete', '2', null, '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('36', '1', '字典管理', 'modules/sys/dict.html', null, '1', 'fa fa-bookmark-o', '9', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('37', '36', '查看', null, 'sys:dict:list,sys:dict:info', '2', null, '6', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('38', '36', '新增', null, 'sys:dict:save', '2', null, '6', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('39', '36', '修改', null, 'sys:dict:update', '2', null, '6', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('40', '36', '删除', null, 'sys:dict:delete', '2', null, '6', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('43', '54', '日报管理', 'modules/sys/tdaily.html', null, '1', 'fa fa-file-code-o', '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('44', '43', '查看', null, 'sys:tdaily:list,sys:tdaily:info', '2', null, '6', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('45', '43', '新增', null, 'sys:tdaily:save', '2', null, '6', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('46', '43', '修改', null, 'sys:tdaily:update', '2', null, '6', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('47', '43', '删除', null, 'sys:tdaily:delete', '2', null, '6', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('48', '54', '日报详情', 'modules/sys/tdailydetail.html', null, '1', 'fa fa-file-code-o', '1', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('49', '48', '查看', null, 'sys:tdailydetail:list,sys:tdailydetail:info', '2', null, '6', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('50', '48', '新增', null, 'sys:tdailydetail:save', '2', null, '6', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('51', '48', '修改', null, 'sys:tdailydetail:update', '2', null, '6', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('52', '48', '删除', null, 'sys:tdailydetail:delete', '2', null, '6', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('53', '0', '用户管理', null, null, '0', 'fa fa-user', '1', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('54', '0', '日报管理', null, null, '0', 'fa fa-file-text-o', '2', null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_oss`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '系统管理员', '1', '2019-06-05 15:58:43');

-- ----------------------------
-- Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `delete_flag` varchar(1) DEFAULT NULL COMMENT '删除标志 0：未删除 1：已删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('1', '1', '1', null, null, null, null, null);
INSERT INTO `sys_role_dept` VALUES ('2', '1', '2', null, null, null, null, null);
INSERT INTO `sys_role_dept` VALUES ('3', '1', '3', null, null, null, null, null);
INSERT INTO `sys_role_dept` VALUES ('4', '1', '4', null, null, null, null, null);
INSERT INTO `sys_role_dept` VALUES ('5', '1', '5', null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  `delete_flag` varchar(1) DEFAULT NULL COMMENT '删除标志 0：未删除 1：已删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '1', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2', '1', '4', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3', '1', '23', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('4', '1', '24', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('5', '1', '25', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('6', '1', '26', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('7', '1', '5', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('8', '1', '6', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('9', '1', '7', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('10', '1', '8', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('11', '1', '9', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('12', '1', '10', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('13', '1', '11', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('14', '1', '12', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('15', '1', '13', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('16', '1', '14', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('17', '1', '27', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('18', '1', '29', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('19', '1', '30', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('20', '1', '36', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('21', '1', '37', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('22', '1', '38', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('23', '1', '39', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('24', '1', '40', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('25', '1', '53', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('26', '1', '2', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('27', '1', '15', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('28', '1', '16', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('29', '1', '17', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('30', '1', '18', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('31', '1', '3', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('32', '1', '19', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('33', '1', '20', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('34', '1', '21', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('35', '1', '22', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('36', '1', '31', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('37', '1', '32', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('38', '1', '33', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('39', '1', '34', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('40', '1', '35', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('41', '1', '54', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('42', '1', '43', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('43', '1', '44', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('44', '1', '45', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('45', '1', '46', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('46', '1', '47', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('47', '1', '48', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('48', '1', '49', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('49', '1', '50', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('50', '1', '51', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('51', '1', '52', null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `delete_flag` varchar(1) DEFAULT NULL COMMENT '删除标志 0：未删除 1：已删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('2', 'test', '8e456be2d089bff403f5b5c7898b0c542131010efac8419ed432b6d875ed526d', 'FgfYUWOmCliH581UtjLm', 'test@HH.test.com', '13300000000', '1', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `delete_flag` varchar(1) DEFAULT NULL COMMENT '删除标志 0：未删除 1：已删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('2', '2', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_daily`
-- ----------------------------
DROP TABLE IF EXISTS `t_daily`;
CREATE TABLE `t_daily` (
  `daily_id` varchar(20) NOT NULL COMMENT '日报ID',
  `daily_date` date DEFAULT NULL COMMENT '日报日期',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名称',
  `project_id` int(11) DEFAULT NULL COMMENT '项目id',
  `off_duty_time` time DEFAULT NULL COMMENT '下班时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新者',
  `remark1` varchar(32) DEFAULT NULL COMMENT '备用字段1',
  `remark2` varchar(64) DEFAULT NULL COMMENT '备用字段2',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (`daily_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_daily
-- ----------------------------
INSERT INTO `t_daily` VALUES ('RB1522672139485', '2018-04-02', 'USER005', '张琪', '25', '20:28:59', '2018-04-02 20:28:59', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1522672186030', '2018-04-02', 'USER001', '王林柱', '25', '20:29:46', '2018-04-02 20:29:46', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1522672210389', '2018-04-02', 'USER004', '胡浪', '25', '20:30:10', '2018-04-02 20:30:10', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1522672236854', '2018-04-02', 'USER003', '赫鑫', '25', '20:30:36', '2018-04-02 20:30:37', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1522672284233', '2018-04-02', 'USER002', '郭凡', '25', '20:31:24', '2018-04-02 20:31:24', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1522758641979', '2018-04-03', 'USER004', '胡浪', '25', '20:30:41', '2018-04-03 20:30:42', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1522758756602', '2018-04-03', 'USER005', '张琪', '25', '20:32:36', '2018-04-03 20:32:37', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1522759008998', '2018-04-03', 'USER002', '郭凡', '25', '20:36:48', '2018-04-03 20:36:49', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1522759016638', '2018-04-03', 'USER003', '赫鑫', '25', '20:36:56', '2018-04-03 20:36:57', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523182658111', '2018-04-08', 'USER001', '王林柱', '25', '18:17:38', '2018-04-08 18:17:38', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523182951026', '2018-04-08', 'USER003', '赫鑫', '25', '18:22:31', '2018-04-08 18:22:31', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523183132280', '2018-04-08', 'USER004', '胡浪', '25', '18:25:32', '2018-04-08 18:25:32', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523183280559', '2018-04-08', 'USER002', '郭凡', '25', '18:28:00', '2018-04-08 18:28:01', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523187892019', '2018-04-08', 'USER005', '张琪', '25', '19:44:52', '2018-04-08 19:44:52', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523240677354', '2018-04-03', 'USER001', '王林柱', '25', '10:24:37', '2018-04-09 10:24:37', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523278535574', '2018-04-09', 'USER001', '王林柱', '25', '20:55:35', '2018-04-09 20:55:36', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523278654215', '2018-04-09', 'USER003', '赫鑫', '25', '20:57:34', '2018-04-09 20:57:34', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523278681639', '2018-04-09', 'USER004', '胡浪', '25', '20:58:01', '2018-04-09 20:58:02', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523278805004', '2018-04-09', 'USER002', '郭凡', '25', '21:00:05', '2018-04-09 21:00:05', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523278988315', '2018-04-09', 'USER005', '张琪', '25', '21:03:08', '2018-04-09 21:03:08', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523363705047', '2018-04-10', 'USER004', '胡浪', '25', '20:35:05', '2018-04-10 20:35:05', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523363982071', '2018-04-10', 'USER003', '赫鑫', '25', '20:39:42', '2018-04-10 20:39:42', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523364029817', '2018-04-10', 'USER001', '王林柱', '25', '20:40:29', '2018-04-10 20:40:30', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523364065022', '2018-04-10', 'USER005', '张琪', '25', '20:41:05', '2018-04-10 20:41:05', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523364298910', '2018-04-10', 'USER002', '郭凡', '25', '20:44:58', '2018-04-10 20:44:59', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523449611042', '2018-04-11', 'USER004', '胡浪', '25', '20:26:51', '2018-04-11 20:26:51', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523449810326', '2018-04-11', 'USER001', '王林柱', '25', '20:30:10', '2018-04-11 20:30:10', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523449907376', '2018-04-11', 'USER003', '赫鑫', '25', '20:31:47', '2018-04-11 20:31:47', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523450132217', '2018-04-11', 'USER005', '张琪', '25', '20:35:32', '2018-04-11 20:35:32', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523450167960', '2018-04-11', 'USER002', '郭凡', '25', '20:36:07', '2018-04-11 20:36:08', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523535384130', '2018-04-12', 'USER001', '王林柱', '25', '20:16:24', '2018-04-12 20:16:24', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523537159972', '2018-04-12', 'USER005', '张琪', '25', '20:45:59', '2018-04-12 20:46:00', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523537441990', '2018-04-12', 'USER002', '郭凡', '25', '20:50:41', '2018-04-12 20:50:42', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523537889930', '2018-04-12', 'USER004', '胡浪', '25', '20:58:09', '2018-04-12 20:58:10', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523538193675', '2018-04-12', 'USER003', '赫鑫', '25', '21:03:13', '2018-04-12 21:03:14', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523621110139', '2018-04-13', 'USER002', '郭凡', '25', '20:05:10', '2018-04-13 20:05:10', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523621738233', '2018-04-13', 'USER005', '张琪', '25', '20:15:38', '2018-04-13 20:15:38', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523621982503', '2018-04-13', 'USER004', '胡浪', '25', '20:19:42', '2018-04-13 20:19:43', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523622045469', '2018-04-13', 'USER001', '王林柱', '25', '20:20:45', '2018-04-13 20:20:45', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523622432138', '2018-04-13', 'USER003', '赫鑫', '25', '20:27:12', '2018-04-13 20:27:12', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523882089990', '2018-04-16', 'USER005', '张琪', '25', '20:34:49', '2018-04-16 20:34:50', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523882092124', '2018-04-16', 'USER001', '王林柱', '25', '20:34:52', '2018-04-16 20:34:52', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523882095276', '2018-04-16', 'USER004', '胡浪', '25', '20:34:55', '2018-04-16 20:34:55', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523882161722', '2018-04-16', 'USER003', '赫鑫', '25', '20:36:01', '2018-04-16 20:36:02', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523882619522', '2018-04-16', 'USER002', '郭凡', '25', '20:43:39', '2018-04-16 20:43:40', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523969166844', '2018-04-17', 'USER003', '赫鑫', '25', '20:46:06', '2018-04-17 20:46:07', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523969269587', '2018-04-17', 'USER001', '王林柱', '25', '20:47:49', '2018-04-17 20:47:50', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523969358688', '2018-04-17', 'USER005', '张琪', '25', '20:49:18', '2018-04-17 20:49:19', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523969374582', '2018-04-17', 'USER004', '胡浪', '25', '20:49:34', '2018-04-17 20:49:35', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1523969500582', '2018-04-17', 'USER002', '郭凡', '25', '20:51:40', '2018-04-17 20:51:41', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524054869453', '2018-04-18', 'USER005', '张琪', '25', '20:34:29', '2018-04-18 20:34:29', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524054964361', '2018-04-18', 'USER003', '赫鑫', '25', '20:36:04', '2018-04-18 20:36:04', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524055028679', '2018-04-18', 'USER004', '胡浪', '25', '20:37:08', '2018-04-18 20:37:09', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524055093251', '2018-04-18', 'USER001', '王林柱', '25', '20:38:13', '2018-04-18 20:38:13', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524055152373', '2018-04-18', 'USER002', '郭凡', '25', '20:39:12', '2018-04-18 20:39:12', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524141465864', '2018-04-19', 'USER002', '郭凡', '25', '20:37:45', '2018-04-19 20:37:46', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524141478996', '2018-04-19', 'USER004', '胡浪', '25', '20:37:58', '2018-04-19 20:37:59', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524141537405', '2018-04-19', 'USER005', '张琪', '25', '20:38:57', '2018-04-19 20:38:57', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524141662271', '2018-04-19', 'USER001', '王林柱', '25', '20:41:02', '2018-04-19 20:41:02', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524142097308', '2018-04-19', 'USER003', '赫鑫', '25', '20:48:17', '2018-04-19 20:48:17', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524212223030', '2018-04-20', 'USER001', '王林柱', '25', '16:17:03', '2018-04-20 16:17:03', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524224014487', '2018-04-20', 'USER005', '张琪', '25', '19:33:34', '2018-04-20 19:33:34', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524224119575', '2018-04-20', 'USER002', '郭凡', '25', '19:35:19', '2018-04-20 19:35:20', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524224159128', '2018-04-20', 'USER004', '胡浪', '25', '19:35:59', '2018-04-20 19:35:59', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524224221973', '2018-04-20', 'USER003', '赫鑫', '25', '19:37:01', '2018-04-20 19:37:02', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524488568404', '2018-04-23', 'USER004', '胡浪', '25', '21:02:48', '2018-04-23 21:02:48', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524488588065', '2018-04-23', 'USER005', '张琪', '25', '21:03:08', '2018-04-23 21:03:08', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524488596259', '2018-04-23', 'USER003', '赫鑫', '25', '21:03:16', '2018-04-23 21:03:16', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524488679493', '2018-04-23', 'USER002', '郭凡', '25', '21:04:39', '2018-04-23 21:04:39', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524489190567', '2018-04-23', 'USER001', '王林柱', '25', '21:13:10', '2018-04-23 21:13:11', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524569861200', '2018-04-24', 'USER005', '张琪', '25', '19:37:41', '2018-04-24 19:37:41', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524570701189', '2018-04-24', 'USER001', '王林柱', '25', '19:51:41', '2018-04-24 19:51:41', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524570846363', '2018-04-24', 'USER002', '郭凡', '25', '19:54:06', '2018-04-24 19:54:06', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524570969084', '2018-04-24', 'USER003', '赫鑫', '25', '19:56:09', '2018-04-24 19:56:09', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524571109581', '2018-04-24', 'USER004', '胡浪', '25', '19:58:29', '2018-04-24 19:58:30', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524663478790', '2018-04-25', 'USER003', '赫鑫', '25', '21:37:58', '2018-04-25 21:37:59', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524663486036', '2018-04-25', 'USER001', '王林柱', '25', '21:38:06', '2018-04-25 21:38:06', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524663506267', '2018-04-25', 'USER004', '胡浪', '25', '21:38:26', '2018-04-25 21:38:26', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524663585608', '2018-04-25', 'USER002', '郭凡', '25', '21:39:45', '2018-04-25 21:39:46', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524663595081', '2018-04-25', 'USER005', '张琪', '25', '21:39:55', '2018-04-25 21:39:55', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524746553709', '2018-04-26', 'USER004', '胡浪', '25', '20:42:33', '2018-04-26 20:42:34', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524746613598', '2018-04-26', 'USER001', '王林柱', '25', '20:43:33', '2018-04-26 20:43:34', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524746806683', '2018-04-26', 'USER003', '赫鑫', '25', '20:46:46', '2018-04-26 20:46:47', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524746998591', '2018-04-26', 'USER002', '郭凡', '25', '20:49:58', '2018-04-26 20:49:59', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524747933466', '2018-04-26', 'USER005', '张琪', '25', '21:05:33', '2018-04-26 21:05:33', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524830481579', '2018-04-27', 'USER004', '胡浪', '25', '20:01:21', '2018-04-27 20:01:22', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524830700929', '2018-04-27', 'USER003', '赫鑫', '25', '20:05:00', '2018-04-27 20:05:01', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524830787321', '2018-04-27', 'USER002', '郭凡', '25', '20:06:27', '2018-04-27 20:06:27', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524832474971', '2018-04-27', 'USER005', '张琪', '25', '20:34:34', '2018-04-27 20:34:35', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524910615068', '2018-04-28', 'USER005', '张琪', '25', '18:16:55', '2018-04-28 18:16:55', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524910638152', '2018-04-28', 'USER003', '赫鑫', '25', '18:17:18', '2018-04-28 18:17:18', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1524910784163', '2018-04-28', 'USER004', '胡浪', '25', '18:19:44', '2018-04-28 18:19:44', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525221441606', '2018-04-28', 'USER002', '郭凡', '25', '08:37:21', '2018-05-02 08:37:22', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525267436298', '2018-05-02', 'USER001', '王林柱', '25', '21:23:56', '2018-05-02 21:23:56', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525267904643', '2018-05-02', 'USER003', '赫鑫', '25', '21:31:44', '2018-05-02 21:31:45', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525267913658', '2018-05-02', 'USER004', '胡浪', '25', '21:31:53', '2018-05-02 21:31:54', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525268017384', '2018-05-02', 'USER005', '张琪', '25', '21:33:37', '2018-05-02 21:33:37', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525268079390', '2018-05-02', 'USER002', '郭凡', '25', '21:34:39', '2018-05-02 21:34:39', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525350799717', '2018-05-03', 'USER003', '赫鑫', '25', '20:33:19', '2018-05-03 20:33:20', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525351436843', '2018-05-03', 'USER002', '郭凡', '25', '20:43:56', '2018-05-03 20:43:57', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525351455783', '2018-05-03', 'USER001', '王林柱', '25', '20:44:15', '2018-05-03 20:44:16', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525351468204', '2018-05-03', 'USER004', '胡浪', '25', '20:44:28', '2018-05-03 20:44:28', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525352621159', '2018-05-03', 'USER005', '张琪', '25', '21:03:41', '2018-05-03 21:03:41', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525431529107', '2018-05-04', 'USER004', '胡浪', '25', '18:58:49', '2018-05-04 18:58:49', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525431754994', '2018-05-04', 'USER005', '张琪', '25', '19:02:34', '2018-05-04 19:02:35', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525431904375', '2018-05-04', 'USER002', '郭凡', '25', '19:05:04', '2018-05-04 19:05:04', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525434568078', '2018-05-04', 'USER003', '赫鑫', '25', '19:49:28', '2018-05-04 19:49:28', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525691774489', '2018-05-07', 'USER004', '胡浪', '25', '19:16:14', '2018-05-07 19:16:14', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525691867908', '2018-05-07', 'USER003', '赫鑫', '25', '19:17:47', '2018-05-07 19:17:48', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525694966375', '2018-05-07', 'USER005', '张琪', '25', '20:09:26', '2018-05-07 20:09:26', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525696175288', '2018-05-07', 'USER002', '郭凡', '25', '20:29:35', '2018-05-07 20:29:35', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525779698680', '2018-05-08', 'USER004', '胡浪', '25', '19:41:38', '2018-05-08 19:41:39', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525781406973', '2018-05-08', 'USER005', '张琪', '25', '20:10:06', '2018-05-08 20:10:07', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525782267767', '2018-05-08', 'USER002', '郭凡', '25', '20:24:27', '2018-05-08 20:24:28', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525782346445', '2018-05-08', 'USER001', '王林柱', '25', '20:25:46', '2018-05-08 20:25:46', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525782654251', '2018-05-08', 'USER003', '赫鑫', '25', '20:30:54', '2018-05-08 20:30:54', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525869033108', '2018-05-09', 'USER004', '胡浪', '25', '20:30:33', '2018-05-09 20:30:33', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525869131261', '2018-05-09', 'USER003', '赫鑫', '25', '20:32:11', '2018-05-09 20:32:11', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525869634400', '2018-05-09', 'USER001', '王林柱', '25', '20:40:34', '2018-05-09 20:40:34', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525869724899', '2018-05-09', 'USER002', '郭凡', '25', '20:42:04', '2018-05-09 20:42:05', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525870942377', '2018-05-09', 'USER005', '张琪', '25', '21:02:22', '2018-05-09 21:02:22', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525956386610', '2018-05-10', 'USER004', '胡浪', '25', '20:46:26', '2018-05-10 20:46:27', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525956544382', '2018-05-10', 'USER001', '王林柱', '25', '20:49:04', '2018-05-10 20:49:04', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525956575852', '2018-05-10', 'USER003', '赫鑫', '25', '20:49:35', '2018-05-10 20:49:36', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525957408540', '2018-05-10', 'USER005', '张琪', '25', '21:03:28', '2018-05-10 21:03:29', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1525957696119', '2018-05-10', 'USER002', '郭凡', '25', '21:08:16', '2018-05-10 21:08:16', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526038412095', '2018-05-11', 'USER004', '胡浪', '25', '19:33:32', '2018-05-11 19:33:32', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526038445275', '2018-05-11', 'USER003', '赫鑫', '25', '19:34:05', '2018-05-11 19:34:05', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526038449736', '2018-05-11', 'USER001', '王林柱', '25', '19:34:09', '2018-05-11 19:34:10', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526040157317', '2018-05-11', 'USER002', '郭凡', '25', '20:02:37', '2018-05-11 20:02:37', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526040171848', '2018-05-11', 'USER005', '张琪', '25', '20:02:51', '2018-05-11 20:02:52', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526299383929', '2018-05-14', 'USER004', '胡浪', '25', '20:03:03', '2018-05-14 20:03:04', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526299958648', '2018-05-14', 'USER003', '赫鑫', '25', '20:12:38', '2018-05-14 20:12:39', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526299969581', '2018-05-14', 'USER001', '王林柱', '25', '20:12:49', '2018-05-14 20:12:50', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526299994419', '2018-05-14', 'USER002', '郭凡', '25', '20:13:14', '2018-05-14 20:13:14', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526388062372', '2018-05-15', 'USER001', '王林柱', '25', '20:41:02', '2018-05-15 20:41:02', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526388063774', '2018-05-15', 'USER003', '赫鑫', '25', '20:41:03', '2018-05-15 20:41:04', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526388137416', '2018-05-15', 'USER004', '胡浪', '25', '20:42:17', '2018-05-15 20:42:17', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526388981181', '2018-05-15', 'USER002', '郭凡', '25', '20:56:21', '2018-05-15 20:56:21', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526465615203', '2018-05-16', 'USER005', '张琪', '25', '18:13:35', '2018-05-16 18:13:35', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526468973248', '2018-05-16', 'USER004', '胡浪', '25', '19:09:33', '2018-05-16 19:09:33', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526468975294', '2018-05-16', 'USER001', '王林柱', '25', '19:09:35', '2018-05-16 19:09:35', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526470440231', '2018-05-16', 'USER003', '赫鑫', '25', '19:34:00', '2018-05-16 19:34:00', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526474185281', '2018-05-16', 'USER002', '郭凡', '25', '20:36:25', '2018-05-16 20:36:25', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526560419127', '2018-05-17', 'USER001', '王林柱', '25', '20:33:39', '2018-05-17 20:33:39', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526560662708', '2018-05-17', 'USER003', '赫鑫', '25', '20:37:42', '2018-05-17 20:37:43', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526562231507', '2018-05-17', 'USER005', '张琪', '25', '21:03:51', '2018-05-17 21:03:52', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526562398172', '2018-05-17', 'USER002', '郭凡', '25', '21:06:38', '2018-05-17 21:06:38', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526603938485', '2018-05-17', 'USER004', '胡浪', '25', '08:38:58', '2018-05-18 08:38:58', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526637616945', '2018-05-18', 'USER004', '胡浪', '25', '18:00:16', '2018-05-18 18:00:17', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526637719265', '2018-05-18', 'USER002', '郭凡1111', '25', '18:01:59', '2018-05-18 18:01:59', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526638073994', '2018-05-18', 'USER005', '张琪', '25', '18:07:53', '2018-05-18 18:07:54', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526904083204', '2018-05-21', 'USER004', '胡浪', '25', '20:01:23', '2018-05-21 20:01:23', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526904101098', '2018-05-21', 'USER005', '张琪', '25', '20:01:41', '2018-05-21 20:01:41', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526904474351', '2018-05-21', 'USER003', '赫鑫', '25', '20:07:54', '2018-05-21 20:07:54', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526904627468', '2018-05-21', 'USER002', '郭凡', '25', '20:10:27', '2018-05-21 20:10:27', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526904662775', '2018-05-21', 'USER001', '王林柱', '25', '20:11:02', '2018-05-21 20:11:03', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526994052291', '2018-05-22', 'USER003', '赫鑫', '25', '21:00:52', '2018-05-22 21:00:52', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526994063576', '2018-05-22', 'USER001', '王林柱', '25', '21:01:03', '2018-05-22 21:01:04', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526994104806', '2018-05-22', 'USER004', '胡浪', '25', '21:01:44', '2018-05-22 21:01:45', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526994138565', '2018-05-22', 'USER002', '郭凡', '25', '21:02:18', '2018-05-22 21:02:19', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1526994173812', '2018-05-22', 'USER005', '张琪', '25', '21:02:53', '2018-05-22 21:02:54', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527078771878', '2018-05-23', 'USER005', '张琪', '25', '20:32:51', '2018-05-23 20:32:52', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527079135631', '2018-05-23', 'USER001', '王林柱', '25', '20:38:55', '2018-05-23 20:38:56', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527079207520', '2018-05-23', 'USER003', '赫鑫', '25', '20:40:07', '2018-05-23 20:40:08', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527080817223', '2018-05-23', 'USER002', '郭凡', '25', '21:06:57', '2018-05-23 21:06:57', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527080871547', '2018-05-23', 'USER004', '胡浪', '25', '21:07:51', '2018-05-23 21:07:52', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527163403042', '2018-05-24', 'USER003', '赫鑫', '25', '20:03:23', '2018-05-24 20:03:23', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527163545604', '2018-05-24', 'USER001', '王林柱', '25', '20:05:45', '2018-05-24 20:05:46', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527163555234', '2018-05-24', 'USER004', '胡浪', '25', '20:05:55', '2018-05-24 20:05:55', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527163558748', '2018-05-24', 'USER1527163402524', '袁哲', '25', '20:05:58', '2018-05-24 20:05:59', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527163627427', '2018-05-24', 'USER005', '张琪', '25', '20:07:07', '2018-05-24 20:07:07', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527167160013', '2018-05-24', 'USER002', '郭凡', '25', '21:06:00', '2018-05-24 21:06:00', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527243346977', '2018-05-25', 'USER004', '胡浪', '25', '18:15:46', '2018-05-25 18:15:47', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527243458157', '2018-05-25', 'USER005', '张琪', '25', '18:17:38', '2018-05-25 18:17:38', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527243655928', '2018-05-25', 'USER002', '郭凡', '25', '18:20:55', '2018-05-25 18:20:56', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527468842201', '2018-05-25', 'USER003', '赫鑫', '25', '08:54:02', '2018-05-28 08:54:02', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527469643508', '2018-05-25', 'USER1527163402524', '袁哲', '25', '09:07:23', '2018-05-28 09:07:24', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527469661008', '2018-05-23', 'USER1527163402524', '袁哲', '25', '09:07:41', '2018-05-28 09:07:41', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527512397351', '2018-05-28', 'USER1527163402524', '袁哲', '25', '20:59:57', '2018-05-28 20:59:57', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527512615602', '2018-05-28', 'USER005', '张琪', '25', '21:03:35', '2018-05-28 21:03:36', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527513562273', '2018-05-28', 'USER004', '胡浪', '25', '21:19:22', '2018-05-28 21:19:22', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527513683997', '2018-05-28', 'USER003', '赫鑫', '25', '21:21:23', '2018-05-28 21:21:24', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527513686370', '2018-05-28', 'USER001', '王林柱', '25', '21:21:26', '2018-05-28 21:21:26', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527514387195', '2018-05-28', 'USER002', '郭凡', '25', '21:33:07', '2018-05-28 21:33:07', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527601118517', '2018-05-29', 'USER1527163402524', '袁哲', '25', '21:38:38', '2018-05-29 21:38:39', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527601355263', '2018-05-29', 'USER005', '张琪', '25', '21:42:35', '2018-05-29 21:42:35', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527601468914', '2018-05-29', 'USER004', '胡浪', '25', '21:44:28', '2018-05-29 21:44:29', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527601591231', '2018-05-29', 'USER002', '郭凡', '25', '21:46:31', '2018-05-29 21:46:31', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527601728097', '2018-05-29', 'USER001', '王林柱', '25', '21:48:48', '2018-05-29 21:48:48', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527601835954', '2018-05-29', 'USER003', '赫鑫', '25', '21:50:35', '2018-05-29 21:50:36', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527686235650', '2018-05-30', 'USER1527163402524', '袁哲', '25', '21:17:15', '2018-05-30 21:17:16', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527687044532', '2018-05-30', 'USER003', '赫鑫', '25', '21:30:44', '2018-05-30 21:30:45', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527687091436', '2018-05-30', 'USER004', '胡浪', '25', '21:31:31', '2018-05-30 21:31:31', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527687109473', '2018-05-30', 'USER002', '郭凡', '25', '21:31:49', '2018-05-30 21:31:49', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527687131177', '2018-05-30', 'USER005', '张琪', '25', '21:32:11', '2018-05-30 21:32:11', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527687177181', '2018-05-30', 'USER001', '王林柱', '25', '21:32:57', '2018-05-30 21:32:57', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527770491663', '2018-05-31', 'USER004', '胡浪', '25', '20:41:31', '2018-05-31 20:41:32', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527770546248', '2018-05-31', 'USER001', '王林柱', '25', '20:42:26', '2018-05-31 20:42:26', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527771695352', '2018-05-31', 'USER003', '赫鑫', '25', '21:01:35', '2018-05-31 21:01:35', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527771905688', '2018-05-31', 'USER002', '郭凡', '25', '21:05:05', '2018-05-31 21:05:06', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527771993704', '2018-05-31', 'USER005', '张琪', '25', '21:06:33', '2018-05-31 21:06:34', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527772064092', '2018-05-31', 'USER1527163402524', '袁哲', '25', '21:07:44', '2018-05-31 21:07:44', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527847548853', '2018-06-01', 'USER002', '郭凡', '25', '18:05:48', '2018-06-01 18:05:49', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527847561622', '2018-06-01', 'USER001', '王林柱', '25', '18:06:01', '2018-06-01 18:06:02', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527847591266', '2018-06-01', 'USER003', '赫鑫', '25', '18:06:31', '2018-06-01 18:06:31', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527847592319', '2018-06-01', 'USER004', '胡浪', '25', '18:06:32', '2018-06-01 18:06:32', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527847592754', '2018-06-01', 'USER005', '张琪', '25', '18:06:32', '2018-06-01 18:06:33', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527907174434', '2018-06-02', 'USER1527163402524', '袁哲', '25', '10:39:34', '2018-06-02 10:39:34', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1527907211284', '2018-06-01', 'USER1527163402524', '袁哲', '25', '10:40:11', '2018-06-02 10:40:11', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528115442279', '2018-06-04', 'USER004', '胡浪', '25', '20:30:42', '2018-06-04 20:30:42', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528115685106', '2018-06-04', 'USER003', '赫鑫', '25', '20:34:45', '2018-06-04 20:34:45', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528115695882', '2018-06-04', 'USER002', '郭凡', '25', '20:34:55', '2018-06-04 20:34:56', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528115716466', '2018-06-04', 'USER001', '王林柱', '25', '20:35:16', '2018-06-04 20:35:16', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528115763864', '2018-06-04', 'USER005', '张琪', '25', '20:36:03', '2018-06-04 20:36:04', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528116584063', '2018-06-04', 'USER1527163402524', '袁哲', '25', '20:49:44', '2018-06-04 20:49:44', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528201955781', '2018-06-05', 'USER003', '赫鑫', '25', '20:32:35', '2018-06-05 20:32:36', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528202077320', '2018-06-05', 'USER005', '张琪', '25', '20:34:37', '2018-06-05 20:34:37', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528202147730', '2018-06-05', 'USER001', '王林柱', '25', '20:35:47', '2018-06-05 20:35:48', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528202173767', '2018-06-05', 'USER004', '胡浪', '25', '20:36:13', '2018-06-05 20:36:14', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528203654144', '2018-06-05', 'USER1527163402524', '袁哲', '25', '21:00:54', '2018-06-05 21:00:54', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528203791282', '2018-06-05', 'USER002', '郭凡', '25', '21:03:11', '2018-06-05 21:03:11', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528286709715', '2018-06-06', 'USER003', '赫鑫', '25', '20:05:09', '2018-06-06 20:05:10', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528286934263', '2018-06-06', 'USER004', '胡浪', '25', '20:08:54', '2018-06-06 20:08:54', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528286935746', '2018-06-06', 'USER005', '张琪', '25', '20:08:55', '2018-06-06 20:08:56', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528286960125', '2018-06-06', 'USER002', '郭凡', '25', '20:09:20', '2018-06-06 20:09:20', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528287241462', '2018-06-06', 'USER001', '王林柱', '25', '20:14:01', '2018-06-06 20:14:01', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528331938003', '2018-06-06', 'USER1527163402524', '袁哲', '25', '08:38:58', '2018-06-07 08:38:58', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528376585585', '2018-06-07', 'USER005', '张琪', '25', '21:03:05', '2018-06-07 21:03:06', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528376702729', '2018-06-07', 'USER004', '胡浪', '25', '21:05:02', '2018-06-07 21:05:03', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528376759170', '2018-06-07', 'USER002', '郭凡', '25', '21:05:59', '2018-06-07 21:05:59', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528376845888', '2018-06-07', 'USER003', '赫鑫', '25', '21:07:25', '2018-06-07 21:07:26', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528376993439', '2018-06-07', 'USER1527163402524', '袁哲', '25', '21:09:53', '2018-06-07 21:09:53', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528452825683', '2018-06-08', 'USER002', '郭凡', '25', '18:13:45', '2018-06-08 18:13:46', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528452951419', '2018-06-08', 'USER004', '胡浪', '25', '18:15:51', '2018-06-08 18:15:51', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528452953747', '2018-06-08', 'USER001', '王林柱', '25', '18:15:53', '2018-06-08 18:15:54', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528452984732', '2018-06-08', 'USER003', '赫鑫', '25', '18:16:24', '2018-06-08 18:16:25', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528453113650', '2018-06-08', 'USER005', '张琪', '25', '18:18:33', '2018-06-08 18:18:34', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528453604583', '2018-06-08', 'USER1527163402524', '袁哲', '25', '18:26:44', '2018-06-08 18:26:45', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528720316678', '2018-06-11', 'USER003', '赫鑫', '25', '20:31:56', '2018-06-11 20:31:57', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528720706869', '2018-06-11', 'USER001', '王林柱', '25', '20:38:26', '2018-06-11 20:38:27', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528720739886', '2018-06-11', 'USER004', '胡浪', '25', '20:38:59', '2018-06-11 20:39:00', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528720765381', '2018-06-11', 'USER002', '郭凡', '25', '20:39:25', '2018-06-11 20:39:25', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528721040886', '2018-06-11', 'USER1527163402524', '袁哲', '25', '20:44:00', '2018-06-11 20:44:01', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528722204977', '2018-06-11', 'USER005', '张琪', '25', '21:03:24', '2018-06-11 21:03:25', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528809295259', '2018-06-12', 'USER004', '胡浪', '25', '21:14:55', '2018-06-12 21:14:55', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528809445701', '2018-06-12', 'USER003', '赫鑫', '25', '21:17:25', '2018-06-12 21:17:26', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528809457515', '2018-06-12', 'USER001', '王林柱', '25', '21:17:37', '2018-06-12 21:17:38', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528809567583', '2018-06-12', 'USER1527163402524', '袁哲', '25', '21:19:27', '2018-06-12 21:19:28', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528810266724', '2018-06-12', 'USER002', '郭凡', '25', '21:31:06', '2018-06-12 21:31:07', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528810330254', '2018-06-12', 'USER005', '张琪', '25', '21:32:10', '2018-06-12 21:32:10', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528895516240', '2018-06-13', 'USER003', '赫鑫', '25', '21:11:56', '2018-06-13 21:11:56', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528895542522', '2018-06-13', 'USER004', '胡浪', '25', '21:12:22', '2018-06-13 21:12:23', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528895599825', '2018-06-13', 'USER005', '张琪', '25', '21:13:19', '2018-06-13 21:13:20', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528895600504', '2018-06-13', 'USER002', '郭凡', '25', '21:13:20', '2018-06-13 21:13:21', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528895653202', '2018-06-13', 'USER001', '王林柱', '25', '21:14:13', '2018-06-13 21:14:13', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528970820057', '2018-06-14', 'USER004', '胡浪', '25', '18:07:00', '2018-06-14 18:07:00', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528970968859', '2018-06-14', 'USER001', '王林柱', '25', '18:09:28', '2018-06-14 18:09:29', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528971607848', '2018-06-14', 'USER003', '赫鑫', '25', '18:20:07', '2018-06-14 18:20:08', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528971980288', '2018-06-14', 'USER002', '郭凡', '25', '18:26:20', '2018-06-14 18:26:20', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1528977916080', '2018-06-14', 'USER005', '张琪', '25', '20:05:16', '2018-06-14 20:05:16', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529043481147', '2018-06-13', 'USER1527163402524', '袁哲', '25', '14:18:01', '2018-06-15 14:18:01', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529043487306', '2018-06-14', 'USER1527163402524', '袁哲', '25', '14:18:07', '2018-06-15 14:18:07', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529048017524', '2018-06-15', 'USER003', '赫鑫', '25', '15:33:37', '2018-06-15 15:33:38', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529048053364', '2018-06-15', 'USER004', '胡浪', '25', '15:34:13', '2018-06-15 15:34:13', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529053582262', '2018-06-15', 'USER001', '王林柱', '25', '17:06:22', '2018-06-15 17:06:22', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529053771100', '2018-06-15', 'USER002', '郭凡', '25', '17:09:31', '2018-06-15 17:09:31', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529055677768', '2018-06-15', 'USER005', '张琪', '25', '17:41:17', '2018-06-15 17:41:18', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529410054151', '2018-06-19', 'USER002', '郭凡', '25', '20:07:34', '2018-06-19 20:07:34', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529410064229', '2018-06-19', 'USER004', '胡浪', '25', '20:07:44', '2018-06-19 20:07:44', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529410088717', '2018-06-19', 'USER001', '王林柱', '25', '20:08:08', '2018-06-19 20:08:09', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529410207179', '2018-06-19', 'USER005', '张琪', '25', '20:10:07', '2018-06-19 20:10:07', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529410518804', '2018-06-15', 'USER1527163402524', '袁哲', '25', '20:15:18', '2018-06-19 20:15:19', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529410546858', '2018-06-19', 'USER1527163402524', '袁哲', '25', '20:15:46', '2018-06-19 20:15:47', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529411464985', '2018-06-19', 'USER003', '赫鑫', '25', '20:31:04', '2018-06-19 20:31:05', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529499917587', '2018-06-20', 'USER003', '赫鑫', '25', '21:05:17', '2018-06-20 21:05:18', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529500079831', '2018-06-20', 'USER005', '张琪', '25', '21:07:59', '2018-06-20 21:08:00', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529500103827', '2018-06-20', 'USER004', '胡浪', '25', '21:08:23', '2018-06-20 21:08:24', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529500233399', '2018-06-20', 'USER001', '王林柱', '25', '21:10:33', '2018-06-20 21:10:33', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529500245033', '2018-06-20', 'USER002', '郭凡', '25', '21:10:45', '2018-06-20 21:10:45', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529586277208', '2018-06-21', 'USER003', '赫鑫', '25', '21:04:37', '2018-06-21 21:04:37', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529586340476', '2018-06-21', 'USER001', '王林柱', '25', '21:05:40', '2018-06-21 21:05:40', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529586511498', '2018-06-21', 'USER004', '胡浪', '25', '21:08:31', '2018-06-21 21:08:31', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529586520671', '2018-06-21', 'USER002', '郭凡', '25', '21:08:40', '2018-06-21 21:08:41', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529586647452', '2018-06-21', 'USER005', '张琪', '25', '21:10:47', '2018-06-21 21:10:47', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529587343412', '2018-06-20', 'USER1527163402524', '袁哲', '25', '21:22:23', '2018-06-21 21:22:23', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529587347099', '2018-06-21', 'USER1527163402524', '袁哲', '25', '21:22:27', '2018-06-21 21:22:27', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529660964296', '2018-06-22', 'USER003', '赫鑫', '25', '17:49:24', '2018-06-22 17:49:24', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529660983712', '2018-06-22', 'USER001', '王林柱', '25', '17:49:43', '2018-06-22 17:49:44', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529661099865', '2018-06-22', 'USER004', '胡浪', '25', '17:51:39', '2018-06-22 17:51:40', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529661267169', '2018-06-22', 'USER002', '郭凡', '25', '17:54:27', '2018-06-22 17:54:27', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529661680782', '2018-06-22', 'USER005', '张琪', '25', '18:01:20', '2018-06-22 18:01:21', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529662309392', '2018-06-22', 'USER1527163402524', '袁哲', '25', '18:11:49', '2018-06-22 18:11:49', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529932236317', '2018-06-25', 'USER004', '胡浪', '25', '21:10:36', '2018-06-25 21:10:36', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529932247410', '2018-06-25', 'USER001', '王林柱', '25', '21:10:47', '2018-06-25 21:10:47', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529932254888', '2018-06-25', 'USER005', '张琪', '25', '21:10:54', '2018-06-25 21:10:55', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529932275706', '2018-06-25', 'USER003', '赫鑫', '25', '21:11:15', '2018-06-25 21:11:16', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1529932291711', '2018-06-25', 'USER002', '郭凡', '25', '21:11:31', '2018-06-25 21:11:32', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530016216242', '2018-06-26', 'USER004', '胡浪', '25', '20:30:16', '2018-06-26 20:30:16', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530016746442', '2018-06-26', 'USER003', '赫鑫', '25', '20:39:06', '2018-06-26 20:39:06', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530016835903', '2018-06-26', 'USER001', '王林柱', '25', '20:40:35', '2018-06-26 20:40:36', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530016974514', '2018-06-26', 'USER005', '张琪', '25', '20:42:54', '2018-06-26 20:42:55', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530017066785', '2018-06-25', 'USER1527163402524', '袁哲', '25', '20:44:26', '2018-06-26 20:44:27', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530017072396', '2018-06-26', 'USER002', '郭凡', '25', '20:44:32', '2018-06-26 20:44:32', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530017165155', '2018-06-26', 'USER1527163402524', '袁哲', '25', '20:46:05', '2018-06-26 20:46:05', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530095397831', '2018-06-27', 'USER003', '赫鑫', '25', '18:29:57', '2018-06-27 18:29:58', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530095848804', '2018-06-27', 'USER002', '郭凡', '25', '18:37:28', '2018-06-27 18:37:29', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530095935833', '2018-06-27', 'USER005', '张琪', '25', '18:38:55', '2018-06-27 18:38:56', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530095967466', '2018-06-27', 'USER004', '胡浪', '25', '18:39:27', '2018-06-27 18:39:27', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530096019579', '2018-06-27', 'USER1527163402524', '袁哲', '25', '18:40:19', '2018-06-27 18:40:20', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530188003390', '2018-06-28', 'USER003', '赫鑫', '25', '20:13:23', '2018-06-28 20:13:23', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530188218576', '2018-06-28', 'USER001', '王林柱', '25', '20:16:58', '2018-06-28 20:16:59', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530188247296', '2018-06-28', 'USER004', '胡浪', '25', '20:17:27', '2018-06-28 20:17:27', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530188547171', '2018-06-28', 'USER005', '张琪', '25', '20:22:27', '2018-06-28 20:22:27', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530188556601', '2018-06-28', 'USER002', '郭凡', '25', '20:22:36', '2018-06-28 20:22:37', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530188591995', '2018-06-28', 'USER1527163402524', '袁哲', '25', '20:23:11', '2018-06-28 20:23:12', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530267091415', '2018-06-29', 'USER002', '郭凡', '25', '18:11:31', '2018-06-29 18:11:31', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530267520242', '2018-06-29', 'USER005', '张琪', '25', '18:18:40', '2018-06-29 18:18:40', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530269026373', '2018-06-29', 'USER1527163402524', '袁哲', '25', '18:43:46', '2018-06-29 18:43:46', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530430036162', '2018-06-29', 'USER003', '赫鑫', '25', '15:27:16', '2018-07-01 15:27:16', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530538766432', '2018-07-02', 'USER1527163402524', '袁哲', '25', '21:39:26', '2018-07-02 21:39:26', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530539712698', '2018-07-02', 'USER001', '王林柱', '25', '21:55:12', '2018-07-02 21:55:13', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530539780888', '2018-07-02', 'USER003', '赫鑫', '25', '21:56:20', '2018-07-02 21:56:21', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530540020138', '2018-07-02', 'USER004', '胡浪', '25', '22:00:20', '2018-07-02 22:00:20', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530540187599', '2018-07-02', 'USER005', '张琪', '25', '22:03:07', '2018-07-02 22:03:08', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530540263230', '2018-07-02', 'USER002', '郭凡', '25', '22:04:23', '2018-07-02 22:04:23', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530621464275', '2018-07-03', 'USER005', '张琪', '25', '20:37:44', '2018-07-03 20:37:44', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530621630314', '2018-07-03', 'USER1527163402524', '袁哲', '25', '20:40:30', '2018-07-03 20:40:30', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530622878419', '2018-07-03', 'USER003', '赫鑫', '25', '21:01:18', '2018-07-03 21:01:18', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530622923803', '2018-07-03', 'USER004', '胡浪', '25', '21:02:03', '2018-07-03 21:02:04', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530623050778', '2018-07-03', 'USER001', '王林柱', '25', '21:04:10', '2018-07-03 21:04:11', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530623093133', '2018-07-03', 'USER002', '郭凡', '25', '21:04:53', '2018-07-03 21:04:53', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530707426631', '2018-07-04', 'USER004', '胡浪', '25', '20:30:26', '2018-07-04 20:30:27', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530707501511', '2018-07-04', 'USER003', '赫鑫', '25', '20:31:41', '2018-07-04 20:31:42', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530707524105', '2018-07-04', 'USER005', '张琪', '25', '20:32:04', '2018-07-04 20:32:04', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530707593936', '2018-07-04', 'USER001', '王林柱', '25', '20:33:13', '2018-07-04 20:33:14', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530707716317', '2018-07-04', 'USER1527163402524', '袁哲', '25', '20:35:16', '2018-07-04 20:35:16', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530707725229', '2018-07-04', 'USER002', '郭凡', '25', '20:35:25', '2018-07-04 20:35:25', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530794547963', '2018-07-05', 'USER004', '胡浪', '25', '20:42:27', '2018-07-05 20:42:28', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530794556131', '2018-07-05', 'USER002', '郭凡', '25', '20:42:36', '2018-07-05 20:42:36', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530794762326', '2018-07-05', 'USER005', '张琪', '25', '20:46:02', '2018-07-05 20:46:02', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530794919442', '2018-07-05', 'USER1527163402524', '袁哲', '25', '20:48:39', '2018-07-05 20:48:39', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530795098715', '2018-07-05', 'USER001', '王林柱', '25', '20:51:38', '2018-07-05 20:51:39', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530796384888', '2018-07-05', 'USER003', '赫鑫', '25', '21:13:04', '2018-07-05 21:13:05', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530868690661', '2018-07-06', 'USER004', '胡浪', '25', '17:18:10', '2018-07-06 17:18:11', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530868834289', '2018-07-06', 'USER1527163402524', '袁哲', '25', '17:20:34', '2018-07-06 17:20:34', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530868836797', '2018-07-06', 'USER003', '赫鑫', '25', '17:20:36', '2018-07-06 17:20:37', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530868878594', '2018-07-06', 'USER005', '张琪', '25', '17:21:18', '2018-07-06 17:21:19', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1530869008300', '2018-07-06', 'USER002', '郭凡', '25', '17:23:28', '2018-07-06 17:23:28', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531139403530', '2018-07-09', 'USER004', '胡浪', '25', '20:30:03', '2018-07-09 20:30:04', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531139471121', '2018-07-09', 'USER005', '张琪', '25', '20:31:11', '2018-07-09 20:31:11', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531139477696', '2018-07-09', 'USER003', '赫鑫', '25', '20:31:17', '2018-07-09 20:31:18', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531139522305', '2018-07-09', 'USER001', '王林柱', '25', '20:32:02', '2018-07-09 20:32:02', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531139753745', '2018-07-09', 'USER002', '郭凡', '25', '20:35:53', '2018-07-09 20:35:54', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531140092911', '2018-07-09', 'USER1527163402524', '袁哲', '25', '20:41:32', '2018-07-09 20:41:33', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531226876449', '2018-07-10', 'USER1527163402524', '袁哲', '25', '20:47:56', '2018-07-10 20:47:56', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531227686518', '2018-07-10', 'USER003', '赫鑫', '25', '21:01:26', '2018-07-10 21:01:27', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531227772316', '2018-07-10', 'USER004', '胡浪', '25', '21:02:52', '2018-07-10 21:02:52', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531227780763', '2018-07-10', 'USER005', '张琪', '25', '21:03:00', '2018-07-10 21:03:01', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531227807589', '2018-07-10', 'USER001', '王林柱', '25', '21:03:27', '2018-07-10 21:03:28', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531227842662', '2018-07-10', 'USER002', '郭凡', '25', '21:04:02', '2018-07-10 21:04:03', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531312335000', '2018-07-11', 'USER004', '胡浪', '25', '20:32:15', '2018-07-11 20:32:15', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531312368408', '2018-07-11', 'USER005', '张琪', '25', '20:32:48', '2018-07-11 20:32:48', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531312559127', '2018-07-11', 'USER1527163402524', '袁哲', '25', '20:35:59', '2018-07-11 20:35:59', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531312604754', '2018-07-11', 'USER002', '郭凡', '25', '20:36:44', '2018-07-11 20:36:45', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531312616799', '2018-07-11', 'USER001', '王林柱', '25', '20:36:56', '2018-07-11 20:36:57', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531312628920', '2018-07-11', 'USER003', '赫鑫', '25', '20:37:08', '2018-07-11 20:37:09', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531396897610', '2018-07-12', 'USER004', '胡浪', '25', '20:01:37', '2018-07-12 20:01:38', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531399429611', '2018-07-12', 'USER005', '张琪', '25', '20:43:49', '2018-07-12 20:43:50', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531399486875', '2018-07-12', 'USER001', '王林柱', '25', '20:44:46', '2018-07-12 20:44:47', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531399579758', '2018-07-12', 'USER002', '郭凡', '25', '20:46:19', '2018-07-12 20:46:20', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531399655801', '2018-07-12', 'USER003', '赫鑫', '25', '20:47:35', '2018-07-12 20:47:36', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531399866813', '2018-07-12', 'USER1527163402524', '袁哲', '25', '20:51:06', '2018-07-12 20:51:07', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531476602711', '2018-07-13', 'USER004', '胡浪', '25', '18:10:02', '2018-07-13 18:10:03', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531476942210', '2018-07-13', 'USER005', '张琪', '25', '18:15:42', '2018-07-13 18:15:42', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531477145378', '2018-07-13', 'USER002', '郭凡', '25', '18:19:05', '2018-07-13 18:19:05', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531477217639', '2018-07-13', 'USER1527163402524', '袁哲', '25', '18:20:17', '2018-07-13 18:20:18', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531478047681', '2018-07-13', 'USER003', '赫鑫', '25', '18:34:07', '2018-07-13 18:34:08', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531736533341', '2018-07-16', 'USER005', '张琪', '25', '18:22:13', '2018-07-16 18:22:13', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531745616892', '2018-07-16', 'USER1527163402524', '袁哲', '25', '20:53:36', '2018-07-16 20:53:37', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531746310313', '2018-07-16', 'USER003', '赫鑫', '25', '21:05:10', '2018-07-16 21:05:10', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531746367500', '2018-07-16', 'USER002', '郭凡', '25', '21:06:07', '2018-07-16 21:06:08', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531746591852', '2018-07-16', 'USER001', '王林柱', '25', '21:09:51', '2018-07-16 21:09:52', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531746678217', '2018-07-16', 'USER004', '胡浪', '25', '21:11:18', '2018-07-16 21:11:18', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531835889424', '2018-07-17', 'USER002', '郭凡', '25', '21:58:09', '2018-07-17 21:58:09', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531836048082', '2018-07-17', 'USER004', '胡浪', '25', '22:00:48', '2018-07-17 22:00:48', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531836082705', '2018-07-17', 'USER005', '张琪', '25', '22:01:22', '2018-07-17 22:01:23', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531836086778', '2018-07-17', 'USER001', '王林柱', '25', '22:01:26', '2018-07-17 22:01:27', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531837058150', '2018-07-17', 'USER003', '赫鑫', '25', '22:17:38', '2018-07-17 22:17:38', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531837308897', '2018-07-17', 'USER1527163402524', '袁哲', '25', '22:21:48', '2018-07-17 22:21:49', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531917170631', '2018-07-18', 'USER004', '胡浪', '25', '20:32:50', '2018-07-18 20:32:51', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531917631102', '2018-07-18', 'USER005', '张琪', '25', '20:40:31', '2018-07-18 20:40:31', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531918845567', '2018-07-18', 'USER1527163402524', '袁哲', '25', '21:00:45', '2018-07-18 21:00:46', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531919002164', '2018-07-18', 'USER002', '郭凡', '25', '21:03:22', '2018-07-18 21:03:22', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531924682606', '2018-07-18', 'USER001', '王林柱', '25', '22:38:02', '2018-07-18 22:38:03', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1531924717302', '2018-07-18', 'USER003', '赫鑫', '25', '22:38:37', '2018-07-18 22:38:37', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532001924343', '2018-07-19', 'USER005', '张琪', '25', '20:05:24', '2018-07-19 20:05:24', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532002490068', '2018-07-19', 'USER004', '胡浪', '25', '20:14:50', '2018-07-19 20:14:50', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532004301175', '2018-07-19', 'USER1527163402524', '袁哲', '25', '20:45:01', '2018-07-19 20:45:01', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532005574472', '2018-07-19', 'USER002', '郭凡', '25', '21:06:14', '2018-07-19 21:06:14', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532005882785', '2018-07-19', 'USER001', '王林柱', '25', '21:11:22', '2018-07-19 21:11:23', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532008764631', '2018-07-19', 'USER003', '赫鑫', '25', '21:59:24', '2018-07-19 21:59:25', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532080994353', '2018-07-20', 'USER005', '张琪', '25', '18:03:14', '2018-07-20 18:03:14', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532081116308', '2018-07-20', 'USER1527163402524', '袁哲', '25', '18:05:16', '2018-07-20 18:05:16', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532081496155', '2018-07-20', 'USER003', '赫鑫', '25', '18:11:36', '2018-07-20 18:11:36', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532081508802', '2018-07-20', 'USER002', '郭凡', '25', '18:11:48', '2018-07-20 18:11:49', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532349246847', '2018-07-23', 'USER005', '张琪', '25', '20:34:06', '2018-07-23 20:34:07', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532350846843', '2018-07-23', 'USER004', '胡浪', '25', '21:00:46', '2018-07-23 21:00:47', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532350961676', '2018-07-23', 'USER001', '王林柱', '25', '21:02:41', '2018-07-23 21:02:42', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532351541206', '2018-07-23', 'USER1527163402524', '袁哲', '25', '21:12:21', '2018-07-23 21:12:21', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532360313179', '2018-07-23', 'USER003', '赫鑫', '25', '23:38:33', '2018-07-23 23:38:33', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532437264827', '2018-07-24', 'USER004', '胡浪', '25', '21:01:04', '2018-07-24 21:01:05', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532437277931', '2018-07-24', 'USER001', '王林柱', '25', '21:01:17', '2018-07-24 21:01:18', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532437368198', '2018-07-24', 'USER002', '郭凡', '25', '21:02:48', '2018-07-24 21:02:48', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532437406628', '2018-07-24', 'USER005', '张琪', '25', '21:03:26', '2018-07-24 21:03:27', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532437474491', '2018-07-24', 'USER003', '赫鑫', '25', '21:04:34', '2018-07-24 21:04:34', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532437649278', '2018-07-24', 'USER1527163402524', '袁哲', '25', '21:07:29', '2018-07-24 21:07:29', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532520104426', '2018-07-25', 'USER1527163402524', '袁哲', '25', '20:01:44', '2018-07-25 20:01:44', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532523838474', '2018-07-23', 'USER002', '郭凡', '25', '21:03:58', '2018-07-25 21:03:58', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532523852385', '2018-07-25', 'USER002', '郭凡', '25', '21:04:12', '2018-07-25 21:04:12', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532524500486', '2018-07-25', 'USER005', '张琪', '25', '21:15:00', '2018-07-25 21:15:00', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532524618778', '2018-07-25', 'USER001', '王林柱', '25', '21:16:58', '2018-07-25 21:16:59', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532525438708', '2018-07-25', 'USER003', '赫鑫', '25', '21:30:38', '2018-07-25 21:30:39', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532525509837', '2018-07-25', 'USER004', '胡浪', '25', '21:31:49', '2018-07-25 21:31:50', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532610064316', '2018-07-26', 'USER1527163402524', '袁哲', '25', '21:01:04', '2018-07-26 21:01:04', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532611691661', '2018-07-26', 'USER005', '张琪', '25', '21:28:11', '2018-07-26 21:28:12', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532611736925', '2018-07-26', 'USER002', '郭凡', '25', '21:28:56', '2018-07-26 21:28:57', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532611754904', '2018-07-26', 'USER001', '王林柱', '25', '21:29:14', '2018-07-26 21:29:15', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532611758025', '2018-07-26', 'USER003', '赫鑫', '25', '21:29:18', '2018-07-26 21:29:18', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532685418475', '2018-07-27', 'USER002', '郭凡', '25', '17:56:58', '2018-07-27 17:56:58', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532685642999', '2018-07-27', 'USER005', '张琪', '25', '18:00:42', '2018-07-27 18:00:43', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532686649087', '2018-07-27', 'USER001', '王林柱', '25', '18:17:29', '2018-07-27 18:17:29', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532688399128', '2018-07-27', 'USER1527163402524', '袁哲', '25', '18:46:39', '2018-07-27 18:46:39', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532691967661', '2018-07-27', 'USER003', '赫鑫', '25', '19:46:07', '2018-07-27 19:46:08', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532950493604', '2018-07-30', 'USER004', '胡浪', '25', '19:34:53', '2018-07-30 19:34:54', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532951701957', '2018-07-30', 'USER1532950925725', '颜苗苗', '25', '19:55:01', '2018-07-30 19:55:02', 'USER1532950925725', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532952043694', '2018-07-30', 'USER003', '赫鑫', '25', '20:00:43', '2018-07-30 20:00:44', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532952134457', '2018-07-30', 'USER001', '王林柱', '25', '20:02:14', '2018-07-30 20:02:14', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532952276979', '2018-07-30', 'USER002', '郭凡', '25', '20:04:36', '2018-07-30 20:04:37', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532952392116', '2018-07-30', 'USER1527163402524', '袁哲', '25', '20:06:32', '2018-07-30 20:06:32', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1532953287378', '2018-07-30', 'USER005', '张琪', '25', '20:21:27', '2018-07-30 20:21:27', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533032539802', '2018-07-31', 'USER1533007165940', '白友扬', '36', '18:22:19', '2018-07-31 18:22:20', 'USER1533007165940', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533034877269', '2018-07-31', 'USER1532950925725', '颜苗苗', '25', '19:01:17', '2018-07-31 19:01:17', 'USER1532950925725', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533037423836', '2018-07-31', 'USER001', '王林柱', '25', '19:43:43', '2018-07-31 19:43:44', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533042442709', '2018-07-31', 'USER004', '胡浪', '25', '21:07:22', '2018-07-31 21:07:23', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533042498691', '2018-07-31', 'USER003', '赫鑫', '25', '21:08:18', '2018-07-31 21:08:19', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533042633405', '2018-07-31', 'USER002', '郭凡', '25', '21:10:33', '2018-07-31 21:10:33', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533042719472', '2018-07-31', 'USER005', '张琪', '25', '21:11:59', '2018-07-31 21:11:59', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533042750879', '2018-07-31', 'USER1527163402524', '袁哲', '25', '21:12:30', '2018-07-31 21:12:31', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533125378635', '2018-08-01', 'USER002', '郭凡', '25', '20:09:38', '2018-08-01 20:09:39', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533127118106', '2018-08-01', 'USER005', '张琪', '25', '20:38:38', '2018-08-01 20:38:38', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533128455713', '2018-08-01', 'USER003', '赫鑫', '25', '21:00:55', '2018-08-01 21:00:56', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533128635401', '2018-08-01', 'USER1527163402524', '袁哲', '25', '21:03:55', '2018-08-01 21:03:55', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533128641363', '2018-08-01', 'USER004', '胡浪', '25', '21:04:01', '2018-08-01 21:04:01', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533128817353', '2018-08-01', 'USER001', '王林柱', '25', '21:06:57', '2018-08-01 21:06:57', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533213092123', '2018-08-02', 'USER004', '胡浪', '25', '20:31:32', '2018-08-02 20:31:32', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533213159597', '2018-08-02', 'USER003', '赫鑫', '25', '20:32:39', '2018-08-02 20:32:40', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533213167172', '2018-08-02', 'USER005', '张琪', '25', '20:32:47', '2018-08-02 20:32:47', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533213216120', '2018-08-02', 'USER001', '王林柱', '25', '20:33:36', '2018-08-02 20:33:36', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533213366145', '2018-08-02', 'USER002', '郭凡', '25', '20:36:06', '2018-08-02 20:36:06', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533213385074', '2018-08-02', 'USER1527163402524', '袁哲', '25', '20:36:25', '2018-08-02 20:36:25', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533221376622', '2018-08-02', 'USER1532950925725', '颜苗苗', '25', '22:49:36', '2018-08-02 22:49:37', 'USER1532950925725', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533292103545', '2018-08-03', 'USER1527163402524', '袁哲', '25', '18:28:23', '2018-08-03 18:28:24', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533297654906', '2018-08-03', 'USER004', '胡浪', '25', '20:00:54', '2018-08-03 20:00:55', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533297953619', '2018-08-03', 'USER002', '郭凡', '25', '20:05:53', '2018-08-03 20:05:54', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533298003015', '2018-08-03', 'USER005', '张琪', '25', '20:06:43', '2018-08-03 20:06:43', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533298021250', '2018-08-03', 'USER003', '赫鑫', '25', '20:07:01', '2018-08-03 20:07:01', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533298081773', '2018-08-03', 'USER001', '王林柱', '25', '20:08:01', '2018-08-03 20:08:02', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533385412077', '2018-08-04', 'USER1532950925725', '颜苗苗', '25', '20:23:32', '2018-08-04 20:23:32', 'USER1532950925725', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533558645199', '2018-08-06', 'USER004', '胡浪', '25', '20:30:45', '2018-08-06 20:30:45', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533559222866', '2018-08-06', 'USER003', '赫鑫', '25', '20:40:22', '2018-08-06 20:40:23', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533559238963', '2018-08-06', 'USER002', '郭凡', '25', '20:40:38', '2018-08-06 20:40:39', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533559649444', '2018-08-06', 'USER005', '张琪', '25', '20:47:29', '2018-08-06 20:47:29', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533559932445', '2018-08-06', 'USER1527163402524', '袁哲', '25', '20:52:12', '2018-08-06 20:52:12', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533560002481', '2018-08-06', 'USER1527163402524', '袁哲', '25', '20:53:22', '2018-08-06 20:53:22', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533560415012', '2018-08-06', 'USER1532950925725', '颜苗苗', '25', '21:00:15', '2018-08-06 21:00:15', 'USER1532950925725', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533609771850', '2018-08-07', 'USER1533007678552', '梁宁莉', '36', '10:42:51', '2018-08-07 10:42:52', 'USER1533007678552', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533636424362', '2018-08-07', 'USER1532950925725', '颜苗苗', '25', '18:07:04', '2018-08-07 18:07:04', 'USER1532950925725', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533644074182', '2018-08-07', 'USER1527163402524', '袁哲', '25', '20:14:34', '2018-08-07 20:14:34', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533648619428', '2018-08-07', 'USER001', '王林柱', '25', '21:30:19', '2018-08-07 21:30:19', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533648644956', '2018-08-07', 'USER002', '郭凡', '25', '21:30:44', '2018-08-07 21:30:45', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533648649708', '2018-08-07', 'USER004', '胡浪', '25', '21:30:49', '2018-08-07 21:30:50', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533648708372', '2018-08-07', 'USER003', '赫鑫', '25', '21:31:48', '2018-08-07 21:31:48', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533648980190', '2018-08-07', 'USER005', '张琪', '25', '21:36:20', '2018-08-07 21:36:20', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533724266022', '2018-08-08', 'USER1532950925725', '颜苗苗', '25', '18:31:06', '2018-08-08 18:31:06', 'USER1532950925725', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533728575155', '2018-08-08', 'USER004', '胡浪', '25', '19:42:55', '2018-08-08 19:42:55', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533729987022', '2018-08-08', 'USER005', '张琪', '25', '20:06:27', '2018-08-08 20:06:27', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533730633164', '2018-08-08', 'USER1527163402524', '袁哲', '25', '20:17:13', '2018-08-08 20:17:13', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533733354177', '2018-08-08', 'USER001', '王林柱', '25', '21:02:34', '2018-08-08 21:02:34', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533734256908', '2018-08-08', 'USER003', '赫鑫', '25', '21:17:36', '2018-08-08 21:17:37', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533735123881', '2018-08-08', 'USER002', '郭凡', '25', '21:32:03', '2018-08-08 21:32:04', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533809122546', '2018-08-09', 'USER1532950925725', '颜苗苗', '25', '18:05:22', '2018-08-09 18:05:23', 'USER1532950925725', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533812701406', '2018-08-09', 'USER004', '胡浪', '25', '19:05:01', '2018-08-09 19:05:01', 'USER004', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533812752811', '2018-08-09', 'USER001', '王林柱', '25', '19:05:52', '2018-08-09 19:05:53', 'USER001', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533812788766', '2018-08-09', 'USER003', '赫鑫', '25', '19:06:28', '2018-08-09 19:06:29', 'USER003', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533813022229', '2018-08-09', 'USER005', '张琪', '25', '19:10:22', '2018-08-09 19:10:22', 'USER005', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533813101932', '2018-08-09', 'USER002', '郭凡', '25', '19:11:41', '2018-08-09 19:11:42', 'USER002', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533825248439', '2018-08-09', 'USER1527163402524', '袁哲', '25', '22:34:08', '2018-08-09 22:34:08', 'USER1527163402524', null, null, null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533897016503', '2018-08-10', 'USER1532950925725', '颜苗苗', '25', '18:30:16', '2018-08-10 18:30:17', 'USER1532950925725', '2018-08-10 18:30:17', 'USER1532950925725', null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533902511914', '2018-08-10', 'USER003', '赫鑫', '25', '20:01:51', '2018-08-10 20:01:52', 'USER003', '2018-08-10 20:01:52', 'USER003', null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533903313767', '2018-08-10', 'USER001', '王林柱', '25', '20:15:13', '2018-08-10 20:15:14', 'USER001', '2018-08-10 20:15:14', 'USER001', null, null, null);
INSERT INTO `t_daily` VALUES ('RB1533904272618', '2018-08-10', 'USER004', '胡浪', '25', '20:31:12', '2018-08-10 20:31:13', 'USER004', '2018-08-10 20:31:13', 'USER004', null, null, null);

-- ----------------------------
-- Table structure for `t_daily_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_daily_detail`;
CREATE TABLE `t_daily_detail` (
  `daily_detail_id` varchar(20) NOT NULL COMMENT '日报详情ID',
  `daily_id` varchar(20) DEFAULT NULL COMMENT '日报ID',
  `daily_no` int(11) DEFAULT NULL COMMENT '日报序号',
  `daily_content` varchar(128) DEFAULT NULL COMMENT '日报内容',
  `daily_percent` int(3) DEFAULT NULL COMMENT '完成百分比',
  `done_date` date DEFAULT NULL COMMENT '计划完成时间',
  `problem` varchar(255) DEFAULT NULL COMMENT '工作存在问题',
  `next_work_plan` varchar(255) DEFAULT '' COMMENT '下周工作计划',
  `work_type` varchar(2) DEFAULT NULL COMMENT '工作类型',
  `execution` varchar(2) DEFAULT NULL COMMENT '完成情况',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新者',
  `remark1` varchar(32) DEFAULT NULL COMMENT '备用字段1',
  `remark2` varchar(64) DEFAULT NULL COMMENT '备用字段2',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (`daily_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_daily_detail
-- ----------------------------
INSERT INTO `t_daily_detail` VALUES ('RBD1522672213278', '1111111111111', null, '客户信息表、委托人和干系人关联表设计。', '100', '2018-04-02', '', '', '02', '03', '2018-04-02 20:30:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522672246462', 'RB1522672186030', null, '家族信托管理端Dubbo端测试', '50', '2018-04-03', '', '', '04', '02', '2018-04-02 20:30:46', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522672274558', 'RB1522672139485', null, '合同管理-家族信托合同管理-委托人信息页面的优化。', '100', '2018-04-02', '', '', '03', '03', '2018-04-02 20:31:15', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522672332261', 'RB1522672139485', null, '委托人和干系人关联表的建立、domain和dao的建立。', '100', '2018-04-02', '', '', '03', '03', '2018-04-02 20:32:12', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522672334237', 'RB1522672236854', null, 'dubbo重构项目测试', '50', '2018-04-03', '云桌面搭建项目有问题，花了半天时间解决', '', '04', '02', '2018-04-02 20:32:14', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522672358919', 'RB1522672210389', null, '家族信托dubbo框架保障金管理和费用管理测试', '100', '2018-04-02', '了解学习dubbo框架', '', '04', '03', '2018-04-02 20:32:39', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522672395293', 'RB1522672139485', null, 'dubbo测试Back端项目。', '30', '2018-04-03', '', '', '04', '02', '2018-04-02 20:33:15', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522672422539', 'RB1522672210389', null, '银行专户和保障金信息需求讨论', '100', '2018-04-02', '', '', '07', '03', '2018-04-02 20:33:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522672439629', 'RB1522672284233', null, '修改财产追加确认函模板', '100', '2018-04-02', '', '', '03', '03', '2018-04-02 20:34:00', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522672647385', 'RB1522672210389', null, '家族信托dubbo框架测试：合作方信息管理', '60', '2018-04-03', '', '', '04', '01', '2018-04-02 20:37:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522672663638', 'RB1522672284233', null, '家族Dubbo系统测试', '30', '2018-04-03', '搭架家族Dubbo系统启动不了，jar包有问题，最后解决了。', '', '04', '02', '2018-04-02 20:37:44', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522758681719', 'RB1522758641979', null, '家族信托dubbo框架测试：合作方信息管理', '100', '2018-04-03', '', '', '04', '03', '2018-04-03 20:31:22', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522758731109', 'RB1522758641979', null, '完成dubbo测试文档填写', '100', '2018-04-03', '', '', '04', '03', '2018-04-03 20:32:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522758871714', 'RB1522758756602', null, 'dubbo测试Back端项目。', '90', '2018-04-04', '数据库无响应，等数据库修复，继续进行测试。', '', '04', '02', '2018-04-03 20:34:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522759049576', 'RB1522759016638', null, 'dubbo重构项目测试', '100', '2018-04-03', '', '', '04', '03', '2018-04-03 20:37:30', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1522759163234', 'RB1522759008998', null, '家族Dubbo系统测试', '100', '2018-04-03', '', '', '04', '03', '2018-04-03 20:39:23', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523183037111', 'RB1523182951026', null, '产品数据库设计，RP设计', '100', '2018-04-08', '产品开放期、封闭期相关暂时不做', '', '02', '03', '2018-04-08 18:23:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523183080358', 'RB1523182951026', null, '产品改造页面开发', '20', '2018-04-10', '', '', '03', '02', '2018-04-08 18:24:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523183086870', 'RB1523182658111', null, '完成追加、赎回、分配确认函通知配置设计', '100', '2018-04-08', '', '', '02', '03', '2018-04-08 18:24:47', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523183345214', 'RB1523183280559', null, '合同管理干系人信息维护改造', '80', '2018-04-09', '', '', '03', '02', '2018-04-08 18:29:05', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523183418434', 'RB1523183280559', null, '家族信托fore端财务报表模块dubbo拆分', '20', '2018-04-09', '', '', '03', '02', '2018-04-08 18:30:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523188067847', 'RB1523187892019', null, 'Back端财产分配管理的改造。', '100', '2018-04-08', '', '', '03', '03', '2018-04-08 19:47:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523240727803', 'RB1523240677354', null, '平安银行估值信息推送需求开发', '100', '2018-04-03', '', '', '03', '03', '2018-04-09 10:25:28', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523242572143', 'RB1523242446897', null, 'dubbo重构项目对李刘娟修复的功能进行测试', '100', '2018-04-04', '', '', '04', '03', '2018-04-09 10:56:12', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523242647825', 'RB1523242446897', null, '产品改造数据库设计，RP设计', '80', '2018-04-08', '产品的开放期和封闭期逻辑较复杂', '完成数据库和RP设计，进行页面开发', '02', '02', '2018-04-09 10:57:28', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523278599663', 'RB1523278535574', null, '确认函通知功能开发', '20', '2018-04-10', '', '', '03', '02', '2018-04-09 20:56:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523278723731', 'RB1523278654215', null, '产品改造相关数据库表新增、更新', '100', '2018-04-09', '', '', '03', '03', '2018-04-09 20:58:44', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523278724880', 'RB1523278681639', null, '讨论dubbo集成测试任务分配会议', '100', '2018-04-09', '', '', '07', '03', '2018-04-09 20:58:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523278777432', 'RB1523278654215', null, '产品改造页面开发', '30', '2018-04-10', '后面一周要测试dubbo架构项目，该项开发工作暂停', '', '03', '02', '2018-04-09 20:59:37', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523278788943', 'RB1523278681639', null, '保障金缴纳历史信息分析取数来源', '100', '2018-04-09', '', '', '01', '03', '2018-04-09 20:59:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523278855320', 'RB1523278805004', null, '合同管理干系人信息维护改造', '100', '2018-04-09', '', '', '03', '03', '2018-04-09 21:00:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523278988400', 'RB1523278805004', null, '家族信托fore端财务报表模块dubbo拆分', '100', '2018-04-09', '', '', '03', '03', '2018-04-09 21:03:08', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523279076901', 'RB1523278988315', null, '关于dubbo测试案例的说明', '100', '2018-04-09', '', '', '07', '03', '2018-04-09 21:04:37', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523363837090', 'RB1523363705047', null, 'dubbo集成测试并编写测试案例', '80', '2018-04-11', '', '', '04', '02', '2018-04-10 20:37:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523364126276', 'RB1523364065022', null, '管理端dubbo服务测试案例', '50', '2018-04-11', '', '', '04', '02', '2018-04-10 20:42:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523364147799', 'RB1523364029817', null, '完成Dubbo项目的测试任务', '100', '2018-04-10', '', '', '04', '03', '2018-04-10 20:42:28', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523364161540', 'RB1523363982071', null, 'dubbo重构项目测试', '20', '2018-04-13', '', '', '04', '02', '2018-04-10 20:42:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523364364874', 'RB1523364298910', null, '家族信托fore端信托财产管理模块dubbo拆分', '100', '2018-04-10', '', '', '03', '03', '2018-04-10 20:46:05', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523364469870', 'RB1523364298910', null, '家族信托back端期间指令管理dubbo测试', '30', '2018-04-11', '财产追加指令审核时向TA系统推送指令不通', '', '04', '02', '2018-04-10 20:47:50', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523449639217', 'RB1523449611042', null, 'dubbo集成测试并编写测试案例', '100', '2018-04-11', '', '', '04', '03', '2018-04-11 20:27:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523449673225', 'RB1523449611042', null, '保障金缴纳历史信息查询', '50', '2018-04-13', '', '', '03', '02', '2018-04-11 20:27:53', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523449909121', 'RB1523449810326', null, '1、家族信托项目测试Dubbo框架', '90', '2018-04-12', '', '', '04', '02', '2018-04-11 20:31:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523449947178', 'RB1523449810326', null, '家族信托项目门户端信托意向拆分Dubbo服务', '70', '2018-04-12', '', '', '03', '02', '2018-04-11 20:32:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523449976070', 'RB1523449907376', null, 'dubbo重构项目测试', '50', '2018-04-13', '数据库总是挂掉，影响测试进度', '', '04', '02', '2018-04-11 20:32:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523450189146', 'RB1523450132217', null, '管理端dubbo服务测试案例', '100', '2018-04-11', '', '', '04', '03', '2018-04-11 20:36:29', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523450265252', 'RB1523450167960', null, '家族信托back端期间指令管理模块dubbo拆分测试', '70', '2018-04-12', '审核时发送指令到TA系统不通', '', '04', '02', '2018-04-11 20:37:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523535446666', 'RB1523535384130', null, '家族信托信托意向功能Dubbo拆分', '100', '2018-04-12', '', '', '04', '03', '2018-04-12 20:17:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523537278375', 'RB1523537159972', null, '家族信托dubbo测试进度会议', '100', null, '', '', '03', '03', '2018-04-12 20:47:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523537332643', 'RB1523537159972', null, '熟悉dubbo框架，熟悉学习信托业务', '100', null, '', '', '04', '03', '2018-04-12 20:48:53', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523537543716', 'RB1523537441990', null, '家族信托back端期间指令管理模块dubbo拆分测试', '90', '2018-04-13', 'TCMP系统无法访问', '', '04', '02', '2018-04-12 20:52:24', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523537957830', 'RB1523537889930', null, '保障金缴纳历史信息查询', '100', '2018-04-12', '', '', '03', '03', '2018-04-12 20:59:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523538001369', 'RB1523537889930', null, '保障金缴纳历史明细信息查询', '100', '2018-04-12', '和娟姐确认保障金缴纳历史明细信息正确性', '', '03', '03', '2018-04-12 21:00:01', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523538214456', 'RB1523538193675', null, 'dubbo重构项目测试', '80', '2018-04-13', '', '', '04', '02', '2018-04-12 21:03:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523612687681', 'RB1523612583034', null, '23', '13', '2018-04-02', '', '', '03', '02', '2018-04-13 17:44:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523621202426', 'RB1523621110139', null, '家族信托back端财产追加指令及分配指令确认函模板改造', '100', '2018-04-13', '', '', '03', '03', '2018-04-13 20:06:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523621334653', 'RB1523621110139', null, '家族信托back端财务报表模块新增导入估值功能', '90', '2018-04-16', '', '家族信托fore端dubbo拆分测试', '03', '02', '2018-04-13 20:08:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523621766420', 'RB1523621738233', null, '熟悉dubbo框架，熟悉学习信托业务', '100', '2018-04-13', '', '', '04', '03', '2018-04-13 20:16:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523622236786', 'RB1523621982503', null, '保障金缴纳历史明细信息查询', '80', '2018-04-16', '页面细节方面的测试验证修改', '', '04', '02', '2018-04-13 20:23:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523622306869', 'RB1523622045469', null, '家族信托Fore端Dubbo拆分测试', '30', '2018-04-13', '', '', '01', '02', '2018-04-13 20:25:07', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523622474616', 'RB1523622432138', null, 'dubbo重构项目测试', '100', '2018-04-13', '', 'fore端dubbo重构项目测试', '04', '03', '2018-04-13 20:27:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523882145176', 'RB1523882089990', null, '有关测试进度和管理端发布事宜的会议', '100', '2018-04-16', '', '', '07', '03', '2018-04-16 20:35:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523882147305', 'RB1523882092124', null, '家族信托项目Fore端首页、资金端、信托意向测试', '50', '2018-04-16', '', '', '04', '02', '2018-04-16 20:35:47', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523882156525', 'RB1523882095276', null, '保障金缴纳历史以及明细查询移植dubbo框架', '50', '2018-04-17', '', '', '03', '02', '2018-04-16 20:35:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523882197653', 'RB1523882161722', null, 'dubbo重构项目fore端接口测试', '30', '2018-04-16', '', '', '04', '02', '2018-04-16 20:36:38', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523882199959', 'RB1523882095276', null, '家族前端dubbo接口联通测试和集成测试', '40', '2018-04-19', '', '', '04', '02', '2018-04-16 20:36:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523882229043', 'RB1523882161722', null, 'dubbo重构项目back端测试', '100', '2018-04-16', '', '', '01', '03', '2018-04-16 20:37:09', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523882239984', 'RB1523882089990', null, '熟悉dubbo框架，熟悉fore端信托业务，准备测试工作。', '100', '2018-04-16', '', '', '04', '03', '2018-04-16 20:37:20', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523882241971', 'RB1523882095276', null, '测试进度和周四管理端的发布事宜会议', '100', '2018-04-16', '', '', '07', '03', '2018-04-16 20:37:22', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523882675071', 'RB1523882619522', null, '修改项目披露报告生成PDF方法', '100', '2018-04-16', '', '', '03', '03', '2018-04-16 20:44:35', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523882751890', 'RB1523882619522', null, '家族信托fore端接口连通性测试', '40', '2018-04-16', '', '', '04', '02', '2018-04-16 20:45:52', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523969231026', 'RB1523969166844', null, 'dubbo重构门户端项目接口连通性测试', '100', '2018-04-17', '', '', '04', '03', '2018-04-17 20:47:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523969324272', 'RB1523969269587', null, '家族信托管理端确认函通知功能开发', '30', '2018-04-20', '', '', '03', '02', '2018-04-17 20:48:44', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523969397481', 'RB1523969374582', null, '保障金缴纳历史以及明细查询移植dubbo框架', '100', '2018-04-17', '', '', '03', '03', '2018-04-17 20:49:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523969416591', 'RB1523969374582', null, '家族前端dubbo接口联通测试和集成测试', '100', '2018-04-17', '', '', '04', '03', '2018-04-17 20:50:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523969417020', 'RB1523969358688', null, 'fore端dubbo服务连通测试', '100', '2018-04-17', '', '', '04', '03', '2018-04-17 20:50:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523969515346', 'RB1523969500582', null, '家族信托fore端接口连通性测试', '100', '2018-04-17', '', '', '04', '03', '2018-04-17 20:51:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523969555754', 'RB1523969500582', null, '修改项目管理-披露报告模板', '100', '2018-04-17', '', '', '03', '03', '2018-04-17 20:52:36', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1523969607507', 'RB1523969500582', null, '家族信托back端财产指令管理测试', '100', '2018-04-17', '', '', '04', '03', '2018-04-17 20:53:28', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524054917314', 'RB1524054869453', null, 'fore端dubbo案例测试', '90', '2018-04-19', '', '', '04', '02', '2018-04-18 20:35:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524055020035', 'RB1524054964361', null, 'dubbo重构项目fore端测试', '50', '2018-04-18', '', '', '04', '02', '2018-04-18 20:37:00', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524055104623', 'RB1524055093251', null, '家族信托管理端确认函通知功能开发', '50', '2018-04-18', '', '', '03', '02', '2018-04-18 20:38:25', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524055136759', 'RB1524055093251', null, '家族信托项目组例会', '100', '2018-04-18', '', '', '07', null, '2018-04-18 20:38:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524055209205', 'RB1524055152373', null, '家族信托fore端期间指令管理测试', '100', '2018-04-18', '', '', '04', '03', '2018-04-18 20:40:09', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524141483491', 'RB1524141465864', null, '修改项目管理-披露报告模板', '100', '2018-04-19', '', '', '03', '03', '2018-04-19 20:38:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524141522839', 'RB1524141465864', null, '家族信托back端dubbo集成测试', '100', '2018-04-19', '', '', '04', '03', '2018-04-19 20:38:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524141534494', 'RB1524141478996', null, 'dubbo测试环境上线前最后测试', '100', '2018-04-19', '保障金缴纳历史明细信息查询SQL语句的调整', '', '04', '03', '2018-04-19 20:38:54', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524141553437', 'RB1524141537405', null, 'fore端dubbo案例测试', '100', '2018-04-19', '', '', '04', '03', '2018-04-19 20:39:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524141587910', 'RB1524141537405', null, '测试环境Back端dubbo案例测试', '100', '2018-04-19', '', '', '04', '03', '2018-04-19 20:39:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524141686699', 'RB1524141662271', null, '家族信托管理端确认函通知功能开发', '80', '2018-04-19', '', '', '03', '02', '2018-04-19 20:41:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524141750583', 'RB1524141537405', null, 'Back端优化部门新增名称为空校验、项目角色新增角色名称角色名称为空校验、系统角色新增角色名称角色名称为空校验', '100', '2018-04-19', '', '', '03', '03', '2018-04-19 20:42:31', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524142112892', 'RB1524142097308', null, 'dubbo重构项目测试', '100', '2018-04-19', '', '', '04', '03', '2018-04-19 20:48:33', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524224031620', 'RB1524212223030', null, '家族信托管理端确认函通知功能开发', '90', '2018-04-20', '', '', '03', '02', '2018-04-20 19:33:52', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524224084037', 'RB1524212223030', null, '家族信托项目组工作计划会', '100', '2018-04-20', '', '', '07', '03', '2018-04-20 19:34:44', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524224113489', 'RB1524224014487', null, 'Back端0226的功能移动到Dubbo上', '30', '2018-04-24', '', '', '03', '02', '2018-04-20 19:35:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524224239779', 'RB1524224119575', null, '修改项目披露报告模板', '100', '2018-04-20', '', '', '03', '03', '2018-04-20 19:37:20', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524224256221', 'RB1524224221973', null, 'dubbo重构项目fore端测试文档整合', '100', '2018-04-20', '', '产品页面改造开发', '04', '03', '2018-04-20 19:37:36', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524224280212', 'RB1524224221973', null, '产品页面开发', '50', '2018-04-20', '', '', '03', '02', '2018-04-20 19:38:00', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524488609107', 'RB1524488596259', null, '门户端测试', '100', '2018-04-23', '', '', '04', '03', '2018-04-23 21:03:29', null, '2018-05-02 10:43:36', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524488613217', 'RB1524488588065', null, 'Back端合同管理0226的功能移动到Dubbo上', '100', '2018-04-23', '', '', '03', '03', '2018-04-23 21:03:33', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524488644802', 'RB1524488568404', null, '银行基金账户维护接口通讯详细设计流程图', '100', '2018-04-24', '', '', '02', '02', '2018-04-23 21:04:05', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524489133970', 'RB1524488679493', null, '家族信托fore端测试环境测试', '90', '2018-04-23', '期间指令管理中的发布及申功能报错', '', '04', '02', '2018-04-23 21:12:14', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524489230319', 'RB1524489190567', null, '家族信托管理端确认函通知功能开发', '90', '2018-04-23', '', '', '03', '02', '2018-04-23 21:13:50', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524489271724', 'RB1524489190567', null, '家族信托管理端追加、赎回、分配、页面要素分析梳理', '100', '2018-04-23', '', '', '01', '03', '2018-04-23 21:14:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524569920224', 'RB1524569861200', null, 'Back端财产分配的修复并移动到Dubbo上。', '100', '2018-04-24', '', '', '03', '03', '2018-04-24 19:38:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524570752856', 'RB1524570701189', null, '家族信托管理端电子签章功能开发', '20', '2018-04-24', '', '', '03', '02', '2018-04-24 19:52:33', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524571019264', 'RB1524570969084', null, '投配页面RP改造', '20', '2018-04-24', '', '', '02', '02', '2018-04-24 19:56:59', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524571055848', 'RB1524570846363', null, '干系人信息维护功能移到dubbo上', '100', '2018-04-24', '', '', '03', '03', '2018-04-24 19:57:36', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524663529264', 'RB1524663478790', null, '投配指令页面改造RP设计', '80', '2018-04-25', '', '', '02', '02', '2018-04-25 21:38:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524663556663', 'RB1524663506267', null, '银行基金账户维护接口通讯测试开发', '70', '2018-04-25', '', '', '03', '02', '2018-04-25 21:39:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524663556664', 'RB1524663506267', null, '页面元素的规范化及投配指令业务流程的会议', '100', '2018-04-25', null, '', '07', '03', '2018-04-25 09:17:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524663564953', 'RB1524663486036', null, '家族信托Service服务开发电子印章功能', '60', '2018-04-25', '', '', '03', '02', '2018-04-25 21:39:25', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524663567750', 'RB1524663478790', null, '项目页面改造相关会议', '100', '2018-04-25', '', '', '07', '03', '2018-04-25 21:39:28', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524663632744', 'RB1524663506267', null, '前端页面代码规范讲解和投配流程讲解', '100', '2018-04-25', '', '', '07', '03', '2018-04-25 21:40:33', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524663655404', 'RB1524663595081', null, '费用支付申请及审核的RP设计', '50', '2018-04-26', '', '', '02', '02', '2018-04-25 21:40:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524663715279', 'RB1524663585608', null, '财产追加管理、财产赎回管理、财产分配管理RP图设计', '100', '2018-04-25', '', '', '02', '03', '2018-04-25 21:41:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524663750870', 'RB1524663595081', null, '页面元素的规范化及投配指令业务流程的会议', '100', '2018-04-25', '', '', '07', '03', '2018-04-25 21:42:31', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524746629175', 'RB1524746553709', null, 'FA系统流程讲解学习', '100', '2018-04-26', '', '', '07', '03', '2018-04-26 20:43:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524746653362', 'RB1524746613598', null, '家族信托Service确认函通知功能开发', '90', '2018-04-26', '', '', '03', '02', '2018-04-26 20:44:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524746712037', 'RB1524746613598', null, '与运营部讨论披露报告相关流程和投配优化', '100', '2018-04-26', '', '', '07', '03', '2018-04-26 20:45:12', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524746848409', 'RB1524746806683', null, '投配指令页面改造RP设计', '100', '2018-04-26', '', '', '02', '03', '2018-04-26 20:47:28', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524746898020', 'RB1524746806683', null, '投配指令管理页面改造', '20', '2018-04-26', '', '', '03', '02', '2018-04-26 20:48:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524747062987', 'RB1524746998591', null, '家族信托back端财产追加、赎回、分配管理界面优化', '80', '2018-04-26', '', '', '03', '02', '2018-04-26 20:51:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524747957000', 'RB1524747933466', null, '费用支付申请及审核的RP设计', '100', '2018-04-26', '', '', '02', '03', '2018-04-26 21:05:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524748002570', 'RB1524747933466', null, 'Back端财产分配的修复。', '20', '2018-04-27', '', '', '03', '02', '2018-04-26 21:06:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524830740662', 'RB1524830700929', null, '投配指令管理页面改造', '40', '2018-04-27', '', '', '03', '02', '2018-04-27 20:05:41', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524830965431', 'RB1524830787321', null, '家族信托back端财产追加、赎回、分配确认函模板从数据库读取', '80', '2018-04-27', '', '', '03', '02', '2018-04-27 20:09:25', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524830986631', 'RB1524830787321', null, '家族信托back端财产追加、赎回、分配确认函新增查看功能', '80', '2018-04-27', '', '', '03', '02', '2018-04-27 20:09:47', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524832491792', 'RB1524832474971', null, 'Back端财产分配的修复。', '100', '2018-04-27', '', '', '02', '03', '2018-04-27 20:34:52', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524832568025', 'RB1524832474971', null, 'Back端费用管理费用支付申请审核页面的开发和功能的优化。', '40', '2018-04-28', '', '', '03', '02', '2018-04-27 20:36:08', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524910661801', 'RB1524910638152', null, '投配指令管理页面改造', '50', '2018-04-28', '', '', '03', '02', '2018-04-28 18:17:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1524910702101', 'RB1524910615068', null, 'Back端费用管理费用支付申请审核页面的开发和功能的优化。', '100', '2018-04-28', '', 'Back端费用管理费用支付审核列表的流程图显示。', '03', '03', '2018-04-28 18:18:22', null, '2018-04-28 18:20:13', 'USER005', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525221519987', 'RB1525221441606', null, '家族信托back端财产追加、赎回、分配管理界面优化', '100', '2018-04-28', '', '', '03', '03', '2018-05-02 08:38:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525221536425', 'RB1525221441606', null, '家族信托back端财产追加、赎回、分配确认函模板从数据库读取', '100', '2018-04-28', '', '', '03', '03', '2018-05-02 08:38:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525221554226', 'RB1525221441606', null, '家族信托back端财产追加、赎回、分配确认函新增查看功能', '100', '2018-04-28', '', '', '03', '03', '2018-05-02 08:39:14', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525267472170', 'RB1525267436298', null, '家族信托管理端确认函通知功能开发', '100', '2018-05-02', '', '', '03', '03', '2018-05-02 21:24:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525267967688', 'RB1525267904643', null, '投配指令管理页面改造', '50', '2018-05-02', '经过开会讨论，投配指令页面还要做修改', '', '03', '02', '2018-05-02 21:32:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525267985111', 'RB1525267913658', null, '投配，期间指令，费用流程开发讨论', '100', '2018-05-02', '', '', '07', '03', '2018-05-02 21:33:05', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525268031080', 'RB1525267904643', null, '流程改造进度会议', '100', '2018-05-02', '', '', '07', '03', '2018-05-02 21:33:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525268097844', 'RB1525268017384', null, 'Back端费用管理费用支付申请审批列表流程图的显示。', '80', '2018-05-02', '', '', '03', '02', '2018-05-02 21:34:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525268113102', 'RB1525268079390', null, '统一确认函接口', '100', '2018-05-02', '', '', '03', '03', '2018-05-02 21:35:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525268114696', 'RB1525268017384', null, '关于开发进度和问题的会议。', '100', '2018-05-02', '', '', '07', '03', '2018-05-02 21:35:15', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525308269953', 'RB1525267904643', null, '解决生产环境-交割信息反馈-交易在途(已拨款)-Excel导出报错问题', '100', '2018-05-02', '', '', '06', '03', '2018-05-03 08:44:30', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525350840893', 'RB1525350799717', null, 'fore端投配指令页面相关BUG修复', '100', '2018-05-03', '', '', '06', '03', '2018-05-03 20:34:01', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525350885612', 'RB1525350799717', null, '投配指令管理页面改造', '60', '2018-05-03', '', '', '03', '02', '2018-05-03 20:34:46', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525351485125', 'RB1525351455783', null, '家族信托确认函通知功能修改', '50', '2018-05-03', '', '', '03', '02', '2018-05-03 20:44:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525351559296', 'RB1525351436843', null, '财产追加、赎回、分配指令审核拒绝和退回时弹窗填写驳回原因', '100', '2018-05-03', '', '', '03', '03', '2018-05-03 20:45:59', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525351596951', 'RB1525351436843', null, '修复fore端测试小问题', '100', '2018-05-03', '', '', '02', '03', '2018-05-03 20:46:37', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525352642744', 'RB1525352621159', null, '费用支付申请审批列表的优化.', '100', '2018-05-03', '', '', '03', '03', '2018-05-03 21:04:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525352656894', 'RB1525352621159', null, '费用支付申请变现功能的实现。', '50', '2018-05-03', '', '', '03', '02', '2018-05-03 21:04:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525431583028', 'RB1525431529107', null, '项目披露报告汇总功能改造优化', '100', '2018-05-04', '', '', '03', '03', '2018-05-04 18:59:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525431778630', 'RB1525431754994', null, '费用支付申请变现功能的实现。', '100', '2018-05-04', '', '', '03', '03', '2018-05-04 19:02:59', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525431884843', 'RB1525431754994', null, '费用支付申请审批拒绝弹窗的显示并填写审批意见的实现。', '100', '2018-05-04', '', '', '03', '03', '2018-05-04 19:04:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525434623371', 'RB1525434568078', null, '投配指令管理页面-审批列表流程图', '50', '2018-05-07', '', '', '03', '02', '2018-05-04 19:50:23', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525434708001', 'RB1525431904375', null, '修改确认函功能存模板id', '100', '2018-05-04', '', '', '03', '03', '2018-05-04 19:51:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525691843565', 'RB1525691774489', null, '银行账户余额接口开发', '50', '2018-05-07', '', '', '03', '02', '2018-05-07 19:17:24', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525691940055', 'RB1525691867908', null, '投配指令管理页面-审批列表流程图', '85', '2018-05-07', '投配流程比较复杂，很多地方需要特殊处理', '', '03', '02', '2018-05-07 19:19:00', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525695055213', 'RB1525694966375', null, 'Back端费用管理费用支付申请的测试。', '70', '2018-05-07', '', '', '04', '02', '2018-05-07 20:10:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525696231850', 'RB1525696175288', null, '财产追加、赎回、分配指令新增签章确认函下载', '100', '2018-05-07', '', '', '03', '03', '2018-05-07 20:30:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525696260124', 'RB1525696175288', null, '签章及通知时更新确认函状态及通知状态', '100', '2018-05-07', '', '', '03', '03', '2018-05-07 20:31:00', null, '2018-05-07 20:31:19', 'USER002', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525779732471', 'RB1525779698680', null, '银行账户余额接口开发', '80', '2018-05-09', '', '', '03', '02', '2018-05-08 19:42:12', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525779763778', 'RB1525779698680', null, '审批履历流程、测试流程讨论', '100', '2018-05-08', '', '', '07', '03', '2018-05-08 19:42:44', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525781460544', 'RB1525781406973', null, 'Back端费用管理费用支付申请的测试。', '90', '2018-05-08', '审批履历流程图有问题，需要进行改进。', '', '04', '02', '2018-05-08 20:11:01', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525781504876', 'RB1525781406973', null, '关于开发进度和开发测试事宜的会议。', '100', '2018-05-08', '', '', '07', '03', '2018-05-08 20:11:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525782386086', 'RB1525782346445', null, '家族信托业务流程图功能修改', '50', '2018-05-09', '', '', '03', '02', '2018-05-08 20:26:26', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525782710167', 'RB1525782654251', null, '投配指令管理页面-审批列表流程图', '85', '2018-05-08', '流程图太过复杂，经过会议讨论，简化流程图', '', '03', '02', '2018-05-08 20:31:50', null, '2018-05-08 20:32:06', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525782984924', 'RB1525782346445', null, '家族信托测试流程与项目进度例会', '100', '2018-05-08', '', '', '07', '03', '2018-05-08 20:36:25', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525783138703', 'RB1525782654251', null, '测试相关与审批列表流程图讨论', '100', '2018-05-08', '', '', '07', '03', '2018-05-08 20:38:59', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525783246184', 'RB1525782267767', null, '测试相关及审批列表流程图讨论会', '100', '2018-05-08', '', '', '03', '03', '2018-05-08 20:40:46', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525783275831', 'RB1525782267767', null, '财产追加、赎回、分配指令审批流程图修改', '50', '2018-05-08', '', '', '03', '02', '2018-05-08 20:41:16', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525869096132', 'RB1525869033108', null, '银行账户余额接口需求变动开发测试', '50', '2018-05-11', '', '', '03', '02', '2018-05-09 20:31:36', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525869132130', 'RB1525869033108', null, '项目披露报告汇总功能流程改造优化', '50', '2018-05-11', '', '', '03', '02', '2018-05-09 20:32:12', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525869157899', 'RB1525869131261', null, '投配指令管理页面-审批列表流程图', '100', '2018-05-09', '', '', '03', '03', '2018-05-09 20:32:38', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525869184193', 'RB1525869131261', null, '投配确认函页面', '50', '2018-05-10', '', '', '03', '02', '2018-05-09 20:33:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525869282386', 'RB1525869131261', null, '投配指令管理页面-审批列表流程图测试', '100', '2018-05-09', '测试环境数据库有些数据不对，导致流程图显示不准确', '', '04', '03', '2018-05-09 20:34:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525869667111', 'RB1525869634400', null, '家族信托通知功能优化', '100', '2018-05-09', '', '', '03', '03', '2018-05-09 20:41:07', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525869770024', 'RB1525869724899', null, '财产追加、赎回、分配指令审批流程图修改', '100', '2018-05-09', '', '', '03', '03', '2018-05-09 20:42:50', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525871002240', 'RB1525870942377', null, 'Back端费用管理费用申请审批履历流程图的优化。', '100', '2018-05-09', '', '', '03', '03', '2018-05-09 21:03:22', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525956410234', 'RB1525956386610', null, '项目披露报告汇总功能流程改造优化', '100', '2018-05-10', '', '', '03', '03', '2018-05-10 20:46:50', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525956432014', 'RB1525956386610', null, '项目披露报告汇总功能流程改造优化门户端新增页面', '100', '2018-05-10', '', '', '03', '03', '2018-05-10 20:47:12', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525956461953', 'RB1525956386610', null, '银行账户余额接口需求变动开发测试', '100', '2018-05-10', '', '', '03', '03', '2018-05-10 20:47:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525956490119', 'RB1525956386610', null, '银行账户余额接口需求审批履历', '20', '2018-05-11', '', '', '03', '02', '2018-05-10 20:48:10', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525956614364', 'RB1525956544382', null, '家族信托通知功能修改发送成功后新增记录', '100', '2018-05-10', '', '', '03', '03', '2018-05-10 20:50:14', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525956615204', 'RB1525956575852', null, '投配确认函页面', '80', '2018-05-11', '', '', '03', '02', '2018-05-10 20:50:15', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525956660020', 'RB1525956575852', null, '投配指令的详细流程设计', '100', '2018-05-10', '', '', '02', '03', '2018-05-10 20:51:00', null, '2018-05-10 21:02:12', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525956662187', 'RB1525956544382', null, '家族信托通知功能详细设计流程图visio版', '100', '2018-05-10', '', '', '02', '03', '2018-05-10 20:51:02', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525957420730', 'RB1525957408540', null, 'Back端费用管理费用支付申请的测试。', '100', '2018-05-10', '', '', '04', '03', '2018-05-10 21:03:41', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525957474056', 'RB1525957408540', null, 'Back端费用管理费用申请及审批评审问题的优化。', '50', '2018-05-10', '', '', '03', '02', '2018-05-10 21:04:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525957514361', 'RB1525957408540', null, 'Back端费用管理费用申请及审批模块的评审会议。', '100', '2018-05-10', '', '', '03', '03', '2018-05-10 21:05:14', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1525957750630', 'RB1525957696119', null, '投配指令确认函功能开发', '30', '2018-05-10', '', '', '03', '02', '2018-05-10 21:09:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526038439345', 'RB1526038412095', null, '银行账户余额接口需求审批履历', '100', '2018-05-11', '', '', '02', '03', '2018-05-11 19:33:59', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526038490815', 'RB1526038412095', null, '项目披露报告汇总功能改造优化详细设计流程图', '100', '2018-05-11', '', '', '02', '03', '2018-05-11 19:34:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526038510040', 'RB1526038449736', null, '家族信托披露报告审批履历流程图', '100', '2018-05-11', '', '', '03', '03', '2018-05-11 19:35:10', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526038513448', 'RB1526038412095', null, '项目披露报告汇总功能改造优化评审', '100', '2018-05-11', '', '', '07', '03', '2018-05-11 19:35:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526038522553', 'RB1526038445275', null, '投配确认函页面', '80', '2018-05-14', '下午评审完，云桌面开始自动掉线，没法开发，原定的开发计划不能完成', '投配确认函页面，投配指令大而全页面', '03', '02', '2018-05-11 19:35:23', null, '2018-05-11 19:37:42', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526038556055', 'RB1526038449736', null, '家族信托项目通知功能修改', '100', '2018-05-11', '', '', '03', '03', '2018-05-11 19:35:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526038563225', 'RB1526038445275', null, '投配指令流程改造评审', '100', '2018-05-11', '', '', '07', '03', '2018-05-11 19:36:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526038600770', 'RB1526038445275', null, '解决Juint+SpringTest在Dubbo项目下的测试问题', '100', '2018-05-11', '', '', '03', '03', '2018-05-11 19:36:41', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526040185634', 'RB1526040157317', null, '财产追加指令评审', '100', '2018-05-11', '', '', '07', '03', '2018-05-11 20:03:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526040209581', 'RB1526040171848', null, 'Back端费用管理费用申请及审批评审问题的优化。', '90', '2018-05-11', '等胡浪接口下周一完成后，页面显示余额。', '', '03', '02', '2018-05-11 20:03:30', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526040226025', 'RB1526040157317', null, '修改财产追加指令流程图', '100', '2018-05-11', '', '', '02', '03', '2018-05-11 20:03:46', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526040251675', 'RB1526040171848', null, '设计费用管理模块概要设计、流程详细设计。', '100', '2018-05-11', '', '', '02', '03', '2018-05-11 20:04:12', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526040281641', 'RB1526040157317', null, '财产追加指令案例测试', '100', '2018-05-11', '', '', '04', '03', '2018-05-11 20:04:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526299427058', 'RB1526299383929', null, 'back端项目披露报告测试案例', '100', '2018-05-14', '', '', '04', '03', '2018-05-14 20:03:47', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526299439504', 'RB1526299383929', null, 'fore端项目披露报告测试案例', '100', '2018-05-14', '', '', '04', '03', '2018-05-14 20:04:00', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526299469704', 'RB1526299383929', null, '项目披露报告问题审批流程问题修复', '100', '2018-05-14', '', '', '03', '03', '2018-05-14 20:04:30', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526300017232', 'RB1526299969581', null, '新增通知任务表、实体', '100', '2018-05-14', '', '', '03', '03', '2018-05-14 20:13:37', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526300046010', 'RB1526299969581', null, '进行上周周报整合', '100', '2018-05-14', '', '', '08', '03', '2018-05-14 20:14:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526300069854', 'RB1526299994419', null, '财产分配指令测试及案例编写', '100', '2018-05-14', '', '', '04', '03', '2018-05-14 20:14:30', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526300094350', 'RB1526299958648', null, '投配指令的详细流程补全', '100', '2018-05-14', '云桌面一直掉线，没法工作，找了硬件部的同事没不能解决。只能装个虚拟机，在虚拟机里连云桌面工作。', '', '02', '03', '2018-05-14 20:14:54', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526300161438', 'RB1526299994419', null, '财产分配指令测试案例评审', '100', '2018-05-14', '', '', '07', '03', '2018-05-14 20:16:01', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526388104513', 'RB1526388062372', null, '修复流程图显示用户角色错误问题', '100', '2018-05-15', '', '', '03', '03', '2018-05-15 20:41:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526388141045', 'RB1526388062372', null, '家族信托用户测试验收会议', '100', '2018-05-15', '', '', '07', '03', '2018-05-15 20:42:21', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526388167986', 'RB1526388137416', null, '修复项目披露报告问题', '100', '2018-05-15', '', '', '03', '03', '2018-05-15 20:42:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526388168685', 'RB1526388063774', null, '投配确认函页面', '90', '2018-05-15', '', '', '03', '02', '2018-05-15 20:42:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526388188809', 'RB1526388063774', null, '大而全页面', '20', '2018-05-15', '', '', '03', '02', '2018-05-15 20:43:09', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526388200912', 'RB1526388137416', null, '项目披露报告RP设计文档', '100', '2018-05-15', '', '', '02', '03', '2018-05-15 20:43:21', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526388252571', 'RB1526388137416', null, '机器人银行账号流水明细接口数据库逻辑开发', '70', '2018-05-16', '', '', '03', '02', '2018-05-15 20:44:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526389492808', 'RB1526388981181', null, '画信托财产管理模块（信托财产信息、追加赎回交易明细、分配交易明细、信托份额变动明细）RP图', '100', '2018-05-15', '', '', '02', '03', '2018-05-15 21:04:53', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526389547784', 'RB1526388981181', null, '家族信托back端信托财产管理-信托财产信息页面开发', '100', '2018-05-15', '', '', '03', '03', '2018-05-15 21:05:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526389609455', 'RB1526388981181', null, '修复ie浏览器文件下载时文件名乱码bug', '100', '2018-05-15', '', '', '06', '03', '2018-05-15 21:06:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526465671789', 'RB1526465615203', null, '费用管理-费用信息页面要素、项目管理-费用信息页面要素的设计', '100', '2018-05-16', '', '', '02', '03', '2018-05-16 18:14:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526465695883', 'RB1526465615203', null, '费用信息页面要素的评审会议。', '100', '2018-05-16', '', '', '03', '03', '2018-05-16 18:14:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526465718438', 'RB1526465615203', null, '费用明细表的设计。', '100', '2018-05-16', '', '', '02', '03', '2018-05-16 18:15:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526469017882', 'RB1526468975294', null, '家族信托需求信息与上线控制会议', '100', '2018-05-16', '', '', '07', '03', '2018-05-16 19:10:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526469084168', 'RB1526468975294', null, '修复通知功能理财师和投顾无法获取收件人的问题', '100', '2018-05-16', '', '', '03', '03', '2018-05-16 19:11:24', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526469129796', 'RB1526468973248', null, '评审项目管理-项目信息-披露信息和披露报告信息页面要素', '100', '2018-05-16', '', '', '07', '03', '2018-05-16 19:12:10', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526469198879', 'RB1526468973248', null, '测试前一版本的项目披露报告流程并修复问题', '100', '2018-05-16', '', '', '04', '03', '2018-05-16 19:13:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526469242818', 'RB1526468973248', null, '优化项目披露报告文件详情页面', '50', '2018-05-17', '', '', '03', '02', '2018-05-16 19:14:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526470463486', 'RB1526470440231', null, '大而全页面', '80', '2018-05-16', '', '', '03', '02', '2018-05-16 19:34:23', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526474235826', 'RB1526474185281', null, '画信托财产管理模块（信托财产信息、追加赎回交易明细、分配交易明细、信托份额变动明细）详细设计图', '100', '2018-05-16', '', '', '02', '03', '2018-05-16 20:37:16', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526474263621', 'RB1526474185281', null, '画信托财产管理模块（信托财产信息、追加赎回交易明细、分配交易明细、信托份额变动明细）设计评审', '100', '2018-05-16', '', '', '07', '03', '2018-05-16 20:37:44', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526474298756', 'RB1526474185281', null, '家族信托back端信托财产管理-交易明细页面开发', '50', '2018-05-16', '', '', '03', '02', '2018-05-16 20:38:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526560485917', 'RB1526560419127', null, '家族信托当前上线功能用户使用说明书理财师、投顾使用编写', '100', '2018-05-17', '', '', '03', '03', '2018-05-17 20:34:46', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526560676567', 'RB1526560662708', null, '大而全页面', '100', '2018-05-17', '', '', '03', '03', '2018-05-17 20:37:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526562311682', 'RB1526562231507', null, 'Back端费用管理-费用申请及审批将费用明细保存在费用明细表的方法建立。', '100', '2018-05-17', '', '', '03', '03', '2018-05-17 21:05:12', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526562369479', 'RB1526562231507', null, 'Back端费用管理-费用信息页面的建立。', '60', '2018-05-17', '', '', '03', '02', '2018-05-17 21:06:09', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526562422852', 'RB1526562398172', null, '家族信托back端信托财产管理-交易明细页面开发', '100', '2018-05-17', '', '', '03', '03', '2018-05-17 21:07:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526603958703', 'RB1526603938485', null, '优化项目披露报告文件详情页面', '100', '2018-05-17', '', '', '03', '03', '2018-05-18 08:39:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526603991125', 'RB1526603938485', null, '专户余额及明细页面', '100', '2018-05-17', '', '', '05', '03', '2018-05-18 08:39:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526604100915', 'RB1526603938485', null, '机器人银行账号流水明细接口数据库逻辑开发', '100', '2018-05-17', '', '', '03', '03', '2018-05-18 08:41:41', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526637668482', 'RB1526637624988', null, '审批信息完善', '80', '2018-05-18', '', '', '03', '02', '2018-05-18 18:01:08', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526637681327', 'RB1526637649025', null, '家族信托通知修改更新通知任务表', '50', '2018-05-18', '', '', '03', '02', '2018-05-18 18:01:21', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526637698036', 'RB1526637616945', null, '编写项目管理-项目披露报告信息RP设计并修改银行专户余额和明细信息RP设计', '100', '2018-05-18', '', '', '01', '03', '2018-05-18 18:01:38', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526637725313', 'RB1526637616945', null, '披露报告查询列表页面', '80', '2018-05-21', '', '', '03', '02', '2018-05-18 18:02:05', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526637764595', 'RB1526637719265', null, '家族信托back端信托财产管理-分配交易明细页面开发', '100', '2018-05-18', '', '', '03', '03', '2018-05-18 18:02:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526637787243', 'RB1526637719265', null, '家族信托back端信托财产管理-信托份额变动明细页面开发', '90', '2018-05-18', '', '', '03', '02', '2018-05-18 18:03:07', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526638102638', 'RB1526638073994', null, 'Back端费用管理-费用信息页面的建立。', '100', '2018-05-18', '', '', '03', '03', '2018-05-18 18:08:23', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526638121208', 'RB1526638073994', null, 'Back端项目管理-费用信息页面的建立。', '100', '2018-05-18', '', '', '03', '03', '2018-05-18 18:08:41', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526904117576', 'RB1526904083204', null, '披露报告信息RP和页面设计评审', '100', '2018-05-21', '', '', '07', '03', '2018-05-21 20:01:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526904173136', 'RB1526904101098', null, '费用管理-费用信息页面、项目管理-费用信息页面的及功能实现的评审会议。', '100', '2018-05-21', '', '', '07', '03', '2018-05-21 20:02:53', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526904174874', 'RB1526904083204', null, '项目管理下的披露信息页面开发', '100', '2018-05-21', '', '', '03', '03', '2018-05-21 20:02:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526904205813', 'RB1526904101098', null, '费用管理-费用信息页面、项目管理-费用信息页面的优化。', '100', '2018-05-21', '', '', '03', '03', '2018-05-21 20:03:26', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526904512219', 'RB1526904474351', null, '投配指令相关改造方案评审', '100', '2018-05-21', '', '', '07', '03', '2018-05-21 20:08:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526904535167', 'RB1526904474351', null, '审批信息完善', '100', '2018-05-21', '', '', '03', '03', '2018-05-21 20:08:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526904557971', 'RB1526904474351', null, '投配指令页面优化', '100', '2018-05-21', '', '', '03', '03', '2018-05-21 20:09:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526904645716', 'RB1526904627468', null, '家族信托back端信托财产管理-信托份额变动明细页面开发', '100', '2018-05-21', '', '', '03', '03', '2018-05-21 20:10:46', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526904678654', 'RB1526904627468', null, '家族信托back端信托财产管理页面展示评审', '100', '2018-05-21', '', '', '07', '03', '2018-05-21 20:11:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526904691903', 'RB1526904662775', null, '家族信托通知功能新增发送记录开发', '100', '2018-05-21', '', '', '03', '03', '2018-05-21 20:11:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526904711028', 'RB1526904627468', null, '家族信托back端投配管理确认函功能', '30', '2018-05-21', '', '', '03', '02', '2018-05-21 20:11:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526994104904', 'RB1526994063576', null, '家族信托确认函通知功能测试', '100', '2018-05-22', '', '', '03', '03', '2018-05-22 21:01:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526994133979', 'RB1526994052291', null, '投配出函及通知页面', '80', '2018-05-22', '', '', '03', '02', '2018-05-22 21:02:14', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526994161066', 'RB1526994138565', null, '家族信托back端投配管理确认函功能', '50', '2018-05-22', '', '', '03', '02', '2018-05-22 21:02:41', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526994162287', 'RB1526994104806', null, '批量保障金缴纳提醒投配指令RP设计', '100', '2018-05-22', '', '', '01', '03', '2018-05-22 21:02:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526994180624', 'RB1526994052291', null, '项目功能模块评审', '100', '2018-05-22', '', '', '07', '03', '2018-05-22 21:03:01', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526994183669', 'RB1526994104806', null, '批量保障金缴纳提醒投配指令', '20', '2018-05-24', '', '', '03', '02', '2018-05-22 21:03:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526994233571', 'RB1526994173812', null, '评审会议', '100', '2018-05-22', '', '', '07', '03', '2018-05-22 21:03:54', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526994267984', 'RB1526994173812', null, '项目管理-财务信息tab页面的建立和功能的实现。', '100', '2018-05-22', '', '', '03', '03', '2018-05-22 21:04:28', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1526994289858', 'RB1526994138565', null, '家族信托back端开发评审', '80', '2018-05-22', '', '', '07', '02', '2018-05-22 21:04:50', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527078832756', 'RB1527078771878', null, '关于费用管理的审核会议。', '100', '2018-05-23', '', '', '07', '03', '2018-05-23 20:33:53', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527078909698', 'RB1527078771878', null, '项目管理-项目成立管理页面的建立、项目管理-项目信息维护页面的建立。', '70', '2018-05-23', '', '', '03', '02', '2018-05-23 20:35:10', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527079183489', 'RB1527079135631', null, '家族信托通知功能收件人修改为类别和子类模式适配', '100', '2018-05-23', '', '', '03', '03', '2018-05-23 20:39:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527079222310', 'RB1527079135631', null, '家族信托费用自动生成、FA推送费用和项目信息处理功能讨论', '100', '2018-05-23', '', '', '07', '03', '2018-05-23 20:40:22', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527079254203', 'RB1527079207520', null, '投配指令管理页面修复评审会议上提出的问题', '100', '2018-05-23', '', '', '03', '03', '2018-05-23 20:40:54', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527079257800', 'RB1527079135631', null, '家族信托禅道功能演示分享会', '100', '2018-05-23', '', '', '07', '03', '2018-05-23 20:40:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527080838821', 'RB1527080817223', null, '家族信托back端开发评审', '100', '2018-05-23', '', '', '07', '03', '2018-05-23 21:07:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527080855900', 'RB1527080817223', null, '家族信托back端投配管理确认函功能', '80', '2018-05-23', '', '', '03', '02', '2018-05-23 21:07:36', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527080943325', 'RB1527080871547', null, '批量保障金缴纳提醒投配指令', '40', '2018-05-28', '', '', '02', '02', '2018-05-23 21:09:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527163482293', 'RB1527163403042', null, '修复投配指令审批列表每个节点的审批履历信息', '80', '2018-05-24', 'OA系统传来的节点有问题，和三盛讨论，明天三盛修改一下OA里的配置', '', '03', '02', '2018-05-24 20:04:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527163590376', 'RB1527163555234', null, '专户交易明细页面修改', '100', '2018-05-24', '', '', '03', '03', '2018-05-24 20:06:30', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527163602404', 'RB1527163558748', null, '了解代码的部分模块', '100', '2018-05-24', '', '', '08', '02', '2018-05-24 20:06:42', null, '2018-05-24 20:08:14', 'USER1527163402524', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527163607719', 'RB1527163545604', null, '家族信托通知功能发送邮件测试', '100', '2018-05-24', '', '', '04', '03', '2018-05-24 20:06:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527163643699', 'RB1527163627427', null, '项目管理-项目成立管理页面的建立、项目管理-项目信息维护页面的建立。', '100', '2018-05-24', '', '', '03', '03', '2018-05-24 20:07:24', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527163731633', 'RB1527163627427', null, '费用管理模块测试案例的修改', '100', '2018-05-24', '', '', '04', '03', '2018-05-24 20:08:52', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527167174818', 'RB1527167160013', null, '家族信托back端投配管理确认函功能', '100', '2018-05-24', '', '', '03', '03', '2018-05-24 21:06:15', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527167226884', 'RB1527167160013', null, '家族信托fore端资金管理模块改造', '100', '2018-05-24', '', '', '03', '03', '2018-05-24 21:07:07', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527167281852', 'RB1527167160013', null, '家族信托back端项目管理-家族项目管理新增信托财产信息模块', '100', '2018-05-24', '', '', '03', '03', '2018-05-24 21:08:02', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527243368940', 'RB1527243346977', null, '银行账户余额接口需求变动开发测试案例', '100', '2018-05-25', '', '', '04', '03', '2018-05-25 18:16:09', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527243423865', 'RB1527243346977', null, '银行账户余额和流水明细详细设计流程图', '100', '2018-05-25', '', '', '02', '03', '2018-05-25 18:17:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527243526037', 'RB1527243458157', null, '项目管理-上传文件页面的按钮权限修改。', '100', '2018-05-25', '', '', '03', '03', '2018-05-25 18:18:46', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527243632144', 'RB1527243458157', null, '项目管理-费用信息的测试案例。', '100', '2018-05-25', '', '', '04', '03', '2018-05-25 18:20:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527243736943', 'RB1527243655928', null, '编写家族信托back端信托财产管理-信托财产信息测试用例', '100', '2018-05-25', '', '', '04', '03', '2018-05-25 18:22:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527243756592', 'RB1527243655928', null, '编写家族信托back端项目管理-信托财产信息测试用例', '100', '2018-05-25', '', '', '04', '03', '2018-05-25 18:22:37', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527243768505', 'RB1527243655928', null, '编写家族信托fore端信托财产管理-信托财产信息测试用例', '100', '2018-05-25', '', '', '04', '03', '2018-05-25 18:22:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527468998066', 'RB1527468842201', null, '家族信托back端-投配管理-投配出函及通知页面，CC划款成功后向确认函表新增可出函指令', '100', '2018-05-25', '', '', '03', '03', '2018-05-28 08:56:38', null, '2018-05-28 09:01:40', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527469070847', 'RB1527468842201', null, '家族信托fore端-投配指令页面', '30', '2018-05-28', '', '家族信托fore端-投配指令页面开发', '03', '02', '2018-05-28 08:57:51', null, '2018-05-28 09:06:57', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527469287564', 'RB1527468842201', null, '家族信托back端-投配管理-投配指令管理-审批列表，与OA关联审批的审批履历测试', '100', '2018-05-25', 'OA里如果要保证审批人和审批节点正确，则不能取到审批说明字段。这块三盛在想办法看能不能取到审批说明', '', '04', '03', '2018-05-28 09:01:28', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527469750547', 'RB1527469643508', null, '熟悉项目流程和业务', '100', '2018-05-23', '', '', '08', '03', '2018-05-28 09:09:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527469801522', 'RB1527469661008', null, '了解项目框架和代码结构', '100', '2018-05-23', '', '', '08', '03', '2018-05-28 09:10:02', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527512441703', 'RB1527512397351', null, '测试back项目中的费用，项目等模块', '100', '2018-05-28', '', '', '04', '03', '2018-05-28 21:00:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527512658162', 'RB1527512615602', null, 'Back端费用管理测试案例的修改。', '100', '2018-05-28', '', '', '04', '03', '2018-05-28 21:04:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527512688560', 'RB1527512615602', null, 'Back端投配管理的测试。', '40', '2018-05-28', '', '', '04', '02', '2018-05-28 21:04:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527512716976', 'RB1527512615602', null, 'Back端费用管理-费用信息页面的优化。', '100', '2018-05-28', '', '', '03', '03', '2018-05-28 21:05:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527513600244', 'RB1527513562273', null, '银行专户余额和流水明细测试及修改', '100', '2018-05-28', '', '', '04', '03', '2018-05-28 21:20:00', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527513626624', 'RB1527513562273', null, '上线前工作、文档准备会议', '100', '2018-05-28', '', '', '07', '03', '2018-05-28 21:20:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527513709579', 'RB1527513683997', null, '家族信托fore端-投配指令页面', '100', '2018-05-28', '', '', '03', '03', '2018-05-28 21:21:50', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527513791728', 'RB1527513686370', null, '家族信托管理端2.2.2上线版本费用管理验证测试', '100', '2018-05-28', '', '', '04', '03', '2018-05-28 21:23:12', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527513794872', 'RB1527513683997', null, '投配指令管理页面测试发现的问题BUG修复', '90', '2018-05-28', '', '', '03', '02', '2018-05-28 21:23:15', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527513807343', 'RB1527513686370', null, '家族信托管理端2.2.2上线版本银行专户余额及明细查询验证测试', '100', '2018-05-28', '', '', '04', '03', '2018-05-28 21:23:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527513842935', 'RB1527513683997', null, '测试相关会议', '100', '2018-05-28', '', '', '07', '03', '2018-05-28 21:24:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527513852267', 'RB1527513686370', null, '家族信托投配指令审批履历模板角色完善', '100', '2018-05-28', '', '', '03', '03', '2018-05-28 21:24:12', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527514429352', 'RB1527514387195', null, '家族信托back端投配指令测试', '100', '2018-05-28', '', '', '04', '03', '2018-05-28 21:33:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527514456160', 'RB1527514387195', null, '家族信托back端费用管理测试', '100', '2018-05-28', '', '', '04', '03', '2018-05-28 21:34:16', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527601173808', 'RB1527601118517', null, '针对于管家系统的项目进行熟悉', '100', '2018-05-29', '', '', '08', '03', '2018-05-29 21:39:34', null, '2018-05-29 21:39:47', 'USER1527163402524', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527601216949', 'RB1527601118517', null, '开发管家系统的多文件上传兼容问题', '100', '2018-05-29', '', '', '03', '03', '2018-05-29 21:40:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527601374724', 'RB1527601355263', null, 'Back端投配管理的测试。', '100', '2018-05-29', '', '', '04', '03', '2018-05-29 21:42:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527601432078', 'RB1527601355263', null, 'Back端费用管理-费用支付申请及审核、费用管理-费用信息 模块用户文档的补充。', '100', '2018-05-29', '', '', '08', '03', '2018-05-29 21:43:52', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527601488568', 'RB1527601468914', null, '投配指令管理的全流程测试', '100', '2018-05-29', '', '', '04', '03', '2018-05-29 21:44:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527601700307', 'RB1527601591231', null, '家族信托back端投配指令按权限角色集中测试', '100', '2018-05-29', '', '', '04', '03', '2018-05-29 21:48:20', null, '2018-05-29 21:50:58', 'USER002', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527601798767', 'RB1527601728097', null, '家族信托管理端财产追加用户使用手册', '80', '2018-05-29', '', '', '03', '02', '2018-05-29 21:49:59', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527601831436', 'RB1527601591231', null, '家族信托back端投配指令管理测试用例编写', '80', '2018-05-29', '', '', '03', '02', '2018-05-29 21:50:31', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527601842064', 'RB1527601728097', null, '家族信托2.2.2上线版本验证集中测试', '100', '2018-05-29', '', '', '07', '03', '2018-05-29 21:50:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527601913373', 'RB1527601835954', null, '解决投配指令流程改造back端和fore端的BUG', '80', '2018-05-29', '', '', '03', '02', '2018-05-29 21:51:53', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527687055764', 'RB1527687044532', null, '解决投配指令流程改造back端和fore端的BUG', '100', '2018-05-30', '', '', '03', '03', '2018-05-30 21:30:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527687075033', 'RB1527687044532', null, '投配指令管理页面改造流程测试', '100', '2018-05-30', '', '', '04', '03', '2018-05-30 21:31:15', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527687121834', 'RB1527687109473', null, '家族信托back端投配指令管理测试用例编写', '100', '2018-05-30', '', '', '03', '03', '2018-05-30 21:32:02', null, '2018-05-30 21:32:31', 'USER002', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527687124616', 'RB1527687091436', null, '投配指令管理的全流程回归测试', '100', '2018-05-30', '', '', '04', '03', '2018-05-30 21:32:05', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527687147362', 'RB1527687131177', null, 'Back端投配管理的集中测试。', '100', '2018-05-30', '', '', '04', '03', '2018-05-30 21:32:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527687202294', 'RB1527687131177', null, '完成Back端费用管理-费用信息模块的上线清单。', '100', '2018-05-30', '', '', '08', '03', '2018-05-30 21:33:22', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527687221672', 'RB1527687177181', null, '家族信托投配指令回归测试', '100', '2018-05-30', '', '', '03', '03', '2018-05-30 21:33:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527727308760', 'RB1527686235650', null, '开发银行卡格式化控件', '100', '2018-05-31', '', '', '03', '03', '2018-05-31 08:41:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527770526267', 'RB1527770491663', null, '优化修改银行专户余额和流水明细按钮权限问题', '100', '2018-05-31', '', '', '04', '03', '2018-05-31 20:42:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527770639590', 'RB1527770546248', null, '家族信托2.2.0版本上线清单准备', '100', '2018-05-31', '', '', '04', '03', '2018-05-31 20:44:00', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527771722169', 'RB1527771695352', null, '投配指令相关版本上线', '100', '2018-05-31', '', '', '05', '03', '2018-05-31 21:02:02', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527771768917', 'RB1527771695352', null, '修复禅道提的投配指令相关BUG', '100', '2018-05-31', '', '', '03', '03', '2018-05-31 21:02:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527771956441', 'RB1527771905688', null, '整理家族系统2.2.0版本上线文档', '100', '2018-05-31', '', '', '05', '03', '2018-05-31 21:05:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527772024569', 'RB1527771905688', null, '家族系统back端财产追加指令新增同步TA数据权限控制', '100', '2018-05-31', '', '', '03', '03', '2018-05-31 21:07:05', null, '2018-05-31 21:08:11', 'USER002', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527772025915', 'RB1527771993704', null, 'Back端费用管理-费用信息项目权限控制bug的修复。', '100', '2018-05-31', '', '', '03', '03', '2018-05-31 21:07:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527772040978', 'RB1527771993704', null, 'Back端费用管理-费用信息的测试。', '100', '2018-05-31', '', '', '04', '03', '2018-05-31 21:07:21', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527772054293', 'RB1527770491663', null, '银行账户余额上线前测试', '100', '2018-05-31', '', '', '04', '03', '2018-05-31 21:07:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527772084282', 'RB1527771905688', null, '家族系统back端及fore端财产追加指令新增及修改页面优化', '100', '2018-05-31', '', '', '03', '03', '2018-05-31 21:08:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527772123943', 'RB1527772064092', null, '开发产品中净值的echarts报表', '100', '2018-05-31', '', '', '03', '03', '2018-05-31 21:08:44', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527772163666', 'RB1527772064092', null, '开发上传功能控件', '100', '2018-05-31', '', '', '03', '03', '2018-05-31 21:09:24', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527847597033', 'RB1527847561622', null, '家族信托2.2.0版本上线总结会及2.3.0上线计划', '100', '2018-06-01', '', '', '07', '03', '2018-06-01 18:06:37', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527847622464', 'RB1527847592754', null, 'Back端费用管理-费用信息cc回调方法bug的修复。', '100', '2018-06-01', '', '', '03', '03', '2018-06-01 18:07:02', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527847628673', 'RB1527847592319', null, '2.2 版本会议总结以及2.3版本开发计划会议', '100', '2018-06-01', '', '', '07', '03', '2018-06-01 18:07:09', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527847631218', 'RB1527847561622', null, '家族信托2.2.0版本上线BUG修复及测试', '100', '2018-06-01', '', '', '06', '03', '2018-06-01 18:07:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527847645271', 'RB1527847592754', null, '上线总结和新版本开发计划。', '100', '2018-06-01', '', '', '07', '03', '2018-06-01 18:07:25', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527847659331', 'RB1527847591266', null, '修复生产环境大而全页面【批】【核】【录】刷新显示不正常问题', '100', '2018-06-01', '', '2.3.0版本开发计划', '06', '03', '2018-06-01 18:07:39', null, '2018-06-01 18:09:12', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527847702257', 'RB1527847591266', null, '协助三盛解决生产环境不能新增产品的问题', '100', '2018-06-01', '', '', '06', '03', '2018-06-01 18:08:22', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527847733720', 'RB1527847591266', null, '2.2.0版本上线总结及2.3.0版本开发计划会议', '100', '2018-06-01', '', '', '07', '03', '2018-06-01 18:08:54', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527847812033', 'RB1527847548853', null, '财产追加指令指令名称修改为不可编辑', '100', '2018-06-01', '', '', '03', '03', '2018-06-01 18:10:12', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527848073638', 'RB1527847548853', null, '家族信托讨论会', '100', '2018-06-01', '', '', '07', '03', '2018-06-01 18:14:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527907248859', 'RB1527907211284', null, '开发管家系统中的页面功能', '100', '2018-06-01', '', '', '03', '03', '2018-06-02 10:40:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1527907309185', 'RB1527907174434', null, '开发管家系统页面控件', '100', '2018-06-02', '', '', '03', '03', '2018-06-02 10:41:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528115478252', 'RB1528115442279', null, '保障金批量申请及审批开发需求讨论', '100', '2018-06-04', '', '', '07', '03', '2018-06-04 20:31:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528115573895', 'RB1528115442279', null, '保障金批量申请及审批相关页面要素文档', '0', '2018-06-07', '', '', '01', '01', '2018-06-04 20:32:54', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528115595681', 'RB1528115442279', null, '保障金批量申请及审批详细设计流程图', '0', '2018-06-07', '', '', '01', '01', '2018-06-04 20:33:16', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528115770493', 'RB1528115716466', null, '家族信托2.3.0上线功能计划安排及需求讨论', '100', '2018-06-04', '', '', '07', '03', '2018-06-04 20:36:10', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528115813026', 'RB1528115763864', null, 'Back端项目管理模块的界面要素设计。', '100', '2018-06-04', '', '', '02', '03', '2018-06-04 20:36:53', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528115860015', 'RB1528115763864', null, '关于Back端项目管理模块的界面要素评审会议。', '100', '2018-06-04', '', '', '07', '03', '2018-06-04 20:37:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528115906813', 'RB1528115763864', null, 'Back端费用管理-费用申请及审批“全部”tab页的排序优化。', '100', '2018-06-04', '', '', '03', '03', '2018-06-04 20:38:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528115964521', 'RB1528115695882', null, '开发同步长安管家理财师授权项目权限接口', '80', '2018-06-04', '', '', '03', '02', '2018-06-04 20:39:25', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528115965393', 'RB1528115685106', null, '管理端投配出函及通知页面，‘全部’tab的排序规则修改', '100', '2018-06-04', '', '', '03', '03', '2018-06-04 20:39:25', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528116045228', 'RB1528115685106', null, '大而全页面账户信息录入时，拨款金额在专户余额旁边显示', '100', '2018-06-04', '', '', '03', '03', '2018-06-04 20:40:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528116081666', 'RB1528115685106', null, '赎回投资中，付款账户不做校验设置', '100', '2018-06-04', '', '', '03', '03', '2018-06-04 20:41:22', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528116141925', 'RB1528115685106', null, '修复【录】【核】【馈】进入大而全页面，刷新后控制台js报错问题', '100', '2018-06-04', '', '', '03', '03', '2018-06-04 20:42:22', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528116173720', 'RB1528115685106', null, '产品入池流程优化会议', '100', '2018-06-04', '', '', '07', '03', '2018-06-04 20:42:54', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528116649353', 'RB1528116584063', null, '管家系统->客户管理->个人管理->收益分配数据导出功能', '100', '2018-06-04', '', '', '03', '03', '2018-06-04 20:50:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528202044298', 'RB1528201955781', null, '投配指令改造详细设计流程图补全', '100', '2018-06-05', '', '', '02', '03', '2018-06-05 20:34:04', null, '2018-06-05 20:34:20', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528202120353', 'RB1528202077320', null, 'Back端项目管理-项目信息模块的开发。', '70', '2018-06-05', '', '', '03', '02', '2018-06-05 20:35:20', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528202155969', 'RB1528201955781', null, '产品入池流程改造页面元素文档', '20', '2018-06-05', '', '', '02', '02', '2018-06-05 20:35:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528202175675', 'RB1528201955781', null, '产品入池流程改造页面RP', '50', '2018-06-05', '', '', '02', '02', '2018-06-05 20:36:16', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528202200210', 'RB1528202173767', null, '保障金批量申请及审批相关页面要素文档', '100', '2018-06-05', '', '', '01', '03', '2018-06-05 20:36:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528202221015', 'RB1528202173767', null, '保障金批量申请及审批详细设计流程图', '80', '2018-06-06', '', '', '01', '02', '2018-06-05 20:37:01', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528202230205', 'RB1528202147730', null, '家族信托通知配置参数梳理', '100', '2018-06-05', '', '', '03', '03', '2018-06-05 20:37:10', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528202238268', 'RB1528201955781', null, '产品入池流程改造讨论会', '100', '2018-06-05', '', '', '07', '03', '2018-06-05 20:37:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528203690983', 'RB1528203654144', null, '优化收益分配导出列表显示', '100', '2018-06-05', '', '', '03', '03', '2018-06-05 21:01:31', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528203715832', 'RB1528203654144', null, '部分管家系统bug修复', '100', '2018-06-05', '', '', '03', '03', '2018-06-05 21:01:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528203800723', 'RB1528203791282', null, '开发同步长安管家理财师授权项目权限接口', '100', '2018-06-05', '', '', '03', '03', '2018-06-05 21:03:21', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528203846076', 'RB1528203791282', null, '配置披露报告及财产追加指令通知模板', '100', '2018-06-05', '', '', '03', '03', '2018-06-05 21:04:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528286730186', 'RB1528286709715', null, '产品入池流程改造页面元素文档', '100', '2018-06-06', '', '', '02', '03', '2018-06-06 20:05:30', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528286748430', 'RB1528286709715', null, '产品入池流程改造页面RP', '100', '2018-06-06', '', '', '02', '03', '2018-06-06 20:05:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528286777215', 'RB1528286709715', null, '投配确认函通知模板配置', '100', '2018-06-06', '', '', '03', '03', '2018-06-06 20:06:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528286946012', 'RB1528286935746', null, 'Back端项目管理-项目信息模块的开发。', '100', '2018-06-06', '', '', '03', '03', '2018-06-06 20:09:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528286958630', 'RB1528286934263', null, '保障金批量申请及审批详细设计流程图', '100', '2018-06-06', '', '', '01', '03', '2018-06-06 20:09:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528286985165', 'RB1528286935746', null, 'Back端项目管理模块详细流程图。', '80', '2018-06-06', '', '', '02', '02', '2018-06-06 20:09:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528286993982', 'RB1528286960125', null, '开发披露报告通知功能', '100', '2018-06-06', '', '', '03', '03', '2018-06-06 20:09:54', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528287027086', 'RB1528286960125', null, '修改披露报告投顾负责人审核方式', '100', '2018-06-06', '', '', '03', '03', '2018-06-06 20:10:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528287296980', 'RB1528287241462', null, '家族信托修复通知服务功能对象子类为空BUG', '100', '2018-06-06', '', '', '03', '03', '2018-06-06 20:14:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528287334039', 'RB1528287241462', null, '家族信托产品信息、投配流水、费用信息推送FA讨论会', '100', '2018-06-06', '', '', '07', '03', '2018-06-06 20:15:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528332103113', 'RB1528331938003', null, '导出文件名格式修改，银行卡格式化正则表达式修改，文件上传', '100', '2018-06-07', '', '', '03', '03', '2018-06-07 08:41:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528376597219', 'RB1528376585585', null, 'Back端项目管理模块详细流程图。', '100', '2018-06-07', '', '', '02', '03', '2018-06-07 21:03:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528376629660', 'RB1528376585585', null, 'Back端项目管理-项目信息页面的优化。', '100', '2018-06-07', '', '', '03', '03', '2018-06-07 21:03:50', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528376777241', 'RB1528376702729', null, '保障金缴纳提醒批量信息弹框确认页面开发', '30', '2018-06-08', '', '', '03', '02', '2018-06-07 21:06:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528376805471', 'RB1528376759170', null, '披露报告投顾负责人审核流程测试', '100', '2018-06-07', '', '', '04', '03', '2018-06-07 21:06:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528376842070', 'RB1528376759170', null, '修改披露报告管理流程图', '100', '2018-06-07', '', '', '03', '03', '2018-06-07 21:07:22', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528376861992', 'RB1528376845888', null, '产品入池流程改造详细设计流程图', '100', '2018-06-07', '', '', '02', '03', '2018-06-07 21:07:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528376870208', 'RB1528376759170', null, '画同步长安管家理财师项目角色接口流程图', '100', '2018-06-07', '', '', '03', '03', '2018-06-07 21:07:50', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528377048261', 'RB1528376993439', null, '修改管家系统中的部分bug和测试开发测功能', '100', '2018-06-07', '晚上发布-查看时候有新的bug产生', '', '03', '03', '2018-06-07 21:10:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528452891899', 'RB1528452825683', null, '披露报告申请及审核使用手册', '100', '2018-06-08', '', '', '03', '03', '2018-06-08 18:14:52', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528453009421', 'RB1528452825683', null, '同步长安管家理财师项目角色及披露报告申请、审核评审', '100', '2018-06-08', '', '', '07', '03', '2018-06-08 18:16:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528453012095', 'RB1528452951419', null, '保障金批量申请及审批页面元素和详细设计流程图评审', '100', '2018-06-08', '', '', '07', '03', '2018-06-08 18:16:52', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528453024443', 'RB1528452953747', null, '家族信托FineReport产品学习讲解和演示', '100', '2018-06-08', '', '', '03', '03', '2018-06-08 18:17:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528453026869', 'RB1528452984732', null, '产品新增入池流程改造评审', '100', '2018-06-08', '', '', '07', '03', '2018-06-08 18:17:07', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528453047282', 'RB1528452951419', null, '保障金批量申请及审批代码优化整理', '10', '2018-06-11', '', '', '01', '02', '2018-06-08 18:17:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528453070054', 'RB1528452953747', null, '家族信托产品被持信息导出使用FineReport实现', '100', '2018-06-08', '', '', '03', '03', '2018-06-08 18:17:50', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528453078902', 'RB1528452984732', null, '修复2.2.0版本业务反馈提出的问题', '50', '2018-06-08', '', '产品新增入池改造', '03', '02', '2018-06-08 18:17:59', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528453153158', 'RB1528453113650', null, '关于项目管理-项目信息模块的评审会议。', '100', '2018-06-08', '', '', '07', '03', '2018-06-08 18:19:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528453176608', 'RB1528453113650', null, 'Fore端项目管理-项目信息模块的优化。', '100', '2018-06-08', '', '', '03', '03', '2018-06-08 18:19:37', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528453624106', 'RB1528453604583', null, '修复生产bug', '100', '2018-06-08', '', '', '03', '03', '2018-06-08 18:27:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528720337342', 'RB1528720316678', null, '修复2.2.0版本业务反馈提出的问题', '100', '2018-06-11', '', '', '03', '03', '2018-06-11 20:32:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528720398284', 'RB1528720316678', null, '产品池信息-产品新增页面开发', '50', '2018-06-11', '', '', '03', '02', '2018-06-11 20:33:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528720743614', 'RB1528720706869', null, '家族信托通知功能测试案例编写', '100', '2018-06-11', '', '', '04', '03', '2018-06-11 20:39:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528720766325', 'RB1528720739886', null, '保障金批量指令流程所需调用的函数文档', '100', '2018-06-11', '', '', '01', '03', '2018-06-11 20:39:26', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528720823111', 'RB1528720706869', null, 'FinReport报表系统开发产品被持情况汇总', '100', '2018-06-11', '', '', '03', '03', '2018-06-11 20:40:23', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528720829866', 'RB1528720739886', null, '保障金批量申请及审批开发', '10', '2018-06-19', '', '', '03', '02', '2018-06-11 20:40:30', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528720860855', 'RB1528720765381', null, '写期间管理报告通知功能测试案例', '100', '2018-06-11', '', '', '03', '03', '2018-06-11 20:41:01', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528721082795', 'RB1528721040886', null, '优化文件上传功能', '100', '2018-06-11', '', '', '03', '03', '2018-06-11 20:44:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528722235051', 'RB1528722204977', null, 'Back端项目管理-项目成立管理的开发。', '20', '2018-06-15', '', '', '03', '02', '2018-06-11 21:03:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528722250298', 'RB1528722204977', null, 'Back端项目管理-项目成立管理的页面要素设计。', '100', '2018-06-11', '', '', '02', '03', '2018-06-11 21:04:10', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528809334497', 'RB1528809295259', null, '保障金批量申请及审批开发', '20', '2018-06-19', '', '', '03', '02', '2018-06-12 21:15:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528809398697', 'RB1528809295259', null, '保障金批量申请及审批评审', '100', '2018-06-12', '', '', '07', '03', '2018-06-12 21:16:39', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528809488420', 'RB1528809457515', null, '家族信托通知功能测试报告测试', '100', '2018-06-12', '', '', '04', '03', '2018-06-12 21:18:08', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528809500735', 'RB1528809445701', null, '产品池信息-产品新增页面开发', '60', '2018-06-12', '页面上逻辑太复杂，包括传值等问题花了很长时间解决', '', '03', '02', '2018-06-12 21:18:21', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528809509356', 'RB1528809457515', null, '家族信托2.3.0版本功能评审', '100', '2018-06-12', '', '', '07', '03', '2018-06-12 21:18:29', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528809533198', 'RB1528809445701', null, '产品新增修改方案评审', '100', '2018-06-12', '', '', '07', '03', '2018-06-12 21:18:53', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528809596070', 'RB1528809567583', null, '文件上传功能开发和兼容性测试', '100', '2018-06-12', '', '', '03', '03', '2018-06-12 21:19:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528810342525', 'RB1528810330254', null, 'Back端项目管理-项目成立管理的开发。', '40', '2018-06-15', '', '', '03', '02', '2018-06-12 21:32:23', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528810351989', 'RB1528810266724', null, '同步长安管家项目角色接口改造及期间管理报告审核流程评审', '100', '2018-06-12', '', '', '07', '03', '2018-06-12 21:32:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528810380677', 'RB1528810266724', null, '向FA推送费用流水文件', '50', '2018-06-12', '', '', '03', '02', '2018-06-12 21:33:01', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528895529132', 'RB1528895516240', null, '产品池信息-产品新增页面开发', '70', '2018-06-13', '', '', '03', '02', '2018-06-13 21:12:09', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528895566769', 'RB1528895542522', null, '保障金批量申请及审批开发', '40', '2018-06-13', '', '', '03', '02', '2018-06-13 21:12:47', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528895594270', 'RB1528895516240', null, '测试经验分享', '100', '2018-06-13', '', '', '07', '03', '2018-06-13 21:13:14', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528895601121', 'RB1528895542522', null, '流程类模块功能测试的经验和态标签加权限的经验', '100', '2018-06-13', '', '', '07', '03', '2018-06-13 21:13:21', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528895610795', 'RB1528895599825', null, 'Back端项目管理-项目成立管理的开发。', '70', '2018-06-15', '', '', '03', '02', '2018-06-13 21:13:31', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528895619617', 'RB1528895600504', null, '向FA推送费用流水文件', '100', '2018-06-13', '', '', '03', '03', '2018-06-13 21:13:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528895681516', 'RB1528895600504', null, '编写期间管理报告申请及审核业务流程测试用例', '100', '2018-06-13', '', '', '03', '03', '2018-06-13 21:14:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528895703391', 'RB1528895653202', null, '家族信托服务提供项目信息、资产信息、交易明细等接口供管家调用', '20', '2018-06-13', '', '', '03', '02', '2018-06-13 21:15:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528895731299', 'RB1528895600504', null, '编写期间管理报告申请及审核测试用例', '100', '2018-06-13', '', '', '03', '03', '2018-06-13 21:15:31', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528970846975', 'RB1528970820057', null, '保障金批量申请及审批开发', '60', '2018-06-14', '', '', '03', '02', '2018-06-14 18:07:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528971165945', 'RB1528970968859', null, '家族信托服务提供项目信息、资产信息、交易明细等接口供管家调用', '40', '2018-06-14', '', '', '03', '02', '2018-06-14 18:12:46', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528971668709', 'RB1528971607848', null, '投配申请及审批二期优化功能测试及测试用例编写', '100', '2018-06-14', '', '', '04', '03', '2018-06-14 18:21:09', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528972009681', 'RB1528971980288', null, '修改向FA推送费用流水文件接口', '100', '2018-06-14', '', '', '03', '03', '2018-06-14 18:26:50', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528972088675', 'RB1528971980288', null, '费用申请及审核页面新增手动向FA推送费用流水文件按钮', '100', '2018-06-14', '', '', '03', '03', '2018-06-14 18:28:09', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528977926674', 'RB1528977916080', null, 'Back端项目管理-项目成立管理的开发。', '100', '2018-06-14', '', '', '03', '03', '2018-06-14 20:05:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1528977968409', 'RB1528977916080', null, 'Back端项目管理-项目成立管理的业务流程测试。', '100', '2018-06-14', '', '', '04', '03', '2018-06-14 20:06:08', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529043910990', 'RB1529043481147', null, '修复文件上传在ie9下的bug', '100', '2018-06-15', '', '', '03', '03', '2018-06-15 14:25:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529043935521', 'RB1529043481147', null, '遗漏的银行卡格式化页面', '100', '2018-06-15', '', '', '03', '03', '2018-06-15 14:25:36', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529043994147', 'RB1529043481147', null, '修复文件长传时出现的错误弹出框问题', '100', '2018-06-15', '', '', '03', '03', '2018-06-15 14:26:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529044033563', 'RB1529043481147', null, '修复IE下无法获取正确浏览器版本号bug', '100', '2018-06-15', '', '', '03', '03', '2018-06-15 14:27:14', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529044083580', 'RB1529043487306', null, '修改上传文件验证，兼容之前的单文件上传', '100', '2018-06-15', '', '', '03', '03', '2018-06-15 14:28:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529044132352', 'RB1529043487306', null, '给上传文件的文件大小添加单位', '100', '2018-06-15', '', '', '03', '03', '2018-06-15 14:28:52', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529044176037', 'RB1529043487306', null, '修复部分页面设计不合理的操作', '100', '2018-06-15', '', '', '03', '03', '2018-06-15 14:29:36', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529044233157', 'RB1529043487306', null, '对已开发的功能进行功能性测试', '100', '2018-06-15', '', '', '04', '03', '2018-06-15 14:30:33', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529044261789', 'RB1529043481147', null, '对已开发的功能进行功能性测试', '100', '2018-06-15', '', '', '04', '03', '2018-06-15 14:31:02', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529048042158', 'RB1529048017524', null, '2.3.0上线方案及测试用例评审', '100', '2018-06-15', '', '', '07', '03', '2018-06-15 15:34:02', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529048068878', 'RB1529048053364', null, '保障金批量申请及审批开发', '75', '2018-06-15', '', '', '03', '02', '2018-06-15 15:34:29', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529048076325', 'RB1529048017524', null, '解决评审提出的界面问题', '100', '2018-06-15', '', '', '03', '03', '2018-06-15 15:34:36', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529053626673', 'RB1529053582262', null, '家族信托2.3.0版本测试案例评审', '100', '2018-06-15', '', '', '07', '03', '2018-06-15 17:07:07', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529053658830', 'RB1529053582262', null, '家族信托通知错误信息提示优化', '100', '2018-06-15', '', '', '03', '03', '2018-06-15 17:07:39', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529053824541', 'RB1529053771100', null, '产品池信息页面新增手动向FA推送产品信息文件按钮', '100', '2018-06-15', '', '', '03', '03', '2018-06-15 17:10:25', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529055694777', 'RB1529055677768', null, 'Back端项目管理-项目成立管理的优化。', '100', '2018-06-15', '', '', '03', '03', '2018-06-15 17:41:35', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529055715168', 'RB1529055677768', null, '关于Back端项目管理-项目成立管理的评审会议。', '100', '2018-06-15', '', '', '07', '03', '2018-06-15 17:41:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529410078024', 'RB1529410064229', null, '保障金批量申请及审批开发', '80', '2018-06-19', '', '', '03', '02', '2018-06-19 20:07:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529410099662', 'RB1529410064229', null, '2.3.0上线事宜讨论', '100', '2018-06-19', '', '', '07', '03', '2018-06-19 20:08:20', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529410124291', 'RB1529410088717', null, '家族信托2.3.0版本投配优化二期测试', '100', '2018-06-19', '', '', '04', '03', '2018-06-19 20:08:44', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529410127698', 'RB1529410054151', null, '整理家族信托2.3.0版本上线清单', '100', '2018-06-19', '', '', '03', '03', '2018-06-19 20:08:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529410168635', 'RB1529410054151', null, '家族信托back端项目成立管理测试', '70', '2018-06-19', '', '', '04', '02', '2018-06-19 20:09:29', null, '2018-06-22 17:59:09', 'USER002', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529410235041', 'RB1529410207179', null, 'Back端项目管理-项目成立管理的测试。', '50', '2018-06-19', '', '', '04', '02', '2018-06-19 20:10:35', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529410256003', 'RB1529410207179', null, 'Back端项目管理-项目成立管理的BUG修复。', '80', '2018-06-19', '', '', '03', '02', '2018-06-19 20:10:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529410540076', 'RB1529410518804', null, '文件上传控件测试', '100', '2018-06-19', '', '', '03', '03', '2018-06-19 20:15:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529410571422', 'RB1529410546858', null, '产品营销-核算页面的开发', '100', '2018-06-19', '', '', '03', '03', '2018-06-19 20:16:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529411508039', 'RB1529411464985', null, '投配申请及审批二期优化功能测试', '100', '2018-06-19', '', '', '04', '03', '2018-06-19 20:31:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529411536584', 'RB1529411464985', null, '2.3.0版本上线提测计划', '100', '2018-06-19', '', '', '07', '03', '2018-06-19 20:32:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529499971288', 'RB1529499917587', null, '投配申请及审批流程测试用例', '100', '2018-06-20', '', '', '03', '03', '2018-06-20 21:06:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529499985200', 'RB1529499917587', null, '项目信息测试', '100', '2018-06-20', '', '', '04', '03', '2018-06-20 21:06:25', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529500005221', 'RB1529499917587', null, '2.3.0上线清单评审', '100', '2018-06-20', '', '', '07', '03', '2018-06-20 21:06:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529500089337', 'RB1529500079831', null, 'Back端项目管理-项目成立管理的BUG修复。', '95', '2018-06-20', '', '', '03', '02', '2018-06-20 21:08:09', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529500111715', 'RB1529500079831', null, 'Back端项目管理-项目成立管理的测试。', '95', '2018-06-20', '', '', '04', '02', '2018-06-20 21:08:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529500119553', 'RB1529500103827', null, '保障金批量申请及审批开发', '90', '2018-06-22', '', '', '02', '02', '2018-06-20 21:08:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529500255779', 'RB1529500245033', null, '家族信托back端项目成立管理测试', '100', '2018-06-20', '', '', '04', '03', '2018-06-20 21:10:56', null, '2018-06-22 17:59:21', 'USER002', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529500263732', 'RB1529500233399', null, '家族信托通知功能优化提示信息、收件人邮箱空问题', '100', '2018-06-20', '', '', '03', '03', '2018-06-20 21:11:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529500282592', 'RB1529500233399', null, '家族信托2.3.0上线版本评审会', '100', '2018-06-20', '', '', '03', '03', '2018-06-20 21:11:23', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529586341840', 'RB1529586277208', null, '投配申请及审批功能测试', '100', '2018-06-21', '', '', '04', '03', '2018-06-21 21:05:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529586387959', 'RB1529586340476', null, '家族信托通知功能新增重复通知逻辑判断', '100', '2018-06-21', '', '', '03', '03', '2018-06-21 21:06:28', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529586534945', 'RB1529586520671', null, '家族信托back端项目成立管理测试', '100', '2018-06-21', '', '', '04', '03', '2018-06-21 21:08:55', null, '2018-06-22 17:59:40', 'USER002', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529586535068', 'RB1529586511498', null, '保障金批量申请及审批开发', '95', '2018-06-22', '', '', '03', '02', '2018-06-21 21:08:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529586564255', 'RB1529586277208', null, '投配指令管理用户权限管理视图', '100', '2018-06-21', '', '', '04', '03', '2018-06-21 21:09:24', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529586590863', 'RB1529586277208', null, '投配申请及审批二期功能用户文档', '100', '2018-06-21', '', '', '03', '03', '2018-06-21 21:09:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529586607655', 'RB1529586520671', null, '编写家族信托back端向FA推送费用流水用户手册', '100', '2018-06-21', '', '', '03', '03', '2018-06-21 21:10:08', null, '2018-06-22 17:59:48', 'USER002', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529586656844', 'RB1529586647452', null, 'Back端项目管理-项目成立管理的测试。', '100', '2018-06-21', '', '', '04', '03', '2018-06-21 21:10:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529586670417', 'RB1529586647452', null, 'Back端项目管理-项目成立管理的BUG修复。', '100', '2018-06-21', '', '', '03', '03', '2018-06-21 21:11:10', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529586791241', 'RB1529586520671', null, '整理家族信托项目用户权限管理视图_菜单及控件', '100', '2018-06-21', '', '', '03', '03', '2018-06-21 21:13:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529587368377', 'RB1529587343412', null, '管家系统-客户管理-个人客户+机构客户-附件上传功能', '100', '2018-06-21', '', '', '03', '03', '2018-06-21 21:22:48', null, '2018-06-23 00:25:49', 'USER1527163402524', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529587407394', 'RB1529587347099', null, '核算功能开发', '100', '2018-06-21', '', '', '03', '03', '2018-06-21 21:23:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529661014457', 'RB1529660964296', null, '产品池信息-产品新增页面开发', '50', '2018-06-27', '', '', '03', '02', '2018-06-22 17:50:14', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529661015440', 'RB1529660983712', null, '家族信托2.3.0版本项目上线总结会', '100', '2018-06-22', '', '', '07', '03', '2018-06-22 17:50:15', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529661075891', 'RB1529660964296', null, '2.3.0版本上线总结及2.4.0版本开发计划会议', '100', '2018-06-22', '', '', '07', '03', '2018-06-22 17:51:16', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529661188686', 'RB1529661099865', null, '保障金批量申请及审批自动反馈的造数据测试', '20', '2018-06-18', '', '单元测试、测试案例、用户手册、流程测试以及上线清单文档补充', '04', '02', '2018-06-22 17:53:09', null, '2018-06-22 18:01:33', 'USER004', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529661515638', 'RB1529661099865', null, '2.3.0上线总结以及2.4.0上线计划', '100', '2018-06-22', '', '保障金批量申请及审批开发', '07', '03', '2018-06-22 17:58:36', null, '2018-06-22 18:00:53', 'USER004', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529661522604', 'RB1529661267169', null, '家族系统2.3.0上线总结会及下期上线任务安排', '100', '2018-06-22', '', '', '07', '03', '2018-06-22 17:58:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529661708282', 'RB1529661680782', null, '关于家族信托2.3.0版本的总结会议。', '100', '2018-06-22', '', '', '07', '03', '2018-06-22 18:01:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529662391418', 'RB1529662309392', null, '管家系统->产品管理->营销产品->增加核算功能', '100', '2018-06-22', '', '', '03', '03', '2018-06-22 18:13:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529662429428', 'RB1529662309392', null, '管家系统->产品管理->营销产品->增加发布产品类型展示', '100', '2018-06-22', '', '', '03', '03', '2018-06-22 18:13:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529932263100', 'RB1529932236317', null, '保障金批量申请及审批开发', '100', '2018-06-25', '', '', '03', '03', '2018-06-25 21:11:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529932276771', 'RB1529932236317', null, '保障金批量申请及审批自动反馈的造数据测试', '30', '2018-06-25', '', '', '04', '02', '2018-06-25 21:11:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529932284405', 'RB1529932247410', null, '家族信托2.4.0版本计划会议', '100', '2018-06-25', '', '', '07', '03', '2018-06-25 21:11:24', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529932299481', 'RB1529932254888', null, '关于Back端费用管理-费用缴纳提醒的评审会议。', '100', '2018-06-25', '', '', '03', '03', '2018-06-25 21:11:39', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529932309207', 'RB1529932236317', null, '2.4.0需求方案评审会议', '100', '2018-06-25', '', '', '07', '03', '2018-06-25 21:11:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529932327714', 'RB1529932254888', null, 'Back端费用管理-费用缴纳提醒的设计。', '70', '2018-06-25', '', '', '02', '02', '2018-06-25 21:12:08', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529932340188', 'RB1529932247410', null, '家族信托2.4.0版本开发功能评审会议', '100', '2018-06-25', '', '', '07', '03', '2018-06-25 21:12:20', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529932348239', 'RB1529932275706', null, '产品池信息-产品新增页面开发', '70', '2018-06-25', '不同收益级别的收益率取值是按投资上下限还是投资期限为主需要和业务讨论', '', '03', '02', '2018-06-25 21:12:28', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529932353523', 'RB1529932291711', null, '家族信托back端财产赎回的流程改造', '20', '2018-06-25', '', '', '03', '02', '2018-06-25 21:12:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529932390799', 'RB1529932275706', null, '2.4.0版本方案评审', '100', '2018-06-25', '', '', '07', '03', '2018-06-25 21:13:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1529932404603', 'RB1529932291711', null, '家族系统2.4.0开发方案评审', '100', '2018-06-25', '', '', '07', '03', '2018-06-25 21:13:25', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530016231284', 'RB1530016216242', null, '保障金批量申请及审批自动反馈的造数据测试', '80', '2018-06-28', '', '', '04', '02', '2018-06-26 20:30:31', null, '2018-06-26 20:31:59', 'USER004', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530016260480', 'RB1530016216242', null, '保障金批量申请及审批开发问题优化', '80', '2018-06-27', '', '', '03', '02', '2018-06-26 20:31:00', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530016833567', 'RB1530016746442', null, '产品池信息-产品新增页面开发', '80', '2018-06-26', '产品受益级别校验规则的制定花了一些时间讨论后才决定下来', '', '03', '02', '2018-06-26 20:40:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530016856197', 'RB1530016746442', null, '与投配部进行产品开发相关问题讨论', '100', '2018-06-26', '', '', '07', '03', '2018-06-26 20:40:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530016899542', 'RB1530016835903', null, '整理家族信托项目计划书', '80', '2018-06-26', '', '', '08', '02', '2018-06-26 20:41:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530016989978', 'RB1530016974514', null, 'Back端费用管理-费用缴纳提醒的设计。', '100', '2018-06-26', '', '', '02', '03', '2018-06-26 20:43:10', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530017005145', 'RB1530016974514', null, 'Back端费用管理-费用缴纳提醒的开发。', '50', '2018-06-26', '', '', '03', '02', '2018-06-26 20:43:25', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530017106150', 'RB1530017072396', null, '家族信托back端财产赎回的流程改造', '50', '2018-06-26', '', '', '03', '02', '2018-06-26 20:45:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530017136365', 'RB1530017072396', null, '家族信托fore端财产赎回的页面改造', '100', '2018-06-26', '', '', '03', '03', '2018-06-26 20:45:36', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530017151045', 'RB1530017072396', null, '家族信托fore端财产追加的页面改造', '100', '2018-06-26', '', '', '03', '03', '2018-06-26 20:45:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530017159827', 'RB1530017066785', null, '管家系统->后台管理系统->风险评估问卷功能', '100', '2018-06-26', '', '', '03', '03', '2018-06-26 20:46:00', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530017210756', 'RB1530017165155', null, '管家系统->产品管理->营销产品->导出文件优化 ExcelUtil 修改', '100', '2018-06-26', '', '', '03', '03', '2018-06-26 20:46:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530095414057', 'RB1530095397831', null, '产品池信息-产品新增页面开发', '90', '2018-06-27', '', '', '03', '02', '2018-06-27 18:30:14', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530095882000', 'RB1530095848804', null, '家族信托back端财产赎回的流程改造', '90', '2018-06-27', '', '', '03', '02', '2018-06-27 18:38:02', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530095944607', 'RB1530095935833', null, 'Back端费用管理-费用缴纳提醒的开发。', '80', '2018-06-27', '', '', '03', '02', '2018-06-27 18:39:05', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530095950048', 'RB1530095848804', null, '修改家族信托back端财产追加及赎回页面RP图', '100', '2018-06-27', '', '', '02', '03', '2018-06-27 18:39:10', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530095974972', 'RB1530095848804', null, '修改家族信托back端财产追加及赎回页面界面要素', '100', '2018-06-27', '', '', '02', '03', '2018-06-27 18:39:35', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530095995256', 'RB1530095967466', null, '保障金批量申请及审批开发问题优化', '95', '2018-06-28', '', '', '03', '02', '2018-06-27 18:39:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530096019319', 'RB1530095967466', null, '保障金批量申请及审批自动反馈的造数据测试', '95', '2018-06-27', '', '', '04', '02', '2018-06-27 18:40:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530096071071', 'RB1530096019579', null, '管家系统->产品管理->营销产品->导出文件优化  测试', '100', '2018-06-27', '', '', '04', '03', '2018-06-27 18:41:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530096099007', 'RB1530096019579', null, '管家系统->产品管理->营销产品->导出文件优化后续功能添加', '100', '2018-06-27', '', '', '03', '03', '2018-06-27 18:41:39', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530188019206', 'RB1530188003390', null, '产品池信息-产品新增页面开发', '95', '2018-06-28', '', '', '03', '02', '2018-06-28 20:13:39', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530188270873', 'RB1530188247296', null, '保障金批量申请及审批开发问题优化', '100', '2018-06-28', '', '', '03', '03', '2018-06-28 20:17:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530188335984', 'RB1530188247296', null, '保障金批量申请及审批自动反馈的造数据测试', '100', '2018-06-28', '', '', '04', '03', '2018-06-28 20:18:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530188380073', 'RB1530188218576', null, '家族信托项目组转项目制流程确认会', '100', '2018-06-28', '', '', '03', '03', '2018-06-28 20:19:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530188385511', 'RB1530188247296', null, '保障金批量申请及审批修复赎回业务类型下无持有资产信息异常情况', '100', '2018-06-28', '', '', '03', '03', '2018-06-28 20:19:46', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530188559121', 'RB1530188547171', null, 'Back端费用管理-费用缴纳提醒的开发。', '100', '2018-06-28', '', '', '03', '03', '2018-06-28 20:22:39', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530188572841', 'RB1530188556601', null, '家族信托back端财产赎回的流程改造', '100', '2018-06-28', '', '', '03', '03', '2018-06-28 20:22:53', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530188637294', 'RB1530188591995', null, '管家系统->微信公众号平台->后台接口开发', '100', '2018-06-28', '', '', '03', '03', '2018-06-28 20:23:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530267126588', 'RB1530267091415', null, '家族信托财产追加及赎回改造评审', '100', '2018-06-29', '', '', '07', '03', '2018-06-29 18:12:07', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530267213593', 'RB1530267091415', null, '家族信托back端及fore端财产赎回页面优化', '100', '2018-06-29', '', '', '03', '03', '2018-06-29 18:13:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530267545270', 'RB1530267520242', null, 'Back端费用管理-费用缴纳提醒的测试案列编写。', '100', '2018-06-29', '', '', '04', '03', '2018-06-29 18:19:05', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530267563186', 'RB1530267520242', null, 'Back端费用管理-费用缴纳提醒的bug修复。', '100', '2018-06-29', '', '', '03', '03', '2018-06-29 18:19:23', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530269077285', 'RB1530269026373', null, '管家系统->微信公众号平台->后台接口开发和联合调试', '100', '2018-06-29', '', '', '03', '03', '2018-06-29 18:44:37', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530430058919', 'RB1530430036162', null, '产品池信息-产品新增页面开发', '100', '2018-07-01', '', '', '03', '03', '2018-07-01 15:27:39', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530430081160', 'RB1530430036162', null, '2.4.0版本产品新增、修改方案评审', '100', '2018-07-01', '', '', '07', '03', '2018-07-01 15:28:01', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530538820123', 'RB1530538766432', null, '管家系统->微信公众号平台->产品预约接口开发', '100', '2018-07-02', '', '', '03', '03', '2018-07-02 21:40:20', null, '2018-07-02 21:41:17', 'USER1527163402524', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530538863501', 'RB1530538766432', null, '管家系统->微信公众号平台->接口联调', '100', '2018-07-02', '', '', '03', '03', '2018-07-02 21:41:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530539822960', 'RB1530539780888', null, '家族信托管理端-产品池信息-产品修改页面开发', '50', '2018-07-02', '修改逻辑比较复杂，耗费了很多时间', '', '03', '02', '2018-07-02 21:57:03', null, '2018-07-02 21:57:18', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530539868631', 'RB1530539780888', null, '家族信托-产品新增、修改页面开发问题评审', '100', '2018-07-02', '明天早上和娟一起再捋一遍业务逻辑，评估开发进度', '', '07', '03', '2018-07-02 21:57:49', null, '2018-07-02 22:01:09', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530540057878', 'RB1530540020138', null, '保障金批量申请及审批开发测试用例文档', '100', '2018-07-02', '', '', '03', '03', '2018-07-02 22:00:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530540078984', 'RB1530540020138', null, '保障金批量申请及审批开发流程测试用例文档', '100', '2018-07-02', '', '', '03', '03', '2018-07-02 22:01:19', null, '2018-07-02 22:01:27', 'USER004', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530540112433', 'RB1530540020138', null, '保障金批量申请及审批开发BUG修改', '100', '2018-07-02', '', '', '04', '03', '2018-07-02 22:01:52', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530540206866', 'RB1530540187599', null, 'Back端费用管理-费用缴纳提醒的测试。', '100', '2018-07-02', '', '', '04', '03', '2018-07-02 22:03:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530540224593', 'RB1530540187599', null, 'Back端费用管理-费用缴纳提醒的bug修复。', '100', '2018-07-02', '', '', '03', '03', '2018-07-02 22:03:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530540235866', 'RB1530539712698', null, '家族信托需求进度流程mpp设计', '100', '2018-07-02', '', '', '03', '03', '2018-07-02 22:03:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530540263482', 'RB1530539712698', null, '家族信托2.4.0上线测试案例评审', '100', '2018-07-02', '', '', '07', '03', '2018-07-02 22:04:23', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530540300037', 'RB1530540263230', null, '家族信托back端及fore端财产赎回测试', '100', '2018-07-02', '', '', '04', '03', '2018-07-02 22:05:00', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530540332242', 'RB1530540263230', null, '编写家族信托back端财产赎回业务流程用例', '100', '2018-07-02', '', '', '03', '03', '2018-07-02 22:05:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530540342829', 'RB1530540263230', null, '编写家族信托back端财产追加业务流程用例', '100', '2018-07-02', '', '', '03', '03', '2018-07-02 22:05:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530621541031', 'RB1530621464275', null, 'Back端期间指令管理-财产赎回申请及审核测试。', '100', '2018-07-03', '', '', '04', '03', '2018-07-03 20:39:01', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530621699459', 'RB1530621630314', null, '管家系统->产品预约->接口增加字段', '100', '2018-07-03', '', '', '03', '03', '2018-07-03 20:41:39', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530621750837', 'RB1530621630314', null, '管家系统->合同管理->新增回款账户修改页面', '100', '2018-07-03', '', '', '03', '03', '2018-07-03 20:42:31', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530622890671', 'RB1530622878419', null, '家族信托管理端-产品池信息-产品修改页面开发', '100', '2018-07-03', '', '', '03', '03', '2018-07-03 21:01:31', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530622924494', 'RB1530622878419', null, '家族信托管理端-产品池信息-产品新增、修改销售信息页面开发', '50', '2018-07-03', '', '', '03', '02', '2018-07-03 21:02:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530622943544', 'RB1530622923803', null, '保障金批量申请及审批开发用户验收测试', '100', '2018-07-03', '', '', '04', '03', '2018-07-03 21:02:24', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530622966369', 'RB1530622923803', null, '保障金批量申请及审批开发系统角色权限配置并测试', '100', '2018-07-03', '', '', '04', '03', '2018-07-03 21:02:46', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530622993039', 'RB1530622923803', null, '保障金批量申请及审批开发上线清单文档', '50', '2018-07-04', '', '', '03', '02', '2018-07-03 21:03:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530623097802', 'RB1530623050778', null, '家族信托2.4.0版本保障金业务测试', '100', '2018-07-03', '', '', '04', '03', '2018-07-03 21:04:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530623144089', 'RB1530623050778', null, '家族信托2.4.0版本用户验收会', '100', '2018-07-03', '', '', '07', '03', '2018-07-03 21:05:44', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530623144870', 'RB1530623093133', null, '家族信托back端费用支付申请及审批测试', '100', '2018-07-03', '', '', '04', '03', '2018-07-03 21:05:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530623179580', 'RB1530623093133', null, '家族信托back端项目授权页面优化', '100', '2018-07-03', '', '', '03', '03', '2018-07-03 21:06:20', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530707446302', 'RB1530707426631', null, '保障金批量申请及审批开发上线清单文档', '100', '2018-07-04', '', '', '03', '03', '2018-07-04 20:30:46', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530707462746', 'RB1530707426631', null, '保障金批量申请及审批开发用户说明手册', '100', '2018-07-04', '', '', '03', '03', '2018-07-04 20:31:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530707500135', 'RB1530707426631', null, '家族信托2.4.0上线文档评审会议', '100', '2018-07-04', '', '', '07', '03', '2018-07-04 20:31:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530707533054', 'RB1530707524105', null, 'Back端期间指令管理-财产赎回申请及审核测试。', '100', '2018-07-04', '', '', '04', '03', '2018-07-04 20:32:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530707563027', 'RB1530707524105', null, 'Back端费用管理-费用缴纳提醒的优化。', '100', '2018-07-04', '', '', '03', '03', '2018-07-04 20:32:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530707606113', 'RB1530707501511', null, '家族信托管理端-产品池信息-产品新增、修改销售信息页面开发', '70', '2018-07-04', '新增销售信息时，如果是新增页面进去不好确定产品池，需要增加一些处理步骤，工作量有所增加', '', '03', '02', '2018-07-04 20:33:26', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530707632933', 'RB1530707593936', null, '家族信托2.4.0上线版本保障金模块测试', '100', '2018-07-04', '', '', '04', '03', '2018-07-04 20:33:53', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530707666835', 'RB1530707593936', null, '家族信托2.4.0版本上线清单评审会', '100', '2018-07-04', '', '', '07', '03', '2018-07-04 20:34:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530707679890', 'RB1530707501511', null, '家族信托管理端-产品池信息-产品新增页面浮动、固定收益率不能保存的小BUG修复', '100', '2018-07-04', '', '', '03', '03', '2018-07-04 20:34:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530707738773', 'RB1530707716317', null, '长安信托管家系统->合同管理->回款账户修改菜单的列表页', '100', '2018-07-04', '', '', '03', '03', '2018-07-04 20:35:39', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530707767641', 'RB1530707725229', null, '家族信托back端费用缴纳提醒测试', '100', '2018-07-04', '', '', '04', '03', '2018-07-04 20:36:08', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530707792293', 'RB1530707725229', null, '家族信托back端保障金批量申请及审批测试', '100', '2018-07-04', '', '', '03', '03', '2018-07-04 20:36:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530794591165', 'RB1530794547963', null, '保障金批量申请及审批的上线前验证测试', '100', '2018-07-05', '', '', '04', '03', '2018-07-05 20:43:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530794631124', 'RB1530794556131', null, '编写家族信托back端期间指令管理-财产赎回申请及审批操作手册', '100', '2018-07-05', '', '', '03', '03', '2018-07-05 20:43:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530794669909', 'RB1530794547963', null, '保障金批量申请及审批修复BUG问题', '100', '2018-07-05', '', '', '03', '03', '2018-07-05 20:44:30', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530794807491', 'RB1530794762326', null, 'Back端保障金管理测试。', '100', '2018-07-05', '', '', '04', '03', '2018-07-05 20:46:47', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530794975499', 'RB1530794919442', null, '管家系统->合同管理->新增回款账户详情页面', '100', '2018-07-05', '', '', '03', '03', '2018-07-05 20:49:35', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530795067603', 'RB1530794556131', null, '编写家族信托fore端期间指令管理-财产赎回申请及审批操作手册', '100', '2018-07-05', '', '', '03', '03', '2018-07-05 20:51:08', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530795131651', 'RB1530795098715', null, '家族信托TA系统他益产品申购需求分析', '100', '2018-07-05', '', '', '01', '03', '2018-07-05 20:52:12', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530796445435', 'RB1530796384888', null, '家族信托管理端-产品池信息-产品新增、修改销售信息页面开发', '80', '2018-07-05', '销售信息的TAB页，和娟讨论后暂定不显示在产品新增页面中，等周五开会时会上再决定', '', '03', '02', '2018-07-05 21:14:05', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530796462384', 'RB1530796384888', null, '家族信托管理端-产品池信息-产品查看页面开发', '100', '2018-07-05', '', '', '03', '03', '2018-07-05 21:14:22', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530796491377', 'RB1530796384888', null, '家族信托管理端-产品池信息-产品相关文件页面开发', '100', '2018-07-05', '', '', '03', '03', '2018-07-05 21:14:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530868872335', 'RB1530868834289', null, '管家系统->合同管理->详情页面继续开发', '100', '2018-07-06', '', '', '03', '03', '2018-07-06 17:21:12', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530868896666', 'RB1530868690661', null, '修复保障金缴纳提醒存储过程问题', '100', '2018-07-06', '', '', '03', '03', '2018-07-06 17:21:37', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530868898388', 'RB1530868878594', null, 'Back端费用管理-费用缴纳提醒的优化。', '100', '2018-07-06', '', '', '03', '03', '2018-07-06 17:21:38', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530868931387', 'RB1530868836797', null, '家族信托管理端-新增投配指令页面改造', '30', '2018-07-06', '受产品改造影响，除了投配指令的新增页面外，修改、查看页面也都受影响', '家族信托管理端-投配指令相关页面改造', '03', '02', '2018-07-06 17:22:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530868943297', 'RB1530868878594', null, 'Back端期间指令管理-财产追加申请及审核、财产赎回申请及审核的测试。', '100', '2018-07-06', '', '', '04', '03', '2018-07-06 17:22:23', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530869066698', 'RB1530869008300', null, '家族信托back端财产追加及赎回指令查询列表新增运营AB岗权限控制', '100', '2018-07-06', '', '家族系统back端及fore端菜单及按钮权限梳理', '03', '03', '2018-07-06 17:24:27', null, '2018-07-06 17:27:38', 'USER002', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530869130196', 'RB1530868878594', null, '关于家族信托2.4.0版本的总结会议。', '100', '2018-07-06', '', '', '07', '03', '2018-07-06 17:25:30', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1530869154945', 'RB1530869008300', null, '家族系统2.4.0版本上线总结会', '100', '2018-07-06', '', '', '07', '03', '2018-07-06 17:25:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531139436537', 'RB1531139403530', null, '家族信托菜单权限文档整理', '100', '2018-07-09', '', '', '02', '03', '2018-07-09 20:30:37', null, '2018-07-09 20:31:24', 'USER004', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531139504502', 'RB1531139477696', null, '家族信托管理端-新增投配指令页面改造', '40', '2018-07-09', '', '', '03', '02', '2018-07-09 20:31:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531139518463', 'RB1531139471121', null, '菜单控件梳理', '100', '2018-07-09', '', '', '08', '03', '2018-07-09 20:31:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531139580540', 'RB1531139477696', null, '家族信托项目-系统菜单改造文档整理', '50', '2018-07-09', '', '', '03', '02', '2018-07-09 20:33:01', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531139596481', 'RB1531139522305', null, '长安信托互联网金融招标文件分析', '100', '2018-07-09', '', '', '08', '03', '2018-07-09 20:33:16', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531139944714', 'RB1531139753745', null, '整理菜单控件梳理及选项卡功能实施方案表', '100', '2018-07-09', '', '', '03', '03', '2018-07-09 20:39:05', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531140173728', 'RB1531140092911', null, '管家系统->bug修复->sql中日期格式化时,出现错误格式,进行数据排查', '100', '2018-07-09', '', '', '03', '03', '2018-07-09 20:42:54', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531140218493', 'RB1531140092911', null, '管家系统->合同管理->查看回款账户信息页面编写', '100', '2018-07-09', '', '', '03', '03', '2018-07-09 20:43:38', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531226933147', 'RB1531226876449', null, '管家系统->合同管理->发函(生成pdf文件)', '100', '2018-07-10', '', '', '03', '03', '2018-07-10 20:48:53', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531227696856', 'RB1531227686518', null, '家族信托管理端-产品池信息-产品新增、修改销售信息页面开发', '90', '2018-07-10', '', '', '03', '02', '2018-07-10 21:01:37', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531227718982', 'RB1531227686518', null, '家族信托管理端-新增投配指令页面改造', '70', '2018-07-10', '', '', '03', '02', '2018-07-10 21:01:59', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531227777321', 'RB1531227686518', null, '家族信托项目-产品销售信息页面及投配指令产品相关改造需求确认会议', '100', '2018-07-10', '', '', '07', '03', '2018-07-10 21:02:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531227790009', 'RB1531227780763', null, '菜单控件梳理', '100', '2018-07-10', '', '', '08', '03', '2018-07-10 21:03:10', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531227826020', 'RB1531227772316', null, '整理菜单空间梳理及选项卡功能实施方案文档', '100', '2018-07-10', '', '', '03', '03', '2018-07-10 21:03:46', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531227826667', 'RB1531227780763', null, 'Back端菜单控件修改', '30', '2018-07-10', '', '', '03', '02', '2018-07-10 21:03:47', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531227866162', 'RB1531227807589', null, '家族信托新菜单权限修改分析', '70', '2018-07-10', '', '', '03', '02', '2018-07-10 21:04:26', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531227883096', 'RB1531227772316', null, '菜单及选项卡改造：保障金管理', '100', '2018-07-10', '', '', '03', '03', '2018-07-10 21:04:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531227932241', 'RB1531227842662', null, '家族系统back端期间指令管理模块菜单及权限改造', '10', '2018-07-10', '', '', '03', '02', '2018-07-10 21:05:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531312369824', 'RB1531312335000', null, '家族信托管理端菜单和权限更换', '100', '2018-07-11', '', '', '03', '03', '2018-07-11 20:32:50', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531312385644', 'RB1531312368408', null, 'Back端菜单控件修改', '80', '2018-07-11', '', '', '03', '02', '2018-07-11 20:33:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531312611686', 'RB1531312559127', null, '管家系统->合同管理->复核列表页和复核页开发', '100', '2018-07-11', '', '', '03', '03', '2018-07-11 20:36:52', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531312616687', 'RB1531312604754', null, '家族系统back端期间指令管理模块菜单及权限改造', '100', '2018-07-11', '', '', '03', '03', '2018-07-11 20:36:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531312638748', 'RB1531312628920', null, '家族信托管理端-产品池信息-产品新增、修改销售信息页面开发', '100', '2018-07-11', '', '', '03', '03', '2018-07-11 20:37:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531312664479', 'RB1531312628920', null, '家族信托项目-系统菜单改造文档整理', '100', '2018-07-11', '', '', '03', '03', '2018-07-11 20:37:44', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531312691276', 'RB1531312628920', null, '家族信托项目-系统权限菜单改造方案评审', '100', '2018-07-11', '', '', '07', '03', '2018-07-11 20:38:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531312695160', 'RB1531312604754', null, 'back端财产分配申请改造需求分析', '80', '2018-07-11', '', '', '01', '02', '2018-07-11 20:38:15', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531312698661', 'RB1531312616799', null, '长安信托长安管家投标文件编写', '30', '2018-07-11', '', '', '08', '02', '2018-07-11 20:38:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399443040', 'RB1531399429611', null, 'Back端菜单控件修改', '100', '2018-07-12', '', '', '03', '03', '2018-07-12 20:44:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399458029', 'RB1531399429611', null, 'Fore端菜单控件修改', '100', '2018-07-12', '', '', '03', '03', '2018-07-12 20:44:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399462036', 'RB1531396897610', null, '家族信托前端菜单和权限更换', '100', '2018-07-12', '', '', '03', '03', '2018-07-12 20:44:22', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399527249', 'RB1531399486875', null, '长安信托长安管家投标文件编写', '50', '2018-07-12', '', '', '08', '02', '2018-07-12 20:45:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399588855', 'RB1531399579758', null, 'back端财产分配申请改造需求分析', '100', '2018-07-12', '', '', '01', '03', '2018-07-12 20:46:29', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399627048', 'RB1531399579758', null, '家族系统back端信托财产管理模块菜单及权限改造', '100', '2018-07-12', '', '', '03', '03', '2018-07-12 20:47:07', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399640975', 'RB1531399579758', null, '家族系统back端财务管理模块菜单及权限改造', '100', '2018-07-12', '', '', '03', '03', '2018-07-12 20:47:21', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399659823', 'RB1531399579758', null, '家族系统back端产品分配清算管理模块菜单及权限改造', '100', '2018-07-12', '', '', '03', '03', '2018-07-12 20:47:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399665018', 'RB1531399655801', null, '家族信托项目-系统权限菜单改造', '100', '2018-07-12', '', '', '03', '03', '2018-07-12 20:47:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399671711', 'RB1531399579758', null, '家族系统fore端信托财产管理模块菜单及权限改造', '100', '2018-07-12', '', '', '03', '03', '2018-07-12 20:47:52', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399686414', 'RB1531399655801', null, '家族信托管理端-新增投配指令页面改造', '80', '2018-07-12', '', '', '03', '02', '2018-07-12 20:48:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399689369', 'RB1531399579758', null, '家族系统fore端期间指令管理模块菜单及权限改造', '100', '2018-07-12', '', '', '03', '03', '2018-07-12 20:48:09', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399707168', 'RB1531399579758', null, '家族系统fore端财务管理模块菜单及权限改造', '100', '2018-07-12', '', '', '03', '03', '2018-07-12 20:48:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399727535', 'RB1531399579758', null, '家族系统fore端信托意向管理模块菜单及权限改造', '100', '2018-07-12', '', '', '03', '03', '2018-07-12 20:48:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531399937810', 'RB1531399866813', null, '管家系统->合同管理->新增回款审核的(查看和审核界面)', '100', '2018-07-12', '', '', '03', '03', '2018-07-12 20:52:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531476634900', 'RB1531476602711', null, '家族信托前端菜单和权限测试', '100', '2018-07-13', '', '', '04', '03', '2018-07-13 18:10:35', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531476965576', 'RB1531476942210', null, '菜单控件测试', '100', '2018-07-13', '', '', '04', '03', '2018-07-13 18:16:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531477197667', 'RB1531477145378', null, 'back端财产分配流程方案梳理', '100', '2018-07-13', '', '', '07', '03', '2018-07-13 18:19:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531477255496', 'RB1531477217639', null, '管家系统->合同管理->修改回款信息', '100', '2018-07-13', '', '', '03', '03', '2018-07-13 18:20:55', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531477517005', 'RB1531477145378', null, '菜单权限和按钮权限表同步', '100', '2018-07-13', '', '', '03', '03', '2018-07-13 18:25:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531478055747', 'RB1531478047681', null, '家族信托管理端-新增投配指令页面改造', '100', '2018-07-13', '', '', '03', '03', '2018-07-13 18:34:16', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531736555154', 'RB1531736533341', null, 'Back端菜单控件测试', '100', '2018-07-16', '', '', '04', '03', '2018-07-16 18:22:35', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531745690880', 'RB1531745616892', null, '管家系统->合同管理->完成合同回款修改审核需求', '100', '2018-07-16', '', '', '03', '03', '2018-07-16 20:54:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531746358612', 'RB1531746310313', null, '家族信托门户端-产品新增、修改改造', '100', '2018-07-16', '', '', '03', '03', '2018-07-16 21:05:59', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531746392068', 'RB1531746310313', null, '家族信托门户端-投配指令产品相关改造', '100', '2018-07-16', '', '', '03', '03', '2018-07-16 21:06:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531746450736', 'RB1531746310313', null, '家族信托项目-产品管理、投配指令管理，页面角色数据完善', '100', '2018-07-16', '', '', '03', '03', '2018-07-16 21:07:31', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531746454451', 'RB1531746367500', null, 'back端财产分配申请改造需求分析及工作量评估', '100', '2018-07-16', '', '', '01', '03', '2018-07-16 21:07:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531746494984', 'RB1531746310313', null, '家族信托项目-禅道提的BUG和任务的修复与开发', '50', '2018-07-16', '', '', '03', '02', '2018-07-16 21:08:15', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531746538284', 'RB1531746367500', null, 'back端期间指令管理、信托财产管理、财务管理、产品分配清算管理菜单及按钮权限测试', '100', '2018-07-16', '', '', '04', '03', '2018-07-16 21:08:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531746628486', 'RB1531746591852', null, '家族信托2.5.0版本菜单权限修改上线测试', '50', '2018-07-16', '', '', '04', '02', '2018-07-16 21:10:28', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531746719076', 'RB1531746678217', null, '家族信托产品入池流程需求分析', '80', '2018-07-17', '', '', '01', '02', '2018-07-16 21:11:59', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531746750537', 'RB1531746678217', null, '家族信托新版菜单及权限上版清单文档', '100', '2018-07-16', '', '', '03', '03', '2018-07-16 21:12:31', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531746774398', 'RB1531746678217', null, '家族信托新版菜单及权限验收测试', '100', '2018-07-16', '', '', '04', '03', '2018-07-16 21:12:54', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531835931612', 'RB1531835889424', null, 'back端产品管理模块测试', '100', '2018-07-17', '', '', '04', '03', '2018-07-17 21:58:52', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531835944545', 'RB1531835889424', null, 'fore端产品管理模块测试', '100', '2018-07-17', '', '', '04', '03', '2018-07-17 21:59:05', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531836077707', 'RB1531835889424', null, '修复back端期间管理报告新增、持有资产信息、投配确认函页面收益率显示问题', '100', '2018-07-17', '', '', '03', '03', '2018-07-17 22:01:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531836090426', 'RB1531836082705', null, '产品管理模块的测试', '100', '2018-07-17', '', '', '04', '03', '2018-07-17 22:01:30', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531836102722', 'RB1531836082705', null, '产品管理模块的bug修复', '100', '2018-07-17', '', '', '03', '03', '2018-07-17 22:01:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531836111321', 'RB1531836048082', null, '家族信托管理端产品产品池信息查看页面添加FA信息tag标签页查询页面', '100', '2018-07-17', '', '', '03', '03', '2018-07-17 22:01:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531836117344', 'RB1531836086778', null, '家族信托2.5.0版本菜单权限修改上线测试', '80', '2018-07-17', '', '', '04', '02', '2018-07-17 22:01:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531836127468', 'RB1531835889424', null, '修复fore端持有资产信息页面收益率显示问题', '100', '2018-07-17', '', '', '03', '03', '2018-07-17 22:02:07', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531836167965', 'RB1531836048082', null, '家族信托管理端修复产品池管理FA页面管理人显示问题', '100', '2018-07-17', '', '', '03', '03', '2018-07-17 22:02:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531836227459', 'RB1531836048082', null, '家族信托长安非全委产品入池同步TA产品信息存储过程', '30', '2018-07-20', '', '', '01', '02', '2018-07-17 22:03:47', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531837105408', 'RB1531837058150', null, '家族信托项目-修复产品新增、修改，投配指令产品改造相关测试出的BUG', '90', '2018-07-17', '', '', '03', '02', '2018-07-17 22:18:25', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531837352292', 'RB1531837308897', null, '管家系统->合同管理->修改合同回款需求bug', '100', '2018-07-17', '', '', '03', '03', '2018-07-17 22:22:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531917196868', 'RB1531917170631', null, '家族信托长安非全委产品入池同步TA产品信息存储过程', '40', '2018-07-20', '', '', '01', '02', '2018-07-18 20:33:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531917225959', 'RB1531917170631', null, '家族信托前端菜单和权限验证测试', '100', '2018-07-18', '', '', '04', '03', '2018-07-18 20:33:46', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531917656731', 'RB1531917631102', null, '产品管理模块和投配管理模块权限的测试', '100', '2018-07-18', '', '', '04', '03', '2018-07-18 20:40:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531918888039', 'RB1531918845567', null, '管家系统->合同管理->增加TA信息同步部分', '100', '2018-07-18', '', '', '03', '03', '2018-07-18 21:01:28', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531919102518', 'RB1531919002164', null, '修复back端期间管理报告新增、持有资产信息、投配确认函页面收益率显示问题', '100', '2018-07-18', '', '', '03', '03', '2018-07-18 21:05:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531919178438', 'RB1531919002164', null, 'back端项目管理模块权限测试', '100', '2018-07-18', '', '', '04', '03', '2018-07-18 21:06:18', null, '2018-07-18 21:06:49', 'USER002', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531919198006', 'RB1531919002164', null, 'back端信托资产管理模块权限测试', '100', '2018-07-18', '', '', '04', '03', '2018-07-18 21:06:38', null, '2018-07-18 21:07:26', 'USER002', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531924693850', 'RB1531924682606', null, '家族信托2.5.0版本菜单权限修改上线测试', '100', '2018-07-18', '', '', '04', '03', '2018-07-18 22:38:14', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1531924729252', 'RB1531924717302', null, '家族信托项目-修复产品新增、修改，投配指令产品改造相关测试出的BUG', '100', '2018-07-18', '', '', '03', '03', '2018-07-18 22:38:49', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532001983545', 'RB1532001924343', null, 'Back端信托资产管理模块-持有资产汇总列表的bug修复。', '100', '2018-07-19', '', '', '03', '03', '2018-07-19 20:06:24', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532002526650', 'RB1532002490068', null, '菜单及权限上线清单评审', '100', '2018-07-19', '', '', '07', '03', '2018-07-19 20:15:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532002566591', 'RB1532002490068', null, '家族信托back端权限列表需求分析', '100', '2018-07-19', '', '', '01', '03', '2018-07-19 20:16:07', null, '2018-07-19 20:16:21', 'USER004', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532002606577', 'RB1532002490068', null, '家族信托back端权限列表开发', '80', '2018-07-20', '', '', '01', '02', '2018-07-19 20:16:47', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532004344952', 'RB1532004301175', null, '管家系统->合同管理->t2sdk接口开发', '100', '2018-07-19', '', '', '03', '03', '2018-07-19 20:45:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532005737678', 'RB1532005574472', null, 'back端及fore端信托资产管理-货币资金信息需求分析', '30', '2018-07-19', '', '', '01', '02', '2018-07-19 21:08:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532005924650', 'RB1532005882785', null, '家族信托2.5.0系统测试', '100', '2018-07-19', '', '', '04', '03', '2018-07-19 21:12:05', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532008796735', 'RB1532008764631', null, '家族信托项目-修复当天产品新增、修改，投配指令产品改造相关测试出的BUG', '100', '2018-07-19', '', '', '03', '03', '2018-07-19 21:59:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532008838509', 'RB1532008764631', null, '家族信托项目-辅助解决产品数据迁移遇到的问题', '100', '2018-07-19', '', '', '03', '03', '2018-07-19 22:00:39', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532008878396', 'RB1532008764631', null, '家族信托项目-2.5.0版本上线清单评审会议', '100', '2018-07-19', '', '', '07', '03', '2018-07-19 22:01:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532081058394', 'RB1532080994353', null, '角色权限及按钮的测试。', '100', '2018-07-20', '', '', '04', '03', '2018-07-20 18:04:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532081112546', 'RB1532080994353', null, 'Fore端用户管理-权限列表模块的开发。', '30', '2018-07-20', '', '', '03', '02', '2018-07-20 18:05:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532081168270', 'RB1532081116308', null, '管家系统->合同管理->修复测试bug.', '100', '2018-07-20', '', '', '03', '03', '2018-07-20 18:06:08', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532081552262', 'RB1532081496155', null, '家族信托项目-当天测试发现BUG修复', '100', '2018-07-20', '', '', '03', '03', '2018-07-20 18:12:32', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532081581076', 'RB1532081496155', null, '家族信托项目-管理端、门户端，投配指令测试案例编写', '100', '2018-07-20', '', '', '03', '03', '2018-07-20 18:13:01', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532081674964', 'RB1532081508802', null, 'back端及fore端信托资产管理-货币资金信息需求分析', '100', '2018-07-20', '', '', '01', '03', '2018-07-20 18:14:35', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532081705278', 'RB1532081508802', null, 'back端信托资产管理-货币资金信息开发', '30', '2018-07-20', '', '', '03', '02', '2018-07-20 18:15:05', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532349266231', 'RB1532349246847', null, '家族信托项目Fore端用户管理-权限列表模块的开发。', '100', '2018-07-23', '', '', '03', '03', '2018-07-23 20:34:26', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532349377246', 'RB1532349246847', null, '家族信托项目用户管理-权限列表模块的用户文档补充。', '100', '2018-07-23', '', '', '08', '03', '2018-07-23 20:36:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532350893353', 'RB1532350846843', null, '家族信托管理端菜单权限优化改造', '100', '2018-07-23', '', '', '03', '03', '2018-07-23 21:01:33', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532351033691', 'RB1532350961676', null, '家族信托2.5.0版本测试环境BUG验证测试', '100', '2018-07-23', '', '', '04', '03', '2018-07-23 21:03:54', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532351074932', 'RB1532350846843', null, '家族信托2.5.0上线前测试问题跟踪会议', '100', '2018-07-23', '', '', '07', '03', '2018-07-23 21:04:35', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532351582643', 'RB1532351541206', null, '管家系统->合同管理->核对需求,修改需求存在的问题', '100', '2018-07-23', '', '', '03', '03', '2018-07-23 21:13:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532360364853', 'RB1532360313179', null, '家族信托项目-管理端-交易在途（已拨款）节点信息汇总导出excel', '30', '2018-07-23', '', '', '03', '02', '2018-07-23 23:39:25', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532360424837', 'RB1532360313179', null, '家族信托项目-管理端、门户端，投配指令产品改造相关与产品新增修改页面当天发现BUG修复', '100', '2018-07-23', '', '', '03', '03', '2018-07-23 23:40:25', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532437311681', 'RB1532437277931', null, '家族信托项目2.5.0版本测试验证', '100', '2018-07-24', '', '', '04', '03', '2018-07-24 21:01:52', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532437335813', 'RB1532437277931', null, '家族信托项目组2.5.0版本产品功能测试案例编写', '50', '2018-07-24', '', '', '04', '02', '2018-07-24 21:02:16', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532437366788', 'RB1532437264827', null, '家族信托相关展示资产信息的需要添加收益级别字段', '100', '2018-07-24', '', '', '03', '03', '2018-07-24 21:02:47', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532437387206', 'RB1532437368198', null, 'back端信托资产管理-货币资金信息开发', '100', '2018-07-24', '', '', '03', '03', '2018-07-24 21:03:07', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532437399029', 'RB1532437368198', null, 'fore端信托资产管理-货币资金信息开发', '100', '2018-07-24', '', '', '03', '03', '2018-07-24 21:03:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532437404194', 'RB1532437264827', null, '家族信托产品相关数据迁移的验证', '80', '2018-07-25', '', '', '04', '02', '2018-07-24 21:03:24', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532437458913', 'RB1532437406628', null, '家族信托项目用户管理-权限列表模块的测试。', '100', '2018-07-24', '', '', '04', '03', '2018-07-24 21:04:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532437482652', 'RB1532437474491', null, '家族信托项目-管理端-交易在途（已拨款）节点信息汇总导出excel', '100', '2018-07-24', '', '', '03', '03', '2018-07-24 21:04:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532437483277', 'RB1532437406628', null, '家族信托项目用户管理-权限列表模块的bug修复。', '100', '2018-07-24', '', '', '03', '03', '2018-07-24 21:04:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532437498951', 'RB1532437474491', null, '家族信托项目-管理端、门户端，投配指令产品改造相关与产品新增修改页面当天发现BUG修复', '100', '2018-07-24', '', '', '03', '03', '2018-07-24 21:04:59', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532437692093', 'RB1532437649278', null, '管家系统->合同管理->针对合同中的部分遗漏的需求进行开发', '100', '2018-07-24', '', '', '03', '03', '2018-07-24 21:08:12', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532520148870', 'RB1532520104426', null, '管家系统->合同管理->添加回款账户修改首页提醒功能', '100', '2018-07-25', '', '', '03', '03', '2018-07-25 20:02:29', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532524323883', 'RB1532523852385', null, 'back端期间指令管理、财务管理、信托财产管理、产品分配清算管理模块权限测试', '100', '2018-07-25', '', '', '04', '03', '2018-07-25 21:12:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532524336682', 'RB1532523852385', null, 'fore端期间指令管理、财务管理、信托财产管理、产品分配清算管理模块权限测试', '100', '2018-07-25', '', '', '04', '03', '2018-07-25 21:12:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532524534118', 'RB1532524500486', null, '家族信托项目费用管理-费用提醒模块的bug修复。', '100', '2018-07-25', '', '', '03', '03', '2018-07-25 21:15:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532524573071', 'RB1532524500486', null, '家族信托项目角色权限的测试。', '100', '2018-07-25', '', '', '04', '03', '2018-07-25 21:16:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532524658966', 'RB1532524618778', null, '家族信托2.5.0版本流程案例分角色验证测试', '100', '2018-07-25', '', '', '04', '03', '2018-07-25 21:17:39', null, '2018-07-25 21:31:19', 'USER001', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532525446796', 'RB1532525438708', null, '家族信托项目-管理端、门户端，投配指令产品改造相关与产品新增修改页面当天发现BUG修复', '100', '2018-07-25', '', '', '03', '03', '2018-07-25 21:30:47', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532525479098', 'RB1532525438708', null, '家族信托项目-2.5.0版本上线清单', '100', '2018-07-25', '', '', '03', '03', '2018-07-25 21:31:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532525548308', 'RB1532525509837', null, '家族信托菜单权限角色全流程测试', '100', '2018-07-25', '', '', '04', '03', '2018-07-25 21:32:28', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532525549023', 'RB1532523852385', null, 'back端期间指令管理、投配指令管理流程测试', '100', '2018-07-25', '', '', '04', '03', '2018-07-25 21:32:29', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532525570864', 'RB1532525509837', null, '家族信托产品相关数据迁移的验证', '100', '2018-07-25', '', '', '04', '03', '2018-07-25 21:32:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532525603193', 'RB1532525509837', null, '家族信托修复披露报告页面跳转问题', '100', '2018-07-25', '', '', '03', '03', '2018-07-25 21:33:23', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532610091418', 'RB1532610064316', null, '管家系统-首页提醒功能开发', '100', '2018-07-26', '', '', '03', '03', '2018-07-26 21:01:31', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532611742961', 'RB1532611691661', null, '家族信托项目费用管理模块的流程测试、项目成立公告的流程测试。', '100', '2018-07-26', '', '', '04', '03', '2018-07-26 21:29:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532611776424', 'RB1532611758025', null, '家族信托项目-管理端、门户端，投配指令产品改造相关与产品新增修改页面当天发现BUG修复', '100', '2018-07-26', '', '', '03', '03', '2018-07-26 21:29:36', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532611782783', 'RB1532611754904', null, '家族信托2.5.0版本上线测试', '100', '2018-07-26', '', '', '04', '03', '2018-07-26 21:29:43', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532611804699', 'RB1532611736925', null, 'fore端期间指令管理业务流程测试', '100', '2018-07-26', '', '', '04', '03', '2018-07-26 21:30:05', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532611814974', 'RB1532611758025', null, '家族信托项目-管理端、门户端，投配指令产品改造相关用户操作手册编写', '100', '2018-07-26', '', '', '03', '03', '2018-07-26 21:30:15', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532611815335', 'RB1532611754904', null, '家族信托2.5.0版本上线清单评审', '100', '2018-07-26', '', '', '07', '03', '2018-07-26 21:30:15', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532685618182', 'RB1532685418475', null, '家族系统2.5.0版本上线总结会', '100', '2018-07-27', '', '', '07', '03', '2018-07-27 18:00:18', null, '2018-07-27 18:01:27', 'USER002', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532685657987', 'RB1532685642999', null, '家族信托项目2.5.0版本的总结会议。', '100', '2018-07-27', '', '', '07', '03', '2018-07-27 18:00:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532685695034', 'RB1532685642999', null, '家族信托项目2.6.0版本项目成立公告模块的需求分析。', '100', '2018-07-27', '', '', '01', '03', '2018-07-27 18:01:35', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532686778333', 'RB1532686649087', null, '家族信托2.5.0上线总结暨2.6.0工作安排', '100', '2018-07-27', '', '', '07', '03', '2018-07-27 18:19:38', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532686803330', 'RB1532686649087', null, '家族信托2.6.0需求分析', '50', '2018-07-27', '', '', '01', '02', '2018-07-27 18:20:03', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532688454516', 'RB1532688399128', null, '管家系统->合同管理->集中测试', '100', '2018-07-27', '', '', '04', '03', '2018-07-27 18:47:35', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532692011773', 'RB1532691967661', null, '家族信托项目-产品新增、修改详细设计流程图修订', '100', '2018-07-27', '', '家族信托项目2.6.0版本产品分配清算信息展示与提醒功能工作量分析、设计、开发', '02', '03', '2018-07-27 19:46:52', null, '2018-07-27 19:49:57', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532692038729', 'RB1532691967661', null, '家族信托项目-产品新增、修改界面要素文档修订', '100', '2018-07-27', '', '', '02', '03', '2018-07-27 19:47:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532692066789', 'RB1532691967661', null, '家族信托项目-2.5.0版本上线总结及2.6.0版本开发计划', '100', '2018-07-27', '', '', '07', '03', '2018-07-27 19:47:47', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532950548059', 'RB1532950493604', null, '家族信托长安非全委产品入池同步TA产品信息存储过程', '50', '2018-08-01', '', '', '03', '02', '2018-07-30 19:35:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532950598495', 'RB1532950493604', null, '家族信托修复门户端系统角色权限管理数据缺失问题', '100', '2018-07-30', '', '', '03', '03', '2018-07-30 19:36:38', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532951994833', 'RB1532951701957', null, '家族信托用户手册1、2、3版的熟悉', '100', '2018-07-31', '', '', '04', '02', '2018-07-30 19:59:55', null, '2018-07-31 19:01:52', 'USER1532950925725', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532952063803', 'RB1532951701957', null, '云桌面的搭建以及SVN环境的搭建', '100', '2018-07-30', '', '', '04', '03', '2018-07-30 20:01:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532952097007', 'RB1532952043694', null, '家族信托项目-管理端、门户端2.5.0版本生产环境发现的BUG修复', '100', '2018-07-30', '', '', '03', '03', '2018-07-30 20:01:37', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532952154130', 'RB1532952043694', null, '家族信托项目-管理端，财产追加指令确认函修改', '100', '2018-07-30', '', '', '03', '03', '2018-07-30 20:02:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532952174357', 'RB1532952134457', null, '家族信托2.5.0版本回溯测试', '100', '2018-07-30', '', '', '04', '03', '2018-07-30 20:02:54', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532952328805', 'RB1532952276979', null, 'back端财产分配指令审核功能改造', '60', '2018-07-30', '', '', '03', '02', '2018-07-30 20:05:29', null, '2018-07-30 20:30:58', 'USER002', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532952430502', 'RB1532952392116', null, '管家系统->合同管理->配合业务测试', '100', '2018-07-30', '', '', '04', '03', '2018-07-30 20:07:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532952432915', 'RB1532952276979', null, 'Back端财产分配申请新增自动及手动向TA推送分配方案功能', '50', '2018-07-30', '', '', '03', '02', '2018-07-30 20:07:13', null, '2018-07-30 20:31:10', 'USER002', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1532953319262', 'RB1532953287378', null, 'Back端项目管理-项目成立管理的OA归档功能开发。', '50', '2018-07-30', '', '', '03', '02', '2018-07-30 20:21:59', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533032832776', 'RB1533032539802', null, '32214234', '33', '2018-07-31', '43534', '3453453453', '01', '02', '2018-07-31 18:27:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533034932858', 'RB1533034877269', null, '家族信托用户手册1、2、3版的熟悉', '100', '2018-07-31', '', '', '04', '03', '2018-07-31 19:02:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533034937218', 'RB1533034877269', null, '家族信托业务流程用例2.3版本的熟悉', '100', '2018-07-31', '', '', '04', '03', '2018-07-31 19:02:17', null, '2018-07-31 19:04:21', 'USER1532950925725', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533042500419', 'RB1533042442709', null, '家族信托长安非全委产品入池同步TA产品信息存储过程开发', '100', '2018-07-31', '', '', '03', '03', '2018-07-31 21:08:20', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533042562287', 'RB1533037423836', null, '家族信托投配流程优化改造需求分析', '100', '2018-07-31', '', '', '01', '03', '2018-07-31 21:09:22', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533042569710', 'RB1533042498691', null, '家族信托项目-管理端-投配指令改造需求分析', '100', '2018-07-31', '', '', '01', '03', '2018-07-31 21:09:30', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533042635604', 'RB1533042498691', null, '家族信托项目-管家对接改造相关需求会议', '100', '2018-07-31', '', '', '07', '03', '2018-07-31 21:10:36', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533042739174', 'RB1533042633405', null, 'back端财产分配申请RP图设计', '100', '2018-07-31', '', '', '02', '03', '2018-07-31 21:12:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533042770956', 'RB1533042633405', null, 'back端财产分配申请详细设计', '100', '2018-07-31', '', '', '02', '03', '2018-07-31 21:12:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533042793524', 'RB1533042719472', null, '家族信托项目Back端成立公告OA归档功能分析', '100', '2018-07-31', '', '', '01', '03', '2018-07-31 21:13:14', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533042813121', 'RB1533042750879', null, '管家系统->合同管理->开发业务人员测试后提出的新需求', '100', '2018-07-31', '', '', '03', '03', '2018-07-31 21:13:33', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533125426295', 'RB1533125378635', null, 'back端投配流程改造评审', '100', '2018-08-01', '', '', '07', '03', '2018-08-01 20:10:26', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533125516175', 'RB1533125378635', null, 'back端投配流程新增初审中节点', '100', '2018-08-01', '', '', '03', '03', '2018-08-01 20:11:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533127158181', 'RB1533127118106', null, '家族信托项目2.6.0版本投配模块需求分析。', '100', '2018-08-01', '', '', '07', '03', '2018-08-01 20:39:18', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533127193318', 'RB1533127118106', null, '家族信托项目Back端投配管理模块通知功能的开发。', '70', '2018-08-01', '', '', '03', '02', '2018-08-01 20:39:53', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533128482746', 'RB1533128455713', null, '家族信托项目-管理端-投配指令改造任务需求实施方案评审', '100', '2018-08-01', '', '', '07', '03', '2018-08-01 21:01:23', null, '2018-08-01 21:02:46', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533128516182', 'RB1533128455713', null, '家族信托项目-管理端-投配指令改造', '70', '2018-08-01', '', '', '03', '02', '2018-08-01 21:01:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533128673910', 'RB1533128641363', null, '家族信托产品入池流程申请及审批列表页面开发', '100', '2018-08-01', '', '', '03', '03', '2018-08-01 21:04:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533128691049', 'RB1533128641363', null, '家族信托产品入池流程申请及审批详情页面开发', '70', '2018-08-02', '', '', '03', '02', '2018-08-01 21:04:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533128756143', 'RB1533128641363', null, '家族信托产品入池同步TA产品按钮调用存储过程', '90', '2018-08-02', '存储过程单独跑没问题，代码调用却报错', '', '03', '02', '2018-08-01 21:05:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533128892901', 'RB1533128817353', null, '家族信托对接管家系统5个接口开发', '30', '2018-08-01', '', '', '03', '02', '2018-08-01 21:08:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533128908230', 'RB1533128635401', null, '管家系统->合同管理->合同管理测试', '100', '2018-08-01', '', '', '04', '03', '2018-08-01 21:08:28', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533128930533', 'RB1533128817353', null, '家族信托通知功能修改去掉机构和管理方式限制', '50', '2018-08-01', '', '', '03', '02', '2018-08-01 21:08:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533213138797', 'RB1533213092123', null, '家族信托产品入池流程申请及审批详情页面开发', '100', '2018-08-02', '', '', '03', '03', '2018-08-02 20:32:19', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533213178125', 'RB1533213092123', null, '家族信托产品入池流程申请及审批审核拒绝和退回方法', '100', '2018-08-02', '', '', '03', '03', '2018-08-02 20:32:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533213178186', 'RB1533213159597', null, '家族信托项目-管理端-投配指令改造', '90', '2018-08-02', '交割反馈的业务逻辑太复杂，强调业务需要改动地方较多', '', '03', '02', '2018-08-02 20:32:58', null, '2018-08-02 20:34:06', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533213185985', 'RB1533213167172', null, '家族信托项目Back端投配管理模块通知功能的开发。', '90', '2018-08-02', '', '', '03', '02', '2018-08-02 20:33:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533213207993', 'RB1533213092123', null, '家族信托产品入池流程申请及审批审核通过功能方法', '50', '2018-08-03', '', '', '03', '03', '2018-08-02 20:33:28', null, '2018-08-02 20:33:41', 'USER004', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533213262848', 'RB1533213216120', null, '家族信托对接管家系统5个接口开发', '80', '2018-08-02', '', '', '03', '02', '2018-08-02 20:34:23', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533213421991', 'RB1533213366145', null, 'back端新增提交投配指令外部接口', '100', '2018-08-02', '', '', '03', '03', '2018-08-02 20:37:02', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533213439521', 'RB1533213385074', null, '管家系统->合同管理->发布测试环境+测试', '100', '2018-08-02', '', '', '05', '03', '2018-08-02 20:37:20', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533221482424', 'RB1533221376622', null, '结合新增需求，编写投配管理页面功能和业务测试用例', '100', '2018-08-06', '针对页面数据间的关联关系以及细节不是很明确，也无相关文档，需找相关开发人员了解', '', '04', '02', '2018-08-02 22:51:22', null, '2018-08-06 20:58:48', 'USER1532950925725', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533292144316', 'RB1533292103545', null, '管家系统->合同管理->功能修复', '100', '2018-08-03', '', '', '03', '03', '2018-08-03 18:29:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533297672236', 'RB1533297654906', null, '家族信托产品入池流程申请及审批审核通过功能方法', '100', '2018-08-03', '', '', '03', '03', '2018-08-03 20:01:12', null, '2018-08-03 20:02:05', 'USER004', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533297773302', 'RB1533297654906', null, '家族信托产品入池流程申请及审批的审核拒绝，审批退回，审批拒绝功能', '100', '2018-08-03', '', '', '03', '03', '2018-08-03 20:02:53', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533298013868', 'RB1533298003015', null, '家族信托项目Back端投配管理模块通知功能的开发。', '100', '2018-08-03', '', '', '03', '03', '2018-08-03 20:06:54', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533298037489', 'RB1533298021250', null, '家族信托项目-管理端-投配指令改造', '100', '2018-08-03', '', '', '03', '03', '2018-08-03 20:07:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533298062238', 'RB1533298003015', null, '家族信托项目Back端产品管理模块审核入池申请页面开发。', '100', '2018-08-03', '', '', '03', '03', '2018-08-03 20:07:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533298108609', 'RB1533297953619', null, 'back端修改提交投配指令外部接口', '100', '2018-08-03', '', '', '03', '03', '2018-08-03 20:08:29', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533298131033', 'RB1533298081773', null, '家族信托对接管家系统5个接口开发', '100', '2018-08-03', '', '', '03', '03', '2018-08-03 20:08:51', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533385465944', 'RB1533385412077', null, '结合新增需求，编写投配管理页面功能和业务测试用例', '100', '2018-08-06', '', '', '04', '02', '2018-08-04 20:24:26', null, '2018-08-06 20:58:59', 'USER1532950925725', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533385491556', 'RB1533385412077', null, '新办公电脑相关环境的安装与配置', '100', '2018-08-04', '', '', '08', '03', '2018-08-04 20:24:52', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533558693165', 'RB1533558645199', null, '家族信托长安非全委产品入池权限控制文档', '100', '2018-08-06', '', '', '03', '03', '2018-08-06 20:31:33', null, '2018-08-06 20:32:17', 'USER004', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533558724223', 'RB1533558645199', null, '家族信托长安非全委产品入池页面权限控制', '100', '2018-08-06', '', '', '03', '03', '2018-08-06 20:32:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533558755133', 'RB1533558645199', null, '家族信托长安非全委产品入池业务流程测试文档', '100', '2018-08-06', '', '', '03', '03', '2018-08-06 20:32:35', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533558776081', 'RB1533558645199', null, '家族信托长安非全委产品入池测试案例文档编写', '20', '2018-08-07', '', '', '04', '02', '2018-08-06 20:32:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533559267701', 'RB1533559222866', null, '家族信托项目-管理端、门户端，发起指令发送邮件功能', '100', '2018-08-06', '', '', '03', '03', '2018-08-06 20:41:08', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533559406809', 'RB1533559238963', null, 'back端投配指令初审功能测试', '100', '2018-08-06', '', '', '04', '03', '2018-08-06 20:43:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533559425365', 'RB1533559238963', null, 'back端提交投配指令外部接口测试', '100', '2018-08-06', '', '', '04', '03', '2018-08-06 20:43:45', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533559707466', 'RB1533559649444', null, '家族信托项目投配管理-流程通知的测试。', '70', '2018-08-06', '', '', '04', '02', '2018-08-06 20:48:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533560117476', 'RB1533560002481', null, '管家系统->合同管理->页面细节修改', '100', '2018-08-31', '', '', '03', '03', '2018-08-06 20:55:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533560477281', 'RB1533560415012', null, '根据上级阅读结果，更新投配管理页面功能和业务测试用例', '100', '2018-08-06', '', '', '04', '03', '2018-08-06 21:01:17', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533560498244', 'RB1533560415012', null, '编写APP投配接口测试用例', '100', '2018-08-06', '', '', '04', '03', '2018-08-06 21:01:38', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533636462252', 'RB1533636424362', null, '家族信托2.0.6版本需求变更评审会议', '100', '2018-08-07', '', '', '07', '03', '2018-08-07 18:07:42', null, '2018-08-07 18:08:40', 'USER1532950925725', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533636511448', 'RB1533636424362', null, '2.5.2版本投配接口的测试', '100', '2018-08-07', '', '', '04', '03', '2018-08-07 18:08:31', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533644135089', 'RB1533644074182', null, '管家系统->合同管理->回执函的内容重新编排', '100', '2018-08-07', '', '', '03', '03', '2018-08-07 20:15:35', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533648663651', 'RB1533648619428', null, '家族信托2.6.0版本开发需求讨论会', '100', '2018-08-07', '', '', '07', '03', '2018-08-07 21:31:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533648665758', 'RB1533648649708', null, '家族信托长安非全委产品入池测试案例文档编写', '100', '2018-08-07', '', '', '03', '03', '2018-08-07 21:31:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533648754908', 'RB1533648708372', null, '家族信托项目-2.6.0版本需求方案讨论会', '100', '2018-08-07', '', '', '07', '03', '2018-08-07 21:32:35', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533648770012', 'RB1533648619428', null, '家族信托提供管家接口BUG修改', '50', '2018-08-07', '', '', '03', '02', '2018-08-07 21:32:50', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533648777736', 'RB1533648649708', null, '家族信托2.6.0版本需求讨论会', '100', '2018-08-07', '', '', '07', '03', '2018-08-07 21:32:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533648789493', 'RB1533648644956', null, 'back端财产分配指令审核功能改造', '80', '2018-08-08', '', '', '03', '02', '2018-08-07 21:33:09', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533648796294', 'RB1533648708372', null, '家族信托项目-管理端-CC划款成功后发送邮件通知功能', '90', '2018-08-07', '', '', '03', '02', '2018-08-07 21:33:16', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533648807078', 'RB1533648649708', null, '家族信托长安非全委产品入池业务流程测试', '100', '2018-08-07', '', '', '04', '03', '2018-08-07 21:33:27', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533648810811', 'RB1533648644956', null, 'back端新增财产分配指令复核功能', '80', '2018-08-08', '', '', '03', '02', '2018-08-07 21:33:31', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533648999910', 'RB1533648980190', null, '家族信托项目投配管理-流程通知的测试。', '100', '2018-08-07', '', '', '04', '03', '2018-08-07 21:36:40', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533724343668', 'RB1533724266022', null, '2.6.0版本新增功能业务流程用例的编写，包含财产分配、项目成立、期间报告的申请和审核业务流程用例', '100', '2018-08-08', '', '', '04', '03', '2018-08-08 18:32:24', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533724368065', 'RB1533724266022', null, '2.5.2投配接口的BUG验证', '100', '2018-08-08', '', '', '04', '03', '2018-08-08 18:32:48', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533728621619', 'RB1533728575155', null, '家族信托期间管理报告申请及审批详细设计文档', '100', '2018-08-08', '', '', '01', '03', '2018-08-08 19:43:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533728705482', 'RB1533728575155', null, '家族信托期间管理报告代码移植到新版', '100', '2018-08-08', '', '', '03', '03', '2018-08-08 19:45:05', null, '2018-08-08 20:01:30', 'USER004', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533730029707', 'RB1533729987022', null, '家族信托项目Back端成立公告流程的优化设计。', '100', '2018-08-08', '', '', '02', '03', '2018-08-08 20:07:10', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533730696154', 'RB1533730633164', null, '家族系统->投配指令管理->根据流程测试并熟悉业务', '100', '2018-08-08', '', '', '04', '03', '2018-08-08 20:18:16', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533730746187', 'RB1533730633164', null, '管家系统->合同管理->完善SQL语句并完善相应的文档', '100', '2018-08-08', '', '', '06', '03', '2018-08-08 20:19:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533733414243', 'RB1533733354177', null, '家族信托提供管家接口BUG修改', '100', '2018-08-08', '', '', '03', '03', '2018-08-08 21:03:34', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533734264891', 'RB1533734256908', null, '家族信托项目-管理端，CC划款成功后发送邮件通知功能', '100', '2018-08-08', '', '', '03', '03', '2018-08-08 21:17:45', null, '2018-08-08 21:32:24', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533734303955', 'RB1533734256908', null, '家族信托项目-管理端，产品分配清算提示功能详细设计流程图', '100', '2018-08-08', '', '', '02', '03', '2018-08-08 21:18:24', null, '2018-08-08 21:32:14', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533734342561', 'RB1533734256908', null, '家族信托项目-管理端，产品分配清算提示页面', '80', '2018-08-08', '', '', '03', '02', '2018-08-08 21:19:03', null, '2018-08-08 21:32:00', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533735132945', 'RB1533735123881', null, 'back端财产分配指令审核功能改造', '100', '2018-08-08', '', '', '03', '03', '2018-08-08 21:32:13', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533735158635', 'RB1533735123881', null, '编写back端财产分配指令流程详细设计', '100', '2018-08-08', '', '', '02', '03', '2018-08-08 21:32:39', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533809203571', 'RB1533809122546', null, '参加2.6.0版本修改点详细设计评审会议', '100', '2018-08-09', '', '', '07', '03', '2018-08-09 18:06:44', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533809236065', 'RB1533809122546', null, '产品分配以及产品入池测试用例的编写', '100', '2018-08-09', '', '', '04', '03', '2018-08-09 18:07:16', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533812742401', 'RB1533812701406', null, '家族信托期间管理报告申请及审批流程评审', '100', '2018-08-09', '', '', '06', '03', '2018-08-09 19:05:42', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533812815822', 'RB1533812752811', null, '家族信托2.6.0详细设计评审会议', '100', '2018-08-09', '', '', '07', '03', '2018-08-09 19:06:56', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533812826116', 'RB1533812788766', null, '家族信托项目-2.6.0版本详细设计方案评审', '100', '2018-08-09', '', '', '07', '03', '2018-08-09 19:07:06', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533812831312', 'RB1533812701406', null, '家族信托期间管理报告申请及审批开发', '50', '2018-08-15', '', '', '03', '02', '2018-08-09 19:07:11', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533812944335', 'RB1533812788766', null, '家族信托项目-管理端，根据评审修改方案修改产品分配清算提示功能详细设计流程图', '100', '2018-08-09', '', '', '02', '03', '2018-08-09 19:09:04', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533813049988', 'RB1533813022229', null, '家族信托项目Back端成立公告流程推送OA的开发。', '80', '2018-08-09', '', '', '03', '02', '2018-08-09 19:10:50', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533813139791', 'RB1533813101932', null, 'back端新增财产分配指令复核功能', '100', '2018-08-09', '', '', '03', '03', '2018-08-09 19:12:20', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533813187304', 'RB1533813101932', null, 'back端财产分配指令流程详细设计及RP图评审', '100', '2018-08-09', '', '', '07', '03', '2018-08-09 19:13:07', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533825309288', 'RB1533825248439', null, '管家系统->合同管理->发布生产', '100', '2018-08-09', '', '', '08', '03', '2018-08-09 22:35:09', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533825331276', 'RB1533825248439', null, '家族系统->投配指令管理->根据流程测试并熟悉业务', '100', '2018-08-09', '', '', '04', '03', '2018-08-09 22:35:31', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533897016538', 'RB1533897016503', null, '2.5.2版本投配管理业务流程、邮件通知、强调页面功能测试', '100', '2018-08-10', '', '', '04', '03', '2018-08-10 18:30:17', 'USER1532950925725', '2018-08-10 18:30:17', 'USER1532950925725', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533897057945', 'RB1533897016503', null, '项目管理成立公告(OA优化)功能用例的编写', '100', '2018-08-10', '', '', '04', '03', '2018-08-10 18:30:58', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533902511941', 'RB1533902511914', null, '家族信托项目-管理端-产品分配清算生成分配日期方法详细设计流程图', '100', '2018-08-10', '', '', '02', '03', '2018-08-10 20:01:52', 'USER003', '2018-08-10 20:01:52', 'USER003', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533902576698', 'RB1533902511914', null, '家族信托项目-管理端-产品查看页面，分配清算提示TAB页面', '100', '2018-08-10', '', '', '03', '03', '2018-08-10 20:02:57', null, null, null, null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533903313794', 'RB1533903313767', null, '家族信托2.6.0版本需求优化及2.7.0版本需求讨论', '100', '2018-08-10', '', '', '07', '03', '2018-08-10 20:15:14', 'USER001', '2018-08-10 20:15:14', 'USER001', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533904272683', 'RB1533904272618', null, '呃丰富32分分4分', '80', '2018-08-10', '13如1分钱夫人反反复复4该2', '232分分3法2分3个3个3', '03', '02', '2018-08-10 20:31:13', 'USER004', '2018-08-10 20:31:13', 'USER004', null, null, null);
INSERT INTO `t_daily_detail` VALUES ('RBD1533904287719', 'RB1533904272618', null, '131日方33g333g3个32分分3', '12', '2018-08-10', '1f3232f2g32g32g3', '23232g2g23g23g23g', '04', '02', '2018-08-10 20:31:28', 'USER004', '2018-08-10 20:31:28', 'USER004', null, null, null);

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userName` varchar(32) DEFAULT NULL COMMENT '用户名',
  `passWord` varchar(32) DEFAULT NULL COMMENT '密码',
  `user_sex` varchar(32) DEFAULT NULL COMMENT '性别',
  `nick_name` varchar(32) DEFAULT NULL COMMENT '昵称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '小明', '123321', 'MAN', 'odjwo');
INSERT INTO `users` VALUES ('2', '小红', '123321', 'WOMAN', 'odwijdw');
INSERT INTO `users` VALUES ('3', '小刚', '321123', 'MAN', '偶的我i都');
INSERT INTO `users` VALUES ('4', '小王', '333333', 'MAN', 'pppoooff');
INSERT INTO `users` VALUES ('28', '小王2', '11111', 'WOMAN', '1111');
