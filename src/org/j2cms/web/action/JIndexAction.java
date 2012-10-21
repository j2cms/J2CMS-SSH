package org.j2cms.web.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.convention.annotation.ExceptionMappings;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.j2cms.model.CheckState;
import org.j2cms.model.PageView;
import org.j2cms.model.article.Article;
import org.j2cms.model.channel.Channel;
import org.j2cms.model.config.Flash;
import org.j2cms.service.ArticleService;
import org.j2cms.service.ChannelService;
import org.j2cms.service.FlashService;
import org.j2cms.utils.Struts2Utils;


import com.j2cms.utils.CreateHtml;
import com.opensymphony.xwork2.ActionSupport;


import freemarker.template.TemplateException;

@Results({
	  @Result(name="succ",type="freemarker",location="/WEB-INF/content/util/succ.ftl"),
	  @Result(name="errorPage",type="freemarker",location="/WEB-INF/content/util/errorPage.ftl"),
	  @Result(name="error",type="freemarker",location="/WEB-INF/content/util/error.ftl"),
})
@ExceptionMappings({
@ExceptionMapping(exception = "java.lang.Exception", result = "errorPage", params = {"message", "操作数据库失败！"})
})
public class JIndexAction extends ActionSupport {
	private static final long serialVersionUID = -3333066726557269678L;
	@Resource
	private ChannelService channelService;
	@Resource
	private ArticleService articleService;
	@Resource
	private FlashService flashService;
	
	private List<Flash> flashs= new ArrayList<Flash>();
	private List<Channel> channelsDisplay = new ArrayList<Channel>();	
	private List<Channel> channelInIndexs= new ArrayList<Channel>();
	private List<Article> latestArticles = new ArrayList<Article>();
	private List<Article> mostVisitArticles=new ArrayList<Article>();  //visit
	private List<Article> mostCommentArticles=new ArrayList<Article>();  //commentCount
	private PageView<Article> pageView = new PageView<Article>(20,1);
	
	
	public PageView<Article> getPageView() {
		return pageView;
	}
	public void setPageView(PageView<Article> pageView) {
		this.pageView = pageView;
	}	
	
//	List<Article> FocusArticles = new ArrayList<Article>();
//	private List<Article> focusArticles[];
//	private List<?> channelArticle[] = new ArrayList<?>[4];

	public List<Flash> getFlashs() {
		return flashs;
	}

	public void setFlashs(List<Flash> flashs) {
		this.flashs = flashs;
	}
	
	public List<Article> getMostVisitArticles() {
		return mostVisitArticles;
	}


	public void setMostVisitArticles(List<Article> mostVisitArticles) {
		this.mostVisitArticles = mostVisitArticles;
	}

	public List<Article> getMostCommentArticles() {
		return mostCommentArticles;
	}

	public void setMostCommentArticles(List<Article> mostCommentArticles) {
		this.mostCommentArticles = mostCommentArticles;
	}

	public List<Channel> getChannelsDisplay() {
		return channelsDisplay;
	}

	public void setChannelsDisplay(List<Channel> channelsDisplay) {
		this.channelsDisplay = channelsDisplay;
	}

	public List<Article> getLatestArticles() {
		return latestArticles;
	}

	public void setLatestArticles(List<Article> latestArticles) {
		this.latestArticles = latestArticles;
	}

	public List<Channel> getChannelInIndexs() {
		return channelInIndexs;
	}

	public void setChannelInIndexs(List<Channel> channelInIndexs) {
		this.channelInIndexs = channelInIndexs;
	}

