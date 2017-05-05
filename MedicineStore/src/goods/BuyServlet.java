package goods;
//添加订单详情，addinfo.jsp
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import order.Item;
import order.OrderBean;

import toolbean.DB;
import toolbean.Tools;

public class BuyServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BuyServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		OrderBean ob=new OrderBean();

		ob.setUsername(Tools.CodeToChinese(request.getParameter("username")));
		ob.setAddress(Tools.CodeToChinese(request.getParameter("address")));
		ob.setReceivename(Tools.CodeToChinese(request.getParameter("receivename")));
		ob.setTele(request.getParameter("tele"));
		ob.setZipcode(request.getParameter("zipcode"));
		ob.setPaymode(Tools.CodeToChinese(request.getParameter("paymode")));
		
		//获取当前的时间
		java.util.Date day=new java.util.Date();
		//格式化成yyyyMMdd格式，注意大小写
		SimpleDateFormat format=new SimpleDateFormat("yyyyMMdd");
		//订单时间
		String orderdate=format.format(day);
		
		
		//生成订单号
		String now=(String)(day.toLocaleString());  //当前的日期时间
		//查询当天的订单数目
		String sql="select count(*) from ordertable where orderdate='"+orderdate+"'";
		DB db=new DB();		
		ResultSet rs=null;
		int i=0;
		try{
			rs=db.executeQuery(sql);
			if(rs.next()){
				i=Integer.parseInt(rs.getString(1)); //获取了当天的订单数目
			}
			i++;	//此订单的序号
		}catch(Exception e){e.printStackTrace();}finally{db.close();}
		String str_i=String.valueOf(i); //转成字符串格式
		while(str_i.length()<3){	//格式化成三位的字符串
		str_i="0"+str_i;
		}
		String orderid=now+str_i;	
		orderid=orderid.replace("-","");	//将日期格式中的特别符号（空格等）除去
		orderid=orderid.replace(" ","");
		orderid=orderid.replace(":","");
		
		PreparedStatement pstmt=null;
		Connection conn=null;
		int mark1=0;
		int mark2=0;
		String sql1="insert into ordertable values (?,?,?,?,?,?,?,?,?)";
		String sql2="insert into orderlist values (?,?,?)";
		
		try{
			conn=DriverManager.getConnection("jdbc:mysql://122.204.82.135:3306/class","root","123456");
			//得到session对象
			HttpSession session =request.getSession(true);
			//得到购物车对象			
			ArrayList cart=(ArrayList)session.getAttribute("cart");
			//转换成Iterator
			Iterator it=cart.iterator();
			
			conn.setAutoCommit(false);
			//添加到订单表
			pstmt=conn.prepareStatement(sql1);
			pstmt.setString(1,orderid);
			pstmt.setString(2,ob.getUsername());
			pstmt.setString(3,orderdate);
			pstmt.setString(4,"0");
			pstmt.setString(5,ob.getAddress());
			pstmt.setString(6,ob.getReceivename());
			pstmt.setString(7,ob.getTele());
			pstmt.setString(8,ob.getZipcode());
			pstmt.setString(9,ob.getPaymode());
			mark1=pstmt.executeUpdate();
			
			while(it.hasNext())
			{
				//得到一个购物项
				Item temp=(Item)it.next();
				String cid=temp.getGoods().getCid();
				int quantity=temp.getQuantity();
				//添加到订单明细表
				pstmt=conn.prepareStatement(sql2);
				pstmt.setString(1,orderid);
				pstmt.setString(2,cid);
				pstmt.setInt(3,quantity);
				mark2=pstmt.executeUpdate();
//				System.out.println(orderid);
//				System.out.println(cid);
//				System.out.println(quantity);
			}
			
//			System.out.println(mark2);
			conn.commit();	//提交事务
		    conn.close();
		    if(mark1==1&&mark2==1){
				session.setAttribute("msg2","添加订单成功！");
			}
			else{
				session.setAttribute("msg2","添加订单失败！");
			}
		    request.getRequestDispatcher("showorder.jsp").forward(request,response);
		}catch(Exception e){
			try{
				conn.rollback();	//出错回滚
			}catch(SQLException ee){
				ee.printStackTrace();
			    }
			e.printStackTrace();
		}finally{
			db.close();
			try {pstmt.close();}catch(Exception e){}
			try {conn.close();}catch(Exception e){}
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
