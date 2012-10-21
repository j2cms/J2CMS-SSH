package org.j2cms.web.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

public class MyStrutsFilterDispatcher extends StrutsPrepareAndExecuteFilter {   
	    /**  
	    *struts2的拦截器与fck上传文件冲突  
	    *重写struts2的拦截器，增加了判断，如果是fck的编辑器上传文件，则不进行拦截。  
	    * 判断路径是否有fckeditor,实现在fck下的操作不进行拦截
	    */  
	 @Override  
	 public void doFilter(ServletRequest req, ServletResponse res,   
	   FilterChain chain) throws IOException, ServletException {   
	      String url = ((HttpServletRequest)req).getRequestURI();    
	      if (url.indexOf("fckeditor") < 0) {   
	             super.doFilter(req, res, chain);    
	       } else {   
	             chain.doFilter(req, res);   
	       }     
	    }   
	  
	}  
