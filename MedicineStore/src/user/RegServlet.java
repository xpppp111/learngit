package user;
//用户<b>注册</b>
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import order.UsersBean;

import toolbean.*;

public class RegServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RegServlet() {
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


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("gb2312");
		
		UsersBean vb=new UsersBean();
		vb.setUsername(Tools.CodeToChinese(request.getParameter("username")));
		vb.setUserpass(request.getParameter("userpass"));
		vb.setBirthdate(request.getParameter("birthdate"));
		vb.setGender(Tools.CodeToChinese(request.getParameter("gender")));
		vb.setNativeplace(Tools.CodeToChinese(request.getParameter("nativeplace")));
			
		//用以建立数据库连接的必要信息
		String url="jdbc:mysql://122.204.82.135:3306/class";
		String user="root";
		String password="123456";
		String sql=""; //省略号表示要输入具体的sql语句
		//创建各个对象
		Connection conn=null; //建立数据库连接的对象
		Statement stmt=null; //创建用于执行SQL语句的Statement对象
		ResultSet rs=null; //创建结果集对象

		try{
		sql="select * from user where username='"+vb.getUsername()+"'";
		conn=DriverManager.getConnection(url, user, password);
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		HttpSession session=request.getSession();
		
		
		
		if(rs.next()){
			session.setAttribute("msg_error","<b>注册</b>名已用");
			response.sendRedirect("reg.jsp");
		}
		
		else{
		StringBuffer newsql=new StringBuffer();
		newsql.append("insert into user (username, userpass, gender,birthdate,nativeplace) values ('");
		newsql.append(vb.getUsername());
		newsql.append("','");
		newsql.append(vb.getUserpass());
		newsql.append("','");
		newsql.append(vb.getGender());
		newsql.append("','");
		newsql.append(vb.getBirthdate());
		newsql.append("','");
		newsql.append(vb.getNativeplace());
		newsql.append("')");
		stmt.executeUpdate(newsql.toString());
		session.setAttribute("msg","<b>注册</b>成功！");
		session.setAttribute("username",vb.getUsername());
		response.sendRedirect("regMsg.jsp");
		}
		
	}catch(Exception e){
		System.out.print(e.toString());
	}finally{
	try{rs.close();}catch(Exception ee){}
	try{stmt.close();}catch(Exception ee){}
	try{conn.close();}catch(Exception ee){}
	}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here  加载驱动
		String classname="com.mysql.jdbc.Driver";
		try{
			Class.forName(classname);
		}catch(ClassNotFoundException ce){
			throw new ServletException("加载数据库驱动失败");
		}

	}

}
