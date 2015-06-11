
CREATE TABLE `up_msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `msg_id` bigint(20) unsigned NOT NULL COMMENT '系统产生',
  `mode` int(1) unsigned NOT NULL COMMENT '1/私有 2/公共',
  `outbox_id` int(10) DEFAULT NULL COMMENT '发件人',
  `inbox_id` int(10) NOT NULL COMMENT '收件人',
  `outbox_name` varchar(20) DEFAULT NULL COMMENT '发件人姓名',
  `inbox_name` varchar(20) DEFAULT NULL COMMENT '收件人姓名',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `is_see` int(1) NOT NULL DEFAULT '0' COMMENT '0/没看 1/查看',
  `is_state` int(1) DEFAULT '1' COMMENT '0/关闭 1/开启',
  `ctime` int(10) NOT NULL COMMENT '创建',
  PRIMARY KEY (`id`),
  KEY `msg_id` (`msg_id`),
  KEY `mode` (`mode`),
  KEY `outbox_id` (`outbox_id`),
  KEY `inbox_id` (`inbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信发件人';


CREATE TABLE `up_msg_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `msg_id` bigint(20) unsigned NOT NULL COMMENT '系统产生',
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `content` text NOT NULL COMMENT '内容',  `is_see` int(1) NOT NULL DEFAULT '0' COMMENT '0/没看 1/查看',
  `ctime` int(10) NOT NULL COMMENT '创建',
  PRIMARY KEY (`id`),
  KEY `msg_id` (`msg_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信回复';



