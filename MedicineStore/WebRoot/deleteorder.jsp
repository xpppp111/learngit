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
    
    <title>È¡Ïû¶©µ¥</title>
    
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
  
    <%
    String orderid=request.getParameter("orderid");
    System.out.println(orderid);
    
    String sql="delete from ordertable where orderid='"+orderid+"'";
    DB db=new DB();
    boolean mark=db.executeUpdate(sql);
    if(mark){
    response.sendRedirect("showorder.jsp");}
    else{
    System.out.println("111111");
    }
    %>
  </body>
</html>
