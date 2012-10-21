<%@ page pageEncoding="utf-8"%>
<script>
alert("操作成功!");
location.href="list?selector.id=${selector.id}&selector.title=${selector.title}&selector.channel.id=${selector.channel.id}&sortType=${sortType}&sortord=${sortord}&selector.releaseDate=${selector.releaseDate}&selector.user.username=${selector.user.username}&selector.recommendLevel=${selector.recommendLevel}&selector.checkState=${selector.checkState}&pageView.maxresult=${pageView.maxresult}&pageView.currentpage=${pageView.currentpage}";
</script>
<%
//	request.getRequestDispatcher("list.jsp").forward(request,response);
%>
