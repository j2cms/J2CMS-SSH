<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ page pageEncoding="utf-8"%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../css/new_style.css" rel="stylesheet" type="text/css" />
<script>
	function check() {
		if (document.getElementById("entity.name").value.length == 0) {
			alert("用户组名不能为空!");
			document.getElementById("entity.name").focus();
			return false;
		}
		document.getElementById("frmAction").submit();
	}
	function back() {
		history.go(-1);
		//location.href = "list";
	}
</script>

</head>
<body>
	<form name="frmAction" id="frmAction" method="post" action="update">
		<input name="entity.id" type="hidden" id="entity.id" value="${entity.id}" />
		<div id="main_frame">
			<div id="main_column">

				<div>
					<div class="mainbox-title-container">
						<div class="mainbox-title">修改用户组：${entity.id}</div>
					</div>

					<div class="mainbox-body">
						<table cellpadding="0" cellspacing="0" border="0" class="table-fixed">
							<tr>
								<td>

									<div class="statistics-box-order">
										<div class="statistics-body-order">

											<table width="100%" border="0px;" cellpadding="0px;" cellspacing="2px;">


												<tr>
													<td height="25px" align="right">状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td colspan="2"><select name="entity.checkState" id="entity.checkState">
															<option value="draft" selected="selected">草稿箱</option>
															<option value="noCheck">待审核</option>
															<option value="pass">已审核</option>
															<option value="noPass">未通过</option>
															<option value="recycle">回收站</option>
													</select> <script>
														document
																.getElementById("entity.checkState").value = '${entity.checkState}';
													</script></td>
												</tr>
												<tr>
													<td width='200' height="35" align='right'>用户组名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><input type="text" id="entity.name" name="entity.name" value="${entity.name}" /> <font color=#ff0000>*</font></td>
												</tr>
												<tr align=left>
													<td width='200' height="32" align='right'>具有权限&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td nowrap="nowrap"><input type="checkbox" name="entity.manageChannel" value="true" <c:if test="${entity.manageChannel==true}">checked="checked" </c:if> /> 栏目管理 <input type="checkbox" name="entity.manageArticle" value="true"
														<c:if test="${entity.manageArticle==true}">checked="checked"</c:if> /> 文章管理 <input type="checkbox" name="entity.manageComment" value="true" <c:if test="${entity.manageComment==true}">checked="checked"</c:if> /> 评论管理 <input type="checkbox" name="entity.manageGroup" value="true"
														<c:if test="${entity.manageGroup==true}">checked="checked" </c:if> /> 用户组管理 <input type="checkbox" name="entity.manageUser" value="true" <c:if test="${entity.manageUser==true}">checked="checked" </c:if> /> 会员管理 <input type="checkbox" name="entity.manageConfig" value="true"
														<c:if test="${entity.manageConfig==true}">checked="checked" </c:if> /> 配置管理 <input type="checkbox" name="entity.manageLog" value="true" <c:if test="${entity.manageLog==true}"> checked="checked"</c:if> /> 日志管理</td>
												</tr>
												<tr>
													<td width='200' height="32" align='right' nowrap>角色描述&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><textarea cols=68 rows=5 name="entity.info">${entity.info}</textarea></td>
												</tr>
												<tr>
													<td></td>
													<td><input class="input" type="button" value=" 确 定 " onClick="javascript:check()" /> <input class="input" type="button" value=" 返 回 " onClick="javascript:back()" /></td>
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
