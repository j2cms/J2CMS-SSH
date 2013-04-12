<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="../../css/demo.css" type="text/css"/>
<script src="../../js/entity.js" language="javascript" type="text/javascript"></script>
</head>
<body>
<form name="frmAction" method="post" action="list">
<input name="id" type="hidden" id="id" value="0"/>
<table width="100%" class="toolBar" >
	<tr>
		<td id="addbutton">
			<input type="button" onclick="add()"  value=" 增 加 "/>&nbsp;&nbsp;
			<input type="button" onclick="edit()" value=" 修 改 "/>&nbsp;&nbsp;
            <input type="button" onclick="del()" value=" 删 除 "/>&nbsp;&nbsp;
            <input style="width: 80px;" type="button" onclick="html()" value="生成HTML" />
       	</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="3" cellspacing="1" class="toolTable">
	<tr align="center" class="colom">
		<td width="50" height="20"><input type="checkbox" name="selall" onclick="selectAll(this)" /></td>
		<td align='center'>ID</td>
		<td>排序ID</td>
		<td>栏目名</td>
        <td>单页面</td>
        <td>导航栏</td>
        <td>首页中</td>
		<td>上级</td>
		<td>点击量</td>
		<td>状态</td>
        <td>操作</td>
	</tr>	
	<c:forEach var="entity" items="${pageView.records}" varStatus="status">
		<tr<c:if test="${status.count%2==1}">class='even'</c:if>  class='row'>
			<td align="center"><input type='checkbox' name='ids'
				value='<c:out value="${entity.id}" />'/></td>
            <td align="center">${entity.id}</td>
            <td align="center">${entity.rankid}</td>
			<td align="center">
            <a href="../../channel?id=${entity.id}" target="_blank">${entity.name}</a></td>
            <td align="center"><c:if test="${entity.single==true}"><img src="../../images/yes.gif"/></c:if></td>
            <td align="center"><c:if test="${entity.display==true}"><img src="../../images/yes.gif"/></c:if></td>
            <td align="center"><c:if test="${entity.displayInIndex==true}"><img src="../../images/yes.gif"/></c:if></td>
			<td align="center"><c:out value="${entity.father.name}"/></td>            
			<td align="center"><c:out value="${entity.visitTotal}"/></td>
			<td align="center"><c:if test="${entity.checkState=='pass'}">
				<img src="../../images/yes.gif" title="已审核" />
			</c:if> <c:if test="${entity.checkState=='draft'}">
				<img src="../../images/pic17.gif" title="草稿箱" />
			</c:if> <c:if test="${entity.checkState=='noCheck'}">
				<img src="../../images/noCheck.gif" title="待审核" />
			</c:if> <c:if test="${entity.checkState=='noPass'}">
				<img src="../..../../images/no.gif" title="未通过" />
			</c:if> <c:if test="${entity.checkState=='recycle'}">
				<img src="../../images/recycle.gif" title="回收站" />
			</c:if></td>
			<td align="center"><input type="button" onclick="javascript:location.href='edit?id=${entity.id}'" value=" 修 改 "/>
			<input type="button" onclick="delSingle(${entity.id},'${entity.checkState}')" value=" 删 除 " /></td>
		</tr>
	</c:forEach>	
</table>

<%@ include file="../util/paging.jsp"%>
</form>
</body>
</html>
