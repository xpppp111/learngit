package user;
//用户修改
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import order.UsersBean;

import toolbean.*;


public class ModifyServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ModifyServlet() {
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

		response.setCharacterEncoding("gb2312");
		
		UsersBean vb=new UsersBean();
		vb.setUsername(Tools.CodeToChinese(request.getParameter("username")));
		vb.setUserpass(request.getParameter("userpass"));
		vb.setBirthdate(request.getParameter("birthdate"));
		vb.setGender(Tools.CodeToChinese(request.getParameter("gender")));
		vb.setNativeplace(Tools.CodeToChinese(request.getParameter("nativeplace")));
		String id=request.getParameter("id");

		DB db=new DB();
		StringBuffer newsql=new StringBuffer();
		
		newsql.append("update user set username='");
		newsql.append(vb.getUsername());
		newsql.append("',userpass='");
		newsql.append(vb.getUserpass());
		newsql.append("',gender='");
		newsql.append(vb.getGender());
		newsql.append("',birthdate='");
		newsql.append(vb.getBirthdate());
		newsql.append("',nativeplace='");
		newsql.append(vb.getNativeplace());
		newsql.append("'where id=");
		newsql.append(id);
		try{

			HttpSession session=request.getSession();
						if(db.executeUpdate(newsql.toString())){
							//获取session对象
							session.setAttribute("msg","修改成功！");
							}
						else{
							session.setAttribute("msg","修改失败！");
						}
						response.sendRedirect("modifyuser.jsp");
		}catch(Exception e){
			System.out.print(e.toString());
		}finally{db.close();}
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
