<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java" import="org.j2cms.model.channel.Channel" errorPage=""%>
<%@ include file="../util/taglib.jsp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="/js/webTree.js" type="text/javascript" language="javascript"></script>
<link href="/css/webTree.css" type="text/css" rel="stylesheet" />

<script src="/js/prototype.lite.js" type="text/javascript"></script>
<script src="/js/moo.fx.js" type="text/javascript"></script>
<script src="/js/moo.fx.pack.js" type="text/javascript"></script>
<style>
body {
	font: 12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin: 0px;
}

#container {
	width: 182px;
}

H1 {
	font-size: 12px;
	margin: 0px;
	width: 182px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;
}

H1 a {
	display: block;
	width: 182px;
	color: #454545;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	background-image: url(/images/menu_bgs.gif);
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;
}

.content {
	width: 182px;
	height: 26px;
}

.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}

.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 182px;
	padding-left: 0px;
}

.MM {
	width: 182px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px, 0px, 0px, 0px);
}

.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(/images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}

.MM a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(/images/menu_bg1.gif);
	background-repeat: no-repeat;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}

.MM a:active {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(/images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}

.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	font-weight: bold;
	color: #006600;
	background-image: url(/images/menu_bg2.gif);
	background-repeat: no-repeat;
	text-align: center;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
</style>
</head>

<body>
<table width="100%" height="280" border="0" cellpadding="0"
	cellspacing="0" bgcolor="#EEF2FB">
	<!--
  <tr>
  		<td  width="182" height="30">
          <h1><a href="right" target="main">管理中心首页</a></h1>
        </td>
  </tr>
-->
	<tr>
		<td width="182" valign="top">
		<div id="container">




		<h1 class="type"><a href="javascript:void(0)">栏目内容管理</a></h1>
		<div class="content">

		<ul class="MM">
			<li><a href="article/add" target="main">发布内容</a></li>
			<li><a href="article/list" target="main">全部内容</a></li>
			<li><a href="article/list?selector.checkState=draft"
				target="main">草稿箱</a></li>
			<li><a href="article/list?selector.checkState=noCheck"
				target="main">待审核</a></li>
			<li><a href="article/list?selector.checkState=noPass"
				target="main">未通过</a></li>
			<li><a href="article/list?selector.checkState=recycle"
				target="main">回收站</a></li>
			<li><a href="article/list?selector.checkState=pass"
				target="main">已审核</a></li>

		</ul>

		<div class="dtree">
		<center><a href="javascript: d.openAll();"><img
			src="/images/icon/4.png" title="展开全部" /></a> | <a
			href="javascript: d.closeAll();"><img title="收起所有"
			src="/images/icon/3.png" /></a></center>
		<script type="text/javascript">
			var d = new dTree('d');
			//d.add(0,-1,'待审核','/manage/article/list?checkState=noCheck','','main');
			d.add(1,-1,'全部栏目','/manage/article/list?selector.checkState=pass','','main');
			
			<%
				String o =(String)session.getAttribute("s");
				List<Channel> channels = (ArrayList<Channel>)request.getAttribute("channels");
				channels.remove(0);
				for(Channel c:channels)
				{
					%>
					d.add(<%=c.getId()%>,<%=c.getFather().getId()%>,'<%=c.getName()%>','/manage/article/list?selector.checkState=pass&selector.channel.id=<%=c.getId()%>','','main');
					<%
				}
			%>
			//d.add(1000000,-1,'草稿箱','/manage/article/list?checkState=draft','','main');
			//d.add(1000001,-1,'未通过','/manage/article/list?checkState=noPass','','main');
			//d.add(1000002,-1,'回收站','/manage/article/list?checkState=recycle','','main','/images/icon/trash.gif');
			document.write(d);
			</script></div>

		</div>

		<h1 class="type"><a href="javascript:void(0)">栏目分类管理</a></h1>
		<div class="content">
		<ul class="MM">
			<li><a href="channel/add" target="main">增加栏目</a></li>
			<li><a href="channel/list" target="main">全部栏目</a></li>
			<li><a href="channel/list?display=true" target="main">导航栏</a></li>
			<li><a href="channel/list?displayInIndex=true" target="main">首页中</a></li>
			<li><a href="channel/list?single=true" target="main">单页面</a></li>


		</ul>
		<div class="dtree">
		<center><a href="javascript: d2.openAll();"><img
			src="/images/icon/4.png" title="展开全部" /></a> | <a
			href="javascript: d2.closeAll();"><img title="收起所有"
			src="/images/icon/3.png" /></a></center>
		<script type="text/javascript">
		var d2 = new dTree('d2');
		d2.add(1,-1,'全部栏目','channel/list','','main');
		<%
			for(Channel c:channels)
			{
				%>
				d2.add(<%=c.getId()%>,<%=c.getFather().getId()%>,'<%=c.getName()%>','channel/edit?id=<%=c.getId()%>', '', 'main');
<%
			}
		%>
	document.write(d2);
</script></div>
		</div>



		<h1 class="type"><a href="javascript:void(0)">注册用户管理</a></h1>
		<div class="content">
		<ul class="MM">
			<li><a href="user/add" target="main">增加用户</a></li>
			<li><a href="user/list" target="main">用户管理</a></li>
			<li><a href="group/list" target="main">用户组</a></li>

		</ul>
		</div>

		<h1 class="type"><a href="javascript:void(0)">网站常规管理</a></h1>
		<div class="content">
		<ul class="MM">
			<li><a href="/manage/config/edit" target="main">基本设置</a></li>
			<li><a href="/manage/config/flash/list" target="main">首页FLASH</a></li>
			<!--  <li><a href="/manage/log/list" target="main">日志管理</a></li> -->
			<li><a href="/manage/config/makeIndexHtml" target="main">生成首页</a></li>
		</ul>
		</div>


		</div>


		<script type="text/javascript">
	var contents = document.getElementsByClassName('content');
	var toggles = document.getElementsByClassName('type');

	var myAccordion = new fx.Accordion(toggles, contents, {
		opacity : true,
		duration : 400
	});
	myAccordion.showThisHideOpen(contents[0]);
</script></td>
	</tr>
</table>


</body>
</html>
