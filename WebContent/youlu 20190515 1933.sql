-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.16


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema youlu
--

CREATE DATABASE IF NOT EXISTS youlu;
USE youlu;

--
-- Definition of table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `upwd` varchar(45) DEFAULT NULL,
  `upur` varchar(45) DEFAULT '1000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员';

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`,`email`,`upwd`,`upur`) VALUES 
 (1,'admin@qq.com','65676b6=3e13e1e307<=0e4a0e<45bg7','10000'),
 (2,'guest@qq.com','65676b6=3e13e1e307<=0e4a0e<45bg7','010000');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `keywords` varchar(85) DEFAULT NULL,
  `content` mediumtext NOT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `visits` bigint(20) unsigned DEFAULT NULL COMMENT '访问次数',
  `ctime` datetime DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL COMMENT '栏目id',
  `city_id` int(10) unsigned DEFAULT NULL COMMENT '国家id',
  `level` int(10) unsigned DEFAULT '9',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='图文资讯';

--
-- Dumping data for table `article`
--

/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`id`,`title`,`keywords`,`content`,`pic`,`visits`,`ctime`,`channel_id`,`city_id`,`level`) VALUES 
 (1,'明天做什么','明天，中国','<p>\r\n	暮云春树村 sdf\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	苛&nbsp;\r\n</p>\r\n<p>\r\n	<img src=\"http://localhost:80/youlu/ups/20190513/20190513376.jpg\" alt=\"\" />\r\n</p>','http://localhost:80/youlu/ups/20190513/20190513236.jpg',0,'2019-05-13 20:22:33',1,2,9),
 (2,'测试用于的文档','','测试用于的文档','http://localhost:80/youlu/ups/20190513/20190513625.jpg',0,'2019-05-13 21:33:28',2,2,9),
 (3,'测试生成静态文本','静态','<p>\r\n	测试生成静态文本\r\n</p>\r\n<p>\r\n	测试生成静态文本测试生成静态文本\r\n</p>\r\n<p>\r\n	测试生成静态文本<img src=\"http://localhost:80/youlu/ups/20190514/20190514566.jpg\" alt=\"\" />\r\n</p>','http://localhost:80/youlu/ups/20190514/2019051452.jpg',0,'2019-05-14 20:43:51',1,4,7);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;


--
-- Definition of table `attach`
--

DROP TABLE IF EXISTS `attach`;
CREATE TABLE `attach` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `oldname` varchar(85) DEFAULT NULL,
  `newpath` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `author` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='所有上传的图片';

--
-- Dumping data for table `attach`
--

/*!40000 ALTER TABLE `attach` DISABLE KEYS */;
INSERT INTO `attach` (`id`,`oldname`,`newpath`,`createtime`,`author`) VALUES 
 (3,'login-background.jpg','http://localhost:80/youlu/ups/20190425/2019042596.jpg','2019-04-25 10:58:54','admin@qq.com'),
 (4,'p_big2.jpg','http://localhost:80/youlu/ups/20190425/20190425186.jpg','2019-04-25 11:02:52','admin@qq.com'),
 (5,'p3.jpg','http://localhost:80/youlu/ups/20190425/20190425856.jpg','2019-04-25 11:33:38','admin@qq.com'),
 (6,'p2.jpg','http://localhost:80/youlu/ups/20190425/20190425693.jpg','2019-04-25 11:34:08','admin@qq.com'),
 (7,'p_big1.jpg','http://localhost:80/youlu/ups/20190425/20190425537.jpg','2019-04-25 20:35:42','admin@qq.com'),
 (8,'a2.jpg','http://localhost:80/youlu/ups/20190425/20190425779.jpg','2019-04-25 20:59:35','admin@qq.com'),
 (9,'pic01.jpg','http://localhost:80/youlu/ups/20190513/20190513719.jpg','2019-05-13 20:21:07','admin@qq.com'),
 (10,'pic02.jpg','http://localhost:80/youlu/ups/20190513/20190513448.jpg','2019-05-13 20:21:15','admin@qq.com'),
 (11,'pic01.jpg','http://localhost:80/youlu/ups/20190513/20190513376.jpg','2019-05-13 20:22:25','admin@qq.com'),
 (12,'pic02.jpg','http://localhost:80/youlu/ups/20190513/20190513236.jpg','2019-05-13 20:22:32','admin@qq.com'),
 (13,'pic03.jpg','http://localhost:80/youlu/ups/20190513/20190513625.jpg','2019-05-13 21:33:27','admin@qq.com'),
 (14,'pic01.jpg','http://localhost:80/youlu/ups/20190514/20190514566.jpg','2019-05-14 20:43:33','admin@qq.com'),
 (15,'pic02.jpg','http://localhost:80/youlu/ups/20190514/2019051452.jpg','2019-05-14 20:43:48','admin@qq.com'),
 (16,'pic01.jpg','http://localhost:80/youlu/ups/20190515/20190515929.jpg','2019-05-15 09:38:59','admin@qq.com'),
 (17,'pic02.jpg','http://localhost:80/youlu/ups/20190515/2019051580.jpg','2019-05-15 09:39:46','admin@qq.com'),
 (18,'pic01.jpg','http://localhost:80/youlu/ups/20190515/20190515436.jpg','2019-05-15 09:40:44','admin@qq.com'),
 (19,'pic02.jpg','http://localhost:80/youlu/ups/20190515/20190515717.jpg','2019-05-15 09:40:51','admin@qq.com'),
 (20,'pic02.jpg','http://localhost:80/youlu/ups/20190515/20190515106.jpg','2019-05-15 09:43:04','admin@qq.com'),
 (21,'pic03.jpg','http://localhost:80/youlu/ups/20190515/20190515723.jpg','2019-05-15 09:45:46','admin@qq.com'),
 (22,'pic01.jpg','http://localhost:80/youlu/ups/20190515/20190515361.jpg','2019-05-15 19:23:31','admin@qq.com'),
 (23,'pic02.jpg','http://localhost:80/youlu/ups/20190515/20190515826.jpg','2019-05-15 19:23:38','admin@qq.com'),
 (24,'pic03.jpg','http://localhost:80/youlu/ups/20190515/20190515553.jpg','2019-05-15 19:23:45','admin@qq.com');
/*!40000 ALTER TABLE `attach` ENABLE KEYS */;


--
-- Definition of table `channel`
--

DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '类别名',
  `level` int(10) unsigned DEFAULT '9' COMMENT '排序',
  `path` varchar(45) DEFAULT NULL COMMENT '静态化路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='资讯类别';

--
-- Dumping data for table `channel`
--

/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` (`id`,`name`,`level`,`path`) VALUES 
 (1,'导购',8,'daogou'),
 (2,'百科',7,'baike'),
 (3,'新闻',9,'news');
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;


