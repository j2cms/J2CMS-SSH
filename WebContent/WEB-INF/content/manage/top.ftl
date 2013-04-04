<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script language=JavaScript>
function logout(){
	if (confirm("您确定要退出控制面板吗？"))
	top.location = "${C.ctp}/user/logout";
	return false;
}
</script>

<link href="../css/new_style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
        function showdrop(drop) {
            var drop_div = document.getElementById(drop);
            drop_div.style.display = "inline";
        }
        function hidedrop(drop) {
            var drop_div = document.getElementById(drop);
            drop_div.style.display = "none";
        }
        
    </script>

</head>
<body>
<div class="header-wrap">
<div id="header">

<div id="logo">
	
</div>
<div id="top_quick_links">
	<a>${(user.username)!""}， 您好！今天是
        <script language=javascript type=text/javascript>
		<!--
				var enabled = 0; today = new Date();
				var day; var date;
				if(today.getDay()==0) day = " 星期日"
				if(today.getDay()==1) day = " 星期一"
				if(today.getDay()==2) day = " 星期二"
				if(today.getDay()==3) day = " 星期三"
				if(today.getDay()==4) day = " 星期四"
				if(today.getDay()==5) day = " 星期五"
				if(today.getDay()==6) day = " 星期六"
				date = (today.getFullYear()) + "年" + (today.getMonth() + 1 ) + "月" + today.getDate() + "日" + day +"";
				document.write(date);
		// -->
		</script>
		&nbsp;&nbsp;
		<a href="../index" title="生成首页" target="_blank" >网站首页</a>
		
		</a>
</div>

<ul id="menu">
        <!--
     
     
       
       <li>
	    <a onmouseover="showdrop('drop_order')" onmouseout="hidedrop('drop_order')">订单管理</a>
	    <div onmouseover="showdrop('drop_order')" onmouseout="hidedrop('drop_order')" id="drop_order" class="dropdown-column">
	    <div class="col">
	    <ul>
	    <li class="view_orders">
	    <a href="admin_vieworder.aspx">
	    <span>查看订单</span>
	    <span class="hint">按时间，卖家，状态查看订单</span>
	    </a></li>
	    <li class="sale_report"> 
	    <a href="admin_tj.aspx">
	    <span>销售报告</span>
	    <span class="hint">按时间段，卖家查看销售统计</span>
	    </a></li>
	    </ul>
	    </div>
	    </div>
	</li>
       -->
    
	<li class="quit"><a href="#" target="_self" onClick="logout();"><img src="../images/out.gif" alt="安全退出" width="46" height="20" border="0"></a></li>
</ul>

	</div>
</div>    
</body>
</html>