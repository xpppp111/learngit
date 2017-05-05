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

		<title>个人资料_wy</title>

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
	width: 900px;
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
						<a href="index.jsp"> </a>
					</div>
					<div id="headright">
						<table border="0">
							<tr>
								<td class="STYLE1">
									<a href="login.jsp">登录</a>
								</td>
								<td class="STYLE1">
									<a href="reg.jsp"><b>注册</b> </a>
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
					<td>
						<div align="center">
							<a href="index.jsp"><strong>主页</strong> </a>
						</div>
					</td>
					<td>
						<div align="center">
							<a href="yaocaiinfo.jsp"><strong>本草大全</strong> </a>
						</div>
					</td>
					<td>
						<div align="center">
							<a href="GetAllGoodsServlet?pageNo=1"><strong>本草选购中心</strong>
							</a>
						</div>
					</td>
					<td>
						<div align="center">
							<a href="cart.jsp"><strong>购物车</strong> </a>
						</div>
					</td>
					<td>
						<div align="center">
							<a href="showorder.jsp"><strong>我的订单</strong> </a>
						</div>
					</td>
					<td>
						<div align="center">
							<a href="usermanage1.jsp"><b>我的资料</b> </a>
						</div>
					</td>
				</tr>
			</table>

			<div id="left">
				<br />
				<br />
				<center>
					<span class="form_row STYLE2">个人资料</span>
				</center>
				<%
							String sql = "select * from user where id="
							+ request.getParameter("id");
					try {
						ResultSet rs = db.executeQuery(sql);
				%>
				<%
				if (rs.next()) {
				%>
				<!-- 把id号传给 ModifyServlet-->
				<form name="form1"
					action="ModifyServlet?id=<%=request.getParameter("id")%>"
					method="post" onsubmit=" isValidate(form1)">
					<table width="400" border="0" height="273" align="center">
						<tbody>
							<tr>
								<td>
									用户名
								</td>
								<td>
									<input type="text" name="username" class="ipt-t" id="username"
										value="<%=rs.getString("username")%>" />
								</td>
							</tr>
							<tr>
								<td>
									密码：
								</td>
								<td>
									<input type="password" name="userpass" class="ipt-t"
										id="userpass" value="<%=rs.getString("userpass")%>" />
								</td>
							</tr>
							<tr>
								<td>
									重复密码：
								</td>
								<td>
									<input type="password" name="reuserpass" id="reuserpass"
										class="ipt-t">
								</td>
							</tr>
							<tr>
								<td>
									性别：
								</td>
								<td>
									<label>
										<input type="radio" name="gender" value="男">
										男
									</label>
									<label>
										<input type="radio" name="gender" value="女">
										女
									</label>
								</td>
							</tr>

							<tr>
								<td>
									出生日期：
								</td>
								<td>
									<input type="text" name="birthdate" class="ipt-t"
										id="birthdate" value="<%=rs.getString("birthdate")%>" />
								</td>
							</tr>
							<tr>
								<td>
									籍贯：
								</td>
								<td>
									<select name="nativeplace" size=1>
										<option value="浙江">
											<%
													if (rs.getString("nativeplace").equals("浙江"))
													
											%>
											浙江
										</option>
										<option value="福建">
											<%
													if (rs.getString("nativeplace").equals("福建"))
													out.print("selected=selected");
											%>
											福建
										</option>
										<option value="上海">
											<%
													if (rs.getString("nativeplace").equals("上海"))
													out.print("selected=selected");
											%>
											上海
										</option>
										<option value="广州">
											<%
													if (rs.getString("nativeplace").equals("广州"))
													out.print("selected=selected");
											%>
											广州
										</option>
										<option value="广西">
											<%
													if (rs.getString("nativeplace").equals("广西"))
													out.print("selected=selected");
											%>
											广西
										</option>
										<option value="江苏">
											<%
													if (rs.getString("nativeplace").equals("江苏"))
													out.print("selected=selected");
											%>
											江苏
										</option>
										<option value="新疆">
											<%
													if (rs.getString("nativeplace").equals("新疆"))
													out.print("selected=selected");
											%>
											新疆
										</option>
										<option value="内蒙古">
											<%
													if (rs.getString("nativeplace").equals("内蒙古"))
													out.print("selected=selected");
											%>
											内蒙古
										</option>
										<option value="湖南">
											<%
													if (rs.getString("nativeplace").equals("湖南"))
													out.print("selected=selected");
											%>
											湖南
										</option>
										<option value="河北">
											<%
													if (rs.getString("nativeplace").equals("河北"))
													out.print("selected=selected");
											%>
											河北
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="提交">
									&nbsp; &nbsp;
									<input type="reset" value="重置">
								</td>
							</tr>
						</tbody>
					</table>
					<br />
				</form>
				<%
				}
				%>
				<%
						} catch (Exception e) {
						out.print(e.toString());
					} finally {
						db.close();
					}
				%>

			</div>

		</div>
	</body>
</html>
