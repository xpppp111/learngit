package user;
//һ���û���¼
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import toolbean.DB;
import toolbean.Tools;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String userid=Tools.CodeToChinese(request.getParameter("username"));
		//System.out.print(userid);
		String userpass=request.getParameter("userpass");
		DB db=new DB();
		String sql="select * from user where username='"+userid+"'and userpass='"+userpass+"'";
		try{
			HttpSession session=request.getSession();
		    if(db.executeQuery(sql).next()){//��¼�ɹ�,��session������Ϣ
		    	session.setAttribute("username",userid);
				session.setAttribute("code", "��ӭ�㣡"+userid);
				}
		    else{
				//��¼ʧ��
		    	session.setAttribute("username",null);
				session.setAttribute("code", "��¼ʧ�ܣ�");
				}
		    request.getRequestDispatcher("index.jsp").forward(request,response);
		}catch(Exception e){
			System.out.print(e.toString());
		}finally{db.close();}
		
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
