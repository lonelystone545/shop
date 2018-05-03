<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>未购买的商品</title>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div class = "g-doc">
		<div class="m-tab m-tab-fw m-tab-simple f-cb">
			<div class="tab">
				<ul>
					<li><a href = "${pageContext.request.contextPath }/">所有内容</a>
					<li class="z-sel"><a href = "${pageContext.request.contextPath }/unbought">未购买的内容</a>
				</ul>
			</div>
		</div>
		
		<div class="n-plist">
			<ul class="f-cb" id="plist">
				<c:forEach items="${products}" var="p">
					<li id="p-${p.pid}">
						<a href="${pageContext.request.contextPath}/product_findByPid?pid=${p.pid }" class="link">
		        			<div class="img"><img src="${p.image }" alt="${p.pname }"/></div>
				       		<h3>${p.pname}</h3>
			       			<div class="price">
			       				<span class="v-unit">¥</span>
			       				<span class="v-value">${p.price }</span>
			       			</div>
		       			</a>
		       		</li>
		       	</c:forEach>
			</ul>
		</div>
	</div>
	<div class="n-foot">
   		<p>版权所有：网易金融<a href="http://mooc.study.163.com/smartSpec/detail/85002.htm">Java开发工程师(Web方向)</a></p>
	</div>
	<script type="text/javascript" src="js/global.js"></script> 
	<script type="text/javascript" src="js/pageIndex.js"></script> 
</body>
</html>