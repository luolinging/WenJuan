

/*Table structure for table `wj_admins` */

DROP TABLE IF EXISTS `wj_admins`;

CREATE TABLE `wj_admins` (
  `username` varchar(20) default NULL,
  `password` varchar(30) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wj_admins` */

LOCK TABLES `wj_admins` WRITE;

insert  into `wj_admins`(`username`,`password`) values ('admin','232F297A57A5A743894A0E4A801FC3');

UNLOCK TABLES;

/*Table structure for table `wj_answer` */

DROP TABLE IF EXISTS `wj_answer`;

CREATE TABLE `wj_answer` (
  `answerId` int(11) NOT NULL auto_increment COMMENT '答案Id',
  `replayId` int(11) NOT NULL COMMENT '回答者Id',
  `oid` int(11) NOT NULL COMMENT '回复主题Id',
  `qSeq` int(11) default NULL COMMENT '问题序号',
  `seSeq` int(11) default NULL COMMENT '选项序号',
  `seValue` varchar(1000) default NULL COMMENT '选项内容',
  `remark` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`answerId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `wj_answer` */

LOCK TABLES `wj_answer` WRITE;

insert  into `wj_answer`(`answerId`,`replayId`,`oid`,`qSeq`,`seSeq`,`seValue`,`remark`) values (1,1,01,1,1,'1',NULL),(2,1,01,2,2,'2',NULL),(3,1,01,3,1,'建议1',NULL),(4,2,01,1,2,'2',NULL),(5,2,01,2,3,'3',NULL),(6,2,01,3,1,'建议2',NULL);

UNLOCK TABLES;

/*Table structure for table `wj_object` */

DROP TABLE IF EXISTS `wj_object`;

CREATE TABLE `wj_object` (
  `oid` int(11) NOT NULL auto_increment,
  `title` varchar(1000) default NULL,
  `discribe` varchar(1000) default NULL,
  `createtime` timestamp NULL default NULL,
  `state` int(11) default NULL,
  `remark` varchar(200) default NULL,
  `anonymousFlag` char(1) default NULL COMMENT '是否匿名投递',
  PRIMARY KEY  (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `wj_object` */

LOCK TABLES `wj_object` WRITE;

insert  into `wj_object`(`oid`,`title`,`discribe`,`createtime`,`state`,`remark`,`anonymousFlag`) values (01,'天猫双11调查问卷','说明：\r\n1. 本调查问卷主要了解您对一些问题的看法，请认真作答。\r\n2. 问卷主要为单项选择题，少部分可多选，请按照要求作出选择。\r\n3. 每题必答，请注意不要漏答。','2015-11-11 08:00:00',1,NULL,'1');

UNLOCK TABLES;

/*Table structure for table `wj_question` */

DROP TABLE IF EXISTS `wj_question`;

CREATE TABLE `wj_question` (
  `oid` int(11) default NULL,
  `content` varchar(1000) default NULL,
  `qtype` int(11) default NULL,
  `seq` int(11) default NULL,
  `remark` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wj_question` */

LOCK TABLES `wj_question` WRITE;

insert  into `wj_question`(`oid`,`content`,`qtype`,`seq`,`remark`) values (01,'您的姓名',3,1,NULL),(01,'您的姓别',0,2,NULL),(01,'您的年龄',0,3,NULL),(01,'您的联系方式',3,4,NULL),(01,'您对该主题的意见',3,5,NULL);

UNLOCK TABLES;

/*Table structure for table `wj_replay` */

DROP TABLE IF EXISTS `wj_replay`;

CREATE TABLE `wj_replay` (
  `replayId` int(11) NOT NULL auto_increment COMMENT '回复ID',
  `replayCode` varchar(100) NOT NULL COMMENT '回复者代码',
  `replayIp` varchar(100) NOT NULL COMMENT '回复者IP',
  `oid` int(11) NOT NULL COMMENT '主题Id',
  `replayTime` timestamp NULL default NULL COMMENT '回复时间',
  `remark` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`replayId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='回复内容表';

/*Data for the table `wj_replay` */

LOCK TABLES `wj_replay` WRITE;

insert  into `wj_replay`(`replayId`,`replayCode`,`replayIp`,`oid`,`replayTime`,`remark`) values (1,'anonymous','192.168.0.1',01,'2015-11-11 20:23:24',''),(2,'anonymous','127.0.0.1',01,'2015-11-11 20:23:58','');

UNLOCK TABLES;

/*Table structure for table `wj_selecter` */

DROP TABLE IF EXISTS `wj_selecter`;

CREATE TABLE `wj_selecter` (
  `oid` int(11) default NULL,
  `qseq` int(11) default NULL,
  `content` varchar(1000) default NULL,
  `selseq` int(11) default NULL,
  `remark` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wj_selecter` */

LOCK TABLES `wj_selecter` WRITE;

insert  into `wj_selecter`(`oid`,`qseq`,`content`,`selseq`,`remark`) values (01,1,'可填可不填',1,NULL),(01,2,'A 男',1,NULL),(01,2,'B 女',2,NULL),(01,3,'A 25岁以下',1,NULL),(01,3,'B 25~30岁',2,NULL),(01,3,'C 30岁以上',3,NULL),(01,4,'手机号',1,NULL),(01,5,'写出您的建议，意见',0,NULL);

UNLOCK TABLES;


