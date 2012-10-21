<%@ page pageEncoding="utf-8"%>
<table width='100%' class="tex004">
	<tr>
    <td  align='left' >共${pageView.totalrecord}条&nbsp;&nbsp;每页
        <input name="pageView.maxresult" type="text" id="pageView.maxresult" value="${pageView.maxresult}" size="2"/>
        条
      <input name="pageView.currentpage" type="hidden" id="pageView.currentpage" value="${pageView.currentpage}"/>        &nbsp;&nbsp;当前&nbsp;${pageView.currentpage}/${pageView.totalpage}页</td>
<td align='left'>
		<c:if test="${pageView.currentpage>1}">
        <input type="button" name="button" id="button" value=" 首&nbsp;&nbsp;页 " onClick="pageQuery(1)"/>
        <input type="button" name="button" id="button" value=" 上一页 " onClick="pageQuery(${pageView.currentpage-1})"/>
    	</c:if>
        <c:if test="${pageView.currentpage==1}">
        <input type="button" name="button" id="button" value=" 首&nbsp;&nbsp;页 " disabled/>
        <input type="button" name="button" id="button" value=" 上一页 " disabled />
    	</c:if>
    	<c:if test="${pageView.currentpage<pageView.totalpage}">
        <input type="button" name="button" id="button" value=" 下一页 " onClick="pageQuery(${pageView.currentpage+1})"/>
     <input type="button" name="button" id="button" value=" 尾&nbsp;&nbsp;页 " onClick="pageQuery(${pageView.totalpage})"/>
        </c:if>
        <c:if test="${pageView.currentpage==pageView.totalpage}">
        <input type="button" name="button" id="button" value=" 下一页 " disabled/>
     <input type="button" name="button" id="button" value=" 尾&nbsp;&nbsp;页 " disabled/>
        </c:if>
</td>       
  </tr>
</table>