	@Actions({
		@Action(value="/index",results={@Result(name="success",type="redirect",location="/index.html")})
	})
	public String execute(){
		List<Flash> flashs= new ArrayList<Flash>();
		List<Channel> channelsDisplay = new ArrayList<Channel>();	
		List<Channel> channelInIndexs= new ArrayList<Channel>();
		List<Article> latestArticles = new ArrayList<Article>();
		List<Article> mostVisitArticles=new ArrayList<Article>();  //visit
		List<Article> mostCommentArticles=new ArrayList<Article>();  //commentCount
		
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> orderbyRankid = new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> orderbyVisitTotal = new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> orderbyCommentCount = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		orderbyRankid.put("rankid", "asc");//正序
		orderbyVisitTotal.put("visitTotal", "desc");
		orderbyCommentCount.put("commentCount", "desc");
		try {
			flashs=flashService.getScrollData(0, 5,"o.checkState=?1",new Object[]{CheckState.pass}, orderby).getResultlist();
			channelsDisplay=channelService.getScrollData(-1,-1, "o.father=?1 and o.display=true",new Object[]{new Channel(1)},orderbyRankid).getResultlist();
			latestArticles=articleService.getScrollData(0, 8,"o.checkState=?1",new Object[]{CheckState.pass},orderby).getResultlist();
			mostVisitArticles=articleService.getScrollData(0, 10,"o.checkState=?1",new Object[]{CheckState.pass},orderbyVisitTotal).getResultlist();
			mostCommentArticles=articleService.getScrollData(0, 10,"o.checkState=?1",new Object[]{CheckState.pass},orderbyCommentCount).getResultlist();
			channelInIndexs=channelService.getScrollData(0,-1, "o.displayInIndex=true",null,orderbyRankid).getResultlist();				
//			List<?> channelArticles[] = new ArrayList<?>[channelInIndexs.size()];			
//			Map <String,ArrayList<Article>> channelArticles = new HashMap<String,ArrayList<Article>>();
//			ArrayList<Article> channelArticle = new ArrayList<Article>();			
			List<Map<?,?>> channelArticleMaps = new ArrayList<Map<?,?>>();			
			for(Channel channel:channelInIndexs)
			{
//				channelArticle=(ArrayList<Article>)articleService.getScrollData(0, 5, "o.channel=?1 and o.checkState=?2", new Object[]{channel,CheckState.pass},orderby).getResultlist();
//				channelArticles.put(channel.getName(), channelArticle);				
				Map <String,ArrayList<Article>> channelArticleMap = new HashMap<String,ArrayList<Article>>();
				ArrayList<Article> channelArticle = new ArrayList<Article>();
				channelArticle=(ArrayList<Article>)articleService.getScrollData(0, 5, "o.channel=?1 and o.checkState=?2", new Object[]{channel,CheckState.pass},orderby).getResultlist();
				channelArticleMap.put(channel.getName(), channelArticle);
				channelArticleMaps.add(channelArticleMap);
			}
			
			Map <String,Object>map  = new HashMap<String,Object>();
			map.put("flashs", flashs);
			map.put("channelsDisplay", channelsDisplay);
			map.put("channelInIndexs", channelInIndexs);
			map.put("latestArticles", latestArticles);
			map.put("mostVisitArticles", mostVisitArticles);
			map.put("mostCommentArticles", mostCommentArticles);
			map.put("channelArticleMaps", channelArticleMaps);
			String [] ftls={"head.ftl","foot.ftl","left.ftl","index.ftl"};
			String [] htmlNames={"head.html","foot.html","left.html","index.html"};
			String relaPath="";
			try {
				CreateHtml createHtml = new CreateHtml();
				createHtml.multiFtlCreateHtml(ftls,htmlNames,map,relaPath);			
			} catch (IOException e) {
				e.printStackTrace();
			} catch (TemplateException e) {
				e.printStackTrace();
			}
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	@Actions({
		@Action(value="/manage/config/makeIndexHtml")
	})
	public String makeHtml(){
		List<Flash> flashs= new ArrayList<Flash>();
		List<Channel> channelsDisplay = new ArrayList<Channel>();	
		List<Channel> channelInIndexs= new ArrayList<Channel>();
		List<Article> latestArticles = new ArrayList<Article>();
		List<Article> mostVisitArticles=new ArrayList<Article>();  //visit
		List<Article> mostCommentArticles=new ArrayList<Article>();  //commentCount
		
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> orderbyRankid = new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> orderbyVisitTotal = new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> orderbyCommentCount = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		orderbyRankid.put("rankid", "asc");//正序
		orderbyVisitTotal.put("visitTotal", "desc");
		orderbyCommentCount.put("commentCount", "desc");
		try {
			flashs=flashService.getScrollData(0, 5,"o.checkState=?1",new Object[]{CheckState.pass}, orderby).getResultlist();
			channelsDisplay=channelService.getScrollData(-1,-1, "o.father=?1 and o.display=true",new Object[]{new Channel(1)},orderbyRankid).getResultlist();
			latestArticles=articleService.getScrollData(0, 8,"o.checkState=?1",new Object[]{CheckState.pass},orderby).getResultlist();
			mostVisitArticles=articleService.getScrollData(0, 10,"o.checkState=?1",new Object[]{CheckState.pass},orderbyVisitTotal).getResultlist();
			mostCommentArticles=articleService.getScrollData(0, 10,"o.checkState=?1",new Object[]{CheckState.pass},orderbyCommentCount).getResultlist();
			channelInIndexs=channelService.getScrollData(0,100, "o.displayInIndex=true",null,orderbyRankid).getResultlist();	

			List<Map<?,?>> channelArticleMaps = new ArrayList<Map<?,?>>();
			for(Channel channel:channelInIndexs) 
			{
				Map <String,ArrayList<Article>> channelArticleMap = new HashMap<String,ArrayList<Article>>();
				ArrayList<Article> channelArticle = new ArrayList<Article>();
				channelArticle=(ArrayList<Article>)articleService.getScrollData(0, 5, "o.channel=?1 and o.checkState=?2", new Object[]{channel,CheckState.pass},orderby).getResultlist();
				channelArticleMap.put(channel.getName(), channelArticle);
				channelArticleMaps.add(channelArticleMap);				
			}
			
			Map <String,Object>map  = new HashMap<String,Object>();
			map.put("flashs", flashs);
			map.put("channelsDisplay", channelsDisplay);
			map.put("channelInIndexs", channelInIndexs);
			map.put("latestArticles", latestArticles);
			map.put("mostVisitArticles", mostVisitArticles);
			map.put("mostCommentArticles", mostCommentArticles);
			map.put("channelArticleMaps", channelArticleMaps);
			String [] ftls={"head.ftl","foot.ftl","left.ftl"};
			String [] htmlNames={"head.html","foot.html","left.html"};
			String relaPath="";
			try {
				CreateHtml createHtml = new CreateHtml();
				createHtml.multiFtlCreateHtml(ftls,htmlNames,map,relaPath);
			} catch (IOException e) {
				e.printStackTrace();
			} catch (TemplateException e) {
				e.printStackTrace();
			}	
			Struts2Utils.setAttribute("message","已生成/index.html");
			return "succ";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		
	}
	
	@Action(value="/manage",results={@Result(name = "success",type="freemarker",location = "manage/login.ftl")})
	public String manage(){
		return SUCCESS;
	}
	@Action(value="/404",results={@Result(name="success",type="freemarker",location="/WEB-INF/content/util/404.ftl")})
	public String Error404(){
		return SUCCESS;
	}


	
	
}
