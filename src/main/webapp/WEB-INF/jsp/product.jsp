<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情页</title>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div class="g-doc">
		<div class="n-show f-cb" id="showContent">
			<div class="img">
				<img src="${product.image }" alt="">
			</div>
			<div class="cnt">
				<h2>${product.pname }</h2>
				<p class="summary">${product.summary }</p>
				<div class="price">
					<span class="v-unit">¥</span>
					<span class="v-value">${product.price }</span>
				</div>
				<div class="num">购买数量: <span id="plusNum" class="lessNum"><a>-</a></span>
					<span class="totalNum" id="allNum">1</span>
					<span id="addNum" class="moreNum"><a>+</a></span>
				</div>
				<div class="oprt f-cb">
					<c:choose>
						<c:when test="${sessionScope.username eq 'buyer' }">
							<c:choose>
								<c:when test="${product.nums == 0}">
									<button class="u-btn u-btn-primary" id="add" data-id="${product.pid }" data-title="${product.pname }" data-price="${product.price }">加入购物车</button>
								</c:when>
								<c:otherwise>
									<span class="u-btn u-btn-primary z-dis">已购买</span>
									<span class="buyprice">当时购买价格: ¥${product.boughtPrice}</span>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:when test="${sessionScope.username eq  'seller' }">
							<a href="${pageContext.request.contextPath}/edit?pid=${product.pid}" class="u-btn u-btn-primary">编辑</a>
						</c:when>
					</c:choose>
				</div>
			</div> 
		</div>
		<div class="m-tab m-tab-fw m-tab-simple f-cb">
			<h2>详细信息</h2>
		</div>
		<div class="n-detail">
			${product.detail }
		</div>
	</div>
	<div class="n-foot">
    	<p>版权所有：网易金融<a href="http://mooc.study.163.com/smartSpec/detail/85002.htm">Java开发工程师(Web方向)</a></p>
	</div>
	<script type="text/javascript" src="js/global.js"></script>
	<script type="text/javascript" src="js/pageShow.js"></script>
</body>
</html>