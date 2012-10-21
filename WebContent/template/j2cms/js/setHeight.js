//设置高度

function alertHeight(){
    
     var divH1 = document.getElementById("left");
     var divH2 = document.getElementById("main1");
     var allHeight= divH1.clientHeight > divH2.clientHeight ? divH1.clientHeight:divH2.clientHeight;
     divH1.style.height=allHeight + 'px';
     divH2.style.height=allHeight + 'px';
}
window.onload=alertHeight;