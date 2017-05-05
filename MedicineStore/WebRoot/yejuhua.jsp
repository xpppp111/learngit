<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

		<title>用户<b>注册</b>_wy</title>

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
						<a href="index.jsp"><br> </a>
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
				<div id="left" style="width: 900px;">
					<p align="center"><strong><p>　　野菊花</p>
<p>　　野菊花为菊科多年生草本植物野菊的头状花序，外形与菊花相似，野生于山坡草地、田边路旁。以色黄无梗、完整、气香、花未全开者为佳。野菊花含可广泛用于治疗疔疮痈肿、咽喉肿痛、风火赤眼、头痛眩晕等病证。同时又有很好的降压作用，可用于高血压病的辅助治疗。</p>
<p>　　植物形态</p>
<p>　　多年生草本，高达1m。茎基部常匍匐，上部多分枝。叶互生，卵状三角形或卵状椭圆形，长3～9cm，羽状分裂，裂片边缘有锯齿，两面有毛，下面较密；叶柄下有明显的假托叶。头状花序直径2～2。5cm，排成聚伞状；总苞半球形，总苞片4层，边缘膜质，外层椭圆形；花小，黄色，边缘舌状，先端3浅裂，雌性；中央为管状花，先端5裂，两性。花期9～11月，果期10～11月。</p>
<p>　　1。野菊 多年生草本，高25-100cm。根茎粗厚，分枝，有长或短的地下匍匐枝。茎直立或基部铺展。基生叶脱落；茎生叶卵形或长圆状卵形，长6-7cm，宽1-2。5cm，羽状分裂或分裂不明显；顶裂片大；侧裂片常2对，卵形或长圆形，全部裂片边缘浅裂或有锯齿；上部叶渐小；全部叶上面有腺体及疏柔毛，下面灰绿色，毛较多，基部渐狭成具翅的叶柄；托叶具锯齿。头状花序直径2。5-4（-5）cm，在茎枝顶端排成伞房状圆锥花或不规则的伞房花序；总苞直径8-20mm，长5-6mm；总苞片边缘宽膜质；舌状花黄色，雌性；盘花两性，筒状。瘦果全部同形，有5条极细的纵肋，无冠状冠毛。花期9-10月。</p>
<p>　　2。岩香菊 本种与野菊的区别在于：叶为羽状深裂，绿色或淡绿色，两面被稀疏的芽下面稍多膨松的柔毛；头状花序多数在茎枝顶端排成疏松的伞房或复伞房花序，舌状花黄色。花果期5-11月。</p>
<p>　　分布</p>
<p>　　生于山坡草地、灌丛、河边水湿地，海滨盐渍地及田边、路旁，岩石上。资源分布：分布于吉林、辽宁、河北、河南、山西、陕西、甘肃、青海、新疆、山东、江苏、浙江、安徽、福建、江西、湖北、四川、云南、湖南等地。</p>
<p>　　采制</p>
<p>　　秋、冬季花初开放时采摘，晒干或蒸后晒干。</p>
<p>　　性状</p>
<p>　　花序呈类球形，直径0。3～1cm，棕黄色。总苞由4～5层苞片组成。舌状花一轮，黄色，皱缩卷曲；管状花多数，深黄色。体轻。气芳香，味苦。</p>
<p>　　性味</p>
<p>　　性微寒，味苦、辛。</p><br> </p>
				</div>
			</div>
	</body>
</html>
