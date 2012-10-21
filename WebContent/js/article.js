var sFromUrl = "http://";


// 初始值
function InitDocument(){
	d_fromurl.value = sFromUrl;
	RadioClick('file');
}

// 图片来源单选点击事件
function RadioClick(what){
	if (what=="url"){
		d_checkfromfile.checked=false;
		d_fromurl.disabled=false;
		d_checkfromurl.checked=true;
		d_file.myform.uploadfile.disabled=true;
	}else{
		d_checkfromurl.checked=false;
		d_file.myform.uploadfile.disabled=false;
		d_checkfromfile.checked=true;
		d_fromurl.disabled=true;
	}
}


// 上传错误
function UploadError(sErrDesc){
	AbleItems();
	RadioClick('file');
	divProcessing.style.display="none";
	try {
		BaseAlert(d_file.myform.uploadfile,sErrDesc);
	}
	catch(e){}
}


// 文件上传完成时执行,带入上传文件名
function UploadSaved(sFileName){
	d_fromurl.value=GetHttpUrl("UploadFile/"+sFileName);
	ReturnValue();
}

// 本窗口返回值
function ReturnValue(){
	sFromUrl = d_fromurl.value;
	window.returnValue = sFromUrl;
	window.close();
}


// 点确定时执行
function ok(){
	// 上传文件判断
	if (d_checkfromurl.checked){
		// 返回值
		ReturnValue();
	}
	else
	{
		if (!d_file.CheckUploadForm()) return false;
		// 使各输入框无效
		DisableItems();
		// 显示正在上传图片
		divProcessing.style.display="";
		// 上传表单提交
		d_file.myform.submit();
	}
}

// 使所有输入框无效
function DisableItems(){
	d_checkfromfile.disabled=true;
	d_checkfromurl.disabled=true;
	d_fromurl.disabled=true;
	Ok.disabled=true;
}

// 使所有输入框有效
function AbleItems(){
	d_checkfromfile.disabled=false;
	d_checkfromurl.disabled=false;
	d_fromurl.disabled=false;
	Ok.disabled=false;
}


// 显示无模式对话框
function ShowDialog(url, width, height) {
	var arr = window.showModalDialog(url,window,"dialogWidth:" + width + "px;dialogHeight:" + height + "px;help:no;scroll:no;status:no");
	return arr;
}


// 是否显示上传图片表单
function ShowPicture(bYes) {
	if(bYes)
	{	
		p.style.display="";
	}
	else p.style.display="none";
}

//添加文章中上传图片事件
function getTitleImg()
{
	var sPicture = ShowDialog('../util/img.htm',350,140)
	if(sPicture!=null)
	{
		document.addForm.NewsPicture.value = sPicture;
	}
}


// 是否显示上传头条图片表单
function ShowcontentImg(bYes) {
	if(bYes)
	{	
		p1.style.display="";
	}
	else p1.style.display="none";
}

//添加文章中上传头条文章图片事件
function getContentImg()
{
	var sPicture = ShowDialog('../util/img.htm',350,140)
	if(sPicture!=null)
	{
		document.addForm.contentImg.value = sPicture;
	}
}

//添加文章中上传头条文章图片事件
function fastNews(b)
{
	var NewsID = document.ListNews.NewsID.value;
	if(b) location.href="DelNews.jsp?NewsID="+NewsID;
	else location.href="ModifyNews.jsp?NewsID="+NewsID;
}

