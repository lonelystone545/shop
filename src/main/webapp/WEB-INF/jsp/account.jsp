<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>财务</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="g-doc">
		<div class="m-tab m-tab-fw m-tab-simple f-cb">
			<h2>已购买的内容</h2>
		</div>
		<table class="m-table m-table-row n-table g-b3">
			<colgroup>
				<col class="img"/>
				<col class="time"/>
				<col class="num"/>
				<col class="price"/>
			</colgroup>
			<thead>
				<tr>
					<th>内容图片</th>
					<th>内容名称</th>
					<th>购买时间</th>
					<th>购买数量</th>
					<th>购买价格</th>
			</thead>
			<tbody>
				<c:if test = "${not empty accountList }">
					<c:forEach items="${accountList }" var="a">
						<tr>
							<td><a href="${pageContext.request.contextPath}/product_findByPid?pid=${a.pid }"><img src="${a.image}" alt=""></a></td>
							<td><h4><a href="${pageContext.request.contextPath}/product_findByPid?pid=${a.pid }">${a.pname }</a></h4></td>
							<td><span class="v-time">${a.time }</span></td>
							<td><span class="v-num">${a.nums }</span></td>
							<td>
								<span class="v-unit">¥</span>
								<span class="value">${a.price * a.nums }</span>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<div class="total">总结: </div>
					</td>
					<td>
						<span class="v-unit">¥</span>
						<span classs="value">${totalPrice }</span>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<div class="n-foot">
   		<p>版权所有：网易金融<a href="http://mooc.study.163.com/smartSpec/detail/85002.htm">Java开发工程师(Web方向)</a></p>
	</div>
</body>
</html>