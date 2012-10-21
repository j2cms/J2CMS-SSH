<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${C.name}管理中心登陆</title>
<link href="/css/skin.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #1D3647;
}
-->
</style>
<script>
function anotherImg()
{
	var obj = document.getElementById("codeImg");
	obj.src="util/rand?rnd="+Math.random();
}
</script>

</head>
<body onLoad="loginForm.username.focus();" oncontextmenu="return false" onselectstart="return false">
<table width="100%" height="166" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="42" valign="top"><table width="100%" height="42" border="0" cellpadding="0" cellspacing="0" class="login_top_bg">
      <tr>
        <td width="1%" height="21">&nbsp;</td>
        <td height="42">&nbsp;</td>
        <td width="17%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg">
      <tr>
        <td width="49%" align="right"><table width="91%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg2">
            <tr>
              <td height="138" valign="top"><table width="89%" height="427" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="149">&nbsp;</td>
                </tr>
                <tr>
                  <td height="80" align="right" valign="top"><img src="/images/j2_logo.gif" width="279" height="68"></td>
                </tr>
                <tr>
                  <td height="198" align="right" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="35%">&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt"><p></p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt"><p></p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt"><p></p></td>
                    </tr>
                 
                  </table></td>
                </tr>
              </table></td>
            </tr>
            
        </table></td>
        <td width="1%" >&nbsp;</td>
        <td width="50%" valign="bottom"><table width="100%" height="59" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%">&nbsp;</td>
              <td width="96%" height="38" ><span class="login_txt_bt">登陆后台管理 </span>&nbsp; <span style="color:#F00;  font-size: 12px;">${message!""} </span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="21"><table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table211" height="328">
                  <tr>
                    <td height="164" colspan="2" align="middle"><form id="loginForm" name="loginForm" action="user/login" method="post">
                        <table cellSpacing="0" cellPadding="0" width="100%" border="0" height="143" id="table212">
                          <tr>
                            <td width="13%" height="38" class="top_hui_text"><span class="login_txt">管理员：&nbsp;&nbsp; </span></td>
                            <td height="38" colspan="2" class="top_hui_text"><input name="entity.username" id="username" class="editbox4" value="" size="20"/>                            </td>
                          </tr>
                          <tr>
                            <td width="13%" height="35" class="top_hui_text"><span class="login_txt"> 密 码： &nbsp;&nbsp; </span></td>
                            <td height="35" colspan="2" class="top_hui_text"><input class="editbox4" type="password" size="20" name="entity.password" id="entity.password"/>
                              <img src="/images/luck.gif" width="19" height="18"/> </td>
                          </tr>
                          <tr>
                            <td width="13%" height="35" ><span class="login_txt">验证码：</span></td>
                            <td height="35" colspan="2" class="top_hui_text"><input class=wenbenkuang name="code" id="code"  type=text value="" maxLength=4 size=10 /> <img id="codeImg" src = "/util/rand" style="cursor:pointer" onClick="anotherImg();" title="点击刷新"/>
                              </td>
                          </tr>
                          <tr>
                            <td height="35" >&nbsp;</td>
                            <td width="20%" height="35" ><input name="Submit" type="submit" class="button" id="Submit" value="登 陆"/> </td>
                            <td width="67%" class="top_hui_text"><input name="cs" type="button" class="button" id="cs" value="取 消" onClick="showConfirmMsg1()"/></td>
                          </tr>
                        </table>
                        <br>
                    </form></td>
                  </tr>
                  <tr>
                    <td width="433" height="164" align="right" valign="bottom"><img src="/images/login-wel.gif" width="242" height="138"/></td>
                    <td width="57" align="right" valign="bottom">&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
          </table>
          </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="20"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="login-buttom-bg">
      <tr>
         <td align="center">
         <span class="login-buttom-txt">
        &copy;${C.copyright} &nbsp;&nbsp;邮箱:${C.email}&nbsp;<a href="http://www.miibeian.gov.cn" target="_blank">${C.recordCode}</a>
        </span></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>