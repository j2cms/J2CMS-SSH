package org.j2cms.web.action.manage.config;

import java.net.InetAddress;
import javax.annotation.Resource;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.convention.annotation.ExceptionMappings;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.j2cms.model.config.Config;
import org.j2cms.service.ConfigService;
import org.j2cms.utils.Struts2Utils;


import com.opensymphony.xwork2.ActionSupport;

@Results({
	  @Result(name="edit",type="redirect",location = "edit"),
	  @Result(name="toList",type="chain",location = "list"),
	  @Result(name="succ",type="freemarker",location="/WEB-INF/content/util/succ.ftl"),
	  @Result(name="error",type="freemarker",location="/WEB-INF/content/util/error.ftl"),
	  @Result(name="errorPage",type="freemarker",location="/WEB-INF/content/util/errorPage.ftl"),
	  @Result(name="urlRedirect",type="freemarker",location="/WEB-INF/content/util/urlRedirect.ftl")
})
@ExceptionMappings({
@ExceptionMapping(exception = "java.sql.SQLException", result = "error", params = {"message", "操作数据库失败！"})
})
public class ConfigAction extends ActionSupport {
	private static final long serialVersionUID = -7444141903036815587L;
	@Resource
	private ConfigService configService;
	private Config config;
	
	public Config getConfig() {
		return config;
	}
	public void setConfig(Config config) {
		this.config = config;
	}
	@Actions({
		@Action("edit"),
	})
	public String execute(){
		Config config = configService.find(1);
		Struts2Utils.setAttribute("config", config);
		return SUCCESS;
	}
	
	
	@Actions({
		@Action("update" )
	})
	public String update(){
		try {
			this.config.setStatistics(this.config.getStatistics().replaceAll("\"", "\'"));
			this.config.setIp(InetAddress.getLocalHost().getHostAddress().toString());
			configService.update(this.config);
			Struts2Utils.setContextAttribute("C", config);
			return "edit";
		} catch (Exception e) {
			return ERROR;
		}	
	}
	@Actions({
		@Action(value="/manage/getLatestVersion"),
	})	
	public String getLatestVersion(){
		Config c =(Config)Struts2Utils.getContextAttribute("C");
		try {
			String p =c.getConfigStr();
			Struts2Utils.setAttribute("url", "http://www.j2cms.com/getLatestVersion?"+p); 
			return "urlRedirect";
		} catch (Exception e) {
			return "urlRedirect";
		}	
	}
	
	
}
