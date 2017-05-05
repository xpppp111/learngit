<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.DataSource"%>
<%@page import="toolbean.DB" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>销售统计_wy</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:useBean id="db" class="toolbean.DB" scope="page" ></jsp:useBean>
	<link rel="stylesheet" type="text/css" href="images/style.css" />
<style type="text/css">
<!--
#main {
	width: 900px;
	height: auto;
	margin: auto;
}
#head {
	height: 181px;
	width: 900px;
}
#left {
	float: left;
	height: 650px;
	width: 900px;
	background-image: url(images/left_bg.gif);
	background-repeat: repeat-y;
}

.STYLE1 {
	font-size: 13px;
	color: #FFFFFF;
	vertical-align: text-bottom;
}

.header{
width:900px;
height:181px;
background:url(images/header.jpg) no-repeat center;
}

#menu{
width:900px;
height:30px;
padding:55px 0 0 10px;
}
#menu ul{
display:block;
list-style:none;
padding:9px 0 0 10px;
margin:0px;
}
#menu ul li{
display:inline;
padding:0px;
margin:0px;
height:20px;
}
#menu ul li a{
height:27px;
display:block;
padding:0px 10px 0 10px;
margin:0 4px 0 4px;
_margin:0 2px 0 2px;
float:left;
text-decoration:none;
text-align:center;
color:#fff;
font-size:13px;
line-height:25px;
}
#menu ul li.selected a{
height:27px;
display:block;
padding:0px 10px 0 10px;
margin:0 5px 0 5px;
float:left;
text-decoration:none;
text-align:center;
color:#f7a849;
font-size:13px;
line-height:25px;
}
#menu ul li a:hover{
color:#f7a849;
}
table,td{ border: 1px dashed gray;BORDER-COLLAPSE:COLLAPSE} 
.STYLE10 {font-size: 18px}
.STYLE8 {font-size: 24px}
#Layer1 {	position:absolute;
	width:423px;
	height:30px;
	z-index:1;
	left: 222px;
	top: 234px;
}
-->
</style>
  </head>
  
  <body>
  <div id="head"><div class="header">
    <div class="logo"><a href="index.jsp"><br></a></div>
	<div id="headright">
	<table border="0">
  <tr>
    <td class="STYLE1"><a href="login.jsp">登录</a></td>
    <td class="STYLE1"><a href="reg.jsp"><b>注册</b></a></td>
    <td class="STYLE1"><img src="images/cart.gif" width="21" height="18" /><a href="cart.jsp">购物车</a></td>
    <td class="STYLE1"><a href="showorder.jsp">我的订单</a></td>
  </tr>
</table>
</div>
   
   </div> 
   <table width="900" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="center"><a href="index.jsp"><strong>主页</strong></a></div></td>
    <td><div align="center"><a href="yaocaiinfo.jsp"><strong>本草大全</strong></a></div></td>
    <td><div align="center"><a href="GetAllGoodsServlet?pageNo=1"><strong>本草选购中心</strong></a></div></td>
    <td><div align="center"><a href="cart.jsp"><strong>购物车</strong></a></div></td>
    <td><div align="center"><a href="showorder.jsp"><strong>我的订单</strong></a></div></td>
    <td><div align="center"><a href="usermanage1.jsp"><b>我的资料</b></a></div></td>
  </tr>
</table>
  <div id="left">
  <br/>
  <center>
    <p class="form_row STYLE2">　　</p>
    <p class="form_row STYLE2">　　　　　　　商品销售量统计
</p>
  </center><br>
    
		
    <br>
    <table width="900" border="1">
    <tbody>
    <tr>
    <td>商品编号</td>
    <td>销售量</td>
    </tr>
    <%!
    String num,sum;
     %>
	<%
	try{
		String sql1="select cid, count(quantity) from orderlist group by cid order by count(quantity) desc";
		ResultSet rs1=db.executeQuery(sql1);
		while(rs1.next()){
		%>
    <tr>
    <td><%=rs1.getString(1)%></td>
   
    <td><%=rs1.getString(2)%></td>
	</tr>
    <%}
    }catch(Exception e){
			System.out.print(e.toString());
		}finally{db.close();}%> 
    </tbody>
    </table>
	<br/>
	<br/>
  </div>
 
  </div>
</body>
</html>
