<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑成功</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="n-result">
		<h3>编辑成功!</h3>
		<p>
			<a href="${pageContext.request.contextPath}/product_findByPid?pid=${pid }">[查看内容]</a>
			<a href="${pageContext.request.contextPath }">[返回首页]</a>
		</p>
		<div class="n-foot">
	    	<p>版权所有：网易金融<a href="http://mooc.study.163.com/smartSpec/detail/85002.htm">Java开发工程师(Web方向)</a></p>
		</div>
	</div>
</body>
</html>