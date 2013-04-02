<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script language=JavaScript>
function logout(){
	if (confirm("您确定要退出控制面板吗？"))
	top.location = "${C.ctp}/user/logout";
	return false;
}
</script>

<style>
body {
background-color: #F3F3F3;
}
.header-wrap {
width: 100%;
min-width: 800px;
height: 95px;
position: relative;
z-index: 21;
}
#header {
background: #0899C9;
padding: 14px 0 0 0;
margin: 0 auto;
width: 100%;
min-width: 800px;
height: 38px;
}
#logo {
font:bold;
padding: 0 0 0 30px;
float: left;
height: 29px;
font-weight:bold;
}
#logo a {
font-size: 14px;
color: white;
text-decoration: none;
}
#top_quick_links {
float: right;
padding-right: 25px;
}

#top_quick_links a{
font-size: 12px;
color: #DAF1F9;
margin-right:10px;
text-decoration: none;
}

#top_quick_links a:hover{
font-size: 12px;
color: #ffffff;
margin-right:10px;
text-decoration:underline;
}

#menu{
list-style: none;
width:auto;
height: 39px;
padding: 0px 30px 0px 30px;
background: #E5E5E5 repeat-x;
clear: both;
}
ul {
padding: 0;
margin: 0;
list-style-type: none;
}


#menu li{
float: left;
display: block;
text-align: center;
position: relative;
border: none;
margin-right: 1px;
}

#menu li#quit{
float:right;
}

#menu li a:hover
{
	background: #D2D2D2 50% -8px;
	font-weight:bold;
}


#menu li a {
font-size: 15px;
color: #000000;
display: block;
outline: 0;
text-decoration: none;
padding: 8px 18px 10px;
cursor:auto;
text-transform: capitalize;
text-shadow: 1px 1px #EBEBEB;
}

#menu ul, #menu li, #alt_menu ul, #alt_menu li 
{
line-height: 21px;
text-align: left;
}


</style>


</head>
<body>
<div class="header-wrap">
<div id="header">
<div id="logo">
	<a href="http://www.j2cms.com" target="_blank" title="点此下载最新版本">J2CMS</a>
</div>
<div id="top_quick_links">
	<a>${(user.username)!""}， 您好！今天是
        <script language=javascript type=text/javascript>
		<!--
				var enabled = 0; today = new Date();
				var day; var date;
				if(today.getDay()==0) day = " 星期日"
				if(today.getDay()==1) day = " 星期一"
				if(today.getDay()==2) day = " 星期二"
				if(today.getDay()==3) day = " 星期三"
				if(today.getDay()==4) day = " 星期四"
				if(today.getDay()==5) day = " 星期五"
				if(today.getDay()==6) day = " 星期六"
				date = (today.getFullYear()) + "年" + (today.getMonth() + 1 ) + "月" + today.getDate() + "日" + day +"";
				document.write(date);
		// -->
		</script>
		</a>
</div>

<ul id="menu">
        
      <li><a href="right" target="main" >管理首页</a></li>
      <li><a href="../index" title="生成首页" target="_blank" >网站首页</a></li>
       
     
	<li id="quit"><a href="#" target="_self" onClick="logout();"><img src="../images/out.gif" alt="安全退出" width="46" height="20" border="0"></a></li>
</ul>

	</div>
</div>    
</body>
</html>