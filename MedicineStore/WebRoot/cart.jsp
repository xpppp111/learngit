<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		<title>���뵽���ﳵ_wy</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
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



-->
</style>
	</head>

	<body>

		<div class="main" id="main">
			<div id="head">
				<div class="header">
					<div class="logo">
						<a href="index.jsp"><br> </a>
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
					<span class="form_row STYLE2">���ﳵ��Ϣ</span>
					<br>
					<br />
					<form action="ProcessCart">
						<table width="800">

							<tr>
								<td>
									��Ʒ���
								</td>
								<td>
									��Ʒ����
								</td>
								<td>
									��Ʒ�۸�
								</td>
								<td>
									��Ʒ����
								</td>
							</tr>

							<c:forEach var="item" items="${cart}">
								<tr>

									<input type="hidden" name="cid" value="${item.goods.cid}">
									<td>
										${item.goods.cid }
									</td>
									<td>
										${item.goods.cname }
									</td>
									<td>
										${item.goods.cprice}
									</td>
									<td>
										<input type="text" name="quantity" value="${item.quantity}">
									</td>
									<td>
										<input type="submit" name="action" value="�޸�">
									</td>
									<td>
										<input type="submit" name="action" value="ɾ��">
									</td>

								</tr>
							</c:forEach>

						</table>
					</form>
					<br />
					<a href="GetAllGoodsServlet?pageNo=1">��������</a>
					<%
					if (session.getAttribute("username") != null) {
					%>
					<a href="addinfo.jsp">�µ�</a>
					<%
					} else {
					%>
					<a href="login.jsp">����</a>
					<%
					}
					%>
					<a href="clearCartServlet">��չ��ﳵ</a>
					<a href="index.jsp">������ҳ</a>
					<br>
					<br>
				</div>

			</div>
	</body>
</html>
