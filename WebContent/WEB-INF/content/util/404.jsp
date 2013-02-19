<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link href="${C.ctp}/template/j2cms/css/common.css" rel="stylesheet" type="text/css" />
<link href="${C.ctp}/template/j2cms/css/Search.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="${C.ctp}/template/j2cms/js/setHeight.js" type="text/javascript"></script>
<title>${empty message?"404":message}-${empty (C.name)?"J2CMS":C.name}</title>
</head>
<body>
<div id="container">  
	<jsp:include page="/head.html" />
<div id="main">
    <div id="left" class="left">
    	<jsp:include page="/left.html" />
    </div><!--left end-->
        <div id="main1" class="main1">
       		 <div id="ShowNews">
                <div id="Pos">&nbsp;<a href="/">首页</a>
	                <img src="${C.ctp}/template/j2cms/images/pos.gif" border="0"/>
	                	${empty message?"404":message}
                </div>
                <div id="Content">
                	<div id="NewsContent"><img src="${C.ctp}/template/j2cms/images/error.jpg"/></div>
                </div>
             </div>
        </div><!--main1 end-->
        <div id="copyright">
        	<jsp:include page="/foot.html" flush="true" />
		</div>
</div><!--main end-->

</div><!--container end-->


</body>
</html>
