package toolbean;

//���봴��Ӧ������Ҫ�õ�����
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
	private String classname="com.mysql.jdbc.Driver";	//���ݿ�������·��
	private String url="jdbc:mysql://122.204.82.135:3306/class"; //���ݿ�URL
	private String user="root";	//��¼���ݿ���û���
	private String pwd="123456";	//��¼���ݿ������
	
	private Connection conn=null;	//����һ��Connection����
	private Statement stmt=null; //����һ��Statement����
	private ResultSet rs=null;
	
	/*ͨ�����췽���������ݿ�����*/
	public DB(){	//DB��Ĺ��췽��
		try{	//����ʹ��try catch��䲶��������ݿ�����ʱ���ܷ������쳣
			Class.forName(classname).newInstance();	//�������ݿ�����
		}catch (Exception e){
			e.printStackTrace();	//����쳣��Ϣ
			System.out.println("�������ݿ�����ʧ�ܣ���");
		}		
	}
	/*�������ݿ�����*/
	public void createConn(){
		try{
			conn=DriverManager.getConnection(url, user, pwd);
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("��ȡ���ݿ�����ʧ�ܣ���");
		}		
	}
	
	/*��ȡStatement����*/
	public void getStmt(){
		createConn();
		try{
			//����Connection��ʵ����createStatement()��������һ��Statement�����
			stmt=conn.createStatement();
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("����Statement����ʧ�ܣ���");			
		}
	}
	
	/*���������ݿ���в��������ӡ�ɾ�����޸ĵ�executeUpdate()����*/
	public boolean executeUpdate(String sql){
		boolean mark=false;
		try{
			getStmt();	//����һ��Statement����
			int iCount=stmt.executeUpdate(sql);	//ִ�в���������ȡ��Ӱ��ļ�¼��
			if(iCount>0)	//�������ݿ�ɹ�
				mark=true;
			else			//����ʧ��
				mark=false;			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return mark;
	}
	
	/*��ѯ���ݿ�*/
	public ResultSet executeQuery(String sql){
		
		try{
			getStmt();
			try{
				rs=stmt.executeQuery(sql);
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("��ѯ���ݿ�ʧ�ܣ���");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return rs;
	}
	public void close(){
		try{if(rs!=null)rs.close();}catch(Exception e){}
		try {stmt.close();}catch(Exception e){}
		try {conn.close();}catch(Exception e){}
	}
}
