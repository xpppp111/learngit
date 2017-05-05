package order;
//��ȡ����
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.OrderBean;


public class GetAllOrderServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetAllOrderServlet() {
		
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
		response.setContentType("text/html;charset=gb2312");
		String pageNo=request.getParameter("pageNo");
		int iPageNo=1;
		if(pageNo!=null)
		{
			iPageNo=Integer.parseInt(pageNo);
		}
		//����JavaBean
		OrderBean o=new OrderBean();
		ArrayList order=null;
		order=o.getOrderByPage(iPageNo);
		int pageCount=o.getPageCount();
		//��ֵ
		request.setAttribute("order",order);
		request.setAttribute("pageNo",new Integer(iPageNo));
		request.setAttribute("pageCounter", new Integer(pageCount));
		//ѡ��һ��������û�������Ӧ
		String forward="ordermanage.jsp";
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request, response);
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
		
	}
	public void init() throws ServletException {
		// Put your code here
	}

}