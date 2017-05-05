package goods;
//���ﳵ�����Ʒ�����޸ĵȡ�cart.jsp
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
			//�õ�Ҫ��ӵ���Ʒ�ı��
			String cid=request.getParameter("cid");
			//�õ�ִ�����ɾ�������޸�
			String action=request.getParameter("action");
			action=Tools.CodeToChinese(action);
			//System.out.println("action="+action);
			//action=new String(action.getBytes("utf-8"));			

			String quantity=null;
			if(action.equals("�޸�"))
			{
				quantity=request.getParameter("quantity");
			}
			//����JavaBean����
			CartManager cartManager=new CartManager();
			//�õ�session����
			HttpSession session=request.getSession(true);
			//�õ����ﳵ����
			ArrayList cart=(ArrayList)session.getAttribute("cart");
			//��cart��ʼ��cartManager
			cartManager.setCart(cart);

			if(action.equals("�޸�"))
				{
				cartManager.update(cid, Integer.parseInt(quantity));//����
				}else
				{
					cartManager.delete(cid);//ɾ��
					}
			//�ѹ��ﳵ���´浽session
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
