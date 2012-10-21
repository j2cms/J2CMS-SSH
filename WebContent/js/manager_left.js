// JavaScript Document
function showsubmenu(sid)
{
	whichEl = eval("submenu" + sid);
	menuTitle = eval("menuTitle" + sid);
	if (whichEl.style.display == "none")
	{
	eval("submenu" + sid + ".style.display=\"\";");
	menuTitle.background="images/title_bg_hide.gif";
	}
	else
	{
	eval("submenu" + sid + ".style.display=\"none\";");
	menuTitle.background="images/title_bg_show.gif";
	}
}