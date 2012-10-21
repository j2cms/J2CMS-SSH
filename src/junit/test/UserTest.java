package junit.test;


import org.j2cms.model.CheckState;
import org.j2cms.model.user.User;
import org.j2cms.service.UserService;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;




public class UserTest {


	private static UserService userService;
	private static ApplicationContext cxt;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			cxt = (ApplicationContext) new ClassPathXmlApplicationContext(
					"applicationContext.xml");
			userService = (UserService) cxt.getBean("userServiceImpl");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
	}
	@Test public void save(){
		User user = new User();
		user.setRealName("郭涛");
		user.setUsername("admin");
		user.setPassword("admin");
		user.setAddress("湖北武汉");
		user.setCheckState(CheckState.pass);
		userService.save(user);
	}

}
