//图片文章
//轮换播放开始
var picNum=0;
function initPicSlider(d) {
	var p=document.getElementById(d);
	var dts=p.getElementsByTagName("dt");
	var t="";
	for(var i=0;i<dts.length;i++) {
		t+="<span id='"+i+"' onclick='setTargetPic(this.id)'>"+(i+1)+"</span>";
	}
	p.innerHTML="<div id='picContorl'>"+t+"</div>"+p.innerHTML;
	setInterval("setAlpha()",50);
	setInterval("playPic()",3000);
}
function setTargetPic(Num) {
	var p=document.getElementById("picSlider");
	var dts=p.getElementsByTagName("dt");
	var dds=p.getElementsByTagName("dd");
	var pc=document.getElementById("picContorl");
	spans=pc.getElementsByTagName("span");
	picNum=dts.length;
	for(var i=0;i<dts.length;i++) {
		if(i==Num) {
			dts[i].style.display="block";
			dds[i].style.display="block";
			spans[i].className="slect";
		} else {
			dts[i].style.display="none";
			dds[i].style.display="none";
			spans[i].className="none";
		}
	}
	var dl=p.getElementsByTagName("dl")[0];
	dl.style.filter="alpha(opacity=0)";
	dl.style.opacity="0";
}
function setAlpha() {
	var p=document.getElementById("picSlider");
	var dl=p.getElementsByTagName("dl")[0];
	if(Number(dl.style.opacity)<1) {
		dl.style.opacity=Number(dl.style.opacity)+0.1;
		dl.style.filter="alpha(opacity="+Number(dl.style.opacity)*100+")";
		//alert(dl.style.opacity);
	}
}
var tNum=0;
function playPic() {
	if(tNum>=picNum) {
		tNum=0;
	}
	setTargetPic(tNum);
	tNum++;
}
window.onload=function() {initPicSlider("picSlider");}

//轮换播放结束