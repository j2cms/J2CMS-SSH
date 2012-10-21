<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel=stylesheet href="/css/demo.css" type="text/css"/>
<link href="/css/bodystyle.css" rel="stylesheet" type="text/css"/>
<!-- 
<script language=Javascript src="/js/post.js"></script>
<script language=Javascript src="/js/article.js"></script>
 -->
</head>
<body>
<form name="addForm" method="post" action="update">
<table width="100%" border="1" cellpadding="0" cellspacing="0">
	<tr >
		<td height="27px" colspan="3" background="/images/menu_bg.jpg">&nbsp;&nbsp;
        <b class="title">修改文章:${article.id}</b>
        <input name="selector.id" type="hidden" id="selector.id" value="${selector.id}"/>
        <input name="selector.title" type="hidden" id="selector.title" value="${selector.title}"/>
        <input name="selector.channel.id" type="hidden" id="selector.channel.id" value="${selector.channel.id}"/>
        <input name="sortType" type="hidden" id="sortType" value="${sortType}"/>
        <input name="sortord" type="hidden" id="sortord" value="${sortord}"/>
        <input name="selector.releaseDate" type="hidden" id="selector.releaseDate" value="${selector.releaseDate}"/>
        <input name="selector.user.username" type="hidden" id="selector.user.username" value="${selector.user.username}"/>
        <input name="selector.recommendLevel" type="hidden" id="selector.recommendLevel" value="${selector.recommendLevel}"/>
        <input name="selector.checkState" type="hidden" id="selector.checkState" value="${selector.checkState}"/>
        <input name="pageView.maxresult" type="hidden" id="pageView.maxresult" value="${pageView.maxresult}"/>
        <input name="pageView.currentpage" type="hidden" id="pageView.currentpage" value="${pageView.currentpage}"/>
                
        <input name="article.id" type="hidden" id="article.id" value="${article.id}"/>
        </td>
	</tr>
	<tr>
		<td height="25px" width="10%" align="right">栏目：</td>
		<td colspan="2"> 
			<select name="article.channel.id" id="article.channel.id">
			<c:forEach var="channel" items="${channels}">
				 <option value="${channel.id}">${channel.name}</option>
			</c:forEach>
	        </select>
        <script>
		   document.getElementById("article.channel.id").value ='${article.channel.id}';
		</script>
		&nbsp;允许浏览用户组
		<select name="article.group.id" id="article.group.id">
        <c:forEach var="group" items="${groups}">
			 <option value="${group.id}">${group.name}</option>
		</c:forEach>
	    </select>
		状态<script>
		   document.getElementById("article.group.id").value ='${article.group.id}';
		</script>
	    <select name="article.checkState" id="article.checkState">
	      <option value="draft" selected="selected">草稿箱</option>
	      <option value="noCheck">待审核</option>
	      <option value="pass">已审核</option>
	      <option value="noPass">未通过</option>
	      <option value="recycle">回收站</option>
	      </select>
        <script>document.getElementById("article.checkState").value ='${article.checkState}';</script>

		推荐级别
		<select name="article.recommendLevel" id="article.recommendLevel">
		  <option value="0">0</option>
		  <option value="1">1</option>
		  <option value="2">2</option>
		  <option value="3">3</option>
		</select>
		<script>
		   document.getElementById("article.recommendLevel").value ='${article.recommendLevel}';
		</script>

		允许评论
		<input type="checkbox" name="article.commentState" id="article.commentState" value="true" />
		<c:if test="${article.commentState==true||article.commentState==null}">
		  <script>document.all["article.commentState"].checked="checked"</script>
		</c:if>
		
		</td>
	</tr>
	<tr>
		<td height="25px" align="right">标题：</td>
		<td colspan="2"><input name="article.title" value="${article.title}" type="text" id="article.title"
			size="40" maxlength="60"/><span class="info1">&nbsp;*</span></td>
	</tr>
	<tr>
		<td height="25px" align="right">作者：</td>
		<td colspan="2"><input name="article.author" value="${article.author}" type="text" id="article.author"
			size="40" maxlength="20"/><span class="info1">&nbsp;*</span></td>
	</tr>
	<tr>
		<td height="25px" align="right">来源：</td>
		<td colspan="2"><input name="article.origin" value="${article.origin}" type="text" id="article.origin"
			size="40" maxlength="60"/><span class="info1">&nbsp;*</span></td>
	</tr>
	<tr>
		<td height="25px" align="right">tag标签：</td>
		<td colspan="2"><input name="article.tags" value="${article.tags}" type="text" id="article.tags"
			size="40" maxlength="30"/></td>
	</tr>
	<tr>
		<td height="25px" align="right">标题缩略图：</td>
		<td>
			<div id="p1" >
	        <input name="article.titleImg" type="text" id="article.titleImg" size=40
				maxlength="80" style="display: " value="${article.contentImg}"/> 
		    </div>
		</td>
	</tr>
	<tr>
		<td height="25px" align="right">内容缩略图：</td>
		<td>
			<div id="p1" >
	        <input name="article.contentImg" type="text" id="article.contentImg" size=40
				maxlength="80" style="display: " value="${article.contentImg}"/> 
		    </div>
		</td>
	</tr>

    <tr>
		<td height="25px" align="right">相关文章ID：</td>
		<td colspan="2"><input type="text" name="article.relatedID" id="article.relatedID" value="${article.relatedID}" size="40" /> 
		  <span class="info1">ID之间用&quot;,&quot;隔开</span></td>
	</tr>    
	<tr>
		<td height="25px" align="right">摘要：</td>
		<td colspan="2"><textarea name="article.summary"  rows="3" cols="97"
			id="article.summary" value="${article.summary}"></textarea> <span class="info1">小于200字</span></td>
	</tr>
	<tr>
    	<td >&nbsp;</td>
		<td colspan="2"><FCK:editor instanceName="article.content"
			height="400pt" width="800pt" basePath="">
			<jsp:attribute name="value">${article.content}</jsp:attribute>
		</FCK:editor></td>
	</tr>
	<tr> 
		<td colspan="3">
		<p align="center"/><br/>
		<input  type="submit"  value=" 保 存 "/>
        <input  type="button" value=" 返 回 " onclick='javascript: history.go(-1)' /> 																	        
		</td>
	</tr>
</table>
</form>
<br/>
<br/>
</body>
</html>