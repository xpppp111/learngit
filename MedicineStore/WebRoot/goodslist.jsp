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

		<title>显示商品_wy</title>

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
						<a href="index.jsp"></a>
					</div>
					<div id="headright">
						<table border="0">
							<tr>
								<td class="STYLE1">
									<a href="login.jsp">登录</a>
								</td>
								<td class="STYLE1">
									<a href="reg.jsp"><b>注册</b>
									</a>
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
				<table width="900" border="1" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<div align="center">
								<a href="index.jsp"><strong>主页</strong>
								</a>
							</div>
						</td>
						<td>
							<div align="center">
								<a href="yaocaiinfo.jsp"><strong>本草大全</strong>
								</a>
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
								<a href="cart.jsp"><strong>购物车</strong>
								</a>
							</div>
						</td>
						<td>
							<div align="center">
								<a href="showorder.jsp"><strong>我的订单</strong>
								</a>
							</div>
						</td>
						<td>
							<div align="center">
								<a href="usermanage1.jsp"><b>我的资料</b>
								</a>
							</div>
						</td>
					</tr>
				</table>
				<div id="left">

					<center>
						<span class="form_row STYLE2">商品信息</span>
					</center>
					<a href="GetAllGoodsServlet?pageNo=1">第一页</a>
					<a href="GetAllGoodsServlet?pageNo=${pageNo-1 }">上一页</a>
					<c:if test="${pageNo!=1 }">
					</c:if>
					<c:if test="${pageNo!=pageCounter }">
						<a href="GetAllGoodsServlet?pageNo=${pageNo+1 }">下一页</a>
						<a href="GetAllGoodsServlet?pageNo=${pageCounter }">最后一页</a>
					</c:if>
					<br>
					<center>
						<table width="850">
							<tbody>
								<tr>
									<td>
										商品图片
									</td>
									<td>
										商品名称
									</td>
									<td>
										商品价格
									</td>
									<td>
										商品数量
									</td>
									<td>
										商品描述
									</td>

								</tr>
								<c:forEach var="g" items="${goods}">
									<tr>
										<td>
											<img src="${g.cimage}" />
										</td>
										<td>
											${g.cname}
										</td>
										<td>
											${g.cprice}
										</td>
										<td>
											${g.cnumber}
										</td>
										<td width="200">
											${g.cintro}
										</td>
										<td>
											<a href="AddToCartServlet?cid=${g.cid}">添加到购物车</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</center>
					<br />
					<br />

				</div>
			</div>
	</body>
</html>
