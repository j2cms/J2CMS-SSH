package org.j2cms.utils;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.j2cms.model.user.User;


/**
 * 
 * @author Administrator
 *
 */
public class WebUtil {
	/**
	 * 获取登录用户
	 */
	public static User getUser(HttpServletRequest request){
		return (User) request.getSession().getAttribute("user");
	}
	
    /***
     * 获取URI的路径,如路径为http://www.j2cms.com/action/post.htm?method=add, 得到的值为"/action/post.htm"
     * @param request
     * @return
     */
    public static String getRequestURI(HttpServletRequest request){     
        return request.getRequestURI();
    }
    /**
     * 获取完整请求路径(含内容路径及请求参数)
     * @param request
     * @return
     */
    public static String getRequestURIWithParam(HttpServletRequest request){     
        return getRequestURI(request) + (request.getQueryString() == null ? "" : "?"+ request.getQueryString());
    }
    /**
     * 添加cookie
     * @param response
     * @param name cookie的名称
     * @param value cookie的值
     * @param maxAge cookie存放的时间(以秒为单位,假如存放三天,即3*24*60*60; 如果值为0,cookie将随浏览器关闭而清除)
     */
    public static void addCookie(HttpServletResponse response, String name, String value, int maxAge) {        
        Cookie cookie = new Cookie(name, value);
        cookie.setPath("/");
        if (maxAge>0) cookie.setMaxAge(maxAge);
        response.addCookie(cookie);
    }
    
    /**
     * 获取cookie的值
     * @param request
     * @param name cookie的名称
     * @return
     */
    public static String getCookieByName(HttpServletRequest request, String name) {
    	Map<String, Cookie> cookieMap = WebUtil.readCookieMap(request);
        if(cookieMap.containsKey(name)){
            Cookie cookie = (Cookie)cookieMap.get(name);
            return cookie.getValue();
        }else{
            return null;
        }
    }
    
    protected static Map<String, Cookie> readCookieMap(HttpServletRequest request) {
        Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
        Cookie[] cookies = request.getCookies();
        if (null != cookies) {
            for (int i = 0; i < cookies.length; i++) {
                cookieMap.put(cookies[i].getName(), cookies[i]);
            }
        }
        return cookieMap;
    }
    /**
     * 去除html代码
     * @param inputString
     * @return
     */
    public static String HtmltoText(String inputString) {
        String htmlStr = inputString; //含html标签的字符串
        String textStr ="";
        java.util.regex.Pattern p_script;
        java.util.regex.Matcher m_script;
        java.util.regex.Pattern p_style;
        java.util.regex.Matcher m_style;
        java.util.regex.Pattern p_html;
        java.util.regex.Matcher m_html;          
        java.util.regex.Pattern p_ba;
        java.util.regex.Matcher m_ba;
        
        try {
            String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; //定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script> }
            String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; //定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style> }
            String regEx_html = "<[^>]+>"; //定义HTML标签的正则表达式
            String patternStr = "\\s+";
            
            p_script = Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE);
            m_script = p_script.matcher(htmlStr);
            htmlStr = m_script.replaceAll(""); //过滤script标签

            p_style = Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE);
            m_style = p_style.matcher(htmlStr);
            htmlStr = m_style.replaceAll(""); //过滤style标签
         
            p_html = Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE);
            m_html = p_html.matcher(htmlStr);
            htmlStr = m_html.replaceAll(""); //过滤html标签
            
            p_ba = Pattern.compile(patternStr,Pattern.CASE_INSENSITIVE);
            m_ba = p_ba.matcher(htmlStr);
            htmlStr = m_ba.replaceAll(""); //过滤空格
         
         textStr = htmlStr;
         
        }catch(Exception e) {
                    System.err.println("Html2Text: " + e.getMessage());
        }          
        return textStr;//返回文本字符串
     }
    
	/***********************************************************
	 * 函数名：strToInt 作 用：把字符串转为整型 参 数：s: 字符串型 返回值：整型
	 ***********************************************************/
	public static int StrToInt(String s) {
		try {
			int i = Integer.parseInt(checkReplace(s));
			return i; // 返回转化以后的字符串
		} catch (Exception e) {
			return 0;
		}
	}
	/*********************************************************
	 * 函数名：checkReplace 作 用：转化SQL特殊字符串 参 数：s: 字符串型，待转化的字符 返回值：转化以后的字符串
	 * 调　用：String s2 = checkReplace(s1);
	 ***********************************************************/
	public static String checkReplace(String s) {
		try {
			if (s == null || s.equals(""))
				return "";
			else {
				StringBuffer stringbuffer = new StringBuffer();
				for (int i = 0; i < s.length(); i++) {
					char c = s.charAt(i);
					switch (c) {

					case 34: // '"'
						stringbuffer.append("&quot;");
						break;

					case 39: // '\''
						stringbuffer.append("&#039;");
						break;

					case 124: // '|'
						stringbuffer.append("");
						break;

					case '&':
						stringbuffer.append("&amp;");
						break;

					case '<':
						stringbuffer.append("&lt;");
						break;

					case '>':
						stringbuffer.append("&gt;");
						break;

					default:
						stringbuffer.append(c);
						break;
					}
				}
				return stringbuffer.toString().trim(); // 返回转化以后的字符串
			}
		} catch (Exception e) {
			return "";
		}
	}

}
