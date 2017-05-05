package toolbean;

public class Tools {
	public static String CodeToChinese(String str){
		String s=str;
		try{
		byte tempB[]=s.getBytes("ISO-8859-1");
		s=new String(tempB);
		return s;
		}catch(Exception e){
			return s;
		}
		}
}
