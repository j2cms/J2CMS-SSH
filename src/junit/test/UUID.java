package junit.test;


import org.junit.Test;

public class UUID {

	@Test
	public void test() {
		String uuid=java.util.UUID.randomUUID().toString();
        System.out.println(uuid);
	}
	
	

}
