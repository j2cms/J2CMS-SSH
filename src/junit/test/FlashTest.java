package junit.test;

import org.j2cms.model.config.Flash;
import org.j2cms.service.FlashService;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class FlashTest {
	private static ApplicationContext cxt;
	private static  FlashService flashService;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {//从Spring的配置文件中获取Bean
			cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
			flashService = (FlashService)cxt.getBean("flashServiceImpl");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
	}
	
	@Test public void save(){
		
		for(int i=1;i<6;i++){
			Flash flash = new Flash();
			flash.setTitle("图片"+i);
			flash.setImageURL("/template/j2cms/images/imageNews/"+i+".jpg");
			flash.setLinkURL("http://www.yetnet.cn");
			flashService.save(flash);
		}
		
	}
	@Test public void update(){
		Flash flash = flashService.find(1);
		flash.setTitle("图片11");
		flashService.update(flash);
	}

}
