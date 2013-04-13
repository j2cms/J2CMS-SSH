<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="../../css/demo.css" type="text/css" />

</head>
<body>
<form name="frmAction" method="post" action="list">
<input name="editID" type="hidden" id="editID" value="0"/>
<table width="100%" class="toolBar">
	<tr>
		<td id="addbutton"> 
          <input type="button" onClick="del()" value="删除"/>&nbsp;&nbsp;
		</td>
	</tr>
</table>

<table width="100%" border="0" cellpadding="3" cellspacing="1"
	class="toolTable">
	<!--此处为列描述，自己加入-->
	<tr align="center" class="colom">
		<td width="5%" ><input type="checkbox" name="selall"
			onClick="selectAll(this)" /></td>
		<td height="20" align='center'>ID</td>
		<td>姓名</td>
		<td>电话</td>
		<td>所在地区</td>
		<td>废品数量</td>
		<td>废品类别</td>
		<td>上门时间</td>
		<td>备注</td>
		<td>年/月/日</td>
		<td></td>
		
	</tr>
	
	<c:forEach var="order" items="${pageView.records}" varStatus="status">
		<tr <c:if test="${status.count%2==1}">class='even'</c:if> class='row'>
			<td align="center"><input type='checkbox' name='checkID' value="${order.id}" /></td>
			<td align="center"><c:out value="${order.id}" /></td>
			<td align="center"><a href="../../order?id=${order.id}" target="_blank"> <c:out value="${order.name}" /></a></td>
			<td align="center"><c:out value="${order.tel}" /></td>
			<td align="center"><c:out value="${order.address}" /></td>
			<td align="center"><c:out value="${order.num}${order.danwei}" /></td>
			<td align="center"><c:out value="${order.channel.name}" /></td>
			<td align="center"><c:out value="${order.time}点" /></td>
			<td align="center"><c:out value="${order.other}" /></td>
			<td align="center"><c:out value="${order.releaseDate}" /></td>
			
			<td align="center">
			<input type="button" onClick="delSingle(${order.id})" value="删除" /></td>
		</tr>
	</c:forEach>

</table>
<%@ include file="../util/paging.jsp"%></form>
</body>
</html>
