package org.j2cms.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

public class Struts2Utils {
	public static HttpSession getSession() {
		return ServletActionContext.getRequest().getSession();
	}

	public static HttpSession getSession(Boolean b) {
		return ServletActionContext.getRequest().getSession(b.booleanValue());
	}

	public static HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	public static HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	public static String getParameter(String name) {
		return getRequest().getParameter(name);
		
	}
	public static String[] getParameterValues(String name){
		return getRequest().getParameterValues(name);
	}
	public static void setAttribute(String name,Object o)
	{
		ServletActionContext.getRequest().setAttribute(name, o);
	}
	public static Object getAttribute(String name)
	{
		return ServletActionContext.getRequest().getAttribute(name);
	}

	public static Object getContextAttribute(String name)
	{
		return ServletActionContext.getServletContext().getAttribute(name);
	}
	public static void setContextAttribute(String name,Object object)
	{
		ServletActionContext.getServletContext().setAttribute(name,object);
	}

}