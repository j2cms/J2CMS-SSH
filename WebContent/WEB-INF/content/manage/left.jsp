<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="org.j2cms.model.channel.Channel" errorPage=""%>
<%@ include file="../util/taglib.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>

.adminleftmenu{
	float:left;
color:#19AADA;
background: #ffffff ;
height:32px;
width:180px;
margin:0px;
-moz-border-radius:0 4px 4px 0;
-webkit-border-radius:0 4px 4px 0;
border-radius:0 4px 4px 0;
box-shadow: 0 4px 15px rgba(0,0,0,0.25);
-moz-box-shadow: 0 4px 15px rgba(0,0,0,0.25);
-webkit-box-shadow: 0 4px 15px rgba(0,0,0,0.25);
border: 1px solid #CDCED0;
font-size: 15px;
padding: 8px 0 0 65px;
font-weight:bold;
cursor:pointer;
}

.adminleftmenu:hover{
text-decoration:underline;
}

.adminleftsubmenu{
	float:left;
display:none;
color:#19AADA;
font-size: 12px;
font-weight:bold;
width:180px;
cursor:pointer;
margin:0px;
list-style: none;
padding: 0;
}

.adminleftsubmenu li{
background: #EEFFFF;
height:25px;
width:175px;
padding: 8px 0 0 70px;
border-top:1px #e4e4e4 dashed;
margin:0px;
float:left;
}

.adminleftsubmenu li:hover{
background:#CAE1FF; /** #CAE1FF;*/
font-size: 12px;
text-decoration:underline;
}

ul {
padding: 0;
margin: 0;
list-style-type: none;
}
body {
background-color: #F3F3F3;
font-family:"微软雅黑";
}
</style>
<script>
	function showdrop(id) {
		for(var j=1;j<=4;j++){
			var a=document.getElementById("ul"+j);
			if(a.id==id){
				
					a.style.display="inline";
			}
			else
				a.style.display="none";
		}
		
	}
	function hidedrop(drop) {
		var drop_div = document.getElementById(drop);
		drop_div.style.display = "none";
	}

	 function setlis(tid,href){
		for(var j=1;j<=4;j++){
			var a=document.getElementById("ul"+j).getElementsByTagName("li");
			
			for(var i=0;i<a.length;i++)
			{
	    		if(a[i].id==tid){
				//a[i].style.background="#19BBEB";
				a[i].style.color="#00688B";
				//a[i].getElementsByTagName("a")[0].style.color="#00688B";
				
				}	
				else{
					//a[i].style.background="#EEFFFF";
					//a[i].getElementsByTagName("a")[0].style.color="#19AADA";
					a[i].style.color="#19AADA";
				  }
			}
		}
		parent.frames.main.location.href=href;
	}
	 
	 function setli(tid){
			for(var j=1;j<=4;j++){
				var a=document.getElementById("ul"+j).getElementsByTagName("li");
				
				for(var i=0;i<a.length;i++)
				{
		    		if(a[i].id==tid){
					a[i].style.color="#00688B";					
					}	
					else{
						a[i].style.color="#19AADA";
					  }
				}
			}
		}
	
	
	
</script>

</head>

<body>
	<div style="width:180px">
		<ul >
			<li>
				<div class="adminleftmenu" onclick="showdrop('ul1')">栏目内容管理</div>
				<ul id="ul1" class="adminleftsubmenu">
					<li id="li11" onclick="setlis('li11','article/add')">发布内容</li>
					<li id="li12" onclick="setlis('li12','article/list')">全部内容</li>
					<li id="li13" onclick="setlis('li13','article/list?selector.checkState=draft')">草稿箱</li>
					<li id="li14" onclick="setlis('li14','article/list?selector.checkState=noCheck')">待审核</li>
					<li id="li15" onclick="setlis('li15','article/list?selector.checkState=noPass')">未通过</li>
					<li id="li16" onclick="setlis('li16','article/list?selector.checkState=recycle')">回收站</li>
					<li id="li17" onclick="setlis('li17','article/list?selector.checkState=pass')">已审核</li>
				</ul>
			</li>
			<li>
				<div class="adminleftmenu" onclick="showdrop('ul2')">栏目分类管理</div>
				<ul id="ul2" class="adminleftsubmenu">
					<li id="li21" onclick="setlis('li21','channel/add')">增加栏目</li>
					<li id="li22" onclick="setlis('li22','channel/list')">全部栏目</li>
					<li id="li23" onclick="setlis('li23','channel/list?display=true')">导航栏</li>
					<li id="li24" onclick="setlis('li24','channel/list?displayInIndex=true')">首页中</li>
					<li id="li25" onclick="setlis('li25','channel/list?single=true')">单页面</li>
				</ul>
			</li>
			<li>
				<div class="adminleftmenu" onclick="showdrop('ul3')">注册用户管理</div>
				<ul id="ul3" class="adminleftsubmenu">
					<li id="li31" onclick="setlis('li31','user/add')">增加用户</li>
					<li id="li32" onclick="setlis('li32','user/list')">用户管理</li>
					<li id="li33" onclick="setlis('li33','group/list')">用户组管理</li>
				</ul>
			</li>
			<li>
				<div class="adminleftmenu" onclick="showdrop('ul4')">网站常规管理</div>
				<ul id="ul4" class="adminleftsubmenu">
					<li id="li41" onclick="setlis('li41','config/edit')">基本设置</li>
					<li id="li42" onclick="setlis('li42','flash/list')">图片广告</li>
					<li id="li43" onclick="setlis('li43','config/makeIndexHtml')">生成首页</li>
				</ul>
			</li>
		</ul>
	</div>


</body>
</html>
