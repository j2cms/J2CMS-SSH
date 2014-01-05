<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="../../css/new_style.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<form name="frmAction" id ="frmAction"  method="post" action="update">
		  <input name="selector.id" type="hidden" id="selector.id" value="${selector.id}" />
		  <input name="selector.title" type="hidden" id="selector.title" value="${selector.title}" />
		  <input name="selector.channel.id" type="hidden" id="selector.channel.id" value="${selector.channel.id}" />
		  <input name="sortType" type="hidden" id="sortType" value="${sortType}" /> 
		  <input name="sortord" type="hidden" id="sortord" value="${sortord}" /> 
		  <input name="selector.releaseDate" type="hidden" id="selector.releaseDate" value="${selector.releaseDate}" /> 
		  <input name="selector.user.username" type="hidden" id="selector.user.username" value="${selector.user.username}" /> 
		  <input name="selector.recommendLevel" type="hidden" id="selector.recommendLevel" value="${selector.recommendLevel}" />
		  <input name="selector.checkState" type="hidden" id="selector.checkState" value="${selector.checkState}" /> 
		  <input name="pageView.maxresult" type="hidden" id="pageView.maxresult" value="${pageView.maxresult}" /> 
		  <input name="pageView.currentpage" type="hidden" id="pageView.currentpage" value="${pageView.currentpage}" /> 
		  <input name="entity.user.id" type="hidden" id="entity.user.id" value="${entity.user.id>0?entity.user.id:user.id}" /> 
		  <input name="entity.id" type="hidden" id="entity.id" value="${entity.id}" /> 
		  <input name="entity.visitTotal" type="hidden" id="entity.visitTotal" value="${entity.visitTotal}" />

		<div id="main_frame">
			<div id="main_column">

				<div>
					<div class="mainbox-title-container">
						<div class="mainbox-title">修改文章：${entity.id}</div>
					</div>

					<div class="mainbox-body">
						<table cellpadding="0" cellspacing="0" border="0" class="table-fixed">
								<tr>
									<td>

										<div class="statistics-box-order">
											<div class="statistics-body-order">

												<table width="100%" border="0px;" cellpadding="0px;" cellspacing="2px;">

													<tr>
														<td width="10%" align="right">栏目：</td>
														<td colspan="2"><select name="entity.channel.id" id="entity.channel.id">
																<c:forEach var="channel" items="${channels}">
																	<option value="${channel.id}">${channel.name}</option>
																</c:forEach>
														</select> <script>
															document.getElementById("entity.channel.id").value = '${entity.channel.id}';
														</script> &nbsp;允许浏览用户组 <select name="entity.group.id" id="entity.group.id">
																<c:forEach var="group" items="${groups}">
																	<option value="${group.id}">${group.name}</option>
																</c:forEach>
														</select> <script>
															document.getElementById("entity.group.id").value = '${entity.group.id}';
														</script> 状态 <select name="entity.checkState" id="entity.checkState">
																<option value="draft" selected="selected">草稿箱</option>
																<option value="noCheck">待审核</option>
																<option value="pass">已审核</option>
																<option value="noPass">未通过</option>
																<option value="recycle">回收站</option>
														</select> <script>
															document.getElementById("entity.checkState").value = '${entity.checkState}';
														</script> 推荐级别 <select name="entity.recommendLevel" id="entity.recommendLevel">
																<option value="0">0</option>
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
														</select> <script>
															document.getElementById("entity.recommendLevel").value = '${entity.recommendLevel}';
														</script> 允许评论 <input type="checkbox" name="entity.commentState" id="entity.commentState" value="true" /> <c:if test="${entity.commentState==true||entity.commentState==null}">
																<script>
																	document.getElementById("entity.commentState").checked = "checked"
																</script>
															</c:if></td>
													</tr>
													<tr>
														<td align="right">标题：</td>
														<td colspan="2"><input name="entity.title" value="${entity.title}" type="text" id="entity.title" size="40" maxlength="60" /><span class="info1">&nbsp;*&nbsp;${message1}</span></td>
													</tr>
													<tr>
														<td align="right">作者：</td>
														<td colspan="2"><input name="entity.author" value="${entity.author}" type="text" id="entity.author" size="40" maxlength="20" /><span class="info1">&nbsp;*&nbsp;${message2}</span></td>
													</tr>
													<tr>
														<td align="right">发布时间：</td>
														<td colspan="2"><input name="entity.releaseDate" value="${entity.releaseDate}" type="text" id="entity.releaseDate" size="40" maxlength="20" /><span class="info1">&nbsp;*&nbsp;${message3}</span></td>
													</tr>
													<tr>
														<td align="right">来源：</td>
														<td colspan="2"><input name="entity.origin" value="${entity.origin}" type="text" id="entity.origin" size="40" maxlength="60" /></td>
													</tr>
													<tr>
														<td align="right">tag标签：</td>
														<td colspan="2"><input name="entity.tags" value="${entity.tags}" type="text" id="entity.tags" size="40" maxlength="30" /></td>
													</tr>
													<tr>
														<td align="right" nowrap>标题缩略图：</td>
														<td colspan="2"><input name="entity.titleImg" type="text" id="entity.titleImg" size=40 maxlength="80" style="display:" value="${entity.titleImg}" /></td>
													</tr>
													<tr>
														<td align="right">内容缩略图：</td>
														<td colspan="2">
															<div id="p1">
																<input name="entity.contentImg" type="text" id="entity.contentImg" size=40 maxlength="80" style="display:" value="${entity.contentImg}" />
															</div>
														</td>
													</tr>

													<tr>
														<td align="right" nowrap>相关文章ID：</td>
														<td colspan="2"><input type="text" name="entity.relatedID" id="entity.relatedID" value="${entity.relatedID}" size="40" /> <span class="info1"></span></td>
													</tr>
													<tr>
														<td align="right">摘要：</td>
														<td colspan="2"><textarea name="entity.summary" rows="3" cols="97" id="entity.summary" value="${entity.summary}"></textarea> </td>
													</tr>
													<tr>
														<td>&nbsp;</td>
														<td colspan="2"><FCK:editor instanceName="entity.content" height="400px" width="800px" basePath="">
																<jsp:attribute name="value">${entity.content}</jsp:attribute>
															</FCK:editor></td>
													</tr>
													<tr>
														<td colspan="3">
															<p align="center" /> <br /> <input type="submit" value=" 保 存 " /> <input type="button" value=" 返 回 " onclick='javascript: history.go(-1)' />
														</td>
													</tr>
												</table>
											</div>
										</div>

									</td>
								</tr>
						</table>

					</div>
				</div>


			</div>
		</div>

	</form>

</body>
</html>