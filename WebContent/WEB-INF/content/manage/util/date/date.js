// 该Java Script文件实现一些与日期相关的函数，
// 如当前年、月、日等
// wzj整理于2004-10-9


//功能描述：获得当前日期的年份
//输    入：无
//输    出：年份 
//编写时间：2004-10-9
//作    者: wzj
function getYear() {
	return new Date().getFullYear();
}

//功能描述：获得当前日期的月份
//输    入：无
//输    出：月份 
//编写时间：2004-10-9
//作    者: wzj
function getMonth() {
	return (new Date().getMonth())+1;
}


//功能描述：获得当前日期的日
//输    入：无
//输    出：日 
//编写时间：2004-10-9
//作    者: wzj
function getDate() {
	return (new Date().getDate());
}

//功能描述：获得当前日期是星期几？
//输    入：无
//输    出：星期日 
//编写时间：2004-10-9
//作    者: wzj
function getDay() {
	return (new Date().getDay());
}

//功能描述：将一个字符串型的日期串转换为日期型
//若不是给定形式的日期串，则返回当前日期
//输    入：String
//输    出：日期 
//编写时间：2004-10-9
//作    者: wzj
function parse(str) {
	var r = str.match(/^([1-9]{1}\d{1,3})-(\d{1,2})-(\d{1,2})$/); 
    if(r==null) return new Date(); 
    return new Date(r[1], r[2]-1, r[3]); 
}

//功能描述：将日期格式化为形如2004-01-01的字符串
//          
//输    入：日期
//输    出：字符串 
//编写时间：2004-10-9
//作    者: wzj
function format(d) {
	return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
}

//功能描述：在形如2004-01-01的日期串后加days的天数，返回字符串
//          
//输    入：日期字符串,天数
//输    出：字符串 
//编写时间：2004-10-9
//作    者: wzj
function addStrDays(str,days) {
	return format(new Date(
			parse(str).getFullYear(),parse(str).getMonth(),parse(str).getDate()+days
		));
}

//功能描述：在一个日期后加days的天数，返回新的日期
//          
//输    入：日期,天数
//输    出：日期 
//编写时间：2004-10-9
//作    者: wzj
function addDays(d,days) {
	return new Date(d.getFullYear(),d.getMonth(),d.getDate()+days);
}

//功能描述：比较两个日期字符串所代表日期的前后，
//          若返回的日期差小于0,表明strBeginDate在strEndDate之前
//           =0，表明strBeginDate与strEndDate代表同一天
//           >0，表明strBeginDate在strEndDate之后
//输    入：日期字符串,日期字符串
//输    出：日期差 
//编写时间：2004-10-9
//作    者: wzj
function compareDate(strBeginDate,strEndDate) {
	return parse(strBeginDate) - parse(strEndDate);
}

//功能描述：比较两个日期字符串所代表日期的前后，
//          若strBeginDate在strEndDate之后，返回true
//输    入：日期字符串,日期字符串
//输    出：boolean 
//编写时间：2004-10-9
//作    者: wzj
function isBeginDateAfterEndDate(strBeginDate,strEndDate) {
	if(compareDate(strBeginDate,strEndDate)>0) return true;
	return false;
}


//功能描述：将日期格式化为形如2004年01月01日的字符串
//          
//输    入：日期
//输    出：字符串 
//编写时间：2004-10-9
//作    者: wzj
function getCNDate(d) {
	return d.getFullYear()+"年"+(d.getMonth()+1)+"月"+d.getDate()+"日";
}

//功能描述：获得给定年、月的天数
//          
//输    入：年、月
//输    出：天数 
//编写时间：2005-2-19
//作    者: wzj
function getMonthDays(year,month) {
	var d1 = new Date(year,month,1);
	var d2 = new Date(year,month+1,1);
	return (d2-d1)/(24*60*60);
}


//功能描述：打开一个窗口获得日期
//          
//输    入：初始化的年、月、日
//输    出：天数 
//编写时间：2005-2-19
//作    者: wzj
function selectDate(y,m,d) {
	url = "../common/date/selectDate.jsp";
	if(y!=null) url+="?year="+y;
	if(m!=null) url+="&month="+m;
	//alert(url)
	var ret = showModalDialog(url,null,"dialogHeight:225px;dialogWidth:260px;center:yes;help:no;resizable:no;scroll:yes;status:no;");
	return ret;
}