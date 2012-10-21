// JavaScript Document

//按Ctrl+Enter)提交表单
function BigPressKey(eventobject)
{
	if(event.ctrlKey && window.event.keyCode==13)
	{
		if(CheckBigClass())  this.document.BigClass.submit();
	}
}

//小类文章中按(Ctrl+Enter)提交表单
function SPressKey(eventobject)
{
	if(event.ctrlKey && window.event.keyCode==13)
	{
		if(CheckSClass())  this.document.SmallClass.submit();
	}
}

//小类文章中按(Ctrl+Enter)提交表单
function SpPressKey(eventobject)
{
	if(event.ctrlKey && window.event.keyCode==13)
	{
		if(CheckSpecial())  this.document.Special.submit();
	}
}

//下拉分页
function MM_jumpMenu(targ,selObj,restore){ 		//v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

// 显示无模式对话框
function ShowDialog(url, width, height) {
	var arr = window.showModalDialog(url, window, "dialogWidth:" + width + "px;dialogHeight:" + height + "px;help:no;scroll:no;status:no");
	ShowDialog = arr;
}

/*****************************************************  
 *  函数名：DateCheck()
 *  作  用：检查字符中是否在指定的大小范围内和是否含有非法字符
 *	参  数：date: 要检查的字符；
 *          minum:  字符最小的长度
 *  		maxnum: 字符最大的长度
 *  返回值：True:   数据不在指定范围内或含有非法字符
 *			False:  数据在指定范围内且不含有非法字符
 ******************************************************
*/
function DateCheck(date,minnum,maxnum)
{
	if (date.length < minnum || date.length > maxnum ){
		window.alert("输入数据的长度不能少于 " + minnum + " 位并且不能大于 " + maxnum + " 位!");
		return true;
	}

	 a = date.indexOf("'");
	 b = date.indexOf("|");
	 c = date.indexOf("\"");
	 
	 if (a != -1||b != -1 ||c != -1){
	   window.alert("您的输入含有特殊字符，请重新输入！");
	   return true;
	  	}
	return false;
}


/*****************************************************  
 *  函数名：	IsNum()
 *  作  用：检查字符是否是纯数字
 *	参  数：str: 要检查的字符；  
 *  返回值：True:   是数字
 *			False:  不是纯数字
 ******************************************************
*/
function IsNum(str)
{
	return !/\D/.test(str)
}


/*****************************************************  
 *  函数名：	IsStr()
 *  作  用：检查字符是否是字符
 *	参  数：str: 要检查的字符  
 *  返回值：True:   是字符
 *			False:  不是纯字符
 ******************************************************
*/
function IsStr(str)
{      
   if (/[^\x00-\xff]/g.test(str))
	{
		return false;
	}
   else 
	{
		return true;
	}
}


/*****************************************************  
 *  函数名：IsEmail()
 *  作  用：检查Email地址是否合法
 *	参  数：date: 要检查的Email地址  
 *  返回值：True: Email 地址合法
 *          False:Email 地址不合法
 *****************************************************
*/
function IsEmail(vEMail)
{
	var regInvalid=/(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/;
	var regValid=/^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/;
	return (!regInvalid.test(vEMail)&&regValid.test(vEMail));
}





/*****************************************************  
 *  函数名：CheckSClass()
 *  作  用：检查小类信息
 *	参  数：无 
 *  返回值：True: 验证通过
 *          False: 验证没有通过
 ******************************************************
*/
function CheckSClass(){
    var CheckSClass = false;
	var bigClassID = document.SmallClass.bigClassID.value;
	if (bigClassID=="")
	{
	   alert("请选择大类!");
	   document.SmallClass.bigClassID.focus();
	   return false;
	 }
	
	
	var SClassName = document.SmallClass.SClassName.value;
	if (SClassName=="")
	{
	   alert("请输入小类标题!");
	   document.SmallClass.SClassName.focus();
	   return false;
	 }
	
	if(DateCheck(SClassName,2,30))
	{
		document.SmallClass.SClassName.focus();
		document.SmallClass.SClassName.value = "";
		return false;
	}
	
	/*
	var SClassInfo = document.SmallClass.SClassInfo.value;
	if (SClassInfo=="")
	{
	   alert("请输入小类的说明!");
	   document.SmallClass.SClassInfo.focus();
	   return false;
	 }

	
	if(DateCheck(SClassInfo,1,200))
	{
		document.SmallClass.SClassInfo.focus();
		return false;
	}
	*/
  	return true;
}





/*****************************************************  
 *  函数名：checkArticle()
 *  作  用：检查文章表单信息
 *	参  数：无 
 *  返回值：True: 验证通过
 *          False: 验证没有通过
 ******************************************************
*/
function checkArticle(){
    var CheckNews = false;
	var channelID = document.addForm.channelID.value;
	if (channelID=="")
	{
	   alert("请选择文章栏目!");
	   document.addForm.channelID.focus();
	   return false;
	 }

	var title = document.addForm.title.value;
	if (title=="")
	{
	   alert("请输入文章标题!");
	   document.addForm.title.focus();
	   return false;
	 }

	if(DateCheck(title,2,60))
	{
		document.addForm.title.focus();
		document.addForm.title.value = "";
		return false;
	}
	
	
	var author = document.addForm.author.value;
	if (author=="")
	{
	   alert("请输入文章作者!");
	   document.addForm.author.focus();
	   return false;
	 }

	if(DateCheck(author,1,20))
	{
		document.addForm.author.focus();
		document.addForm.author.value = "";
		return false;
	}
	
	
	var origin = document.addForm.origin.value;
	if (origin=="")
	{
	   alert("请输入文章出处!");
	   document.addForm.origin.focus();
	   return false;
	 }

	if(DateCheck(origin,2,60))
	{
		document.addForm.origin.focus();
		document.addForm.origin.value = "";
		return false;
	}
	
	
	//getHTML()为eWebEditor自带的接口函数，功能为取编辑区的内容
	/*换编辑器后用不到了 fck
	if (DreamEditor.getHTML()==""){
		alert("文章内容不能为空！");
		return false;
	}
	
	*/

	// 表单有效性检测完后，自动上传远程文件
	// 函数：remoteUpload(strEventUploadAfter)
	// 参数：strEventUploadAfter ; 上传完后，触发的函数名，如果上传完后不需动作可不填参数
	//DreamEditor.remoteUpload();
	//document.addForm.NewsContent.value = DreamEditor.getHTML();
	return true;
}



/*****************************************************  
 *  函数名：CheckUser()
 *  作  用：检查用户表单信息
 *	参  数：无 
 *  返回值：True: 验证通过
 *          False: 验证没有通过
 ******************************************************
*/
function CheckUser(){
    var CheckUser = false;
	var AdminName = document.User.AdminName.value;
	if (AdminName=="")
	{
	   alert("用户名不能为空!");
	   document.User.AdminName.focus();
	   return false;
	 }

	if(DateCheck(AdminName,2,16))
	{
		document.User.AdminName.focus();
		document.User.AdminName.value = "";
		return false;
	}
	
	var AdminPwd = document.User.AdminPwd.value;
	if (AdminPwd=="")
	{
	   alert("请输入管理员密码!");
	   document.User.AdminPwd.focus();
	   return false;
	 }

	if(DateCheck(AdminPwd,4,16))
	{
		document.User.AdminPwd.focus();
		document.User.AdminPwd.value = "";
		return false;
	}
	
	var AdminPwd2 = document.User.AdminPwd2.value;
	if (AdminPwd2=="")
	{
	   alert("请再输入一次新密码!");
	   document.User.AdminPwd2.focus();
	   return false;
	 }
	
	if(DateCheck(AdminPwd2,4,16))
	{
		document.User.AdminPwd.focus();
		document.User.AdminPwd.value = "";
		return false;
	}
	
	if (AdminPwd != AdminPwd2) 
	{
		alert("你两次输入的密码不一致，请重输入！");
		document.User.AdminPwd.focus();	
		document.User.AdminPwd.value = "";
		document.User.AdminPwd2.value = "";
		return false;
	}
	
	var UserName = document.User.UserName.value;
	if (UserName=="")
	{
	   alert("真实姓名不能为空!");
	   document.User.UserName.focus();
	   return false;
	 }

	if(DateCheck(UserName,2,16))
	{
		document.User.UserName.focus();
		document.User.UserName.value = "";
		return false;
	}
	
	var UserEmail = document.User.UserEmail.value;
	if (UserEmail=="")
	{
	   alert("请输入电子邮件!");
	   document.User.UserEmail.focus();
	   return false;
	 }
	
		
	if(!IsEmail(UserEmail ))
	{
		alert("请输入正确的电子邮箱！");
		document.User.UserEmail .focus();
		document.User.UserEmail .value = "";
		return false;
	}
	
	var UserQQ = document.User.UserQQ.value;
	if (UserQQ != "") 
	{
		if(!IsNum(UserQQ))
		{
			alert("您输入的QQ不是纯数字,如果没有QQ请不要填写!");
			document.User.UserQQ.focus();
			document.User.UserQQ.value = "";
			return false;
		}
		if(DateCheck(UserQQ,4,10))
		{
			document.User.UserQQ.focus();
			document.User.UserQQ.value = "";
			return false;
		}
	}
}


/*****************************************************  
 *  函数名：CheckEditUser()
 *  作  用：检查用户表单信息
 *	参  数：无 
 *  返回值：True: 验证通过
 *          False: 验证没有通过
 ******************************************************
*/
function CheckEditUser(){
    var CheckEditUser = false;
	var AdminPwd = document.User.AdminPwd.value;
	if (AdminPwd!="")
	{
		if(DateCheck(AdminPwd,4,16))
		{
			document.User.AdminPwd.focus();
			document.User.AdminPwd.value = "";
			return false;
		}
		
		var AdminPwd2 = document.User.AdminPwd2.value;
		if (AdminPwd2=="")
		{
		   alert("请再输入一次新密码!");
		   document.User.AdminPwd2.focus();
		   return false;
		 }
		
		if(DateCheck(AdminPwd2,4,16))
		{
			document.User.AdminPwd.focus();
			document.User.AdminPwd.value = "";
			return false;
		}
		
		if (AdminPwd != AdminPwd2) 
		{
			alert("你两次输入的密码不一致，请重输入！");
			document.User.AdminPwd.focus();	
			document.User.AdminPwd.value = "";
			document.User.AdminPwd2.value = "";
			return false;
		}
		
	}


	
	var UserName = document.User.UserName.value;
	if (UserName=="")
	{
	   alert("真实姓名不能为空!");
	   document.User.UserName.focus();
	   return false;
	 }

	if(DateCheck(UserName,2,16))
	{
		document.User.UserName.focus();
		document.User.UserName.value = "";
		return false;
	}
	
	var UserEmail = document.User.UserEmail.value;
	if (UserEmail=="")
	{
	   alert("请输入电子邮件!");
	   document.User.UserEmail.focus();
	   return false;
	 }
	
		
	if(!IsEmail(UserEmail ))
	{
		alert("请输入正确的电子邮箱！");
		document.User.UserEmail .focus();
		document.User.UserEmail .value = "";
		return false;
	}
	
	var UserQQ = document.User.UserQQ.value;
	if (UserQQ != "") 
	{
		if(!IsNum(UserQQ))
		{
			alert("您输入的QQ不是纯数字,如果没有QQ请不要填写!");
			document.User.UserQQ.focus();
			document.User.UserQQ.value = "";
			return false;
		}
		if(DateCheck(UserQQ,4,10))
		{
			document.User.UserQQ.focus();
			document.User.UserQQ.value = "";
			return false;
		}
	}
}



/*****************************************************  
 *  函数名：CheckPerson()
 *  作  用：检查用户表单信息
 *	参  数：无 
 *  返回值：True: 验证通过
 *          False: 验证没有通过
 ******************************************************
*/
function CheckPerson(){
    var CheckPerson = false;
	var UserName = document.User.UserName.value;
	if (UserName=="")
	{
	   alert("真实姓名不能为空!");
	   document.User.UserName.focus();
	   return false;
	 }

	if(DateCheck(UserName,2,16))
	{
		document.User.UserName.focus();
		document.User.UserName.value = "";
		return false;
	}
	
	var UserEmail = document.User.UserEmail.value;
	if (UserEmail=="")
	{
	   alert("请输入电子邮件!");
	   document.User.UserEmail.focus();
	   return false;
	 }
	
		
	if(!IsEmail(UserEmail ))
	{
		alert("请输入正确的电子邮箱！");
		document.User.UserEmail .focus();
		document.User.UserEmail .value = "";
		return false;
	}
	
	var UserQQ = document.User.UserQQ.value;
	if (UserQQ != "") 
	{
		if(!IsNum(UserQQ))
		{
			alert("您输入的QQ不是纯数字,如果没有QQ请不要填写!");
			document.User.UserQQ.focus();
			document.User.UserQQ.value = "";
			return false;
		}
		if(DateCheck(UserQQ,4,10))
		{
			document.User.UserQQ.focus();
			document.User.UserQQ.value = "";
			return false;
		}
	}
}



/*****************************************************  
 *  函数名：CheckModPwd()
 *  作  用：修改密码表单数据验证
 *	参  数：无 
 *  返回值：True: 验证通过
 *          False: 验证没有通过
 *****************************************************
*/
function CheckModPwd()
{
	var OldPwd = document.User.OldPwd.value;
	if (OldPwd == "") {
	alert("请输入你的旧密码!");
	document.User.OldPwd.focus();
		return false;
	}
	
	if(DateCheck(OldPwd,4,16)){
		document.User.OldPwd.focus();
		document.User.OldPwd.value = "";
		return false;
	}
	
	var AdminPwd = document.User.AdminPwd.value;
	if (AdminPwd == "") {
	alert("新密码不能为空！");
	document.User.AdminPwd.focus();	
		return false;
	} 
	
	if(DateCheck(AdminPwd,4,16)){
		document.User.AdminPwd.focus();
		document.User.AdminPwd.value = "";
		return false;
	}
	
	var AdminPwd2 = document.User.AdminPwd2.value; 
	if (AdminPwd2 == "") {
	alert("请确认新密码！");
	document.User.AdminPwd2.focus();		
		return false;
      }
	  
	if(DateCheck(AdminPwd2,4,16)){
		document.User.AdminPwd2.focus();
		document.User.AdminPwd2.value = "";
		return false;
	}
	 
	if (AdminPwd != AdminPwd2) {
	alert("你两次输入的密码不一致，请重输入！");
	document.User.AdminPwd.focus();	
	document.User.AdminPwd.value = "";
	document.User.AdminPwd2.value = "";
		return false;
	}
	 
  return true;
  }    
 
 
 
 

 /*****************************************************  
 *  函数名：CheckConfig()
 *  作  用：系统参数设置表单数据验证
 *	参  数：无 
 *  返回值：True: 验证通过
 *          False: 验证没有通过
 *****************************************************
*/
 function CheckConfig()
 {
	var loginCheck = false;	 
 }
