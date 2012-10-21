package junit.test;


import java.util.List;

import org.j2cms.model.channel.Channel;
import org.j2cms.service.ChannelService;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



public class ChannelTest {
	private static ChannelService channelService;
	private static ApplicationContext cxt;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			cxt = (ApplicationContext) new ClassPathXmlApplicationContext(
					"applicationContext.xml");
			channelService = (ChannelService) cxt.getBean("channelServiceImpl");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
	}
	@Test public void save(){
		for (int i =12;i<21;i++){
		Channel channel = new Channel();
		channel.setName("栏目"+i);
		channel.setInfo("栏目说明"+i);
		channel.setFather(new Channel(i-1));
		channel.setRankid(0);
		channelService.save(channel);
		}
	}
	@Test public void finds(){
		List<Channel> channels = (List<Channel>) channelService.getScrollData(0, 10, "o.father=?1",new Object[]{new Channel(1)});
		System.out.println();
		
	}

}
