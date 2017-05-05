package order;

import java.sql.ResultSet;
import java.util.ArrayList;

import toolbean.DB;
//�����ĸ����ԡ�����
//import java.sql.ResultSet;
//
//import toolbean.DB;

public class OrderBean {
	private String orderid;
//	private String cid;
//	private int quantity;
	private String username;
	private String orderdate;
	private String orderstate;//����״̬
	private String address;
	private String receivename;//�ջ�������
	private String tele;
	private String zipcode;//�ʱ�
	private String paymode;//���ʽ

	public String getOrderid()
	{
		return orderid;
	}
	public void setOrderid(String orderid)
	{
		this.orderid=orderid;
	}
//	public String getCid() {
//		return cid;
//	}
//	public void setCid(String cid) {
//		this.cid = cid;
//	}
//	public int getQuantity() {
//		return quantity;
//	}
//	public void setQuantity(int quantity) {
//		this.quantity = quantity;
//	}
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username=username;
	}
	public String getOrderdate()
	{
		return orderdate;
	}
	public void setOrderdate(String orderdate)
	{
		this.orderdate=orderdate;
	}
	public String getOrderstate()
	{
		return orderstate;
	}
	public void setOrderstate(String orderstate)
	{
		this.orderstate=orderstate;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address=address;
	}
	public String getReceivename()
	{
		return receivename;
	}
	public void setReceivename(String receivename)
	{
		this.receivename=receivename;
	}
	public String getTele()
	{
		return tele;
	}
	public void setTele(String tele)
	{
		this.tele=tele;
	}
	public String getZipcode()
	{
		return zipcode;
	}
	public void setZipcode(String zipcode)
	{
		this.zipcode=zipcode;
	}
	public String getPaymode()
	{
		return paymode;
	}
	public void setPaymode(String paymode)
	{
		this.paymode=paymode;
	}
	public ArrayList getOrderByPage(int pageNo){
		int number=5;
		//ÿһҳ��ʾ�ļ�¼��
		int begin=(pageNo*number)-4;
		int end=pageNo*number;
		int index=1;
		
		DB db=new DB();
		//Ҫ���ؽ������
		ArrayList ordertable=new ArrayList();
		String sql="select * from ordertable";
		ResultSet rs;
		//System.out.print(sql);
		try{
		rs=db.executeQuery(sql);
		while(rs.next()){
			//��begin֮ǰ�ļ�¼�ǲ���ʾ��
			if(index<begin){
				index++;
				continue;
			}
		
			//�� end֮��ļ�¼Ҳ����ʾ
			if(index>end) break;
			
			index++;
			String orderid=rs.getString(1);
    		String username=rs.getString(2);
    		String orderdate=rs.getString(3);
    		String orderstate=rs.getString(4);
    		String address=rs.getString(5);
    		String receivename=rs.getString(6);
    		String tele=rs.getString(7);
    		String zipcode=rs.getString(8);
    		String paymode=rs.getString(9);
    				
			OrderBean o=new OrderBean();
			o.setOrderid(orderid);
    		o.setUsername(username);
            o.setOrderdate(orderdate);
            o.setOrderstate(orderstate);
            o.setAddress(address);
            o.setReceivename(receivename);
            o.setTele(tele);
            o.setZipcode(zipcode);
            o.setPaymode(paymode);
            ordertable.add(o);
		}
		
	}catch(Exception e){
        e.printStackTrace();	
    }finally{
    	db.close();
    }
    return ordertable;
    }
	//������Ʒ��cid������Ʒ
    public OrderBean findOrderById(String orderid){
    	try{
    		String sql="select * from ordertable where orderid='"+orderid+"'";
    	    DB db=new DB();
    	    ResultSet rs=db.executeQuery(sql);
    	    if(rs.next())
    	    {
    	    	//String cid=rs.getString(2); 
    			//String orderid=rs.getString(1);
        		String username=rs.getString(2);
        		String orderdate=rs.getString(3);
        		String orderstate=rs.getString(4);
        		String address=rs.getString(5);
        		String receivename=rs.getString(6);
        		String tele=rs.getString(7);
        		String zipcode=rs.getString(8);
        		String paymode=rs.getString(9);
                OrderBean temp=new OrderBean();

                temp.setOrderid(orderid);
                temp.setUsername(username);
                temp.setOrderdate(orderdate);
                temp.setOrderstate(orderstate);
                temp.setAddress(address);
                temp.setReceivename(receivename);
                temp.setTele(tele);
                temp.setZipcode(zipcode);
                temp.setPaymode(paymode);
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
         try{//��д��ѯ���ݿ���Ϣ��SQL���
        	 String sql="select count(*) from ordertable";
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
	/*public void add(ArrayList cart){
		//ת����Iterator
		Iterator i=cart.iterator();
		while(i.hasNext())
		{
			//�õ�һ��������
			Item temp=(Item)i.next();
			String cid=temp.getGoods().getCid();
			int quantity=temp.getQuantity();
		}
	}*/
	/*
	//�����û������Ҷ���
	public OrderBean findOrderByName(String username){
		DB db=new DB();
		try{
			String sql1="select * from ordertable where username='"+username+"'";
			ResultSet rs1=db.executeQuery(sql1);
			OrderBean ob=new OrderBean();
			while(rs1.next())
			{
				ob.setOrderid(rs1.getString(1));
				ob.setUsername(username);
				ob.setOrderdate(rs1.getString(3));
				ob.setOrderstate(rs1.getString(4));
				ob.setAddress(rs1.getString(5));
				ob.setReceivename(rs1.getString(6));
				ob.setTele(rs1.getString(7));
				ob.setZipcode(rs1.getString(8));
				ob.setPaymode(rs1.getString(9));
//				String orderid=rs1.getString(1);
//				String orderdate=rs1.getString(3);
//				String orderstate=rs1.getString(4);
//				String address=rs1.getString(5);
//				String receivename=rs1.getString(6);//�ջ�������
//				String tele=rs1.getString(7);
//				String zipcode=rs1.getString(8);//�ʱ�
//				String paymode=rs1.getString(9);//���ʽ
			}
			String sql2="select * from orderlist where orderid='"+orderid+"'";
			ResultSet rs2=db.executeQuery(sql2);
			if(rs2.next()){
//				String cid=rs2.getString(2);
//				int quantity=rs2.getInt(3);
				ob.setCid(rs2.getString(2));
				ob.setQuantity(rs2.getInt(3));
				return ob;
			}
 			else{
 				return null;
 			}
			
			}catch(Exception e){
				System.out.print(e.toString());
			return null;
		}
	}*/
	
}
