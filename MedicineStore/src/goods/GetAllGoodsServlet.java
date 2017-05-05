package goods;

//获取商品
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.GoodsBean;

public class GetAllGoodsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetAllGoodsServlet() {

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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		// PrintWriter out = response.getWriter();
		// 获取用户的输入信息
		String pageNo = request.getParameter("pageNo");
		int iPageNo = 1;
		if (pageNo != null) {
			iPageNo = Integer.parseInt(pageNo);
		}
		// 调用JavaBean
		GoodsBean g = new GoodsBean();
		ArrayList goods = null;
		goods = g.getGoodsByPage(iPageNo);
		int pageCount = g.getPageCount();
		// 传值
		request.setAttribute("goods", goods);
		request.setAttribute("pageNo", new Integer(iPageNo));
		request.setAttribute("pageCounter", new Integer(pageCount));
		// 选择一个界面对用户进行响应
		String forward = "goodslist.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);

	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
