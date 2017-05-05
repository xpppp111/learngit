package order;
//商品各属性···
import java.sql.ResultSet;
import java.util.ArrayList;

import toolbean.DB;

public class GoodsBean {
	private String cid;
	private String cname;
	private float cprice;
	private int cnumber;
	private String cintro;
	private String cimage;
	
	public String getCintro() {
		return cintro;
	}

	public void setCintro(String cintro) {
		this.cintro = cintro;
	}

	public String getCimage() {
		return cimage;
	}

	public void setCimage(String cimage) {
		this.cimage = cimage;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public float getCprice() {
		return cprice;
	}

	public void setCprice(float cprice) {
		this.cprice = cprice;
	}


	public int getCnumber() {
		return cnumber;
	}

	public void setCnumber(int cnumber) {
		this.cnumber = cnumber;
	}
	//商品通过分页显示
	public ArrayList getGoodsByPage(int pageNo){
		int number=5;
		//每一页显示的记录数
		int begin=(pageNo*number)-4;
		int end=pageNo*number;
		int index=1;
		
		DB db=new DB();
		//要返回结果对象
		ArrayList goods=new ArrayList();
		String sql="select * from goods";
		ResultSet rs;
		//System.out.print(sql);
		try{
		rs=db.executeQuery(sql);
		while(rs.next()){
			//在begin之前的记录是不显示的
			if(index<begin){
				index++;
				continue;
			}
		
			//在 end之后的记录也不显示
			if(index>end) break;
			
			index++;
			String cid=rs.getString(1);
    		String cname=rs.getString(2);
    		float cprice=rs.getFloat(3);
    		int cnumber=rs.getInt(4);
    		String cintro=rs.getString(5);
    		String cimage=rs.getString(6);
    				
			GoodsBean g=new GoodsBean();
			g.setCid(cid);
    		g.setCname(cname);
            g.setCprice(cprice);
            g.setCnumber(cnumber);
            g.setCintro(cintro);
            g.setCimage(cimage);
            goods.add(g);
		}
		
	}catch(Exception e){
        e.printStackTrace();	
    }finally{
    	db.close();
    }
    return goods;
    }
	//根据商品的cid号找商品
    public GoodsBean findGoodsById(String cid){
    	try{
    		String sql="select * from goods where cid='"+cid+"'";
    	    DB db=new DB();
    	    ResultSet rs=db.executeQuery(sql);
    	    if(rs.next())
    	    {
    	    	//String cid=rs.getString(2); 
    	    	String cname=rs.getString(2);  
                float cprice=rs.getFloat(3);
                int cnumber=rs.getInt(4);
                String cintro=rs.getString(5);
        		String cimage=rs.getString(6);
                GoodsBean temp=new GoodsBean();
                temp.setCid(cid);
                temp.setCname(cname);
                temp.setCprice(cprice);
                temp.setCnumber(cnumber);
                temp.setCintro(cintro);
                temp.setCimage(cimage);
                db.close();
                return temp;
              }else{
            	  return null;
              }
    	
    	}catch(Exception e){
    		System.out.println(e.toString());
    		return null;
    	}
    }
    public int getPageCount(){
         try{//编写查询数据库信息的SQL语句
        	 String sql="select count(*) from goods";
        	 DB db=new DB();
        	 ResultSet rs=db.executeQuery(sql);
        	 int number=0;
        	 if(rs.next())
        		 number=Integer.parseInt(rs.getString(1));//???????
                 db.close();
                 return (number-1)/5+1;
         }catch(Exception e){
        	 return 0;
        }
    }	
}
