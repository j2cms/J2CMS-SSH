package org.j2cms.web.action.manage.log;

import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.convention.annotation.ExceptionMappings;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.j2cms.model.log.Log;
import org.j2cms.web.action.EntityAction;
@Results({
	  @Result(name="listAll",location = "list.jsp"),
	  @Result(name="toList",type="chain",location = "list"),
	  @Result(name="succ",type="freemarker",location="/WEB-INF/content/util/succ.ftl"),
	  @Result(name="error",type="freemarker",location="/WEB-INF/content/util/error.ftl"),
	  @Result(name="errorPage",type="freemarker",location="/WEB-INF/content/util/errorPage.ftl"),
	  @Result(name="urlRedirect",type="freemarker",location="/WEB-INF/content/util/urlRedirect.ftl")
})
@ExceptionMappings({
	  @ExceptionMapping(exception = "java.sql.SQLException", result = "error", params = {"message", "操作数据库失败！"})
})
public class LogAction extends EntityAction<Log> {
	private static final long serialVersionUID = -504186111821053449L;

}