CREATE TABLE `up_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mode` int(1) unsigned NOT NULL COMMENT '模式',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `task_id` int(10) unsigned NOT NULL COMMENT '任务id',
  `is_state` int(1) DEFAULT '1' COMMENT '0/关闭 1/开启',
  `info` text DEFAULT NULL COMMENT '内容',
  `ctime` int(10) NOT NULL COMMENT '创建',
  PRIMARY KEY (`id`),
  KEY `mode` (`mode`),
  KEY `task_id` (`task_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';


CREATE TABLE `up_company_reply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL COMMENT '评论id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `info` text DEFAULT NULL COMMENT '内容',
  `ctime` int(10) NOT NULL COMMENT '创建',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论回复';


CREATE TABLE `up_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mode` int(1) unsigned NOT NULL COMMENT '模式',
  `tag_name` varchar(35) DEFAULT NULL COMMENT '标签名称',
  `info` varchar(50) DEFAULT NULL COMMENT '描述',
  `is_state` int(1) DEFAULT '1' COMMENT '0/关闭 1/开启',
  `ctime` int(10) NOT NULL COMMENT '创建',
  `etime` int(10) NOT NULL COMMENT '更新',
  PRIMARY KEY (`id`),
  KEY `mode` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签';


CREATE TABLE `up_system_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mode` int(1) unsigned NOT NULL COMMENT '模式',
  `tag_name` varchar(35) DEFAULT NULL COMMENT '标签名称',
  `info` varchar(50) DEFAULT NULL COMMENT '描述',
  `is_state` int(1) DEFAULT '1' COMMENT '0/关闭 1/开启',
  `ctime` int(10) NOT NULL COMMENT '创建',
  `etime` int(10) NOT NULL COMMENT '更新',
  PRIMARY KEY (`id`),
  KEY `mode` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统标签';




CREATE TABLE `up_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mode` int(1) unsigned NOT NULL COMMENT '模式',
  `nav_id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `title` varchar(80) DEFAULT NULL COMMENT '标题',
  `info` varchar(250) DEFAULT NULL COMMENT '描述',
  `content` text DEFAULT NULL COMMENT '内容',
  `is_state` int(1) DEFAULT '1' COMMENT '0/关闭 1/开启',
  `ctime` int(10) NOT NULL COMMENT '创建',
  `etime` int(10) NOT NULL COMMENT '更新',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务';


CREATE TABLE `up_plug` (
  `plug_id` int(10) unsigned NOT NULL COMMENT '插件ID',
  `plug_name` varchar(50) DEFAULT NULL COMMENT '插件名称',
  `plug_title` varchar(50) DEFAULT NULL COMMENT '插件标题',
  `plug_info` varchar(250) DEFAULT NULL COMMENT '描述',
  `plug_about` varchar(30) DEFAULT NULL COMMENT '作者名称',
  `is_status` int(1) DEFAULT '1' COMMENT '0/关闭 1/开启',
  `ctime` int(10) NOT NULL COMMENT '创建',
  `etime` int(10) NOT NULL COMMENT '更新',
  PRIMARY KEY (`plug_id`),
  key `is_status` (`is_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件';



CREATE TABLE `up_user_account` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '//id',
  `email` varchar(50) NOT NULL COMMENT '登录邮箱',
  `pass` char(40) NOT NULL COMMENT '用户密码',
  `uname` varchar(30) DEFAULT NULL COMMENT '用户名',
  `work_number` varchar(30) DEFAULT NULL COMMENT '工号',
  `mobile` varchar(12) DEFAULT NULL COMMENT '手机号码',
  `roles_id` int(5) DEFAULT NULL COMMENT '角色ID',
  `qq` varchar(15) NOT NULL COMMENT 'QQ',
  `wx` varchar(30) NOT NULL COMMENT '微信',
  `login_count` int(10) NOT NULL COMMENT '登录次数',
  `last_ip` varchar(25) NOT NULL COMMENT '最后登录IP',
  `is_state` int(1) NOT NULL COMMENT '账户状态',
  `etime` int(10) DEFAULT NULL COMMENT '最后修改时间',
  `ctime` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`uid`),
  KEY `role_id` (`roles_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='用户账户表';

CREATE TABLE `up_user` (
  `uid` int(10) unsigned NOT NULL COMMENT '//id',
  `is_type` int(1) DEFAULT '1' COMMENT '1/总部 2/代理商',
  `agent_id` int(10) DEFAULT '0' COMMENT '代理商ID',
  `user_name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `identity` varchar(20) DEFAULT NULL COMMENT '身份证',
  `etime` int(10) DEFAULT NULL COMMENT '最后修改时间',
  `ctime` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='用户资料';
 


CREATE TABLE `up_user_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `is_type` int(1) DEFAULT '1' COMMENT '1/总部 2/代理商',
  `agent_id` int(10) DEFAULT '0' COMMENT '代理商ID',
  `url_log` varchar(255) DEFAULT NULL COMMENT '访问URL',
  `user_ip` char(20) DEFAULT NULL COMMENT '管理员IP',
  `user_id` int(10) DEFAULT NULL COMMENT '访问者ID',
  `user_name` varchar(20) DEFAULT NULL COMMENT '访问者姓名',
  `operate_name` varchar(50) DEFAULT NULL COMMENT '操作名称',
  `operate` varchar(2) DEFAULT '0' COMMENT '0/没权限   1/有权限',
  `ctime` int(10) DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='后台访问表';


CREATE TABLE `up_user_operate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `is_type` int(1) DEFAULT '1' COMMENT '1/总部 2/代理商',
  `agent_id` int(10) DEFAULT '0' COMMENT '代理商ID',
  `section_id` int(10) NOT NULL COMMENT '部门ID',
  `cname` varchar(50) NOT NULL COMMENT '操作名称',
  `operate_name` varchar(50) NOT NULL COMMENT '方法名称',
  `notes` varchar(200) NOT NULL COMMENT '备注',
  `set_menu` int(1) DEFAULT '0' COMMENT '是否显示0/否 1/是',
  `etime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `is_type` (`is_type`),
  KEY `operate_name` (`operate_name`),
  KEY `set_menu` (`set_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='操作表';


CREATE TABLE `up_user_roles` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `is_type` int(1) DEFAULT '1' COMMENT '1/总部 2/代理商',
  `agent_id` int(10) DEFAULT '0' COMMENT '代理商ID',
  `cname` varchar(80) NOT NULL COMMENT '角色名称',
  `operate_data` blob NOT NULL COMMENT '有操作权限的ID',
  `notes` varchar(250) NOT NULL COMMENT '备注',
  `etime` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`rid`),
  KEY `is_type` (`is_type`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='角色表';


CREATE TABLE `up_user_section` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `is_type` int(1) DEFAULT '1' COMMENT '1/总部 2/代理商',
  `agent_id` int(10) DEFAULT '0' COMMENT '代理商ID',
  `cname` varchar(20) NOT NULL COMMENT '模块名称',
  `action_name` varchar(20) NOT NULL COMMENT '控制器名称',
  `notes` varchar(250) NOT NULL COMMENT '备注',
  `sort` int(5) DEFAULT NULL COMMENT '排序',
  `etime` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_type` (`is_type`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='部门';






