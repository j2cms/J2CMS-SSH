<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="/css/demo.css" type="text/css" />
<script src="/js/entity.js" language="javascript" type="text/javascript"></script>
</head>
<body>
<form name="frmAction" method="post" action="list">
<input name="id" type="hidden" id="id" value="0"/>
<table class="toolBar" width="100%">
	<tr>
		<td width="100%">
			<input type="button" onclick="add()" value=" 发 布 " />&nbsp;&nbsp; 
			<input type="button" onclick="edit()"value=" 修 改 " />&nbsp;&nbsp; 
			<input type="button" onclick="del()" value=" 删 除 " /> 
			<input style="width: 80px;"  value="生成HTML" type="button" onclick="html()"  />
		</td>
	</tr>
</table>

<table width="100%" border="0" cellpadding="3" cellspacing="1"
	class="toolTable">
	<!--此处为列描述，自己加入-->
	<tr align="center" class="colom">
		<td width="5%" rowspan="2"><input type="checkbox" name="selall"
			onclick="selectAll(this)" /></td>
		<td height="20" align='center'>ID</td>
		<td>标题</td>
		<td>栏目</td>
		<td>发布时间</td>
		<td>发布者</td>
		<td>推荐级别</td>
		<td>排序<select name="sortord" id="sortord">
			<option value="desc">>></option>
			<option value="asc"><<</option>
		</select> <script>document.getElementById("sortord").value ='${sortord}';</script>
		</td>
		<td>状态</td>
		<td rowspan="2"><input type="submit" name="button2" id="button2"
			value="查询" style="width: 100px; height: 50px;" /></td>
	</tr>
	<tr align="center" class="colom">
		<td height="20"><input name="selector.id" type="text"
			id="selector.id" value="${selector.id}" size="5"/></td>
		<td><input name="selector.title" type="text" id="selector.title" value="${selector.title}"/></td>
		<td><select name="selector.channel.id" id="selector.channel.id">
			<c:forEach var="channel" items="${channels}">
				<option value="${channel.id}">${channel.name}</option>
			</c:forEach>
		</select> <script>document.getElementById("selector.channel.id").value ='${selector.channel.id>1?selector.channel.id:1}';</script>
		</td>
		<td><input name="selector.releaseDate" type="text" id="selector.releaseDate" value="${selector.releaseDate}" size="5" /></td>
		<td><input name="selector.user.username" type="text" id="selector.user.username" value="${selector.user.username}" size="5" /></td>
		<td><select name="selector.recommendLevel"
			id="selector.recommendLevel">
			<option value="">全部</option>
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
		</select> <script>document.getElementById("selector.recommendLevel").value ='${selector.recommendLevel}';</script>
		</td>
		<td>
		<select name="sortType" id="sortType">
			<option value="id">ID</option><!--默认ID -->
			<option value="recommendLevel">推荐级别</option>
			<option value="releaseDate">发布时间</option>
			<option value="checkDate">审核时间</option>
			<option value="disableDate">禁用时间</option>
			<option value="commentCount">评论数量</option>
			<option value="visitTotal">访问数量</option>
		</select> <script>document.getElementById("sortType").value ='${sortType}';</script>
		</td>
		<td><select name="selector.checkState" id="selector.checkState">
			<option value="">全部</option>
			<option value="draft">-草稿箱</option>
			<option value="noCheck">-待审核</option>
			<option value="pass">-已审核</option>
			<option value="noPass">-未通过</option>
			<option value="recycle">-回收站</option>
		</select> <script>document.getElementById("selector.checkState").value ='${selector.checkState}';</script> 
		</td>
	</tr>

	<c:forEach var="entity" items="${pageView.records}" varStatus="status">
		<tr <c:if test="${status.count%2==1}">class='even'</c:if> class='row'>
			<td align="center"><input type='checkbox' name='ids' value="${entity.id}" /></td>
			<td align="center"><c:out value="${entity.id}" /></td>
			<td align="center"><a href="../../article?id=${entity.id}"
				target="_blank"> <c:out value="${entity.title}" /></a></td>
			<td align="center"><a href="../../channel?id=${entity.channel.id}" target="_blank"><c:out value="${entity.channel.name}" /></a></td>
			<td align="center"><c:out value="${entity.releaseDate}" /></td>
			<td align="center"><c:out value="${entity.user.username}" /></td>
			<td align="center"><c:out value="${entity.recommendLevel}" /></td>
			<td align="center">
			<c:if test="${sortType=='id'}">${entity.id}</c:if>
			<c:if test="${sortType=='recommendLevel'}">${entity.recommendLevel}</c:if>
			<c:if test="${sortType=='releaseDate'}">${entity.releaseDate}</c:if>
			<c:if test="${sortType=='checkDate'}">${entity.checkDate}</c:if>
			<c:if test="${sortType=='disableDate'}">${entity.disableDate}</c:if>
			<c:if test="${sortType=='commentCount'}">${entity.commentCount}</c:if>
			<c:if test="${sortType=='visitTotal'}">${entity.visitTotal}</c:if>
			</td>
			<td align="center"><c:if test="${entity.checkState=='pass'}">
				<img src="/images/yes.gif" title="已审核" />
			</c:if> <c:if test="${entity.checkState=='draft'}">
				<img src="/images/pic17.gif" title="草稿箱" />
			</c:if> <c:if test="${entity.checkState=='noCheck'}">
				<img src="/images/noCheck.gif" title="待审核" />
			</c:if> <c:if test="${entity.checkState=='noPass'}">
				<img src="/images/no.gif" title="未通过" />
			</c:if> <c:if test="${entity.checkState=='recycle'}">
				<img src="/images/recycle.gif" title="回收站" />
			</c:if></td>
			<td align="center">
			<input type="button" onclick="editSingle(${entity.id})" value=" 修 改 " /> 
			<input type="button" onclick="delSingle(${entity.id},'${entity.checkState}')" value=" 删 除 " /></td>
		</tr>
	</c:forEach>

</table>
<%@ include file="../util/paging.jsp"%></form>
</body>
</html>
