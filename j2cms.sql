-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2012 年 10 月 25 日 09:19
-- 服务器版本: 5.5.16
-- PHP 版本: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `j2cms`
--

-- --------------------------------------------------------

--
-- 表的结构 `j2_article`
--

CREATE TABLE IF NOT EXISTS `j2_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(20) DEFAULT NULL,
  `check_date` datetime DEFAULT NULL,
  `check_state` int(11) DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL,
  `comment_state` char(1) DEFAULT NULL,
  `content` longtext,
  `content_img` varchar(100) DEFAULT NULL,
  `disable_date` datetime DEFAULT NULL,
  `origin` varchar(50) DEFAULT NULL,
  `recommend_level` int(11) DEFAULT NULL,
  `related_id` varchar(255) DEFAULT NULL,
  `release_date` varchar(10) DEFAULT NULL,
  `release_sys_date` datetime DEFAULT NULL,
  `summary` varchar(200) DEFAULT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `title_img` varchar(100) DEFAULT NULL,
  `visit_total` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sys_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7CAEF8BF65590862` (`user_id`),
  KEY `FK7CAEF8BFC51C15F0` (`group_id`),
  KEY `FK7CAEF8BF35ABF734` (`channel_id`),
  KEY `FK7CAEF8BF2856D981` (`user_id`),
  KEY `FK7CAEF8BFBFEA1B4F` (`group_id`),
  KEY `FK7CAEF8BF652A3513` (`channel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `j2_article`
--

INSERT INTO `j2_article` (`id`, `author`, `check_date`, `check_state`, `comment_count`, `comment_state`, `content`, `content_img`, `disable_date`, `origin`, `recommend_level`, `related_id`, `release_date`, `release_sys_date`, `summary`, `tags`, `title`, `title_img`, `visit_total`, `channel_id`, `group_id`, `user_id`, `sys_date`) VALUES
(1, '管理员', NULL, 2, 0, 'Y', '<p>功能更新：</p>\r\n<p>&nbsp;</p>\r\n<p>1.实现用户组权限管理；</p>\r\n<p>&nbsp;</p>\r\n<p>2.优化内容管理与用户管理模块的查询功能；</p>\r\n<p>&nbsp;</p>\r\n<p>3.用户密码字段加密；</p>\r\n<p>&nbsp;</p>\r\n<p>4.改写大量代码，优化系统结构，修正若干BUG。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '', NULL, '本站', 0, '', '2011-05-22', '2011-05-18 23:34:12', '', '', '2011年5月21日J2CMS新版本发布!', '', 2157, 7, 1, 1, '2012-06-27 22:47:51'),
(2, '管理员', NULL, 2, 0, 'Y', '<p>更新</p>\r\n<p>1.加入Freemarker作为模版</p>\r\n<p>2.若干小BUG修正</p>\r\n<p>&nbsp;</p>\r\n<p>获取最新版本 <a rel="nofollow" href="http://code.google.com/p/j2cms-org/source/checkout"><font color="#0000cc">http://code.google.com/p/j2cms-org/source/checkout</font></a> 关注最新开发进度请加官方QQ群31309177</p>', '', NULL, '本站', 0, '', '2011-09-27', '2011-09-27 17:27:44', '', '', '2011年9月27日J2CMS发布新版本!', '', 1527, 7, 1, 1, NULL),
(3, '管理员', NULL, 2, 0, 'Y', '<p>更新：</p>\r\n<p>1.增加若干系统参数</p>\r\n<p>2.java包启用org.j2cms</p>\r\n<p>3.增加用户注册 /register</p>\r\n<p>4.部分代码修改</p>\r\n<p>&nbsp;</p>\r\n<p>获取最新版本 <font face="Courier New">svn checkout <strong><em>http</em></strong>://j2cms-org.googlecode.com/svn/J2CMS/</font></p>', '', NULL, '本站', 0, '', '2012-02-11', '2012-02-08 01:37:21', '', '', '2012年2月8日J2CMS发布新版本!', '', 1874, 7, 1, 1, NULL),
(4, '管理员', NULL, 2, 0, 'Y', '<div>\r\n<div style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; text-align: left; ">what''s new　</div>\r\n<div style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; text-align: left; ">&nbsp;</div>\r\n<div style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; text-align: left; ">=================================</div>\r\n<div style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; text-align: left; ">\r\n<div>2012.3.25</div>\r\n<div>1.Struts2中Action类的泛型继承，架构上的重大改进</div>\r\n<div>2.首页，栏目，文章可以生成静态页面</div>\r\n<div>3.为全部实体增加系统日期和系统状态的属性，管理更加灵活</div>\r\n<div>4.修改系统配置后同时修改全局变量里的值</div>\r\n<div>5.用户注册唯一问题</div>\r\n<div>6.系统里所有表单的必填项的服务器端加强验证</div>\r\n<div>7.可自定义模版文件夹的路径</div>\r\n<div>8.采用了Alice作为UI的CSS模版</div>\r\n<div>9.大量代码重写,修复与改进。控制层的重新架构。</div>\r\n<div>10.整体性能大幅提升</div>\r\n</div>\r\n<div style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; text-align: left; ">=================================</div>\r\n<div style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; text-align: left; ">&nbsp;</div>\r\n<div style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; text-align: left; ">&nbsp;</div>\r\n<div style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; text-align: left; ">关注最新开发进度请加官方QQ群31309177</div>\r\n<div style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; text-align: left; ">&nbsp;</div>\r\n<div style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; text-align: left; "><a target="_blank" style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(0, 0, 0); text-decoration: none; " href="http://code.google.com/p/j2cms-org/downloads/list"><span style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border-style: initial; border-color: initial; border-image: initial; "><img alt="" style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; color: rgb(31, 58, 135); font-family: bold; " src="http://www.j2cms.com/template/j2cms/images/downicon.gif" /></span><span style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(31, 58, 135); font-family: bold; ">&nbsp;猛击此处下载</span></a></div>\r\n</div>', '', NULL, 'www.j2cms.org', 0, '', '2012-03-25', NULL, '', '', '2012年3月25日J2CMS发布新版本!', '', 3879, 7, 1, 1, '2012-03-25 18:45:06'),
(5, '管理员', NULL, 2, 0, 'Y', '<p>&nbsp;</p>\r\n<p>1.问：下载的war包里为什么没有源码src的文件夹</p>\r\n<p>&nbsp;</p>\r\n<p>答：请加群，在群共享</p>\r\n<p><span style="color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; text-align: left; ">J2CMS官方群一：31309177 [满]</span></p>\r\n<p><span style="color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; text-align: left; ">J2CMS官方群二：154615448</span><span style="color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; ">&nbsp;</span><span style="color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; ">[满]</span></p>\r\n<p><span style="color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; text-align: left; ">J2CMS官方群三：</span><font color="#222222" face="''Arial,Helvetica,sans-serif''"><span style="font-size: 14px; line-height: 20px;">196170407</span></font></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '', NULL, 'www.j2cms.org', 0, '', '2012-05-29', NULL, '', '', '关于java源码包', '', 2421, 7, 1, 1, '2012-06-27 17:59:58'),
(6, '管理员', NULL, 2, 0, 'Y', '<p>&nbsp; what''s new<br />\r\n=================================<br />\r\n2012.10.22<br />\r\n1.当前版本的分支为j2cms-SSH<br />\r\n2.更新了SSH的版本,使用了当前最新的版本<br />\r\n3.其它所有的依赖的jar包基本都升级到当前最新版本,去掉多余的jar包<br />\r\n4.若干bug的修正<br />\r\n5.log4j的调整<br />\r\n6.整体性能大幅提升<br />\r\n=================================</p>', '', NULL, '', 0, '', '2012-10-22', NULL, '', '', '2012年10月22日J2CMS将发布新版本!', '', 0, 7, 1, 1, '2012-10-22 00:27:33');

-- --------------------------------------------------------

--
-- 表的结构 `j2_channel`
--

CREATE TABLE IF NOT EXISTS `j2_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display` char(1) DEFAULT NULL,
  `display_in_index` char(1) DEFAULT NULL,
  `info` longtext,
  `name` varchar(20) DEFAULT NULL,
  `rank_id` int(11) DEFAULT NULL,
  `single` char(1) DEFAULT NULL,
  `visit_total` int(11) DEFAULT NULL,
  `father_id` int(11) DEFAULT NULL,
  `check_state` int(11) DEFAULT NULL,
  `sys_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD461A8CCC7E7643B` (`father_id`),
  KEY `FKD461A8CCF765A21A` (`father_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `j2_channel`
--

INSERT INTO `j2_channel` (`id`, `display`, `display_in_index`, `info`, `name`, `rank_id`, `single`, `visit_total`, `father_id`, `check_state`, `sys_date`) VALUES
(1, 'N', 'N', '', '全部', 1, 'N', 247, 1, 2, '2012-03-22 03:56:00'),
(2, 'Y', 'N', '<p><strong>下载方式&nbsp;：</strong></p>\r\n<p>&nbsp;</p>\r\n<p>1.<img alt="" src="/template/j2cms/images/downicon.gif" />&nbsp; &nbsp;<a href="https://github.com/j2cms/J2CMS-SSH/zipball/master" target="_blank">ZIP</a>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n<div class="round1">&nbsp;</div>\r\n<p>2.<img alt="" src="/template/j2cms/images/downicon.gif" />&nbsp; &nbsp;<font face="Courier New"><a href="https://github.com/j2cms" target="_blank">https://github.com/j2cms</a></font></p>\r\n<p>&nbsp;</p>\r\n<p>3.加入官方QQ群</p>\r\n<p>J2CMS官方群一：31309177 &nbsp;[满]</p>\r\n<p>J2CMS官方群二：154615448 &nbsp;[满]</p>\r\n<p>J2CMS官方群三：<span style="color: rgb(34, 34, 34); font-family: ''Arial,Helvetica,sans-serif''; font-size: 14px; line-height: 20px; ">196170407</span></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><strong>开发环境：</strong></p>\r\n<p>eclipse-jee-Juno-Release-win32<br />\r\nJDK 1.6<br />\r\nApache tomcat 6.0<br />\r\nMySQL 5.5<br />\r\n系统依赖的其它jar包版本可以在lib目录里看到</p>\r\n<p>&nbsp;</p>\r\n<p><strong>导入Eclipse：</strong></p>\r\n<p>1.src和WebContent目录分别是Eclipse工程中对应的目录内容</p>\r\n<p>2.j2cms.sql是数据库，需要导入mysql中，修改src\\META-INF\\persistence.xml 文件中数据库配置。</p>\r\n<p>&nbsp;</p>\r\n<p><strong>安装在tomcat：</strong></p>\r\n<p>1.将数据库文件（在根目录）j2cms.sql 导入数据库。<br />\r\n方法一,用MySQLAdministrator导入<br />\r\n方法二,用MySQL命令导入：<br />\r\nmysql&gt; create database j2cms;<br />\r\nmysql&gt; use j2cms;<br />\r\nmysql&gt; source d:\\j2cms.sql;<br />\r\n2.修改配置文件 WEB-INF\\classes\\META-INF\\persistence.xml 中的数据库配置。<br />\r\n3.网站必须部署在根目录才能正常显示（因为使用了绝对路径）。比如tomcat的ROOT目录，访问路径为http://127.0.0.2:8080/&nbsp;<br />\r\n管理后台访问路径 http://127.0.0.2:8080/login 帐号 admin 密码 admin&nbsp;<br />\r\n配置一个带域名的主机，以下是在tomcat的server.xml中配置一个Host的示例<br />\r\n&lt;Host name=&quot;127.0.0.2&quot; appBase=&quot;F:/web&quot;<br />\r\nunpackWARs=&quot;true&quot; autoDeploy=&quot;true&quot;<br />\r\nxmlValidation=&quot;false&quot; xmlNamespaceAware=&quot;false&quot;&gt;<br />\r\n&lt;Alias&gt;j2cms.org&lt;/Alias&gt;<br />\r\n&lt;Context path=&quot;&quot; docBase=&quot;F:/web/j2cms&quot; debug=&quot;0&quot; reloadable=&quot;true&quot;/&gt;<br />\r\n&lt;/Host&gt;</p>\r\n<p>4.重启Tomcat 通过http://127.0.0.2:8080访问</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p>&nbsp;</p>', '下载', 2, 'Y', 3654, 1, 2, '2012-10-23 19:58:52'),
(3, 'Y', 'N', '<p>&nbsp;</p>\r\n<p>案例1　J2CMS官方网站　<a target="_blank" href="http://www.j2cms.com">http://www.j2cms.com</a></p>\r\n<p>案例2　华中师范大学文学院　<a target="_blank" href="http://chinese.ccnu.edu.cn/">http://chinese.ccnu.edu.cn/</a></p>\r\n<p>案例3 &nbsp; &nbsp;武汉废旧物资回收&nbsp; <a target="_blank" href="http://www.198529.com">www.198529.com</a></p>\r\n<p>................</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<p>&nbsp;</p>', '案例', 3, 'Y', 934, 1, 2, NULL),
(4, 'Y', 'N', '<h2 style="text-align: center; ">服务套餐</h2>\r\n<p>&nbsp;\r\n<table class="table" border="1" cellspacing="0" cellpadding="0" align="center">\r\n    <thead>\r\n        <tr>\r\n            <th><strong>服务说明</strong></th>\r\n            <th><strong>基础型服务</strong></th>\r\n            <th><strong>标准型服务</strong></th>\r\n            <th><strong>高级型服务</strong></th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class="td1"><label class="poptext">商业授权 </label></td>\r\n            <td class="td7"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <th colspan="9">&nbsp;</th>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1"><label class="poptext">E-mail 支持 </label></td>\r\n            <td class="td7"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1"><label class="poptext">网站客服中心支持 </label></td>\r\n            <td class="td7"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1"><label class="poptext">QQ/MSN 支持 </label></td>\r\n            <td class="td7"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1"><label class="poptext">电话支持 </label></td>\r\n            <td class="td7"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <th colspan="9">&nbsp;</th>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">程序BUG反馈</td>\r\n            <td class="td7"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&radic;</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">软件安装指导</td>\r\n            <td class="td7"><strong class="ico_rig"> <strong class="ico_rig"><font color="#339900" size="3">&le;3次&nbsp;</font></strong>&nbsp;<strong class="ico_rig"><font color="#339900" size="3">&nbsp;</font></strong>&nbsp;</strong></td>\r\n            <td class="td8"><strong class="ico_rig"> <strong class="ico_rig"> <strong class="ico_rig"> <strong class="ico_rig"><strong class="ico_rig"><font color="#339900" size="3">&le;3次&nbsp;</font></strong></strong>&nbsp;<strong class="ico_rig"><strong class="ico_rig"><strong class="ico_rig"><font color="#339900" size="3">&nbsp;</font></strong>&nbsp;<strong class="ico_rig">&nbsp;</strong></strong></strong></strong></strong></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">不限</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">程序升级指导</td>\r\n            <td class="td7"><strong class="ico_rig"> <strong class="ico_rig"><strong class="ico_rig"><font color="#339900" size="3">&le;3次&nbsp;</font></strong></strong>&nbsp;<strong class="ico_rig"><font color="#339900" size="3">&nbsp;</font></strong>&nbsp;</strong></td>\r\n            <td class="td8"><strong class="ico_rig"> <strong class="ico_rig"> <strong class="ico_rig"><strong class="ico_rig"><font color="#339900" size="3">&le;3次&nbsp;</font></strong></strong>&nbsp;<strong class="ico_rig"><strong class="ico_rig"><font color="#339900" size="3">&nbsp;</font></strong>&nbsp;&nbsp;</strong></strong></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">不限</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">代升级服务</td>\r\n            <td class="td7"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><strong class="ico_rig"><strong class="ico_rig"><strong class="ico_rig"><font color="#339900" size="3">&le;3次</font></strong></strong></strong></strong></td>\r\n            <td class="td9"><strong class="ico_rig"> <strong class="ico_rig"><font color="#339900" size="3">不限</font></strong></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">网站会员整合</td>\r\n            <td class="td7"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1"><label class="poptext">程序数据转换 </label></td>\r\n            <td class="td7"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1"><label class="poptext">数据库修复 </label></td>\r\n            <td class="td7"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&le;3次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <th colspan="9">&nbsp;</th>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">站点目录权限配置</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&le;3次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1"><label class="poptext">数据库校验、优化 </label></td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&le;3次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">FTP配置安装</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&le;3次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">软件所需环境安装</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&le;3次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">网站迁移服务</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&le;3次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">数据库安全备份</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&le;3次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">运行环境优化</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&le;3次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">服务器代维护</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&le;3次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">模板制作技术咨询</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">&le;3次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1"><label class="poptext">数据库灾难修复 </label></td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">数据库迁移</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">数据库字符集转换</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">网络及系统安全防护策略</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">系统负载优化</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <th colspan="9">&nbsp;</th>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">二次开发技术咨询</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">WEB 负载均衡</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">程序代码优化</td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1"><label class="poptext">企业培训 </label></td>\r\n            <td class="td7"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td8"><strong class="ico_wor"><font color="#ff9933">&times;</font></strong></td>\r\n            <td class="td9"><strong class="ico_rig"><font color="#339900" size="3">1次</font></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <th colspan="4">&nbsp;</th>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">国际域名.com/.net/.org</td>\r\n            <td class="td7">1个</td>\r\n            <td class="td8">1个</td>\r\n            <td class="td9">1个</td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1"><a target="_blank" href="http://www.j2cms.com/host.html">Java空间</a></td>\r\n            <td class="td7">1个</td>\r\n            <td class="td8">1个</td>\r\n            <td class="td9">1个</td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">企业邮局</td>\r\n            <td class="td7">1个</td>\r\n            <td class="td8">1个</td>\r\n            <td class="td9">1个</td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">服务网站数量</td>\r\n            <td class="td7">1个</td>\r\n            <td class="td8">1个</td>\r\n            <td class="td9">1个</td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">技术支持年限</td>\r\n            <td class="td7">1年</td>\r\n            <td class="td8">3年</td>\r\n            <td class="td9">10年</td>\r\n        </tr>\r\n        <tr>\r\n            <th colspan="4"><strong><font color="#999999">套餐价格 (注：所有服务不含硬件相关费用，不含第三方软件授权费用，不含差旅费用。)</font></strong></th>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1">套餐价格</td>\r\n            <td class="td7">1800&nbsp;RMB</td>\r\n            <td class="td8">3800&nbsp;RMB</td>\r\n            <td class="td9">9800RMB</td>\r\n        </tr>\r\n        <tr>\r\n            <td class="td1" colspan="4">\r\n            <p>&nbsp;</p>\r\n            <p><span style="color: #0000ff"><strong>付款方式： &nbsp;&nbsp;</strong></span><span style="color: rgb(0, 0, 255); "><strong><span style="font-family: Verdana, Arial, Helvetica, sans-serif; line-height: 16px; ">6222 0232 0203 8561 683 &nbsp;郭涛 &nbsp;</span><span style="font-family: Verdana, Arial, Helvetica, sans-serif; line-height: 16px; ">工商银行武汉市长飞支行</span></strong></span></p>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table class="table" border="0" cellspacing="0" cellpadding="0" align="center">\r\n    <tbody>\r\n        <tr>\r\n            <td>\r\n            <div class="abctxt"><strong><font color="#555555">说明①：以下情况不属于服务范围</font></strong> <br />\r\n            1、自行修改或使用非原始 J2CMS 程序代码产生的问题；<br />\r\n            2、自行对数据库进行直接操作导致数据库出错或者崩溃；<br />\r\n            3、非官方的模块/插件的安装以及由于安装模块/插件造成的故障； <br />\r\n            4、服务器、虚拟主机原因造成的系统故障；<br />\r\n            5、二次开发或定制及其它可能产生问题的情况。<br />\r\n            <br />\r\n            <font color="#555555"><strong>说明②：以上服务默认都属一次性服务，特殊服务除外。</strong><br />\r\n            <br />\r\n            <strong>说明③：表格中符号代表的含义</strong><br />\r\n            </font>&quot;<span class="ico_wor"><strong><font color="#555555">&times;</font></strong></span> &quot; 表示该版本不具备或不支持此功能或服务 &quot;<span class="ico_rig"><strong><font color="#555555" size="3">&radic;</font></strong></span>&quot; 表示该版本已具备或支持此功能或服务</div>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>', '购买服务', 4, 'Y', 794, 1, 2, '2012-06-28 00:21:51'),
(5, 'N', 'N', '<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>美工1名</p>\r\n<p>工作职责： <br />\r\n1、 负责网站的页面美工设计、制作。 <br />\r\n2、 配合程序员完成J2CMS的整合。 <br />\r\n3、 负责公司其它美工类工作的设计与制作。</p>\r\n<p>职位要求：</p>\r\n<p>1. 具有1年以上web平面设计和互联网工作经验，具有良好的web平面审美感，熟悉网站制作的整套流程。<br />\r\n2. 熟练掌握Photoshop、网络三剑客等图象处理软件。<br />\r\n3. 工作态度积极、责任心强，有较强的独立工作能力和团队合作精神。<br />\r\n4. 有Flash动画制作经验。<br />\r\n5. 能熟练使用DIV+CSS进行网站布局，能处理好不同浏览器之间的兼容性问题；<br />\r\n6. 面试时请带上自己满意的web设计作品与简历。 <br />\r\n&nbsp;</p>\r\n<p>=============================================== &shy;</p>\r\n<p>&shy;</p>\r\n<p>电子商务销售人员2名，负责向客户介绍、推荐、销售J2CMS，跟踪客户使用情况 &shy;</p>\r\n<p>职位要求： &shy;</p>\r\n<p>1、热爱销售，适应高强度工作，喜欢挑战自我，善于客户公关，主动销售，不畏挫折 &shy;</p>\r\n<p>2、品貌端正，思维敏捷，反应迅速，善于交流，细心谨慎、认真负责，普通话流利 &shy;</p>\r\n<p>3、熟悉软件和互联网行业，掌握 office 软件，网络沟通和应用办公软件 &shy;</p>\r\n<p>4、具有软件或网络销售工作经验，有客户积累者优先考虑 &shy;</p>\r\n<p>5、年龄 30 岁以下，大专以上学历，男女不限 &shy;</p>\r\n<p>&shy;</p>\r\n<p>=============================================== &shy;</p>\r\n<p>简历投至邮箱 HR#yetnet.cn&nbsp;&nbsp;&nbsp; #换成@&nbsp;&nbsp; (勿直接来电，我们会筛选后电话通知)<br />\r\n&nbsp;</p>', '英才招聘', 5, 'Y', 509, 1, 4, '2012-03-24 06:44:14'),
(6, 'Y', 'N', '<p>&nbsp;</p>\r\n<p>武汉地址：湖北省武汉市光谷创业街SBI&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>北京地址：北京市海淀区中关村</p>\r\n<p>&nbsp;</p>\r\n<p>上海地址：上海市松江区东华大学</p>\r\n<p>&nbsp;</p>\r\n<p>电话：18818232418</p>\r\n<p>&nbsp;</p>\r\n<p>Q Q：<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=75214390&amp;site=qq&amp;menu=yes"><img title="点击与我会话" border="0" alt="点击与我会话" src="http://wpa.qq.com/pa?p=2:75214390:41" /></a>&nbsp;<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=304748568&amp;site=qq&amp;menu=yes"><img title="点击与我会话" border="0" alt="点击与我会话" src="http://wpa.qq.com/pa?p=2:304748568:41" /></a></p>\r\n<p>&nbsp;</p>\r\n<p>邮箱：j2cms.org@gmail.com</p>\r\n<p>&nbsp;</p>\r\n<p>官方QQ群：</p>\r\n<p>J2CMS官方群一：31309177 [满]</p>\r\n<p>&nbsp;</p>\r\n<p>J2CMS官方群二：154615448 [满]</p>\r\n<p>&nbsp;</p>\r\n<p>J2CMS 官方群三：196170407</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<p>&nbsp;</p>', '联系我们', 6, 'Y', 798, 1, 2, '2012-10-23 20:13:02'),
(7, 'Y', 'Y', '', '版本', 1, 'N', 1199, 1, 2, NULL),
(8, 'Y', 'N', '<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>后台演示</p>\r\n<p><a target="_blank" href="/manage"><u>http://www.j2cms.com/manage</u>&nbsp;</a>&nbsp;&nbsp;&nbsp; 帐号 admin &nbsp;密码 admin</p>\r\n<p>&nbsp;</p>\r\n<p>后台界面</p>\r\n<p><a target="_blank" href="http://www.j2cms.com/jiemian/1.png">http://www.j2cms.com/jiemian/1.png</a></p>\r\n<p><a target="_blank" href="http://www.j2cms.com/jiemian/2.png">http://www.j2cms.com/jiemian/2.png</a></p>\r\n<p><a target="_blank" href="http://www.j2cms.com/jiemian/3.png">http://www.j2cms.com/jiemian/3.png</a></p>\r\n<p><a target="_blank" href="http://www.j2cms.com/jiemian/4.png">http://www.j2cms.com/jiemian/4.png</a></p>\r\n<p><a target="_blank" href="http://www.j2cms.com/jiemian/5.png">http://www.j2cms.com/jiemian/5.png</a></p>\r\n<p><a target="_blank" href="http://www.j2cms.com/jiemian/6.png">http://www.j2cms.com/jiemian/6.png</a></p>', '演示', 3, 'Y', 2141, 1, 2, '2012-03-25 23:07:50'),
(9, 'N', 'N', '<p>&nbsp;</p>\r\n<p>J2CMS是一个基于JAVAEE平台的轻量极的敏捷开发架构,实现了一个内容管理系统模型．集合了Spring3.1 + Struts2.3 + Hibernate4.1 + JPA2.0 + FreeMarker + MySQL 等技术。</p>\r\n<p>项目源码托管在 &nbsp;https://github.com/j2cms/&nbsp; 。</p>\r\n<p>欢迎给我们反馈BUG和建议！</p>', '加入', 5, 'Y', 417, 1, 2, '2012-10-22 00:44:53');

-- --------------------------------------------------------

--
-- 表的结构 `j2_comment`
--

CREATE TABLE IF NOT EXISTS `j2_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `release_date` datetime DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `sys_date` datetime DEFAULT NULL,
  `check_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE0FC1A2865590862` (`user_id`),
  KEY `FKE0FC1A284167BB47` (`article_id`),
  KEY `FKE0FC1A2870E5F926` (`article_id`),
  KEY `FKE0FC1A282856D981` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `j2_config`
--

CREATE TABLE IF NOT EXISTS `j2_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(40) DEFAULT NULL,
  `copyright` varchar(200) DEFAULT NULL,
  `domain` varchar(30) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `record_code` varchar(20) DEFAULT NULL,
  `template` varchar(20) DEFAULT NULL,
  `file` varchar(20) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `QQ` varchar(20) DEFAULT NULL,
  `ceo` varchar(20) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `introduce` varchar(1000) DEFAULT NULL,
  `keywords` varchar(50) DEFAULT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `statistics` varchar(200) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `version` varchar(10) DEFAULT NULL,
  `sys_date` datetime DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `j2_config`
--

INSERT INTO `j2_config` (`id`, `company`, `copyright`, `domain`, `email`, `name`, `record_code`, `template`, `file`, `full_name`, `QQ`, `ceo`, `description`, `introduce`, `keywords`, `mobile`, `statistics`, `tel`, `ip`, `version`, `sys_date`, `uuid`) VALUES
(1, '武汉易乐网络科技有限公司 ', '2009-2012 J2CMS ', 'www.j2cms.org', 'j2cms.org@gmail.com', 'J2CMS', '鄂ICP备08102130号', 'template/j2cms/', '/', '捷免网络J2CMS|开源 jsp cms | java cms ', '75214390', '李小天', 'J2CMS是一个基于JAVAEE平台的轻量极的敏捷开发架构,实现了一个内容管理系统模型．集合了Spring3.1 + Struts2.3 + Hibernate4.1 + JPA2.0 + FreeMarker + MySQL 等技术', '    J2CMS是一个基于JAVAEE平台的轻量极的敏捷开发架构,实现了一个内容管理系统模型．集合了Spring3.1 + Struts2.3 + Hibernate4.1 + JPA2.0 + FreeMarker + MySQL 等技术。<br/>更新时间:2012年10月22日<br/>软件大小:24M  <br/>\n<a href="manage" title="帐号：admin 密码：admin" target="_blank">后台演示</a>  <img src="/template/j2cms/images/downicon.gif"/>\n<a href="https://github.com/j2cms/J2CMS-SSH/zipball/master" target="_blank">立即下载</a>', 'java cms,jsp cms', '18818232418', '<script src=''http://s87.cnzz.com/stat.php?id=1766140&web_id=1766140'' language=''JavaScript'' charset=''gb2312''></script>', '18818232418', '218.193.154.51', '20121022', '2012-10-25 13:14:48', '');

-- --------------------------------------------------------

--
-- 表的结构 `j2_flash`
--

CREATE TABLE IF NOT EXISTS `j2_flash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(300) DEFAULT NULL,
  `link_url` varchar(300) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `check_state` int(11) DEFAULT NULL,
  `sys_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `j2_flash`
--

INSERT INTO `j2_flash` (`id`, `image_url`, `link_url`, `title`, `check_state`, `sys_date`) VALUES
(4, 'http://www.j2cms.com/images/AD/domain.gif', 'http://www.yeelor.com/services/domain/', '域名.com  52元/年 .net 42元/年.org 49元/年', 2, '2012-03-22 02:57:50'),
(5, '/images/AD/java_host.jpg', '/host.html', '高性能JAVA虚拟主机  100元/年', 2, '2012-03-22 02:57:45');

-- --------------------------------------------------------

--
-- 表的结构 `j2_group`
--

CREATE TABLE IF NOT EXISTS `j2_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` varchar(255) DEFAULT NULL,
  `manager_article` char(1) DEFAULT NULL,
  `manage_channel` char(1) DEFAULT NULL,
  `manage_comment` char(1) DEFAULT NULL,
  `manage_config` char(1) DEFAULT NULL,
  `manage_group` char(1) DEFAULT NULL,
  `manager_log` char(1) DEFAULT NULL,
  `manager_user` char(1) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `check_state` int(11) DEFAULT NULL,
  `sys_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `j2_group`
--

INSERT INTO `j2_group` (`id`, `info`, `manager_article`, `manage_channel`, `manage_comment`, `manage_config`, `manage_group`, `manager_log`, `manager_user`, `name`, `check_state`, `sys_date`) VALUES
(1, '', 'N', 'N', 'N', 'N', 'N', 'N', 'N', '测试用户', NULL, NULL),
(5, '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '系统管理员', 2, NULL),
(12, '', 'N', 'N', 'N', 'N', 'Y', 'N', 'Y', '普通管理员', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `j2_log`
--

CREATE TABLE IF NOT EXISTS `j2_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) DEFAULT NULL,
  `log_result` varchar(20) DEFAULT NULL,
  `log_type` varchar(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `sys_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `j2_order`
--

CREATE TABLE IF NOT EXISTS `j2_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(50) DEFAULT NULL,
  `danwei` varchar(2) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `num` varchar(10) DEFAULT NULL,
  `other` varchar(500) DEFAULT NULL,
  `release_date` varchar(10) DEFAULT NULL,
  `sys_date` datetime DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `time` varchar(2) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA21157652A3513` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `j2_user`
--

CREATE TABLE IF NOT EXISTS `j2_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `QQ` varchar(12) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `check_state` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `info` longtext,
  `last_login_ip` varchar(15) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `login_number` int(11) DEFAULT NULL,
  `j2cms_pass_word` varchar(32) DEFAULT NULL,
  `real_name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `j2cms_user_name` varchar(20) DEFAULT NULL,
  `zipCode` varchar(10) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `sys_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `j2cms_user_name` (`j2cms_user_name`),
  KEY `FK42187CA2C51C15F0` (`group_id`),
  KEY `FK42187CA2BFEA1B4F` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `j2_user`
--

INSERT INTO `j2_user` (`id`, `QQ`, `address`, `birthday`, `check_state`, `createTime`, `email`, `gender`, `info`, `last_login_ip`, `last_login_time`, `login_number`, `j2cms_pass_word`, `real_name`, `telephone`, `j2cms_user_name`, `zipCode`, `group_id`, `sys_date`) VALUES
(1, '', '', NULL, 2, NULL, '', 0, '', NULL, NULL, NULL, '21232F297A57A5A743894A0E4A801FC3', '测试用户', '', 'admin', '', 5, NULL);

--
-- 限制导出的表
--

--
-- 限制表 `j2_order`
--
ALTER TABLE `j2_order`
  ADD CONSTRAINT `FKA21157652A3513` FOREIGN KEY (`channel_id`) REFERENCES `j2_channel` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
