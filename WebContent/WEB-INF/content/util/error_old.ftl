 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="${C.ctp}/template/j2cms/css/common.css" rel="stylesheet" type="text/css" />
<link href="${C.ctp}/template/j2cms/css/Search.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="${C.ctp}/template/j2cms/js/setHeight.js" type="text/javascript"></script>
<title><@s.text name="errorMessage"/>-${C.name}</title>
</head>
<body>
<div id="container">  
	<#include "head.ftl" encoding="UTF-8">
<div id="main">
    <div id="left" class="left">
		<#include "left.ftl" encoding="UTF-8">
    </div><!--left end-->
        <div id="main1" class="main1">
       		 <div id="ShowNews">
                <div id="Pos">&nbsp;<a href=""><@s.text name="index"/></a>
	                <img src="${C.ctp}/template/j2cms/images/pos.gif" border="0"/>
	                	<@s.text name="errorMessage"/>
                </div>
                <div id="Content">
                	<div id="NewsContent"><img src="${C.ctp}/template/j2cms/images/error.jpg"/></div>
                </div>
             </div>
        </div><!--main1 end-->
        <div id="copyright">
			<#include "foot.ftl" encoding="UTF-8">
		</div>
</div><!--main end-->

</div><!--container end-->


</body>
</html>