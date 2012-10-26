www.j2cms.org

J2CMS是一个基于JAVAEE平台的轻量级的敏捷开发架构,实现了一个内容管理系统模型．集合了Spring3.1 + Struts2.3 + Hibernate4.1 + JPA2.0 + FreeMarker + MySQL 等技术。
开发环境　:
eclipse-jee-Juno-Release-win32
JDK 1.6
Apache tomcat 6.0
MySQL 5.5
系统依赖的其它jar包版本可以在lib目录里看到

导入Eclipse说明：
1.src和WebContent目录分别是Eclipse工程中对应的目录内容
2.j2cms.sql是数据库，需要导入mysql中，修改src\META-INF\persistence.xml 文件中数据库配置。

安装说明：
1.将数据库文件（在根目录）j2cms.sql 导入数据库。
　　方法一,用MySQLAdministrator导入
　　方法二,用MySQL命令导入：
	mysql> create database j2cms;
	mysql> use j2cms;
	mysql> source d:\j2cms.sql;
2.修改配置文件 WEB-INF\classes\META-INF\persistence.xml 中的数据库链接。
3.网站必须部署在根目录才能正常显示（因为使用了绝对路径）。比如tomcat的ROOT目录，访问路径为http://127.0.0.2:8080/ 
      管理后台访问路径  http://127.0.0.2:8080/login  帐号 admin 密码 admin 
　  配置一个带域名的主机，以下是在tomcat的server.xml中配置一个Host的示例
     <Host name="127.0.0.2"  appBase="F:/web"
            unpackWARs="true" autoDeploy="true"
            xmlValidation="false" xmlNamespaceAware="false">
	         <Alias>j2cms.org</Alias>
             <Context path="" docBase="F:/web/j2cms" debug="0" reloadable="true"/>
     </Host>

4.重启Tomcat 通过http://127.0.0.2:8080访问




关注最新开发进度请加官方QQ群31309177 [已满] 154615448 [已满] 196170407
what's new
=================================
2012.10.22
1.当前版本的分支为j2cms-SSH
2.更新了SSH的版本,使用了当前最新的版本
3.其它所有的依赖的jar包基本都升级到当前最新版本,去掉多余的jar包
4.若干bug的修正
5.log4j的调整
6.整体性能大幅提升
=================================
2012.3.25
1.Struts2中Action类的泛型继承，架构上的重大改进
2.首页，栏目，文章可以生成静态页面
3.为全部实体增加系统日期和系统状态的属性，管理更加灵活
4.修改系统配置后同时修改全局变量里的值
5.用户注册唯一问题
6.系统里所有表单的必填项的服务器端加强验证
7.可自定义模版文件夹的路径
8.采用了Alice作为UI的CSS模版
9.大量代码重写,修复与改进。控制层的重新架构。
10.整体性能大幅提升
=================================
2012.2.11
1.manage/left.ftl->  left.jsp
=================================
2012.2.8
1.增加若干系统参数
 
2.java包启用org.j2cms
 
3.增加用户注册 /register
 
4.部分代码优化

=================================
2011.9.27
1.加入Freemarker作为模版
2.若干小修正
=================================
2011.6.8

1.修改字体为Arial,Helvetica,sans-serif
=================================
2011.5.22

1.修正栏目访问统计量在更新后被清零的BUG；
2.修正发布文章的默认所属栏目为“全部”；

=================================
2011.5.21

1.实现用户组权限管理； 

2.优化内容管理与用户管理模块的查询功能； 

3.用户密码字段加密；

4.改写大量的程序代码,优化系统架构,修正若干BUG。

=================================
2011.4.8

1.添加用户组权限功能
2.用户管理模块的查询功能
==================================
