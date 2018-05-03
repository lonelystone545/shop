<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="g-doc" id="shoppingcart">
		<div class="m-tab m-tab-fw m-tab-simple">
			<h2>已添加到购物车的内容</h2>
		</div>
		<table id="newTable" class="m-table m-table-row n-table g-b3"></table>
		<div id="act-btn">
			<button class="u-btn u-btn-primary" id="back">退出</button>
			<button class="u-btn u-btn-primary" id="Account">购买</button>
		</div>
	</div>
	<div class="n-foot">
   		<p>版权所有：网易金融<a href="http://mooc.study.163.com/smartSpec/detail/85002.htm">Java开发工程师(Web方向)</a></p>
	</div>
	<script type="text/javascript" src="js/global.js"></script> 
	<script type="text/javascript" src="js/shoppingcart.js"></script> 
</body>
</html>