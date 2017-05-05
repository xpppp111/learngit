package goods;
//�����Ʒ��addgoods.jsp
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.*;
import toolbean.DB;
import toolbean.Tools;

public class addGoodsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public addGoodsServlet() {
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
		
		PreparedStatement pstmt=null;
		Connection conn=null;
		String ext="", url="upload/";
		SmartUpload su=new SmartUpload();  //�����µ��ϴ�����
		long maxsize=200*1024; //����ÿ���ϴ��ļ����Ϊ200KB
		DB db=new DB();
		

		try{
		    su.initialize(this.getServletConfig(), request, response); //��ʼ��
		    su.setMaxFileSize(maxsize); //�����ϴ��ļ��Ĵ�С
		    su.setAllowedFilesList("jpg,JPG,gif,GIF"); //�趨�����ϴ��ĸ�ʽ
		    su.upload(); //�ϴ��ļ�
		    
		    Request req=su.getRequest(); //����Request����

			String cid=req.getParameter("cid");
			String cname=req.getParameter("cname");
			String number=req.getParameter("cnumber");
			String price=req.getParameter("cprice");
			String cintro=req.getParameter("cintro");
			//��ʽת��			
			int cnumber=Integer.parseInt(number);
			float cprice=Float.parseFloat(price);
			
		    //��ȡ�ϴ����ļ�����Ϊֻ�ϴ���һ���ļ������Կ�ֱ�ӻ�ȡ
		    com.jspsmart.upload.File myfile=su.getFiles().getFile(0);
		    HttpSession session=request.getSession();
		    
		    if(!myfile.isMissing()){
			ext=myfile.getFileExt();  //ȡ����չ��
			Calendar cal=Calendar.getInstance();
			String filename=String.valueOf(cal.getTimeInMillis());
			String saveurl=request.getRealPath("/")+url;
			saveurl+=filename+"."+ext;  //saveurlΪ����ͼƬ�ľ���·��

			//���ô浽���ݿ��е�·��
			String cimage=url+filename+"."+ext;
			int cmark=0;
			String sql="insert into goods(cid,cname,cprice,cnumber,cintro,cimage) values (?,?,?,?,?,?)";
			conn=DriverManager.getConnection("jdbc:mysql://122.204.82.135:3306/class","root","123456");
			//conn=db.createConn();
			conn.setAutoCommit(true);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,cid);
			pstmt.setString(2,cname);
			pstmt.setFloat(3,cprice);
			pstmt.setInt(4,cnumber);
			pstmt.setString(5,cintro);
			pstmt.setString(6,cimage);
			cmark=pstmt.executeUpdate();
					
			if(cmark==1){
				//���ļ����浽ָ��Ŀ¼��
				myfile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL); 
				session.setAttribute("msg1","��ӳɹ���");
			}else{
				session.setAttribute("msg1","���ʧ�ܣ�");
			}
		    }
			else{
				session.setAttribute("msg1","��ѡ��Ҫ�ϴ����ļ�");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
			try {pstmt.close();}catch(Exception e){}
			try {conn.close();}catch(Exception e){}
		}
		    RequestDispatcher rd=request.getRequestDispatcher("goodmanage.jsp");
		    rd.forward(request,response);
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
