package junit.test;


import org.j2cms.model.log.Log;
import org.j2cms.model.log.LogResult;
import org.j2cms.service.LogService;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



public class LogTest {


	private static LogService logService;
	private static ApplicationContext cxt;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			cxt = (ApplicationContext) new ClassPathXmlApplicationContext(
					"applicationContext.xml");
			logService = (LogService) cxt.getBean("logServiceImpl");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
	}
	@Test public void save(){
		Log log = new Log();
		log.setLogResult(LogResult.操作成功);
		logService.save(log);
	}
}
