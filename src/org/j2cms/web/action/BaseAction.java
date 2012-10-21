package org.j2cms.web.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;


public abstract class BaseAction extends ActionSupport {
	
	private static final long serialVersionUID	= 1997750562713263377L;
	// 让子类拥有日志记录的能力
	protected Logger log = LoggerFactory.getLogger(this.getClass());
	
	// ajax数据内容的类型,就是配置文件里${ajaxContentType}的替换值
	protected String ajaxContentType = "text/html";
	
	// ajax resultType
	protected final static String AJAX = "ajax";
	
	// ajax回写客户端流
	private InputStream  inputStream;
	
	/**
	 * 方法由struts2调用,在配置文件里有设置这个方法,名字根据个人爱好
	 * 
	 * @return ajax回写数据流
	 */
	public InputStream getAjaxInputStream() {
		return this.inputStream;
	}
	
	/**
	 * 设置ajax回写数据流
	 * 
	 * @param data 返回客户端的字符串
	 */
	public void setAjaxInputStream(String data) {
		byte[] bytes;
		try {
			bytes = data.getBytes("utf-8");
			this.inputStream = new ByteArrayInputStream(bytes);
		} catch (UnsupportedEncodingException e) {
			log.error("设置ajax input stream 失败! 错误原因 : {}", e.getMessage());
		}
	}
}