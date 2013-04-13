<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.util.*" %>
<%
	int year = (request.getParameter("year")==null)?(-1):
			Integer.parseInt(request.getParameter("year"));
	int month = (request.getParameter("month")==null)?(-1):
			(Integer.parseInt(request.getParameter("month"))-1);	
	int day = (request.getParameter("day")==null)?(-1):
			Integer.parseInt(request.getParameter("day"));
				
	Calendar cal = Calendar.getInstance();
	year = (year==-1)?cal.get(Calendar.YEAR):year;
	month = (month<0||month>11)?cal.get(Calendar.MONTH):month;
	day = (day<0||day>31)?cal.get(Calendar.DATE):day;
	//out.println("year:"+year+",month:"+month+",day:"+day);
%>

<style>
	table { font-family:Arial,Helvetica,sans-serif; font-size:9pt; }
	input { font-size:9pt; }
	.td_t { font-size:9pt; text-align:center; background-color:gray; color:white; }
	.td_d { font-size:9pt; cursor:hand; text-align:center; background-color:white; }
</style>
<html>
<head><title>选择日期</title></head>
<script language="javascript">
function change() {
	updateDate(document.getElementById("year").value,document.getElementById("month").value,<%=day%>);
}
	
function updateDate(year,month,theDay){
	//alert("month:"+month);
	calTable = document.getElementById("caltab");
	for(i=1;i<calTable.rows.length;i++) {
		for(j=0;j<7;j++) {
			calTable.rows(i).cells(j).innerHTML = "";
			calTable.rows(i).cells(j).style.background="white";
			calTable.rows(i).cells(j).style.color="black";
		}
	}
	beginDate = new Date(year,month,1);
	beginWeek = beginDate.getDay();
	day = 1;
	j=beginWeek;
	i = 1;
	while(true) {
		for(j==beginWeek;j<7;j++) {
			today = new Date(year,month,day);
			if((today.getMonth()>month)||(today.getMonth()==0&&month>0)) break;
			calTable.rows(i).cells(j).innerHTML = day;
			if(day==theDay) {
				calTable.rows(i).cells(j).style.background="#DCDCDC";
				calTable.rows(i).cells(j).style.color="red";
			}
			//else calTable.rows(i).cells(j).style=r;
			++day;
		}
		j=0;		
		beginWeek=0;
		i++;
		today = new Date(year,month,day);
		//alert("today:"+today.getMonth());
		if((today.getMonth()>month)||(today.getMonth()==0&&month>0)){
		 	break;
		}

	}
	//alert("ff");
	return true;
}
function selDate(obj) {
	if(obj.innerText=="") return false;
	result = document.getElementById("year").value+"-"+(parseInt(document.getElementById("month").value)+1)+"-"+obj.innerText;
	window.returnValue = result;
	window.close();
}
function changeYear(){
	if(event.keyCode==13) {
		change();
	}
}
function addYear() {
	document.getElementById("year").value = 1+parseInt(document.getElementById("year").value);
	change();
}

function minusYear() {
	document.getElementById("year").value = parseInt(document.getElementById("year").value)-1;
	change();
}

</script>

<body topmargin="10" leftmargin="5" scroll="no">
<table cellspacing=0 cellpadding=0 width="100%" height="15" align="center">
<tr>
	<td  rowspan="2" >
		<select name="month" id="month" onChange="change();" >
			<option value="0">一月
			<option value="1">二月
			<option value="2">三月
			<option value="3">四月
			<option value="4">五月
			<option value="5">六月
			<option value="6">七月
			<option value="7">八月
			<option value="8">九月
			<option value="9">十月
			<option value="10">十一月
			<option value="11">十二月
		</select>
	</td>
	
	<td rowspan=2 align="right">
		<input type="text" name="year" maxlength="4" size=6 value="<%=year%>" onKeyDown="changeYear()" onChange="change()">
	</td>
	<td align="left" valign="bottom">
		<img src="arrow_up.gif" style="cursor:hand" alt="上一年" onClick="addYear()"/>
	</td>
</tr>
<tr>
	<td align="left" valign="top"  >
		<img src="arrow_down.gif" style="cursor:hand" alt="下一年" onClick="minusYear()"/>
	</td>
</tr>
</table>

<table cellspacing=0 cellpadding=0 width="100%" id="caltab" name="caltab" height="150" >
<tr class="td_t">
	<td>日 </td>
	<td>一 </td>
	<td>二 </td>
	<td>三 </td>
	<td>四 </td>
	<td>五 </td>
	<td>六 </td>
</tr>
<tr class="td_d">
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
</tr>
<tr class="td_d">
	<td  onclick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
</tr>
<tr class="td_d">
	<td  onclick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
</tr>
<tr class="td_d">
	<td  onclick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
</tr>
<tr class="td_d">
	<td  onclick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
</tr>	
<tr class="td_d">
	<td  onclick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
	<td onClick="selDate(this)"></td>
</tr>
</table>

<!--/form-->
</body>
</html>
<script language="javascript">
//alert("ff999");
var  month = document.getElementById("month");
month.selectedIndex = <%=month%>;
updateDate(<%=year%>,<%=month%>,<%=day%>);
</script>