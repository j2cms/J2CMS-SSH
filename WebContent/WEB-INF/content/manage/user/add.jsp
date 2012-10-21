<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel=stylesheet href="/css/demo.css" type="text/css"/>
<link href="/css/bodystyle.css" rel="stylesheet" type="text/css"/>
<script language=Javascript src="/js/article.js"></script>
</head>
<body>
<form name="addForm" method="post" action="save">
<table width="100%" border="1" cellpadding="0">
	<tr >
		<td height="27px" colspan="3" background="/images/menu_bg.jpg">&nbsp;&nbsp;
        <b class="title">增加用户:</b>
        <input name="selector.id" type="hidden" id="selector.id" value="${selector.id}"/>
        <input name="selector.username" type="hidden" id="selector.username" value="${selector.username}"/>
        <input name="selector.group.id" type="hidden" id="selector.group.id" value="${selector.group.id}"/>
        <input name="selector.gender" type="hidden" id="selector.gender" value="${selector.gender}"/>
        <input name="selector.realName" type="hidden" id="selector.realName" value="${selector.realName}"/>
        <input name="selector.birthday" type="hidden" id="selector.birthday" value="${selector.birthday}"/>
        <input name="selector.email" type="hidden" id="selector.email" value="${selector.email}"/>
        <input name="selector.telephone" type="hidden" id="selector.telephone" value="${selector.telephone}"/>
        <input name="selector.QQ" type="hidden" id="selector.QQ" value="${selector.QQ}"/>
        <input name="selector.address" type="hidden" id="selector.address" value="${selector.address}"/>
        <input name="selector.zipCode" type="hidden" id="selector.zipCode" value="${selector.zipCode}"/>
        <input name="selector.checkState" type="hidden" id="selector.checkState" value="${selector.checkState}"/>        
       
        </td>
	</tr>
	<tr>
		<td height="25px" align="right" width="20px">用户组</td>
		<td colspan="2"> 
			<select name="entity.group.id" id="entity.group.id">
	        <c:forEach var="group" items="${groups}">
		    <option value="${group.id}">${group.name}</option>
	     	</c:forEach>
		    </select>
		    <script>
			   document.getElementById("entity.group.id").value ='${selector.group.id>1?selector.group.id:1}';
			</script>
        	  状态
            <select name="entity.checkState" id="entity.checkState">
              <option value="noCheck">待审核</option>
              <option value="pass" selected>已审核</option>
              <option value="noPass">未通过</option>
              <option value="recycle">回收站</option>
            </select>
         </td>
	</tr>
	<tr>
		<td height="25px" align="right">用户名</td>
		<td colspan="2">
		  <input name="entity.username" type="text" id="entity.username" value="${entity.username}" />
		  <span class="info1">&nbsp;*&nbsp;${message1}</span>
		</td>
	</tr>
	<tr>
		<td height="25px" align="right">密码</td>
		<td colspan="2"><input name="entity.password" type="password" id="entity.password" value="${entity.password}" />
		<span class="info1">&nbsp;*&nbsp;${message2}</span></td>
	</tr>
	<!--  
	<tr>
		<td height="25px" align="right" nowrap >再次输入密码</td>
		<td colspan="2"><input name="password" type="password" id="password" value="${password}" /></td>
	</tr>
	-->
	<tr>
		<td height="25px" align="right">真实姓名</td>
		<td colspan="2"><input name="entity.realName" type="text" id="entity.realName" value="${entity.realName}" /></td>
	</tr>
	<tr>
		<td height="25px" align="right">性别</td>
		<td>
			<select name="entity.gender" id="gender">
			 <option value="unknown">未知</option>
		     <option value="man"<c:if test="${entity.gender=='man'}"> selected="selected"</c:if>>男</option>
		     <option value="woman" <c:if test="${entity.gender=='woman'}"> selected="selected"</c:if>>女</option>
   			</select>
		</td>
	</tr>
	<tr>
		<td height="25px" align="right">出生时间</td>
		<td><input name="entity.birthday" type="text" id="entity.birthday" value="${entity.birthday}" />	
		</td>
	</tr>
    <tr>
		<td height="25px" align="right">电子邮箱</td>
		<td><input name="entity.email" type="text" id="entity.email" value="${entity.email}" />	
		</td>
	</tr>
    <tr>
		<td height="25px" align="right">电话</td>
		<td><input name="entity.telephone" type="text" id="entity.telephone" value="${entity.telephone}" />
		</td>
	</tr>
    <tr>
		<td height="25px" align="right">QQ</td>
		<td><input name="entity.QQ" type="text" id="entity.QQ" value="${entity.QQ}" />
		</td>
	</tr>
    <tr>
		<td height="25px" align="right">地址</td>
		<td><input name="entity.address" type="text" id="entity.address" value="${entity.address}" />
		</td>
	</tr>
	<tr>
		<td height="25px" align="right">邮编</td>
		<td colspan="2"><input name="entity.zipCode" type="text" id="entity.zipCode" value="${entity.zipCode}" /></td>
	</tr>   

	<tr>
    	<td width="10%" align="right">个人资料</td>
		<td colspan="2"><FCK:editor instanceName="entity.info"
			height="400px" width="800px" basePath="">
			<jsp:attribute name="value">${entity.info}</jsp:attribute>
		</FCK:editor></td>
	</tr>
	<tr> 
		<td colspan="3">
		<p align="center"/><br/>
		<input  type="submit"  value=" 增 加 "/>
        <input  type="button" value=" 返 回 " onclick='javascript: history.go(-1)' /> 																	        
		</td>
	</tr>
</table>
</form>
<br/>
<br/>
</body>
</html>