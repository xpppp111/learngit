<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.DataSource"%>
<%@page import="toolbean.DB"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>用户管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<jsp:useBean id="db" class="toolbean.DB" scope="page"></jsp:useBean>
		<link rel="stylesheet" type="text/css" href="images/style.css" />
		<style type="text/css">
<!--

body{
	align:center;
	}
#main {
	width: 900px;
	height: auto;
	margin-top: auto;
	margin-right: 62px;
	margin-bottom: auto;
	margin-left: auto;
}

#head {
	height: 181px;
	width: 900px;
}
#left {
	float: left;
	height: 650px;
	width: 500px;
	background-image: url(images/left_bg.gif);
	background-repeat: repeat-y;
}
#right {
	float: right;
	width: 400px;
	height: 650px;
	background-image: url(images/center_bg.gif);
}
.STYLE1 {
	font-size: 13px;
	color: #FFFFFF;
	vertical-align: text-bottom;
}
#headright {
	float: right;
	height: 30px;
	width: 200px;
	margin-bottom: 10px;
	margin-top: 10px;
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
color:#f7a849
}
.STYLE2 {font-size: 24px}
table,td{ border: 1px dashed gray;BORDER-COLLAPSE:COLLAPSE} 
-->
</style>
	</head>

	<body>

		<div class="main" id="main">

			<div id="head">
				<div class="header">
					<div class="logo">
					</div>
					<div id="headright">
						<table border="0">
							<tr>
								<td class="STYLE1">
									<a href="login.jsp">登录</a>
								</td>
								<td class="STYLE1">
									<a href="reg.jsp">注册</a>
								</td>
								<td class="STYLE1">
									<img src="images/cart.gif" width="21" height="18" />
									<a href="cart.jsp">购物车</a>
								</td>
								<td class="STYLE1">
									<a href="showorder.jsp">我的订单</a>
								</td>
							</tr>
						</table>
					</div>
					<div id="menu">
						<ul>
							<li class="selected">
								<a href="index.jsp">主页</a>
							</li>
							<li>
								<a href="GetAllGoodsServlet?pageNo=1">望</a>
							</li>
							<li>
								<a href="GetAllGoodsServlet?pageNo=1">闻</a>
							</li>
							<li>
								<a href="GetAllGoodsServlet?pageNo=1">问</a>
							</li>
							<li>
								<a href="GetAllGoodsServlet?pageNo=1">切</a>
							</li>
							<li>
								<a href="GetAllGoodsServlet?pageNo=1">论坛管理</a>
							</li>

						</ul>

					</div>
				</div>
			</div>
			<div id="left">
				<br />
				<br />
				<%
				if (session.getAttribute("username") != null) {
				%>
				<%
				String sql = "select * from user";
				%>
				<center>
					<span class="form_row STYLE2">用户管理</span>
				</center>
				<hr>
				<%
							if (session.getAttribute("msg") != null) {
							out.print(session.getAttribute("msg"));
							session.setAttribute("msg", null);
						}
				%>
				<%
							try {
							ResultSet rs = db.executeQuery(sql);
				%>
				<table>
					<tr>
						<td>
							序号
						</td>
						<td>
							用户名
						</td>
						<td>
							出生年月
						</td>
						<td>
							性别
						</td>
						<td>
							籍贯
						</td>
						<td>
							操作
						</td>
					</tr>
					<%
								int i = 1;
								while (rs.next()) {
							String deleteurl = "deleteuser.jsp?id=" + rs.getInt(1);
							String modifyurl = "modifyuser.jsp?id=" + rs.getInt(1);
					%>
					<tr>
						<td>
							&nbsp;
							<%=i%>
						</td>
						<td>
							&nbsp;
							<%=rs.getString(2)%>
						</td>
						<td>
							&nbsp;
							<%=rs.getString(4)%>
						</td>
						<td>
							&nbsp;
							<%=rs.getString(5)%>
						</td>
						<td>
							&nbsp;
							<%=rs.getString(6)%>
						</td>
						<td>
							&nbsp;
							<a href="<%=deleteurl%>">删除</a>&nbsp;
							<a href="<%=modifyurl%>">修改 </a>
						</td>
					</tr>
					<%
								i++;
								}
					%>
				</table>
				<%
							} catch (Exception e) {
							out.print(e.toString());
						} finally {
							db.close();
						}
				%>
				<%
				} else {
				%>

				<h2>
					错误提示
				</h2>
				<hr>
				<div id="back">
					您还未登录,请
					<a href="adlogin.jsp">登陆</a>
				</div>
				<%
				}
				%>
				<div id="back">
					<a href="manage.jsp">>>返回</a>
				</div>
			</div>
			<div id="right">
				<br>
				<br />
				<p class="title">
					&nbsp;&nbsp; 本草仁堂
				</p>
				<br />
				<br />
				<p class="details">
					<img src="images/huangcen.gif" align="right" />
					&nbsp;&nbsp;本草仁堂(www.bcrt.com) - 专业的药材网上商城,可提供包括中药材、中草药、
						滋补药材、药材工具、等数万种药材商品直销,便捷，诚信的服务,为您提供愉悦的网上购物旅程！
				</p>
				<br />
				
				<div align="center">
					<img src="images/border.gif" />
				</div>
				
				<br>
				<p class="title">
					&nbsp;&nbsp; 促销产品
				</p>
				<br />
				<br />
				<br />
				<p>
					&nbsp;
					<img src="images/tsxl.gif"/>
				</p>
				<br />
				<p height="37">
				<div align="center">
					<img src="images/border.gif" />
				</div>
				
				<p align="center">
					&nbsp;
					<a href="adlogin.jsp">用户管理</a>
				</p>
			</div>
		</div>
	</body>
</html>
