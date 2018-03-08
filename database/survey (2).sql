# Host: localhost  (Version: 5.6.21-log)
# Date: 2015-11-17 11:06:46
# Generator: MySQL-Front 5.3  (Build 4.249)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "wj_admins"
#

DROP TABLE IF EXISTS `wj_admins`;
CREATE TABLE `wj_admins` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "wj_admins"
#

INSERT INTO `wj_admins` VALUES ('admin','232F297A57A5A743894A0E4A801FC3');

#
# Structure for table "wj_answer"
#

DROP TABLE IF EXISTS `wj_answer`;
CREATE TABLE `wj_answer` (
  `answerId` int(11) NOT NULL AUTO_INCREMENT COMMENT '答案Id',
  `replayId` int(11) NOT NULL COMMENT '回答者Id',
  `oid` int(11) NOT NULL COMMENT '回复主题Id',
  `qSeq` int(11) DEFAULT NULL COMMENT '问题序号',
  `seSeq` int(11) DEFAULT NULL COMMENT '选项序号',
  `seValue` varchar(1000) DEFAULT NULL COMMENT '选项内容',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`answerId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Data for table "wj_answer"
#

INSERT INTO `wj_answer` VALUES (2,1,1,1,1,'1',NULL),(3,1,1,2,1,'1',NULL),(4,1,1,3,2,'2',NULL),(5,1,1,4,0,'0',NULL),(6,1,1,4,1,'1',NULL),(7,1,1,4,2,'2',NULL),(8,1,1,5,0,'0',NULL),(9,1,1,5,2,'2',NULL),(10,1,1,5,3,'3',NULL),(11,1,1,6,3,'3',NULL),(12,2,2,1,1,'1',NULL),(13,2,2,2,3,'3',NULL),(14,2,2,3,3,'3',NULL),(15,2,2,4,4,'4',NULL),(16,2,2,4,5,'5',NULL),(17,2,2,4,6,'6',NULL),(18,2,2,5,2,'2',NULL),(19,2,2,6,3,'3',NULL),(20,2,2,7,4,'4',NULL);

#
# Structure for table "wj_object"
#

DROP TABLE IF EXISTS `wj_object`;
CREATE TABLE `wj_object` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) DEFAULT NULL,
  `discribe` varchar(1000) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `anonymousFlag` char(1) DEFAULT NULL COMMENT '是否匿名投递',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Data for table "wj_object"
#

INSERT INTO `wj_object` VALUES (1,'大学生对天猫双11网购消费态度','说明：\r\n1. 本调查问卷主要了解您对一些问题的看法，请认真作答。\r\n2. 问卷为不记名方式，您的个人信息和观点将受到严格保密。\r\n3. 问卷主要为单项选择题，少部分可多选，请按照要求作出选择。\r\n4. 每题必答，请注意不要漏答。','2015-11-11 08:00:00',1,NULL,'1'),(2,'编程语言技术能力调查问卷','亲爱的同学们：\r\n您们好，我们正在进行一场关于编程技术能力情况问卷调查。这份调查能够帮助\r\n我们更好的了解这个市场，以便未来能够为大家提供更多的服务和适合的产品。\r\n希望您能够从百忙中抽出些许时间来帮助我们完成这次调查，回答没有正误之分。\r\n谢谢您的合作。','2015-11-11 17:28:55',1,NULL,'1');

#
# Structure for table "wj_question"
#

DROP TABLE IF EXISTS `wj_question`;
CREATE TABLE `wj_question` (
  `oid` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `qtype` int(11) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "wj_question"
#

INSERT INTO `wj_question` VALUES (1,'你会在双十一期间网购吗？（单选）',0,1,NULL),(1,'你认为双十一期间的商品比平常便宜吗？（单选）',0,2,NULL),(1,'你是大几的学生？（单选）',0,6,NULL),(1,'今年双十一恰逢工作日，您会在零点守候吗？（单选）',0,3,NULL),(1,'双十一期间您会在哪个网站网购呢？（多选）',1,4,NULL),(1,'你在以前双十一消费中遇到过哪些问题？（多选）',1,5,NULL),(2,'你认为自己目前的开发水平在哪一个层次？（单选）',0,1,NULL),(2,'你觉得以你目前的水平能够胜任多少薪酬的工作？（单选）',0,2,NULL),(2,'你目前掌握的java技术是通过哪种途径获得的？（单选）',0,3,NULL),(2,'你觉得自己目前还欠缺那部分的技术？在下面的选项前打勾。（多选）',1,4,NULL),(2,'对于你自己勾选的部分技术，你打算如何补充它？（单选）',0,5,NULL),(2,'对于学习这部分欠缺技术的成本，你认为费用在哪个范围是属于合理的，你可以接受的》（单选）',0,6,NULL),(2,'为您提供如下课程，请选出你感兴趣的培训项目？（多选）',1,7,NULL);

#
# Structure for table "wj_replay"
#

DROP TABLE IF EXISTS `wj_replay`;
CREATE TABLE `wj_replay` (
  `replayId` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复ID',
  `replayCode` varchar(100) NOT NULL COMMENT '回复者代码',
  `replayIp` varchar(100) NOT NULL COMMENT '回复者IP',
  `oid` int(11) NOT NULL COMMENT '主题Id',
  `replayTime` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`replayId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='回复内容表';

#
# Data for table "wj_replay"
#

INSERT INTO `wj_replay` VALUES (1,'anonymous','0:0:0:0:0:0:0:1',1,'2015-11-17 09:48:23',''),(2,'anonymous','0:0:0:0:0:0:0:1',2,'2015-11-17 10:53:58','');

#
# Structure for table "wj_selecter"
#

DROP TABLE IF EXISTS `wj_selecter`;
CREATE TABLE `wj_selecter` (
  `oid` int(11) DEFAULT NULL,
  `qseq` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `selseq` int(11) DEFAULT NULL,
  `remark` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "wj_selecter"
#

INSERT INTO `wj_selecter` VALUES (1,1,'会',1,NULL),(1,1,'不会',2,NULL),(1,1,'看情况',3,NULL),(1,2,'便宜很多',1,NULL),(1,2,'便宜一点点',2,NULL),(1,2,'一点都不便宜',3,NULL),(1,3,'熬夜也要守着',1,NULL),(1,3,'视情况而定',2,NULL),(1,3,'不会，正常作息',3,NULL),(1,4,'淘宝（包含天猫）',0,NULL),(1,4,'京东',1,NULL),(1,4,'苏宁易购',2,NULL),(1,4,'1号店',3,NULL),(1,4,'易迅网',4,NULL),(1,4,'亚马逊',5,NULL),(1,4,'其他',6,NULL),(1,5,'容易断货',0,NULL),(1,5,'折扣有陷阱、优惠套餐有猫腻',1,NULL),(1,5,'物流紧张，延迟发货',2,NULL),(1,5,'店小二服务沟通不及时',3,NULL),(1,5,'退换货困难、理赔困难',4,NULL),(1,5,'产品以次充好',5,NULL),(1,5,'其他',6,NULL),(1,5,'没遇到过',7,NULL),(1,6,'大一',1,NULL),(1,6,'大二',2,NULL),(1,6,'大三',3,NULL),(2,1,'了解1-2种编程语言，但尚处于一知半解状态，无法融会贯通使用',1,NULL),(2,1,'熟悉1-2种编程语言，且能够独立编写简单的程序',2,NULL),(2,1,'精通1-2种编程语言，且能够独立完成小型软件系统设计',3,NULL),(2,1,'精通1-2种编程语言，深刻理解OO思想，且参与过真实项目研发工作',4,NULL),(2,2,'尚无法胜任研发工作，需要继续学习',1,NULL),(2,2,'1500-2000 元',2,NULL),(2,2,'2000-3000元',3,NULL),(2,2,'3000元以上',4,NULL),(2,3,'自学',1,NULL),(2,3,'培训（培训机构提供的））',2,NULL),(2,3,'他授（学校教学）',3,NULL),(2,4,'Java编程',1,NULL),(2,4,'C#编程',2,NULL),(2,4,'易迅网多线程编程',3,NULL),(2,4,'Oracle数据库',4,NULL),(2,4,'面向对象分析与设计',5,NULL),(2,4,'Database管理',6,NULL),(2,4,'JDBC',7,NULL),(2,4,'Struts框架',8,NULL),(2,4,'Hibernate框架',9,NULL),(2,4,'Spring框架',10,NULL),(2,4,'AJAX技术',11,NULL),(2,4,'搜索引擎',12,NULL),(2,5,'参加培训',1,NULL),(2,5,'自学',2,NULL),(2,6,'1000以内',1,NULL),(2,6,'1000-2000',2,NULL),(2,6,'2000-3000',3,NULL),(2,6,'3000-6000',4,NULL),(2,7,'Core Java提高班\r\n(深刻掌握Java编程语言和面向对象编程思想，毕业后能够使用Java编程语言编写优雅\r\n的C/S结构的应用软件系统，培训周期为15个工作日)',1,NULL),(2,7,'Web应用编程初级班\r\n（深刻掌握Servlet、JSP、JDBC等技术，深刻理解MVC设计模式，毕业后能够使用Java编程语言\r\n设计实用的B/S结构的应用软件系统，培训周期为15个工作日）',2,NULL),(2,7,'Web应用编程提高班\r\n（深刻掌握Struts2.0、Spring及Hibernate三大流行开源框架，毕业后能够使用Java编程语言\r\n设计可复用的B/S结构应用软件系统，培训周期为15个工作日）',3,NULL),(2,7,'Web应用编程项目实战班\r\n（深刻体会拓胜独创性的浸入式IT培训体系，深入体验拓胜软件工厂式项目实战精华，\r\n在拓胜资深软件工程师带领下，采用拓胜商用软件研发流程，完整地开发一个流行实用\r\n的Web2.0软件系统，如后现代主义交友平台、携程航空订票系统、当当网上书城系统、\r\n大型银行台帐系统等，培训周期为20个工作日）',4,NULL);
