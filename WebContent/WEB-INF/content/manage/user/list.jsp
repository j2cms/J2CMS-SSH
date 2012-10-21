<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="/css/demo.css" type="text/css"/>
<script src="/js/entity.js" language="javascript" type="text/javascript"></script>
</head>
<body>
<form name="frmAction" method="post" action="list">
<input name="id" type="hidden" id="id" value="0"/>
<table width="100%"  class="toolBar" >
	<tr>
		<td width="100%">
			<input type="button" onclick="add()"  value=" 增 加 "/>&nbsp;&nbsp;
			<input type="button" onclick="edit()" value=" 修 改 "/>&nbsp;&nbsp;
          <input type="button" onclick="del()" value=" 删 除 "/>&nbsp;&nbsp;
       	</td>
   	</tr>
</table>

<table width="100%" border="0" cellpadding="3" cellspacing="1" class="toolTable">
  <tr align="center" class="colom">
		<td width="5%" rowspan="2"><input type="checkbox" name="selall" onclick="selectAll(this)" /></td>
		<td height="20" align='center'>ID</td>
	  	<td >用户名</td>
		<td >用户组</td>
        <td >性别</td>
        <td >真实姓名</td>
		<td >出生时间</td>		
        <td >电子邮箱</td>
        <td >电话</td>
        <td >QQ</td>
        <td >地址</td>
        <td >邮编</td>
        <td >状态</td>
        <td rowspan="2"><input type="submit" name="button2" id="button2" value="查询" style="width:100px; height:50px;"/></td>
	</tr>
    <tr align="center" class="colom">
		<td height="20" align='center'><input name="selector.id" type="text" id="selector.id" value="${selector.id}" size="5"/></td>
		<td><input name="selector.username" type="text" id="selector.username" value="${selector.username}" size="8" /></td>
		<td><select name="selector.group.id" id="selector.group.id">
		  <option value="">全部</option>
		  <c:forEach var="group" items="${groups}">
		    <option value="${group.id}">${group.name}</option>
	      </c:forEach>
		  </select>
		  <script>document.getElementById("selector.group.id").value ='${selector.group.id}';</script>
		</td>
        <td>
        <select name="selector.gender" id="selector.gender">
           <option value="" selected="selected">全部</option>
           <option value="unknown">未知</option>
		   <option value="man">男</option>
		   <option value="woman">女</option>
        </select>
        <script>document.getElementById("selector.gender").value ='${selector.gender}';</script>
        </td>
        <td><input name="selector.realName" type="text" id="selector.realName" value="${selector.realName}" size="8" /></td>
		<td><input name="selector.birthday" type="text" id="selector.birthday" value="${selector.birthday}" size="8" /></td>		
        <td><input name="selector.email" type="text" id="selector.email" value="${selector.email}" size="8" /></td>
        <td><input name="selector.telephone" type="text" id="selector.telephone" value="${selector.telephone }" size="8" /></td>
        <td><input name="selector.QQ" type="text" id="selector.QQ" value="${selector.QQ}" size="8" /></td>
        <td><input name="selector.address" type="text" id="selector.address" value="${selector.address}" size="8" /></td>
        <td><input name="selector.zipCode" type="text" id="selector.zipCode" value="${selector.zipCode}" size="8" /></td>
        <td><select name="selector.checkState" id="selector.checkState">
          <option value="">全部</option>
          <option value="noCheck">未审核</option>
          <option value="pass">已审核</option>
          <option value="noPass">未通过</option>
          <option value="recycle">回收站</option>
        </select>
        <script>document.getElementById("selector.checkState").value ='${selector.checkState}';</script>
        </td>
    </tr>
	
	<c:forEach var="entity" items="${pageView.records}" varStatus="status">
		<tr<c:if test="${status.count%2==1}">class='even'</c:if>  class='row' >
			<td align="center"><input type='checkbox' name='ids' value="${entity.id}"/></td>
            <td align="center"><c:out value="${entity.id}"/></td>
			<td align="center">
            <a href="../../user?id=${entity.id}" target="_blank">
            <c:out value="${entity.username}"/></a></td>
            <td align="center"><c:out value="${entity.group.name}"/></td>
            <td align="center">
            	<c:if test="${entity.gender=='unknown'}"></c:if>
            	<c:if test="${entity.gender=='man'}">男</c:if>
            	<c:if test="${entity.gender=='woman'}">女</c:if>
            </td>
            <td align="center"><c:out value="${entity.realName}"/></td>
            <td align="center"><c:out value="${entity.birthday}"/></td>
            <td align="center"><c:out value="${entity.email}"/></td>
            <td align="center"><c:out value="${entity.telephone}"/></td>
            <td align="center"><c:out value="${entity.QQ}"/></td>
            <td align="center"><c:out value="${entity.address}"/></td>
            <td align="center"><c:out value="${entity.zipCode}"/></td>
			<td align="center">
            	<c:if test="${entity.checkState=='pass'}"><img src="/images/yes.gif" title="已审核"/></c:if>
				<c:if test="${entity.checkState=='noCheck'}"><img src="/images/noCheck.gif" title="待审核"/></c:if>
				<c:if test="${entity.checkState=='noPass'}"><img src="/images/no.gif" title="未通过"/></c:if>
				<c:if test="${entity.checkState=='recycle'}"><img src="/images/recycle.gif" title="回收站"/></c:if>
			</td>
			<td align="center">
			<input type="button" onclick="editSingle(${entity.id})" value=" 修 改 " /> 
			<input type="button" onclick="delSingle(${entity.id},'${entity.checkState}')" value=" 删 除 "/></td>
		</tr>
	</c:forEach>
	
</table>
<%@ include file="../util/paging.jsp"%>
</form>
</body>
</html>
