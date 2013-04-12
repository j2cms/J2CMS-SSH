<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 
<script language=Javascript src="/js/post.js"></script>
<script language=Javascript src="/js/article.js"></script>
onSubmit="return checkArticle();"
 -->
<link href="../../css/new_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form name="addForm" method="post" action="save">
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
<input name="entity.user.id" type="hidden" id="entity.user.id" value="${entity.user.id>0?entity.user.id:user.id}"/>

<div id="main_frame">
<div id="main_column">

<div>
	<div class="mainbox-title-container">
	    <div class="mainbox-title"> 发布文章：${entity.id}
	    </div>
	</div>
	
    <div class="mainbox-body">
    <table cellpadding="0" cellspacing="0" border="0" class="table-fixed">
    <tbody>
    <tr>
    <td>
      <div class="statistics-box-order">
        <div class="statistics-body-order">
        <div class="form-all">
		<div class="float-field">       
        	<div class="form-field ">
                <div class="label" >栏目：</div>
                <select class="search-select" name="entity.channel.id" id="entity.channel.id">
				<c:forEach var="channel" items="${channels}">
				 <option value="${channel.id}">${channel.name}</option>
				</c:forEach>
				<script>
		   			document.getElementById("entity.channel.id").value ='${selector.channel.id>1?selector.channel.id:1}';
				</script>

	        </select>
                 
       		</div>
        
        	<div class="form-field ">
        		<a class="label" >允许浏览用户组：</a>
        		<select class="search-select" name="entity.group.id" id="entity.group.id">
        		<c:forEach var="group" items="${groups}">
			 	<option value="${group.id}">${group.name}</option>
				</c:forEach>
	    		</select>
        	</div>
        	
        	<div class="form-field ">
        		<a class="label" >状态：</a>
        		<select class="search-select" name="entity.checkState" id="entity.checkState">
	      		<option value="draft">草稿箱</option>
	      		<option value="noCheck">待审核</option>
	      		<option value="pass" selected="selected">已审核</option>
	      		<option value="noPass">未通过</option>
	      		<option value="recycle">回收站</option>
	    		</select>
        		
        	</div>
        	
        	<div class="form-field ">
        		<a class="label" >推荐级别：</a>
        		<select class="search-select" name="entity.recommendLevel" id="entity.recommendLevel">
				  <option value="0">0</option>
				  <option value="1">1</option>
				  <option value="2">2</option>
				  <option value="3">3</option>
				</select>
        	</div>
        	
        	<div class="form-field ">
        		<a class="label" >允许评论：</a>
        		<input class="float-left" type="checkbox" name="entity.commentState" id="entity.commentState" value="true" checked="checked"/>
        	</div>
       </div>
       
        <div class="float-field">
        	<div class="form-field ">
        		<a class="label" >标题：</a>
        		<input name="entity.title" class="search-input-price" value="${entity.title}" type="text" id="entity.title"	size="40" maxlength="60"/><span class="info1">&nbsp;*&nbsp;${message1}</span>
        	</div>
        	

        
        	<div class="form-field ">
        		<a class="label" >作者：</a>
        		<input name="entity.author" class="search-input-price" value="${empty entity.author?user.realName:entity.author}" type="text" id="entity.author"
			size="40" maxlength="20"/><span class="info1">&nbsp;*&nbsp;${message2}</span>
        	</div>
        	
        	<div class="form-field ">
        		<a class="label" >发布时间：</a>
        		<input name="entity.releaseDate" class="search-input-price" value="${entity.releaseDate}" type="text" id="entity.releaseDate"
			size="40" maxlength="20"/><span class="info1">&nbsp;*&nbsp;${message3}</span>
        	</div>
        	
        	<div class="form-field ">
        		<a class="label" >来源：</a>
        		<input name="entity.origin" class="search-input-price" value="${entity.origin}" type="text" id="entity.origin"
			size="40" maxlength="60"/>
        	</div>
        	
        	<div class="form-field ">
        		<a class="label" >tag标签：</a>
        		<input name="entity.tags" class="search-input-price" value="${entity.tags}" type="text" id="entity.tags"
			size="40" maxlength="30"/>
        	</div>
        	
        	<div class="form-field ">
        		<a class="label" >标题缩略图：</a>
        		<input name="entity.titleImg" class="search-input-price" type="text" id="entity.titleImg" size=40
				maxlength="80" style="display: " value="${entity.contentImg}"/> 
        	</div>
        	
        	<div class="form-field ">
        		<a class="label" >内容缩略图：</a>
        		<input name="entity.contentImg" class="search-input-price" type="text" id="entity.contentImg" size=40
				maxlength="80" style="display: " value="${entity.contentImg}"/>
        	</div>
        	
        	<div class="form-field ">
        		<a class="label" >相关文章ID：</a>
        		<input type="text" name="entity.relatedID" class="search-input-price" id="entity.relatedID" value="${entity.relatedID}" size="40" /> 
		  <span class="info1"></span>
        	</div>
        	
        	
        </div>
        
        
        
        <div class="float-field">
        
        	<div class="form-field " style="min-width:700px;">
        		<a class="label" >摘要：</a>
        		<textarea name="entity.summary"  rows="3" cols="85" id="entity.summary" value="${entity.summary}"></textarea> <span class="info1">小于200字</span>
        	</div>
        	
        	<div class="form-field " style="min-width:800px;">
        		<FCK:editor instanceName="entity.content" height="400px" width="800px"  basePath="">
					<jsp:attribute name="value">${entity.content}</jsp:attribute>
				</FCK:editor>
        		
        	</div>
        	
        	<div class="form-field " style="min-width:700px;">
        		<input  type="submit"  value=" 保 存 "/>
        		<input  type="button" value=" 返 回 " onclick='javascript: history.go(-1)' /> 
        	</div>
        	
        	
        </div>
        	
        
        </div>
        
        </div>
      </div>
    </td>
    </tr>
    </tbody>
    </table>
    </div>
 </div>
 
 
</div>
</div>


</form>
<br/>
<br/>
</body>
</html>