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
<input name="id" type="hidden" id="id" value="0"/>

<div id="main_frame">
<div id="main_column">

<div>
	<div class="mainbox-title-container">
	    <div class="mainbox-title">栏目管理</div>
	</div>
	
    <div class="mainbox-body">
    <table cellpadding="0" cellspacing="0" border="0" class="table-fixed">
    <tbody>
    <tr>
    <td>
      <div class="statistics-box-order">
        <div class="statistics-body-order">
        
            <div class="vieworder_row_top" style="padding:0px;margin:0px;">
              <div class="vieworder_box_60_40">
				<input type="button" class="search-button" onclick="add()" value=" 增 加 " />
              </div>
              
              <div class="vieworder_box_60_40" >
                <input type="button" class="search-button"  onclick="edit()"value=" 修 改 " />&nbsp;&nbsp; 
              </div>
                
              <div class="vieworder_box_60_40">
                <input type="button" class="search-button"  onclick="del()" value=" 删 除 " /> 
              </div>
			
              <div class="vieworder_box_60_40">
                <input class="search-button"   value="生成HTML" type="button" onclick="html()"  />
              </div>
              
            </div>
      <div class="table_border">

         <div class="vieworder_row_top">
              <div class="vieworder_box_30_40"><input type="checkbox" id="selall" name="selall" onclick="selectAll(this)" /></div>
              <div class="vieworder_box_50_40">ID</div>
              <div class="vieworder_box_150_40">栏目名</div>
              <div class="vieworder_box_80_40">单页面</div>
              <div class="vieworder_box_80_40">导航栏</div>
              <div class="vieworder_box_80_40">首页中</div>        
              <div class="vieworder_box_80_40">上级</div>
           	  <div class="vieworder_box_80_40">点击量</div>
             <div class="vieworder_box_80_40"><a>状态</a></div>
             <div class="vieworder_box_80_40"></div>
         </div>
   
			
       <c:forEach var="entity" items="${pageView.records}" varStatus="status">     
           
         <div  class="vieworder_row item">
			  <div class="vieworder_box_30_40"><input type='checkbox' name='ids' value="${entity.id}" /></div>
              <div class="vieworder_box_50_40">${entity.id}</div>
              <div class="vieworder_box_150_40"><a href="../../channel?id=${entity.id}" target="_blank">${entity.name}</a></div>
              <div class="vieworder_box_80_40"><c:if test="${entity.single==true}"><img src="../../images/yes.gif"/></c:if></div>
              <div class="vieworder_box_80_40"><c:if test="${entity.display==true}"><img src="../../images/yes.gif"/></c:if></div>
              <div class="vieworder_box_80_40"><c:if test="${entity.displayInIndex==true}"><img src="../../images/yes.gif"/></c:if></div>   
	          <div class="vieworder_box_80_40">${entity.father.name}</div>
	          <div class="vieworder_box_80_40">${entity.visitTotal}</div>
	          <div class="vieworder_box_80_40">
	           		<c:if test="${entity.checkState=='pass'}">
					<img src="../../images/yes.gif" title="已审核" />
				</c:if> <c:if test="${entity.checkState=='draft'}">
					<img src="../../images/pic17.gif" title="草稿箱" />
				</c:if> <c:if test="${entity.checkState=='noCheck'}">
					<img src="../../images/noCheck.gif" title="待审核" />
				</c:if> <c:if test="${entity.checkState=='noPass'}">
					<img src="../../images/no.gif" title="未通过" />
				</c:if> <c:if test="${entity.checkState=='recycle'}">
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
	
	
	
			<div class="vieworder_row_top" style="padding:0px;margin:0px;">
			<%@ include file="../util/paging.jsp"%>
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
</body>
</html>
