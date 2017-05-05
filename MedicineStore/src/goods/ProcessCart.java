package goods;
//购物车里的商品数量修改等。cart.jsp
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import order.CartManager;

import toolbean.Tools;

public class ProcessCart extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProcessCart() {
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

		try{
			//得到要添加的物品的编号
			String cid=request.getParameter("cid");
			//得到执行命令：删除还是修改
			String action=request.getParameter("action");
			action=Tools.CodeToChinese(action);
			//System.out.println("action="+action);
			//action=new String(action.getBytes("utf-8"));			

			String quantity=null;
			if(action.equals("修改"))
			{
				quantity=request.getParameter("quantity");
			}
			//创建JavaBean对象
			CartManager cartManager=new CartManager();
			//得到session对象
			HttpSession session=request.getSession(true);
			//得到购物车对象
			ArrayList cart=(ArrayList)session.getAttribute("cart");
			//用cart初始化cartManager
			cartManager.setCart(cart);

			if(action.equals("修改"))
				{
				cartManager.update(cid, Integer.parseInt(quantity));//更新
				}else
				{
					cartManager.delete(cid);//删除
					}
			//把购物车重新存到session
			session.setAttribute("cart", cartManager.getCart());
		}catch(Exception e){
			//out.println(e.toString());
		}
		response.sendRedirect("cart.jsp");
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

		doGet(request,response);
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
