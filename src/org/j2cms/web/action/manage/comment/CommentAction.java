package org.j2cms.web.action.manage.comment;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import javax.annotation.Resource;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.convention.annotation.ExceptionMappings;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.j2cms.model.PageView;
import org.j2cms.model.QueryResult;
import org.j2cms.model.CheckState;
import org.j2cms.model.article.Article;
import org.j2cms.model.comment.Comment;
import org.j2cms.model.group.Group;
import org.j2cms.model.user.User;
import org.j2cms.service.CommentService;
import org.j2cms.service.GroupService;
import org.j2cms.utils.Struts2Utils;
import org.j2cms.utils.WebUtil;
import org.j2cms.web.action.EntityAction;

@Results({
	  @Result(name="toList",type="chain",location = "list"),
	  @Result(name="succ",type="freemarker",location="/WEB-INF/content/util/succ.ftl"),
	  @Result(name="error",type="freemarker",location="/WEB-INF/content/util/error.ftl"),
	  @Result(name="errorPage",type="freemarker",location="/WEB-INF/content/util/errorPage.ftl"),
	  @Result(name="urlRedirect",type="freemarker",location="/WEB-INF/content/util/urlRedirect.ftl")
})
@ExceptionMappings({
@ExceptionMapping(exception = "java.sql.SQLException", result = "error", params = {"message", "操作数据库失败！"})
})
public class CommentAction extends EntityAction<Comment> {
	private static final long serialVersionUID = 8972280621447030234L;
	@Resource
	private CommentService entityService;
	@Resource
	private GroupService groupService;
	private Comment entity;
	private List<Group> entitys  = new ArrayList<Group>();
	private Integer articleID; 	
	private Integer userID;
	private PageView<Comment> pageView = new PageView<Comment>(20,1);
	

	public Integer getArticleID() {
		return articleID;
	}
	public void setArticleID(Integer articleID) {
		this.articleID = articleID;
	}
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public PageView<Comment> getPageView() {
		return pageView;
	}
	public void setPageView(PageView<Comment> pageView) {
		this.pageView = pageView;
	}
	public Comment getEntity() {
		return entity;
	}
	public void setEntity(Comment entity) {
		this.entity = entity;
	}
	public List<Group> getEntitys() {
		entitys = groupService.getScrollData().getResultlist();
		return entitys;
	}
	public void setEntitys(List<Group> entitys) {
		this.entitys = entitys;
	}
	

	@Actions({
		@Action("save")
	})
	public String save(){
		this.entity.setArticle (new Article(articleID));
		this.entity.setUser(new User(userID));
		entityService.save(this.entity);
		return SUCCESS;
	}
	
	
	@Actions({
		@Action("/manage/comment/list")
	})	
	public String list(){
		int page =WebUtil.StrToInt(Struts2Utils.getParameter("page"));
		Integer id = WebUtil.StrToInt(Struts2Utils.getParameter("id"));
		
	
		if(page!=0) pageView.setCurrentpage(page);
		int firstindex = (pageView.getCurrentpage()-1)*pageView.getMaxresult();
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		QueryResult<Comment> qr =entityService.getScrollData(
				firstindex, pageView.getMaxresult(),"o.state=?1", new Object[]{CheckState.values()[id]}, orderby);
		pageView.setQueryResult(qr);
		return SUCCESS;
	}

}
