function CreateFlash(idad, swfurl, wad, had, vs){
var str = "<object classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" codebase=\"http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0\" width=\"" + wad + "\" height=\"" + had + "\" id=\"" + idad + "\" align=\"middle\">";
str += "<param name=\"allowScriptAccess\" value=\"always\">";
str += "<param name=\"quality\" value=\"high\">";
str += "<param name=\"movie\" value=\"" + swfurl + "\">";
str += '<param name=\"wmode\" value=\"transparent\">';
str += "<param name=\"flashvars\" value=\"" + vs + "\">";
str += "<embed src=\"" + swfurl + "\" flashvars=\"" + vs + "\" wmode=\"transparent\" quality=\"high\" width=\"" + wad + "\" height=\"" + had + "\" name=\"" + idad + "\" align=\"middle\" allowScriptAccess=\"always\" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\">";
str += "</object>";
document.write(str);
}