package junit.test;

import org.j2cms.utils.WebUtil;
import org.junit.Test;



public class WebUtilsTest {
	@Test
	public void Test()
	{
	Integer i = WebUtil.StrToInt("1");
	System.out.println(i);
	}

}
