package goods;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import order.GoodsBean;
import order.UsersBean;

import toolbean.DB;
import toolbean.Tools;

public class goodsModifyServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public goodsModifyServlet() {
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
		
		GoodsBean gb=new GoodsBean();
		//gb.setCid(request.getParameter("cid"));
		gb.setCname(Tools.CodeToChinese(request.getParameter("cname")));
		gb.setCprice(Float.parseFloat(request.getParameter("cprice")));
		gb.setCnumber(Integer.parseInt(request.getParameter("cnumber")));
		gb.setCintro(Tools.CodeToChinese(request.getParameter("cintro")));
		gb.setCimage(request.getParameter("cimage"));

		StringBuffer newsql=new StringBuffer();
		newsql.append("update goods set cname='");
		//newsql.append(gb.getCid());
		//newsql.append("',cname='");
		newsql.append(gb.getCname());
		newsql.append("',cprice='");
		newsql.append(gb.getCprice());
		newsql.append("',cnumber='");
		newsql.append(gb.getCnumber());
		newsql.append("',cintro='");
		newsql.append(gb.getCintro());
		newsql.append("',cimage='");
		newsql.append(gb.getCimage());
		newsql.append("' where cid='");
		newsql.append(request.getParameter("cid"));
		newsql.append("'");
		
		DB db=new DB();
		
		try{
			System.out.println(newsql.toString());
			HttpSession session=request.getSession();
						if(db.executeUpdate(newsql.toString())){
							//获取session对象
							session.setAttribute("msg1","修改成功！");
							}
						else{
							session.setAttribute("msg1","修改失败！");
						}
						response.sendRedirect("goodmanage.jsp");
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
