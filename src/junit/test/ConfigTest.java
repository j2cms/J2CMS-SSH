package junit.test;

import org.j2cms.model.config.Config;
import org.j2cms.service.ConfigService;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class ConfigTest {
	private static ApplicationContext cxt;
	private static  ConfigService configService;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {//从Spring的配置文件中获取Bean
			cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
			configService = (ConfigService)cxt.getBean("configServiceImpl");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
	}
	@Test public void save(){
		Config config = new Config();
		config.setName("易乐网络");
		config.setCompany("武汉易乐网络有限公司");
		config.setDomain("127.0.0.1:8080/j2cmsSSH");
		config.setCopyright("YetNet 2010 All right reserved");
		config.setEmail("admin@yetnet.cn");
		config.setTemplate("j2cms");
		config.setRecordCode("鄂ICP备08102130号");
		configService.save(config);
	}
	@Test public void update(){
		Config config = configService.find(1);
		System.out.println(config.getCompany());
		config.setCompany("易乐网络有限公司");
		configService.update(config);
	}
	/**
	 * 传统的直接单元测试的方法,采用Service中的方法进行单元测试的时候如上
	 */
//	@Test public void save2(){
//		EntityManagerFactory factory = Persistence.createEntityManagerFactory("j2cms");//sessionFactory
//		EntityManager em = factory.createEntityManager();
//		em.getTransaction().begin();//开始事务
//		Config config = new Config("11","22","33","44","55","66","77");
//		em.persist(config);//对应级联操作 CascadeType.PERSIST
//		em.getTransaction().commit();		
//		em.close();
//		factory.close();
//	}
}
