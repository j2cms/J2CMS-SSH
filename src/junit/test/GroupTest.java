package junit.test;


import org.j2cms.model.group.Group;
import org.j2cms.service.GroupService;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class GroupTest {
	private static ApplicationContext cxt;
	private static GroupService groupService;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {		
		try {
			cxt=new ClassPathXmlApplicationContext("applicationContext.xml");
			groupService = (GroupService)cxt.getBean("groupServiceImpl");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}			
	}
	@Test public void save(){
		for(int i =1;i<6;i++)
		{
			Group group = new Group();
			group.setName("小组"+i);
//			group.setInfo("组"+i);
			group.setManageArticle(true);	
			groupService.save(group);			
		}

	}

}
