<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link href="../../css/new_style.css" rel="stylesheet" type="text/css" />
<script src="../../js/entity.js" language="javascript" type="text/javascript"></script>
</head>
<body>
	<form name="frmAction" id="frmAction" method="post" action="list">
		<input name="id" type="hidden" id="id" value="0" />

		<div id="main_frame">
			<div id="main_column">

				<div>
					<div class="mainbox-title-container">
						<div class="mainbox-title">内容管理</div>
					</div>

					<div class="mainbox-body">
						<table cellpadding="0" cellspacing="0" border="0" class="table-fixed">
								<tr>
									<td>
										<div class="statistics-box-order">
											<div class="statistics-body-order">

												<div class="vieworder_row_top" style="padding: 0px; margin: 0px;">
													<div class="vieworder_box_60_40">
														<input type="button" class="search-button" onclick="add()" value=" 增 加 " />
													</div>

													<div class="vieworder_box_60_40">
														<input type="button" class="search-button" onclick="edit()" value=" 修 改 " />&nbsp;&nbsp;
													</div>

													<div class="vieworder_box_60_40">
														<input type="button" class="search-button" onclick="del()" value=" 删 除 " />
													</div>

													<div class="vieworder_box_60_40">
														<input class="search-button" value="生成HTML" type="button" onclick="html()" />
													</div>

												</div>
												<div class="table_border">

													<div class="vieworder_row_top">
														<div class="vieworder_box_30_40"></div>
														<div class="vieworder_box_50_40">
															<a>ID</a>
														</div>
														<div class="vieworder_box_250_40">标题</div>
														<div class="vieworder_box_80_40">
															<a>栏目</a>
														</div>
														<div class="vieworder_box_80_40">
															<a>发布时间</a>
														</div>
														<div class="vieworder_box_80_40">
															<a>发布者</a>
														</div>
														<div class="vieworder_box_80_40">
															<a>推荐级别</a>
														</div>
														<div class="vieworder_box_30_40">
															<a>排序</a>
														</div>
														<div class="vieworder_box_80_40">
															<select name="sortord" id="sortord">
																<option value="desc">>></option>
																<option value="asc"><<</option>
															</select>
															<script>document.getElementById("sortord").value ='${sortord}';</script>
														</div>
														<div class="vieworder_box_80_40">
															<a>状态</a>
														</div>
														<div class="vieworder_box_80_40"></div>
													</div>

													<div class="vieworder_row_top">
														<div class="vieworder_box_30_40">
															<input type="checkbox" id="selall" name="selall" onclick="selectAll(this)" />
														</div>
														<div class="vieworder_box_50_40">
															<input name="selector.id" type="text" id="selector.id" value="${selector.id}" size="5" style="width: 40px" />
														</div>
														<div class="vieworder_box_250_40">
															<input name="selector.title" type="text" id="selector.title" value="${selector.title}" />
														</div>
														<div class="vieworder_box_80_40">
															<select name="selector.channel.id" id="selector.channel.id">
																<c:forEach var="channel" items="${channels}">
																	<option value="${channel.id}">${channel.name}</option>
																</c:forEach>
															</select>
															<script>document.getElementById("selector.channel.id").value ='${selector.channel.id>1?selector.channel.id:1}';</script>
														</div>
														<div class="vieworder_box_80_40">
															<input name="selector.releaseDate" type="text" id="selector.releaseDate" value="${selector.releaseDate}" size="5" />
														</div>
														<div class="vieworder_box_80_40">
															<input name="selector.user.username" type="text" id="selector.user.username" value="${selector.user.username}" size="5" />
														</div>
														<div class="vieworder_box_80_40">
															<select name="selector.recommendLevel" id="selector.recommendLevel">
																<option value="">全部</option>
																<option value="0">0</option>
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
															</select>
															<script>document.getElementById("selector.recommendLevel").value ='${selector.recommendLevel}';</script>
														</div>
														<div class="vieworder_box_110_40">
															<select name="sortType" id="sortType">
																<option value="id">ID</option>
																<!--默认ID -->
																<option value="recommendLevel">推荐级别</option>
																<option value="releaseDate">发布时间</option>
																<option value="checkDate">审核时间</option>
																<option value="disableDate">禁用时间</option>
																<option value="commentCount">评论数量</option>
																<option value="visitTotal">访问数量</option>
															</select>
															<script>document.getElementById("sortType").value ='${sortType}';</script>
														</div>
														<div class="vieworder_box_80_40">
															<select name="selector.checkState" id="selector.checkState">
																<option value="">全部</option>
																<option value="draft">-草稿箱</option>
																<option value="noCheck">-待审核</option>
																<option value="pass">-已审核</option>
																<option value="noPass">-未通过</option>
																<option value="recycle">-回收站</option>
															</select>
															<script>document.getElementById("selector.checkState").value ='${selector.checkState}';</script>
														</div>
														<div class="vieworder_box_80_40">
															<input type="submit" style="margin: -2px 0 0 0;" class="search-button" name="button2" id="button2" value=" 查 询 " />
														</div>

													</div>

													<c:forEach var="entity" items="${pageView.records}" varStatus="status">

														<div class="vieworder_row item">
															<div class="vieworder_box_30_40">
																<input type='checkbox' name='ids' value="${entity.id}" />
															</div>
															<div class="vieworder_box_50_40">${entity.id}</div>
															<div class="vieworder_box_250_40">
																<a href="../../article?id=${entity.id}" target="_blank"> <c:out value="${entity.title}" /></a>
															</div>
															<div class="vieworder_box_80_40">
																<a href="../../channel?id=${entity.channel.id}" target="_blank"><c:out value="${entity.channel.name}" /></a>
															</div>
															<div class="vieworder_box_80_40">
																<c:out value="${entity.releaseDate}" />
															</div>
															<div class="vieworder_box_80_40">
																<c:out value="${entity.user.username}" />
															</div>
															<div class="vieworder_box_80_40">
																<c:out value="${entity.recommendLevel}" />
															</div>
															<div class="vieworder_box_110_40">
																<c:if test="${sortType=='id'}">${entity.id}</c:if>
																<c:if test="${sortType=='recommendLevel'}">${entity.recommendLevel}</c:if>
																<c:if test="${sortType=='releaseDate'}">${entity.releaseDate}</c:if>
																<c:if test="${sortType=='checkDate'}">${entity.checkDate}</c:if>
																<c:if test="${sortType=='disableDate'}">${entity.disableDate}</c:if>
																<c:if test="${sortType=='commentCount'}">${entity.commentCount}</c:if>
																<c:if test="${sortType=='visitTotal'}">${entity.visitTotal}</c:if>
															</div>
															<div class="vieworder_box_80_40">
																<c:if test="${entity.checkState=='pass'}">
																	<img src="../../images/yes.gif" title="已审核" />
																</c:if>
																<c:if test="${entity.checkState=='draft'}">
																	<img src="../../images/pic17.gif" title="草稿箱" />
																</c:if>
																<c:if test="${entity.checkState=='noCheck'}">
																	<img src="../../images/noCheck.gif" title="待审核" />
																</c:if>
																<c:if test="${entity.checkState=='noPass'}">
																	<img src="../../images/no.gif" title="未通过" />
																</c:if>
																<c:if test="${entity.checkState=='recycle'}">
																	<img src="../../images/recycle.gif" title="回收站" />
																</c:if>
															</div>
															<div class="vieworder_box_70_40">
																<input type="button" class="search-button" onclick="editSingle('${entity.id}')" value=" 修 改 " />
															</div>
															<div class="vieworder_box_70_40">
																<input type="button" class="search-button" onclick="delSingle(${entity.id},'${entity.checkState}')" value=" 删 除 " />
															</div>

														</div>
													</c:forEach>



													<div class="vieworder_row_top" style="padding: 0px; margin: 0px;">
														<%@ include file="../util/paging.jsp"%>
													</div>

												</div>
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
