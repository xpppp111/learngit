package user;
//π‹¿Ì‘±µ«¬º
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import toolbean.DB;
import toolbean.Tools;

public class adLoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public adLoginServlet() {
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

		response.setContentType("text/html");
		String userid=Tools.CodeToChinese(request.getParameter("username"));
		//System.out.print(userid);
		String userpass=request.getParameter("userpass");
		DB db=new DB();
		String sql="select * from user where username='"+userid+"'and userpass='"+userpass+"'";
		try{		
		    if(db.executeQuery(sql).next()){
		    	request.getRequestDispatcher("manage.jsp").forward(request,response);
				}
		    else{
		    	request.getRequestDispatcher("adlogin.jsp").forward(request,response);
		    }
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
