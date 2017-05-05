package order;

public class UsersBean {
	private String username;
	private String userpass;
	private String reuserpass;
	private String gender;
	private String birthdate;
	private String nativeplace;
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username=username;
	}
	public String getUserpass()
	{
		return userpass;
	}
	public void setUserpass(String userpass)
	{
		this.userpass=userpass;
		
	} 
	public void setReuserpass(String reuserpass){
		this.reuserpass=reuserpass;		
	}
	public String getReuserpass(){
		return this.reuserpass;
	}
	public void setGender(String gender){
		this.gender=gender;		
	}
	public String getGender(){
		return this.gender;
	}
	
	
	public void setBirthdate(String birthdate){
		this.birthdate=birthdate;		
	}
	public String getBirthdate(){
		return this.birthdate;
	}
	
	
	public void setNativeplace(String nativeplace){
		this.nativeplace=nativeplace;		
	}
	public String getNativeplace(){
		return this.nativeplace;
	}
	
}
	
