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
					<p align="center"><strong><p>　　蒲公英</p>
<p>　　蒲公英属菊科多年生草本植物。头状花序，种子上有白色冠毛结成的绒球，花开后随风飘到新的地方孕育新生命。蒲公英植物体中含有蒲公英醇、蒲公英素、胆碱、有机酸、菊糖等多种健康营养成分，有利尿、缓泻、退黄疸、利胆等功效。蒲公英同时含有蛋白质、脂肪、碳水化合物、微量元素及维生素等，有丰富的营养价值，可生吃、炒食、做汤，是药食兼用的植物。</p>
<p>　　外形特征</p>
<p>　　蒲公英-原植物　　多年生草本植物，高10～25cm，含白色乳汁。根深长，单一或分枝，外皮黄棕色。叶根生，排成莲座状，狭倒披针形，大头羽裂，裂片三角形，全缘或有数齿，先端稍钝或尖，基部渐狭成柄，无毛蔌有蛛丝状细软毛。花茎比叶短或等长，结果时伸长，上部密被白色蛛丝状毛。头状花序单一，顶生，长约3。5cm；总苞片草质，绿色，部分淡红色或紫红色，先端有或无小角，有白色蛛丝状毛；舌状花鲜黄色，先端平截，5齿裂，两性。瘦果倒披针形，土黄色或黄棕色，有纵棱及横瘤，中产以上的横瘤有刺状突起，先端有喙，顶生白色冠毛。花期早春及晚秋。生于路旁、田野、山坡。</p>
<p>　　药材</p>
<p>　　皱  中药蒲公英缩卷曲的团块，根圆柱形，多弯曲长3~7cm，棕褐色，根头部有茸毛，叶破碎，完整叶片为倒披针形，暗灰绿色或绿褐色，边缘浅裂或具有羽状缺刻，基部下延成柄状，下表面主脉明显，花葶1至数条，头状花序顶生，黄褐色或淡黄白色，有的可见多数具有白色冠毛的长椭圆形瘦果，气微，味微苦。药用部位：干燥的全草。</p>
<p>　　性味功能：甘，微苦，寒。清热解毒，消肿散结。</p>
<p>　　主治：上呼吸道感染，眼结膜炎，流行性腮腺炎，高血糖，乳痈肿痛，胃炎，痢疾，肝炎，胆襄炎，急性阑尾炎，泌尿系感染，盆腔炎，痈疖疔疮，咽炎，治急性乳腺炎，淋巴腺炎，瘰疠，疔毒疮肿，急性结膜炎，感冒发热，急性扁桃体炎，急性支气管炎、尿路感染。</p>
<p>　　临床应用</p>
<p>　　1．单味新鲜者，捣碎，取汁直接敷于痛处，治肺癌引起的疼痛。</p>
<p>　　2．单味新鲜者，捣碎，加鸡蛋清（少加白糖）调糊，外敷，治流行性腮腺炎。3．单味捣烂取汁，高温消毒后点眼，治砂眼痒痛。[1]</p>
<p>　　蒲公英茶</p>
<p>　　材料：  蒲公英干燥蒲公英75克、水1000毫升</p>
<p>　　作法：</p>
<p>　　1．将蒲公英洗净，放入锅中，加水淹过蒲公英</p>
<p>　　2．大火煮沸后盖上锅盖，小火熬煮一小时</p>
<p>　　3．滤除茶渣，待凉后即可饮用</p>
<p>　　注意事项：</p>
<p>　　阳虚外寒、脾胃虚弱者忌用。用量过大，可致缓泻。</p></strong></p>
				</div>
			</div>
	</body>
</html>
