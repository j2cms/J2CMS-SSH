package junit.test;

import java.lang.reflect.ParameterizedType;
import java.util.LinkedList;
import java.util.List;

import org.junit.Test;

public class GenericTest
{
	public List<String> list = new LinkedList<String>();
	
	@Test  public void test( Object o)  throws SecurityException, NoSuchFieldException 
	{
		ParameterizedType pt = (ParameterizedType) this.getClass().getField(o.getClass().getSimpleName()).getGenericType();  
        System.out.println(pt.getActualTypeArguments().length);  
        System.out.println(pt.getActualTypeArguments()[0]);  
	}
	

	int main(){
		try {
			test(list);
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  0;
	}
}
