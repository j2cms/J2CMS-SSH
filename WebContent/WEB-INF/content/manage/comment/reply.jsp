<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>回复</title>
</head>
<body  topmargin="10" leftmargin="10"  ondrag="return false" >
<form id=commentform>
<table cellspacing=1 cellpadding=0 width="100%" bgcolor=#cccccc border=0>
  <tbody>
  <tr>
    <td align=right width="17%" bgcolor=#f9f9f9 height=30>回复留言：</td>
    <td width="83%" bgcolor=#ffffff>&nbsp;<textarea class=required id=commentcontent title=请填写回复（3到255个字符） name=commentcontent       rows=5 cols=70 minlength="3"></textarea> 
    </td></tr>
  <tr>
    <td align=right bgcolor=#f9f9f9 height=30>验 证 码：</td>
    <td bgcolor=#ffffff>&nbsp;<input class=required id=commentcheckcode 
      title=请填写验证码 maxlength=10 name=commentcheckcode> &nbsp;
      <input type=submit value=回复 /></td></tr></tbody></table></form><!--回复留言End-->
</body>
</html>