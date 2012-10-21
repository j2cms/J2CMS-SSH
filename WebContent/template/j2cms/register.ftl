<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="/template/j2cms/css/common.css" rel="stylesheet" type="text/css" />
<link href="/template/j2cms/css/Search.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="/template/j2cms/js/setHeight.js" type="text/javascript"></script>
<title>注册-${C.name}</title>
<style type="text/css">
<!--
.gg1 {
	width: 550px;
	height: 45px;
	margin-top: 7px;
	background-color: #367dc6
}

.ht {
	background-color: #BD0000;
	width: 774px;
	height: 23px
}

.foot {
	background-color: #BD0000;
	width: 774px;
	height: 8px
}

* {
	PADDING-RIGHT: 0px;
	PADDING-LEFT: 0px;
	PADDING-BOTTOM: 0px;
	MARGIN: 0px;
	PADDING-TOP: 0px
}
-->
</style>
</head>
<body>
<div id="container">  
<#include "head.ftl" encoding="UTF-8">
<div id="main">
    <table width="61%" height="400" border="0" align="center"
		cellspacing="0" style="font-weight: bold; font-size: 10pt;">
		<tr>
			<td width="79%">
				<form method="post" action="/userSave" name="addForm">
					<table width="80%" height="256" border="1"  rules="groups" frame="border" style="border-color: #99CCFF; ">
						<tr style="background-color: #edf2f7">
							<td height="25" align="right">用户名：</td>
							<td><input id="entity.username" style="height:30px; width:200px "
								name="entity.username" value="<#if entity??>${entity.username}</#if>" />
								<font color="#B10000"><#if message1??>${message1}</#if></font> 
							</td>
						</tr>
						<tr style="background-color: #edf2f7">
							<td height="25" align="right">密码：</td>
							<td><input id="entity.password" type="password"
								style="height:30px; width:200px " name="entity.password"  />
								<font color="#B10000"><#if message2??>${message2}</#if></font> 
						    </td>
						</tr>

						<tr>
							<td height="83" align="right">&nbsp;</td>
							<td><label> <input type="submit"
									style="height: 40px" name="Submit"
									value="&nbsp;&nbsp;&nbsp;注&nbsp;&nbsp;册&nbsp;&nbsp;&nbsp;" />
							</label></td>
						</tr>

					</table>
				</form>
			</td>
		</tr>
	
	</table>
	
	<div id="copyright">
			<#include "foot.ftl" encoding="UTF-8">
		</div>
</div><!--main end-->

</div><!--container end-->


</body>
</html>

