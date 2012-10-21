<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<%@ page pageEncoding="utf-8"%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/bodystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="/css/demo.css" type="text/css"/>
<script language=Javascript src="/js/post.js"></script>
<script language=Javascript src="/js/article.js"></script>
<script>
function check() {
	if(document.all("entity.name").value.length==0) {
		alert("角色名不能为空!");
		document.all("entity.name").focus();
		return false;
	};	
	document.all("frmAction").submit();
}
function back() {
	history.go(-1);
}
</script>

</head>
<body> 
<form name="frmAction"  method="post" action="update" >
   <table width="100%"  border="1" >
     	<tr align=left>
		<td height="27px" colspan="3" background="/images/menu_bg.jpg"><b class="title">修改用户组:${entity.id}</b>
		<input name="entity.id" type="hidden" id="entity.id" value="${entity.id}"/>
		</td>
	</tr>
	<tr>
		<td height="25px" align="right">状态：</td>
		<td colspan="2">
		<select name="entity.checkState" id="entity.checkState">
	      <option value="draft" selected="selected">草稿箱</option>
	      <option value="noCheck">待审核</option>
	      <option value="pass">已审核</option>
	      <option value="noPass">未通过</option>
	      <option value="recycle">回收站</option>
	    </select>
        <script>document.getElementById("entity.checkState").value ='${entity.checkState}';</script>
		</td>
	</tr>	
	<tr >
		 <td width='200' height="35" align='right' >角色名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td ><input type="text"  name="entity.name" value="${entity.name}"/> <font color=#ff0000>*</font></td>
		</tr>
	<tr align=left>
		  <td width='200' height="32" align='right'>具有权限&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		  <td nowrap="nowrap">
		   <input type="checkbox" name="entity.manageChannel" value="true" <c:if test="${entity.manageChannel==true}">checked="checked" </c:if>/> 栏目管理
		   <input type="checkbox" name="entity.manageArticle" value="true" <c:if test="${entity.manageArticle==true}">checked="checked"</c:if>/> 文章管理
           <input type="checkbox" name="entity.manageComment" value="true" <c:if test="${entity.manageComment==true}">checked="checked"</c:if>/> 评论管理
           <input type="checkbox" name="entity.manageGroup" value="true" <c:if test="${entity.manageGroup==true}">checked="checked" </c:if>/> 用户组管理 
           <input type="checkbox" name="entity.manageUser" value="true" <c:if test="${entity.manageUser==true}">checked="checked" </c:if>/> 会员管理
           <input type="checkbox" name="entity.manageConfig"  value="true" <c:if test="${entity.manageConfig==true}">checked="checked" </c:if>/> 配置管理
           <input type="checkbox" name="entity.manageLog" value="true" <c:if test="${entity.manageLog==true}"> checked="checked"</c:if>/> 日志管理
            
             </td>                   
         </tr>		
	<tr >
		<td width='200' height="32" align='right' nowrap>角色描述&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><textarea cols=60 rows=5 name="entity.info" >${entity.info}</textarea><font color='#ff0000'>字符个数不多于250个</font>
		</td>
       </tr>
   <tr>
       	<td></td>
	   	<td>    
         <input class="input" type="button" value=" 确 定 " onClick="javascript:check()" />
		 <input class="input" type="button" value=" 返 回 " onClick="javascript:back()" />        
</td></tr></table>
</form>
</body>
</html>