--
-- Definition of table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `dis` varchar(200) DEFAULT NULL,
  `level` int(10) unsigned DEFAULT '99',
  `display` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_city_1` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='国家和城市';

--
-- Dumping data for table `city`
--

/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`id`,`parent_id`,`name`,`pic`,`dis`,`level`,`display`) VALUES 
 (2,0,'中国','http://localhost:80/youlu/ups/20190425/2019042596.jpg','<p>\r\n	中国1\r\n</p>\r\n<p>\r\n	中国1\r\n</p>',9,1),
 (3,2,'昆明','http://localhost:80/youlu/ups/20190425/20190425186.jpg','昆明1',9,1),
 (4,0,'柬埔寨','http://localhost:80/youlu/ups/20190425/20190425856.jpg','<p>\r\n	柬埔寨1\r\n</p>\r\n<p>\r\n	柬埔寨1\r\n</p>',9,1),
 (5,4,'西哈努克','http://localhost:80/youlu/ups/20190425/20190425693.jpg','<p>\r\n	西哈努克\r\n</p>\r\n<p>\r\n	西哈努克\r\n</p>',9,1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;


--
-- Definition of table `citypic`
--

DROP TABLE IF EXISTS `citypic`;
CREATE TABLE `citypic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned DEFAULT NULL,
  `dis` varchar(45) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `level` int(10) unsigned DEFAULT '99',
  PRIMARY KEY (`id`),
  KEY `FK_citypic_1` (`city_id`),
  CONSTRAINT `FK_citypic_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='国家图片';

--
-- Dumping data for table `citypic`
--

/*!40000 ALTER TABLE `citypic` DISABLE KEYS */;
INSERT INTO `citypic` (`id`,`city_id`,`dis`,`path`,`level`) VALUES 
 (1,3,'aaa2','http://localhost:80/youlu/ups/20190425/20190425359.jpg',8),
 (2,3,'bbb1','http://localhost:80/youlu/ups/20190425/20190425257.jpg',9),
 (4,3,'abc','http://localhost:80/youlu/ups/20190425/20190425539.jpg',7),
 (6,2,'bbb','http://localhost:80/youlu/ups/20190425/20190425196.jpg',8),
 (7,2,'ddd1','http://localhost:80/youlu/ups/20190425/20190425148.jpg',9);
/*!40000 ALTER TABLE `citypic` ENABLE KEYS */;


--
-- Definition of table `focuspic`
--

DROP TABLE IF EXISTS `focuspic`;
CREATE TABLE `focuspic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dis` varchar(45) NOT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `path` varchar(200) DEFAULT '9',
  `link` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='焦点广告';

--
-- Dumping data for table `focuspic`
--

/*!40000 ALTER TABLE `focuspic` DISABLE KEYS */;
INSERT INTO `focuspic` (`id`,`dis`,`level`,`path`,`link`) VALUES 
 (1,'aaa',8,'http://localhost:80/youlu/ups/20190401/20190401105.jpg','http://www.baidu.com'),
 (2,'aaa',9,'http://localhost:80/youlu/ups/20190425/20190425470.jpg','http://www.baidu.com');
/*!40000 ALTER TABLE `focuspic` ENABLE KEYS */;


--
-- Definition of table `house`
--

DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) NOT NULL COMMENT '楼盘名',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键词',
  `area` varchar(65) DEFAULT NULL COMMENT '区域',
  `addr` varchar(85) DEFAULT NULL COMMENT '地址',
  `price_rmb` varchar(45) DEFAULT NULL COMMENT '总价人民币',
  `price_other` varchar(45) DEFAULT NULL COMMENT '总价其它',
  `feature` varchar(100) DEFAULT NULL COMMENT '楼盘特色',
  `types` varchar(100) DEFAULT NULL COMMENT '物业类型',
  `propertys` varchar(45) DEFAULT NULL COMMENT '产权',
  `sizes` varchar(45) DEFAULT NULL COMMENT '面积',
  `payment` int(10) unsigned DEFAULT '10' COMMENT '首付',
  `huxing` varchar(85) DEFAULT NULL COMMENT '主力户型',
  `fitment` varchar(45) DEFAULT NULL COMMENT '装修类型 ',
  `country_id` bigint(20) unsigned DEFAULT NULL COMMENT '国家',
  `city_id` bigint(20) unsigned DEFAULT NULL COMMENT '城市',
  `level` int(10) unsigned DEFAULT '29' COMMENT '排序',
  `ctimes` datetime DEFAULT NULL COMMENT '时间',
  `txt1` text COMMENT '基本信息',
  `txt2` text COMMENT '配套',
  `txt3` text COMMENT '特色',
  `pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `yj_persent` int(10) unsigned DEFAULT NULL COMMENT '拥金百分比',
  `yj_many` varchar(45) DEFAULT NULL COMMENT '拥金钱',
  `isdel` int(10) unsigned DEFAULT '0' COMMENT '0启用1禁用',
  `target` varchar(50) DEFAULT NULL COMMENT '置业目的',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='房产基本信息';

