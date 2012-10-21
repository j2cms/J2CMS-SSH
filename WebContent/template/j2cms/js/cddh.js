// JavaScript Document  菜单导航

	var previoustab = "sub_1";
	tempobj="sub_1_li";
	function showsub(obj)
	{
		document.all(tempobj).className="";
		document.all(obj+"_li").className="liover";
		document.all(obj).style.display="block";
		if(obj!=previoustab)
		{
		document.getElementById(previoustab).style.display = "none";
		previoustab = obj;
		tempobj=obj+"_li";
		}
		
	}
	
	function SetHome(obj,vrl)//设置为主页
    {
        try
        {
                obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
        }
        catch(e){
                if(window.netscape) {
                        try {
                                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
                        } 
                        catch (e) { 
                                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将[signed.applets.codebase_principal_support]设置为'true'"); 
                        }
                        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                        prefs.setCharPref('browser.startup.homepage',vrl);
                 }
        }
    }
