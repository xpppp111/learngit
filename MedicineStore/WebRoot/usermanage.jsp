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

		<title>�û�����</title>

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
									<a href="login.jsp">��¼</a>
								</td>
								<td class="STYLE1">
									<a href="reg.jsp">ע��</a>
								</td>
								<td class="STYLE1">
									<img src="images/cart.gif" width="21" height="18" />
									<a href="cart.jsp">���ﳵ</a>
								</td>
								<td class="STYLE1">
									<a href="showorder.jsp">�ҵĶ���</a>
								</td>
							</tr>
						</table>
					</div>
					<div id="menu">
						<ul>
							<li class="selected">
								<a href="index.jsp">��ҳ</a>
							</li>
							<li>
								<a href="GetAllGoodsServlet?pageNo=1">��</a>
							</li>
							<li>
								<a href="GetAllGoodsServlet?pageNo=1">��</a>
							</li>
							<li>
								<a href="GetAllGoodsServlet?pageNo=1">��</a>
							</li>
							<li>
								<a href="GetAllGoodsServlet?pageNo=1">��</a>
							</li>
							<li>
								<a href="GetAllGoodsServlet?pageNo=1">��̳����</a>
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
					<span class="form_row STYLE2">�û�����</span>
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
							���
						</td>
						<td>
							�û���
						</td>
						<td>
							��������
						</td>
						<td>
							�Ա�
						</td>
						<td>
							����
						</td>
						<td>
							����
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
							<a href="<%=deleteurl%>">ɾ��</a>&nbsp;
							<a href="<%=modifyurl%>">�޸� </a>
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
					������ʾ
				</h2>
				<hr>
				<div id="back">
					����δ��¼,��
					<a href="adlogin.jsp">��½</a>
				</div>
				<%
				}
				%>
				<div id="back">
					<a href="manage.jsp">>>����</a>
				</div>
			</div>
			<div id="right">
				<br>
				<br />
				<p class="title">
					&nbsp;&nbsp; ��������
				</p>
				<br />
				<br />
				<p class="details">
					<img src="images/huangcen.gif" align="right" />
					&nbsp;&nbsp;��������(www.bcrt.com) - רҵ��ҩ�������̳�,���ṩ������ҩ�ġ��в�ҩ��
						�̲�ҩ�ġ�ҩ�Ĺ��ߡ���������ҩ����Ʒֱ��,��ݣ����ŵķ���,Ϊ���ṩ���õ����Ϲ����ọ́�
				</p>
				<br />
				
				<div align="center">
					<img src="images/border.gif" />
				</div>
				
				<br>
				<p class="title">
					&nbsp;&nbsp; ������Ʒ
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
					<a href="adlogin.jsp">�û�����</a>
				</p>
			</div>
		</div>
	</body>
</html>
