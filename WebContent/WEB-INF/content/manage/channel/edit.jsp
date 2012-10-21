<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="/css/demo.css" type="text/css"/>
<link href="/css/bodystyle.css" rel="stylesheet" type="text/css"/>
<script language="javascript">
function check() {	
	if(document.all("entity.name").value.length==0) {
		alert("栏目名不能为空，请输入栏目名!");
		document.all("entity.name").focus();
		return false;
    };
	document.all("frmAction").submit();
}
function back() {
	location.href="list";
}
</script>
</head>
<body >
	<form name="frmAction"  method="post" action="update" >
	<input type="hidden"  value="${entity.visitTotal}" name="entity.visitTotal"/>
	<table width="100%" border="1" cellpadding="0" >
 		<tr>
			<td height="32" colspan="7" background="/images/menu_bg.jpg">&nbsp;&nbsp;
        	<b class="title">修改栏目:${entity.id}</b>
        	<input name="entity.id" type="hidden" id="entity.id" value="${entity.id}"/>
        	</td>
		</tr>
		<tr>
			 <td height="25px" width='10%' align='right'>上级栏目 </td>
             <td>
				 <select name="entity.father.id" id="entity.father.id">
	   		     <c:forEach var="chs" items="${channels}">
				 	<option value="${chs.id}">${chs.name}</option>
				 </c:forEach>
		     	 </select>
		     	 <script>
		   			document.getElementById("entity.father.id").value ='${entity.father.id}';
				 </script>
				  状态
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
			<td  height="25px" align='right' nowrap>排序ID&nbsp;</td>
		    <td ><input type="text"  value="${entity.rankid}" name="entity.rankid"/></td>
		</tr>
		<tr>
			<td  height="25px" align='right' nowrap>栏目名&nbsp;</td>
		    <td ><input type="text" name="entity.name" value="${entity.name }" /></td>
		</tr>
		<tr >
			<td  height="25px" align='right' nowrap>单页面&nbsp;</td>
		    <td ><input type="checkbox" name="entity.single" id="entity.single" value="true" />&nbsp;&nbsp;&nbsp;[此栏目将以单个页面而不是文章列表的形式显示，显示内容为栏目内容]</td>
		    <c:if test="${entity.single==true}">
		  		<script>document.all["entity.single"].checked="checked"</script>
			</c:if>
		</tr>
        <tr >
			<td  height="25px" align='right' nowrap>导航栏&nbsp;</td>
		    <td ><input type="checkbox" name="entity.display" id="entity.display" value="true" />&nbsp;&nbsp;&nbsp;[此栏目将在导航栏中显示]</td>
		    <c:if test="${entity.display==true}">
		  		<script>document.all["entity.display"].checked="checked"</script>
			</c:if>
		</tr>
		<tr>
			<td  height="25px" align='right' nowrap>首页中&nbsp;</td>
		    <td ><input type="checkbox" name="entity.displayInIndex" id="entity.displayInIndex" value="true" />&nbsp;&nbsp;&nbsp;[此栏目下文章列表将在首页中部显示，不适合单页面]</td>
		    <c:if test="${entity.displayInIndex==true}">
		  		<script>document.all["entity.displayInIndex"].checked="checked"</script>
			</c:if>
		</tr>
		
		<tr >
			<td  align='right' nowrap>栏目内容</td>
			<td >
			<FCK:editor instanceName="entity.info"
			height="400px" width="800px" basePath="">
			<jsp:attribute name="value">${entity.info}</jsp:attribute>
		    </FCK:editor>
			</td>
		</tr>		
		<tr >
			<td></td>
		   	<td  height=35 >
	   			<input  type="button" value=" 确 定 " onClick="javascript:check();"/>
				<input  type="button" value=" 返 回 " onClick="javascript:back();" />
		   </td>
		</tr>        
	</table>
	</form>
</body>
</html>
