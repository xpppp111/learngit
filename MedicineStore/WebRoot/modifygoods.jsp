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

		<title>��Ʒ�޸�_wy</title>

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
									<a href="login.jsp">��¼</a>
								</td>
								<td class="STYLE1">
									<a href="reg.jsp"><b>ע��</b></a>
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
					
				</div>
			</div>
			<table width="900" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="center"><a href="index.jsp"><strong>��ҳ</strong></a></div></td>
    <td><div align="center"><a href="yaocaiinfo.jsp"><strong>���ݴ�ȫ</strong></a></div></td>
    <td><div align="center"><a href="GetAllGoodsServlet?pageNo=1"><strong>����ѡ������</strong></a></div></td>
    <td><div align="center"><a href="cart.jsp"><strong>���ﳵ</strong></a></div></td>
    <td><div align="center"><a href="showorder.jsp"><strong>�ҵĶ���</strong></a></div></td>
    <td><div align="center"><a href="usermanage1.jsp"><b>�ҵ�����</b></a></div></td>
  </tr>
</table>
			<div id="left">
				<br />
				<br />
				<center>
					<span class="form_row STYLE2">��Ʒ�޸�</span>
				</center>

				<!-- ��cid�Ŵ��� goodsModifyServlet-->
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
					��Ʒ����:
					<input type="text" name="cname" size="22"
						value="<%=rs.getString(2)%>">
					<br />
					<br />
					��Ʒ����:
					<input type="text" name="cnumber" size="22"
						value="<%=rs.getInt(4)%>">
					<br />
					<br />
					��Ʒ�۸�:
					<input type="text" name="cprice" size="22"
						value="<%=rs.getFloat(3)%>">
					<br />
					<br />
					��Ʒ����:
					<textarea name="cintro" rows="3" cols="20">
						<%=rs.getString(5)%>
					</textarea>
					<br />
					<br />
					��ƷͼƬ:
					<input type="text" name="cimage" size="22"
						value="<%=rs.getString(6)%>">
					<br />
					<br />
					<br />
					<input type="submit" value="�ύ" />
					&nbsp;&nbsp;
					<input type="reset" value="����" />
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
				<a href="goodmanage.jsp">&gt;&gt;����</a>

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
					��������(www.bcrt.com) - רҵ��ҩ�������̳�,���ṩ������ҩ�ġ��в�ҩ�� �̲�ҩ�ġ�ҩ�Ĺ��ߡ���������ҩ����Ʒֱ��,��ݣ����ŵķ���,Ϊ���ṩ���õ����Ϲ����ọ́�
��Ӫ��Ʒ�������� ������ ���� ���� ���� ǣţ�� �컨�� ǧ���� ���� ���� �ѹ�Ӣ ���� ��Ǵ� ���� �ϻ��� �ع�Ƥ Ů���� ���� ������.</p>
				<br />
				<div align="center">
					<img src="images/border.gif" />
				</div>
				<br>
			  &nbsp;
				<p align="center">
					&nbsp;
					<a href="adlogin.jsp">�û�����</a>
				</p>
			</div>
		</div>
	</body>
</html>
