package junit.test;

import static org.junit.Assert.*;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.apache.struts2.ServletActionContext;
import org.junit.BeforeClass;
import org.junit.Test;

public class HostTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void test() {
		InetAddress addr;
		try {
			addr = InetAddress.getLocalHost();
			String ip=addr.getHostAddress().toString();//获得本机IP
			String domain=addr.getHostName().toString();//获得本机名称
//			String address=addr.get
			String path = ServletActionContext.getServletContext().getRealPath("/");
			System.out.println("+=============================================================");
			System.out.println("ip="+ip+"    "+"domain="+path);
			System.out.println("+=============================================================");
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		fail("Not yet implemented");
	}

}
