<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script language=JavaScript>
function logout(){
	if (confirm("您确定要退出控制面板吗？"))
	top.location = "/user/logout";
	return false;
}
</script>
<link href="/css/skin.css" rel="stylesheet" type="text/css"/>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" height="64" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
  <tr>
    <td  width="40%" height="64"><a href="http://www.j2cms.com" target="_blank" title="点此下载最新版本"><img border="0" src="/images/j2cms_logo.gif"  height="64" alt=""/></a></td>
    <td width="60%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="85%" height="38" class="admin_txt"><b>${(user.username)!""}</b>， 您好！今天是
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
      &nbsp;&nbsp;
      <a href="right" target="main" style="color:#FFF">管理首页</a>
      &nbsp;&nbsp;
      <a href="../index" title="生成首页" target="_blank" style="color:#FFF">网站首页</a>
        </td>
        <td width="11%" nowrap><a href="#" target="_self" onClick="logout();"><img src="/images/out.gif" alt="安全退出" width="46" height="20" border="0"></a></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr>
        <td height="19" colspan="3">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table>
</body>
</html>