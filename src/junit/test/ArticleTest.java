package junit.test;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import org.j2cms.model.CheckState;
import org.j2cms.model.PageView;
import org.j2cms.model.QueryResult;
import org.j2cms.model.article.Article;
import org.j2cms.model.channel.Channel;
import org.j2cms.model.group.Group;
import org.j2cms.model.user.User;
import org.j2cms.service.ArticleService;
import org.j2cms.service.ChannelService;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;






public class ArticleTest {
	private static ApplicationContext cxt;
	private static ArticleService articleService;
	private static ChannelService channelService;


	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			cxt = (ApplicationContext) new ClassPathXmlApplicationContext(
					"applicationContext.xml");
			articleService = (ArticleService) cxt.getBean("articleServiceImpl");
			channelService = (ChannelService) cxt.getBean("channelServiceImpl");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
	}
	@Test
	public void delete(){
		Integer id[]={59,60};
		articleService.delete(id);
	}
	@Test
	public void  delete2 (){
		String strid[] = {"57","58"};
		Integer intid[]=null;
		intid=new Integer[strid.length];
		try {
			for (int i = 0; i < strid.length; i++) {
				intid[i] = Integer.parseInt(strid[i]);
				System.out.println("----------------------------------------------------------");
				System.out.println(intid[i]);
				System.out.println("----------------------------------------------------------");
			}
			articleService.delete(intid);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Test public void save()
	{
		for(int i=1;i<50;i++)
		{
			Article article = new Article();
			article.setTitle(i+"关于J2CMS");
			article.setContent("<p>&nbsp;&nbsp;J2CMS是一款JAVAEE平台的开源内容管理系统．继承java强大、稳定、安全、高效、跨平台等多方面的优点，结合mysql数据库开发. 懂html就能建站,提供最便利、合理的使用方式．<br />");
			article.setAuthor("郭涛");
			article.setOrigin("本站");
			article.setUser(new User(1));
			article.setGroup(new Group(5));
			article.setChannel(new Channel(7));
			article.setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			article.setCommentCount(200+i);
			article.setVisitTotal(100+i);
			article.setCheckState(CheckState.pass);			
					
			articleService.save(article);			
		}

	}
	@Test public void update()
	{
		Article article = articleService.find(1);
		article.setTitle("标题1");
		article.setChannel(channelService.find(1));
		articleService.update(article);
	}
	@Test public void update2()
	{
		Article article = articleService.find(1);
		article.setTitle("标题111");
		article.setChannel(channelService.find(1));
		articleService.update(article);
	}
	@Test public void list(){
		QueryResult<Article> queryResult;
		queryResult =articleService.getScrollData();
		List<Article> articles = queryResult.getResultlist();
		for(Article article:articles){
			System.out.println(article.getAuthor());
		}		
	}
	
	@Test 
	public void list2(){
//		int page =Integer.parseInt(Struts2Utils.getParameter("page"));
//		int id = Integer.parseInt(Struts2Utils.getParameter("id"));
		int page =1;
		Integer id=1;
		Channel channel = new Channel(id);
		
		PageView<Article> pageView = new PageView<Article>(15,page);
		int firstindex = (pageView.getCurrentpage()-1)*pageView.getMaxresult();
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		QueryResult<Article> qr =articleService.getScrollData(
				firstindex, pageView.getMaxresult(),"o.checkState=?1 and o.channel=?2 and o.author=?3", new Object[]{CheckState.pass,new Channel(id),'%'}, orderby);
//				firstindex, pageView.getMaxresult(),"o.checkState=?1 and o.channel=?2 ", new Object[]{CheckState.已审核,new Channel(id)}, orderby);
		pageView.setQueryResult(qr);

//		Struts2Utils.setAttribute("channel", channel);
//		Struts2Utils.setAttribute("pageView", pageView);		
//		return "list";
		System.out.println(channel.getId());
		
		for(Article article:pageView.getRecords()){
			System.out.println(article.getTitle());
		}
	}
}
