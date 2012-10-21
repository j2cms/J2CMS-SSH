package org.j2cms.web.action.manage.article;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.ExceptionMappings;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.j2cms.model.CheckState;
import org.j2cms.model.PageView;
import org.j2cms.model.QueryResult;
import org.j2cms.model.article.Article;
import org.j2cms.model.channel.Channel;
import org.j2cms.model.group.Group;
import org.j2cms.service.ChannelService;
import org.j2cms.service.GroupService;
import org.j2cms.utils.Struts2Utils;
import org.j2cms.web.action.EntityAction;

import com.j2cms.utils.CreateHtml;


import freemarker.template.TemplateException;

//@ResultPath("/Article")
//@Namespace("/article") 
@Results({
		  @Result(name="add",location = "add.jsp"),
		  @Result(name="edit",location = "edit.jsp"),
		  @Result(name="toList",location = "toList.jsp"),
		  @Result(name="succ",type="freemarker",location="/WEB-INF/content/util/succ.ftl"),
		  @Result(name="error",type="freemarker",location="/WEB-INF/content/util/error.ftl"),
		  @Result(name="errorPage",type="freemarker",location="/WEB-INF/content/util/errorPage.ftl"),
		  @Result(name="urlRedirect",type="freemarker",location="/WEB-INF/content/util/urlRedirect.ftl")
})
@ExceptionMappings({
    @ExceptionMapping(exception = "java.sql.SQLException", result = "error", params = {"message", "操作数据库失败！"})
})
@SuppressWarnings("unused")
public class ArticleAction  extends EntityAction<Article>{
	private static final long serialVersionUID = 2265855246102250818L;
	@Resource
	private ChannelService channelService;
	@Resource
	private GroupService groupService;
	private Article selector= new Article();
	private String sortType="id";//排序类型
	private String sortord="desc";
	private List<Group>groups = new ArrayList<Group>(); //会员组
	private List<Channel> channels = new ArrayList<Channel>();//栏目组
	public String getSortord() {
		return sortord;
	}
	public void setSortord(String sortord) {
		this.sortord = sortord;
	}
	public String getSortType() {
		return sortType;
	}
	public void setSortType(String sortType) {
		this.sortType = sortType;
	}
	public PageView<Article> getPageView() {
		return pageView;
	}
	public void setPageView(PageView<Article> pageView) {
		this.pageView = pageView;
	}	

	public Article getSelector() {
		return selector;
	}
	public void setSelector(Article selector) {
		this.selector = selector;
	}
	public List<Group> getGroups() {
		return groupService.getScrollData().getResultlist();
	}
	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}
	public List<Channel> getChannels() {
		return channelService.getScrollData().getResultlist();
	}
	public void setChannels(List<Channel> channels) {
		this.channels = channels;
	}
	
	@Actions({
		@Action("/article")
	})	
	public String execute() throws Exception {//o.father.id=1 改成这样简单

		if(entity!=null&&entity.getCheckState()==CheckState.pass){
			entity.setVisitTotal(entity.getVisitTotal()+1);//点击数加1
			try {
				Map <String,Object>map  = new HashMap<String,Object>();
				map.put("entity", entity);
				new CreateHtml().init("article.html", id+".html", map, "Article/");
			} catch (IOException e) {
				e.printStackTrace();
			} catch (TemplateException e) {
				e.printStackTrace();
			}//生成静态HTML
			Struts2Utils.setAttribute("url", "/Article/"+id+".html");
			return "urlRedirect";
		}
		else{
			Struts2Utils.setAttribute("message", "该信息不存在或未通过审核！");
			return "errorPage";
		}
		
	}

	private boolean checkEntityForm()
	{
		if(entity.getTitle()==null||entity.getTitle().equals("")) 
		{
			Struts2Utils.setAttribute("message1", "标题不能为空！");
			return false;
		}
		if(entity.getAuthor()==null||entity.getAuthor().equals("")) 
		{
			Struts2Utils.setAttribute("message2", "作者不能为空！");
			return false;
		}
		if(entity.getReleaseDate()==null||entity.getReleaseDate().equals("")) 
		{
			Struts2Utils.setAttribute("message3", "发布时间不能为空！");
			return false;
		}
		
		return true;
	}
	
	@Actions({
		@Action("update")
	})
	public String update(){
		try {
			if(!checkEntityForm()) return "edit";
			super.update();
			return "toList";			
		} catch (Exception e) {
			return ERROR;
		}
			
	}

	@Actions({
		@Action("save")
	})
	public String save(){
		try {
			if(!checkEntityForm()) return "add";
			super.save();	
			return "toList";
		} catch (Exception e) {
			return ERROR;
		}
		
	}

	@Actions({
		@Action("list")
	})	
	public String list(){
		QueryResult<Article> qr;
		StringBuffer jpql = new StringBuffer("");//"1=1"?
		List<Object> params = new ArrayList<Object>();

		if(selector!=null&&selector.getId()!=null){
			jpql.append(" o.id=?").append((params.size()+1));
			params.add(selector.getId());
			qr=entityService.getScrollData(0, 1,jpql.toString(), params.toArray());
		}
		else{
			int firstindex = (pageView.getCurrentpage()-1)*pageView.getMaxresult();
		    LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
			orderby.put(sortType==null?"id":sortType, sortord);
			if(selector.getChannel()!=null&&selector.getChannel().getId()!=null&&selector.getChannel().getId()!=1){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.channel=?").append((params.size()+1));
				params.add(selector.getChannel());
			}
			if(selector.getCheckState()!=null && !"".equals(selector.getCheckState())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.checkState=?").append((params.size()+1));
				params.add(selector.getCheckState());
			}
			if(selector.getRecommendLevel()!=null &&!"".equals(selector.getRecommendLevel())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.recommendLevel=?").append((params.size()+1));
				params.add(selector.getRecommendLevel());
			}
			if(selector.getReleaseDate()!=null&&!"".equals(selector.getReleaseDate())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.releaseDate=?").append((params.size()+1));
				params.add(selector.getReleaseDate());
			}
			if(selector.getUser()!=null&&!"".equals(selector.getUser().getUsername())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.user.username=?").append((params.size()+1));
				params.add(selector.getUser().getUsername());
			}
			if(selector.getTitle()!=null && !"".equals(selector.getTitle())){
				if(params.size()>0) jpql.append(" and ");
				jpql.append(" o.title like ?").append((params.size()+1));
				params.add("%"+ selector.getTitle()+ "%");
			}
			qr=entityService.getScrollData(firstindex, pageView.getMaxresult(),jpql.toString(), params.toArray(), orderby);
		}
		pageView.setQueryResult(qr);
	
		return SUCCESS;
	}
	
	
	@Action(value="makeHtml")
	public String makeHtml(){		
		Map <String,Object>map  = new HashMap<String,Object>();		
		CreateHtml createHtml=new CreateHtml();
		String ftl = "article.html";
		String relaPath = "Article/";
		int count=0;
		try {
			for (Integer id:ids)
			{
				String htmlName = id+".html";
				Article entity=entityService.find(id);
				if(entity!=null&&entity.getCheckState()==CheckState.pass){
					map.put("entity",entity);
					createHtml.init(ftl, htmlName, map, relaPath);
					count++;
				}
			}
			Struts2Utils.setAttribute("message","已在"+relaPath+"目录生成个"+count+"个html文件");
			return "succ";
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		return ERROR; 
	}
	
	


}
