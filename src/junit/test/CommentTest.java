package junit.test;


import org.j2cms.model.comment.Comment;
import org.j2cms.service.CommentService;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



public class CommentTest {

	private static CommentService commentService;
	private static ApplicationContext cxt;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			cxt = (ApplicationContext) new ClassPathXmlApplicationContext(
					"applicationContext.xml");
			commentService = (CommentService) cxt.getBean("commentServiceImpl");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
	}
	@Test public void save(){
		Comment comment = new Comment();
		comment.setContent("评论1");
		commentService.save(comment);
	}

}
