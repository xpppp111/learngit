<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="toolbean.DB" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ɾ����Ʒ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <br/>
  
    <%String sql="delete from goods where cid='"+request.getParameter("cid")+"'";
    DB db=new DB();
    boolean mark=db.executeUpdate(sql);
    if(mark){session.setAttribute("msg1","ɾ���ɹ�");}
    else{session.setAttribute("msg1","ɾ��ʧ��");}
    response.sendRedirect("goodmanage.jsp");
    %>
  </body>
</html>
