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

		<title>商品修改_wy</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="images/style.css" />
		<style type="text/css">
<!--

body{
	text-align:center;
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
-->
</style>
	</head>

	<body>

		<div class="main" id="main">

			<div id="head">
				<div class="header">
					<div class="logo">
						<a href="index.jsp"><br>
						</a>
					</div>
					<div id="headright">
						<table border="0">
							<tr>
								<td class="STYLE1">
									<a href="login.jsp">登录</a>
								</td>
								<td class="STYLE1">
									<a href="reg.jsp"><b>注册</b></a>
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
				<br />
				<br />
				<center>
					<span class="form_row STYLE2">商品修改</span>
				</center>

				<!-- 把cid号传给 goodsModifyServlet-->
				<form name="form1"
					action="goodsModifyServlet?cid=<%=request.getParameter("cid")%>"
					method="post" onSubmit=" isValidate(form1)">
					<%
						Connection conn = null;
						ResultSet rs = null;
						Statement stmt = null;
						String sql = "select * from goods where cid='"+ request.getParameter("cid") + "'";
						try {
							conn = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/class", "root", "zaq123456");
							stmt = conn.createStatement();
							rs = stmt.executeQuery(sql);
					%>
					<%
					if (rs.next()) {
					%>
					<br />
					<br />
					商品名称:
					<input type="text" name="cname" size="22"
						value="<%=rs.getString(2)%>">
					<br />
					<br />
					商品数量:
					<input type="text" name="cnumber" size="22"
						value="<%=rs.getInt(4)%>">
					<br />
					<br />
					商品价格:
					<input type="text" name="cprice" size="22"
						value="<%=rs.getFloat(3)%>">
					<br />
					<br />
					商品介绍:
					<textarea name="cintro" rows="3" cols="20">
						<%=rs.getString(5)%>
					</textarea>
					<br />
					<br />
					商品图片:
					<input type="text" name="cimage" size="22"
						value="<%=rs.getString(6)%>">
					<br />
					<br />
					<br />
					<input type="submit" value="提交" />
					&nbsp;&nbsp;
					<input type="reset" value="重置" />
					<%
					}
					%>
					<%
							} catch (Exception e) {
							throw new ServletException(e);
						} finally {
							try {
								rs.close();
							} catch (SQLException e) {
							}
							try {
								stmt.close();
							} catch (SQLException e) {
							}
							try {
								conn.close();
							} catch (SQLException e) {
							}
						}
					%>
				</form>

				<br />
				<a href="goodmanage.jsp">&gt;&gt;返回</a>

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
					本草仁堂(www.bcrt.com) - 专业的药材网上商城,可提供包括中药材、中草药、 滋补药材、药材工具、等数万种药材商品直销,便捷，诚信的服务,为您提供愉悦的网上购物旅程！
主营产品：鼠曲草 天南星 槐花 白术 玄参 牵牛子 天花粉 千金子 白芷 蝉蜕 蒲公英 丹参 皂角刺 瓜蒌 合欢花 地骨皮 女贞子 槐角 何首乌.</p>
				<br />
				<div align="center">
					<img src="images/border.gif" />
				</div>
				<br>
			  &nbsp;
				<p align="center">
					&nbsp;
					<a href="adlogin.jsp">用户管理</a>
				</p>
			</div>
		</div>
	</body>
</html>