--
-- Dumping data for table `house`
--

/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` (`id`,`name`,`keyword`,`area`,`addr`,`price_rmb`,`price_other`,`feature`,`types`,`propertys`,`sizes`,`payment`,`huxing`,`fitment`,`country_id`,`city_id`,`level`,`ctimes`,`txt1`,`txt2`,`txt3`,`pic`,`yj_persent`,`yj_many`,`isdel`,`target`) VALUES 
 (1,'星汇海景湾1','柬埔寨，星汇1','柬埔寨.西港1','柬埔寨西南海岸线上的西哈努克港星汇海景湾1','100-150万','1','精装、无公摊、永久产权','住宅,别墅','永久产权','46-300',20,'一房户型、两房户型1','精装',4,5,3,'2019-04-25 21:00:14','星汇海景湾12','星汇海景湾22','星汇海景湾32','http://localhost:80/youlu/ups/20190425/20190425779.jpg',20,'5',0,'自住,商旅');
/*!40000 ALTER TABLE `house` ENABLE KEYS */;


--
-- Definition of table `huxing`
--

DROP TABLE IF EXISTS `huxing`;
CREATE TABLE `huxing` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `house_id` bigint(20) unsigned DEFAULT NULL COMMENT '房id',
  `path` varchar(100) DEFAULT NULL COMMENT '新名',
  `orgname` varchar(45) DEFAULT NULL COMMENT '原名',
  `mime` varchar(45) DEFAULT NULL COMMENT 'mime',
  `level` int(10) unsigned DEFAULT '9' COMMENT '排序',
  `dis` varchar(65) DEFAULT NULL COMMENT '名称',
  `area` varchar(45) DEFAULT NULL COMMENT '面积',
  `ctime` datetime DEFAULT NULL COMMENT '时间',
  `price` bigint(20) unsigned DEFAULT NULL COMMENT '多钱',
  PRIMARY KEY (`id`),
  KEY `FK_h_huxing_1` (`house_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='户型';

