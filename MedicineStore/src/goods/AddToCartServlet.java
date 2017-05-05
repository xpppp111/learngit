package goods;
//添加物品到购物车
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import order.CartManager;
import order.GoodsBean;


public class AddToCartServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddToCartServlet() {
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

		response.setCharacterEncoding("gb2312");
		try{
			//得到要添加的物品的编号
			String cid=request.getParameter("cid");
			//创建JavaBean对象
			CartManager cartManager=new CartManager();
			//得到session对象
			HttpSession session =request.getSession(true);
			//得到购物车对象			
			ArrayList cart=(ArrayList)session.getAttribute("cart");
		
		//用cart初始化cartManager
		cartManager.setCart(cart);
		//构造物品对象
		GoodsBean g=new GoodsBean();
		g=g.findGoodsById(cid);
		cartManager.addToCart(g,1);
		//先把购物车重新存到session
		session.setAttribute("cart", cartManager.getCart());
		
		}catch(Exception e){
			
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
