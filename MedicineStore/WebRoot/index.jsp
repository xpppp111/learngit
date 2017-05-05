<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
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

		<title>本草仁堂_首页</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="images/style.css" />
		<style type="text/css">
<!--
#main {
	width: 1000px;
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
	color: #Fe0000;
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
align:left;
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
#Layer1 {
	position:absolute;
	width:423px;
	height:30px;
	z-index:1;
	left: 216px;
	top: 143px;
}
.STYLE2 {color: #FF3399}
.STYLE8 {font-size: 24px}
.STYLE10 {font-size: 18px}
#Layer2 {
	position:absolute;
	width:994px;
	height:119px;
	z-index:2;
	left: 204px;
	top: 864px;
}
.STYLE13 {font-size: 12px; }
-->
        </style>
	</head>

	<body>

		<div class="main" id="main">
			<div id="head">
				<div class="header">
					<div class="STYLE10" id="Layer1">
						<form name="form1" method="post" action="SearchServlet">
							<label>
								<input name="cname" type="text" class="STYLE8" size="20">
							</label>
							<label>
								<input name="Submit" type="submit" class="STYLE10" value="搜索本草">
							</label>
						</form>
					</div>
					<div class="logo">
						<br>
						<br>
						<br>
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

					<center>
						<span class="form_row STYLE2"> <%
 		if (session.getAttribute("code") != null) {
 		out.print(session.getAttribute("code"));
 		session.setAttribute("code", null);
 	}
 %> </span>
					</center>
					<div class="title">
						<span class="title_icon"><img src="images/bullet1.gif"
								alt="" title="" /> </span>热门本草
					</div>
					<div class="feat_prod_box">
						<div class="prod_img">
							<p>
								<img src="images/prog3.jpg" alt="" width="140" height="162"
									border="0" title="" />
							</p>
							<p>
								<a href="yejuhua.jsp">野菊花</a>
							</p>
						</div>
						<div class="prod_det_box">
							<div class="box_top"></div>
							<div class="box_center">
								<div class="prod_title">
									野菊花
								</div>
								<p class="details">
									野菊花为菊科多年生草本植物野菊的头状花序，外形与菊花相似，野生于山坡草地、田边路旁。以色黄无梗、完整、气香、花未全开者为佳。野菊花含可广泛用于治疗疔疮痈肿、咽喉肿痛、风火赤眼、头痛眩晕等病证。同时又有很好的降压作用，可用于高血压病的辅助治疗。
									</br>
									性味：性微寒，味苦、辛
									<br>
									产地：湖北
								</p>
								<a href="GetAllGoodsServlet?pageNo=1" class="more">- more
									details -</a>
								<div class="clear"></div>
							</div>
							<div class="box_bottom"></div>
						</div>

					</div>
					<div class="feat_prod_box">
						<div class="prod_img">
							<p>
								<img src="images/prog13.jpg" alt="" height="177" border="0"
									title="" />
							</p>
							<p>
								<a href="pugongying.jsp">蒲公英</a>
							</p>
						</div>
						<div class="prod_det_box">

							<div class="box_center">
								<div class="prod_title">
									蒲公英
								</div>
								<p class="details">
									蒲公英 多年生草本，高10-25cm。全株含白色乳汁，被白色疏软毛。根深长，单一分枝，直径通常3-5mm，
									外皮黄棕色。叶根生，排列成莲座状；具叶柄，柄基部两侧扩大呈鞘状；叶片线状披针形，倒披针形或倒卵形，
									长6-15cm，宽2-3.5cm，先端尖或钝，基部狭窄，下延，边缘浅裂或作不规则羽状分裂，裂片齿牙状或三角状，
									全缘或具疏齿，裂片间有细小锯齿，绿色或有时在边缘事淡紫以斑迹，被白色蛛丝状毛。
									</br>

									产地：分布于东北、华北、华东、华中、西南及陕西、甘肃、青海等地
								</p>
							</div>
							<div class="box_bottom"></div>
						</div>

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
						<br>
						主营产品：鼠曲草 天南星 槐花 白术 玄参 牵牛子 天花粉 千金子 白芷 蝉蜕 蒲公英 丹参 皂角刺 瓜蒌 合欢花 地骨皮 女贞子
						槐角 何首乌 ……
					</p>
					<br />
					<jsp:useBean id="db" class="toolbean.DB" scope="page"></jsp:useBean>

					<%
						String sql = "select  * from goods LIMIT 0,4";
						if (session.getAttribute("msg1") != null) {
							out.print(session.getAttribute("msg1"));
							session.setAttribute("msg1", null);
						}
						try {
							ResultSet rs = db.executeQuery(sql);
					%>

					<table>
						<tr>
							<td>
								<span class="STYLE13"> 图片 </span>
							</td>
							<td>
								<span class="STYLE13"> 商品编号 </span>
							</td>
							<td>
								<span class="STYLE13"> 商品名称 </span>
							</td>
							<td>
								<span class="STYLE13"> 商品价格 </span>
							</td>
							<td>
								<span class="STYLE13"> 商品数量 </span>
							</td>
						</tr>
						<%
								int i = 1;
								while (rs.next()) {
									String deleteurl = "deletegoods.jsp?cid=" + rs.getString(1);
									String modifyurl = "modifygoods.jsp?cid=" + rs.getString(1);
						%>
						<tr>
							<td>
								<span class="STYLE13">&nbsp; <img width="58" height="43"
										src="<%=rs.getString(6)%>" /> </span>
							</td>
							<td>
								<span class="STYLE13">&nbsp; <%=rs.getString(1)%> </span>
							</td>
							<td>
								<span class="STYLE13">&nbsp; <%=rs.getString(2)%> </span>
							</td>
							<td>
								<span class="STYLE13">&nbsp; <%=rs.getFloat(3)%> </span>
							</td>
							<td>
								<span class="STYLE13">&nbsp; <%=rs.getInt(4)%> </span>
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

					<div align="center">
						<img src="images/border.gif" />
					</div>

					<p align="center">&nbsp;
						
					</p>
					<div id="Layer2">
						<form name="form2" method="post" action="">
							<p class="STYLE13">
								新手入门 支付方式 物流配送 售后服务 帮助信息 联系我们
							</p>
							<p class="STYLE13">
								本草简介 银联支付 普通快递 退换政策 常见问题 联系邮箱
							</p>
							<p>
								<span class="STYLE13"> 购物流程 货到付款 本草专递 退换流程 找回密码</span>
								<span class="STYLE13">在线客服</span>
							</p>
							<p>
								<span class="STYLE13">关于本草 ｜ 网站联盟 ｜ 广告服务 ｜ 友情链接 ｜ 本草论坛</span>
							</p>
							<p class="STYLE13">
								Copyright(C) 2009-2012 浙江本草仁堂电子商务发展有限公司 All Rights Reserved
								浙ICP证zlp001号 浙公网安备zlp001号
							</p>
						</form>
						<p>
							<img src="images/dibu.jpg" width="456" height="38">
						</p>
					</div>
					<p align="center">
						<a href="adlogin.jsp">用户管理</a>
					</p>
					<p align="center">&nbsp;
						
					</p>
					<p align="center">&nbsp;
						
					</p>
				</div>
				<p>&nbsp;
					
				</p>
				<p>&nbsp;
					
				</p>
			</div>
	</body>
</html>