--
-- Dumping data for table `huxing`
--

/*!40000 ALTER TABLE `huxing` DISABLE KEYS */;
INSERT INTO `huxing` (`id`,`house_id`,`path`,`orgname`,`mime`,`level`,`dis`,`area`,`ctime`,`price`) VALUES 
 (1,1,'http://localhost:80/youlu/ups/20190507/20190507433.jpg',NULL,NULL,9,'jjjj1',NULL,NULL,23451),
 (3,1,'http://localhost:80/youlu/ups/20190507/20190507335.jpg',NULL,NULL,9,'ddd',NULL,NULL,234),
 (5,1,'http://localhost:80/youlu/ups/20190507/20190507815.jpg',NULL,NULL,9,'ddd',NULL,NULL,124);
/*!40000 ALTER TABLE `huxing` ENABLE KEYS */;


--
-- Definition of table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
CREATE TABLE `pictures` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `house_id` bigint(20) unsigned DEFAULT NULL COMMENT '房产id',
  `dis` varchar(45) DEFAULT NULL COMMENT '描述',
  `path` varchar(200) DEFAULT NULL COMMENT '路径',
  `mime` varchar(45) DEFAULT NULL COMMENT 'mime',
  `orgname` varchar(65) DEFAULT NULL COMMENT '原名字',
  `channel` int(10) unsigned DEFAULT NULL COMMENT '频道',
  `level` int(10) unsigned DEFAULT '9' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `FK_pictures_1` (`house_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='户产相册';

--
-- Dumping data for table `pictures`
--

/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` (`id`,`house_id`,`dis`,`path`,`mime`,`orgname`,`channel`,`level`) VALUES 
 (1,1,'aaaa','http://localhost:80/youlu/ups/20190425/2019042582.jpg',NULL,NULL,1,9),
 (3,1,'abc','http://localhost:80/youlu/ups/20190425/20190425382.jpg',NULL,NULL,3,9),
 (4,1,'aaa','http://localhost:80/youlu/ups/20190513/20190513176.jpg',NULL,NULL,1,9),
 (5,1,'bbb','http://localhost:80/youlu/ups/20190513/20190513918.jpg',NULL,NULL,2,9),
 (6,1,'fdsfsdfds','http://localhost:80/youlu/ups/20190513/20190513634.jpg',NULL,NULL,4,9),
 (7,1,'zdfsdfd','http://localhost:80/youlu/ups/20190513/20190513502.jpg',NULL,NULL,5,9);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;


--
-- Definition of table `successfull`
--

DROP TABLE IF EXISTS `successfull`;
CREATE TABLE `successfull` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '姓名',
  `house` varchar(65) DEFAULT NULL COMMENT '项目',
  `why` varchar(100) DEFAULT NULL COMMENT '为什么',
  `dis` text COMMENT '描述',
  `pic1` varchar(65) DEFAULT NULL COMMENT '图1北京',
  `pic2` varchar(65) DEFAULT NULL COMMENT '图2头像',
  `level` int(10) unsigned DEFAULT '9',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='成功案例';

--
-- Dumping data for table `successfull`
--

/*!40000 ALTER TABLE `successfull` DISABLE KEYS */;
INSERT INTO `successfull` (`id`,`name`,`house`,`why`,`dis`,`pic1`,`pic2`,`level`) VALUES 
 (1,'李先生11','星汇海星湾1','投资1','<p>\r\n	李先生李先生1\r\n</p>\r\n<p>\r\n	<img src=\"http://localhost:80/youlu/ups/20190515/20190515361.jpg\" alt=\"\" /> \r\n</p>','http://localhost:80/youlu/ups/20190515/20190515826.jpg','http://localhost:80/youlu/ups/20190515/20190515553.jpg',9);
/*!40000 ALTER TABLE `successfull` ENABLE KEYS */;


--
-- Definition of table `travel`
--

DROP TABLE IF EXISTS `travel`;
CREATE TABLE `travel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(65) NOT NULL COMMENT '标题',
  `depart` varchar(45) DEFAULT NULL COMMENT '出发时间',
  `city` varchar(45) DEFAULT NULL COMMENT '出发地点',
  `visitcity` varchar(45) DEFAULT NULL COMMENT '访问城市',
  `content` mediumtext COMMENT '内容',
  `issue` int(10) unsigned DEFAULT NULL COMMENT '0启用1作废',
  `ctimes` datetime DEFAULT NULL COMMENT '时间',
  `pic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='旅行考察';

--
-- Dumping data for table `travel`
--

/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
INSERT INTO `travel` (`id`,`title`,`depart`,`city`,`visitcity`,`content`,`issue`,`ctimes`,`pic`) VALUES 
 (1,'西港四天五晚1','2019-3-8','西安1','西哈努克1','<p>\r\n	西港四天五晚1\r\n</p>\r\n<p>\r\n	<img src=\"http://localhost:80/youlu/ups/20190515/20190515717.jpg\" alt=\"\" /> \r\n</p>',0,'2019-05-15 09:41:03','http://localhost:80/youlu/ups/20190515/20190515106.jpg');
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;


--
-- Definition of table `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `house_id` bigint(20) unsigned DEFAULT NULL COMMENT 'house_id',
  `dis` varchar(65) DEFAULT NULL COMMENT '描述',
  `path` varchar(85) DEFAULT NULL COMMENT '新路径',
  `mime` varchar(45) DEFAULT NULL COMMENT 'mime',
  `orgname` varchar(45) DEFAULT NULL COMMENT '原名',
  `links` varchar(45) DEFAULT NULL COMMENT '外链',
  `channel_id` int(10) unsigned DEFAULT NULL COMMENT '是培训还是资讯',
  `code` text,
  `level` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h_video_1` (`house_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video`
--

/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` (`id`,`house_id`,`dis`,`path`,`mime`,`orgname`,`links`,`channel_id`,`code`,`level`) VALUES 
 (1,1,'aaa1234',NULL,NULL,NULL,NULL,NULL,'http://player.youku.com/embed/XNDE1MDEwOTQ3Mg==1234',7),
 (3,1,'http://player.youku.com/embed/XNDE1MDEwOTQ3Mg==',NULL,NULL,NULL,NULL,NULL,'<embed src=\'http://player.youku.com/player.php/sid/XNDEzNjY4NTE2MA==/v.swf\' allowFullScreen=\'true\' quality=\'high\' width=\'480\' height=\'400\' align=\'middle\' allowScriptAccess=\'always\' type=\'application/x-shockwave-flash\'></embed>',8);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
