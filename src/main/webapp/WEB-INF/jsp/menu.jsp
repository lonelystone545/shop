<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="css/style.css" />

<div class="n-head">
	<c:choose>
		<c:when test="${sessionScope.username eq 'buyer'}">
			<div class="g-doc f-cb">
				<div class="user">
					买家你好, <span class="name">${sessionScope.username }</span>!<a href="${ pageContext.request.contextPath }/logout">[退出]</a>
				</div>
				<ul class="nav">
		            <li><a href="${ pageContext.request.contextPath }/">首页</a></li>
		            <li><a href="${ pageContext.request.contextPath }/account">账务</a></li>
		            <li><a href="${ pageContext.request.contextPath }/shoppingcart">购物车</a></li>
	        	</ul>
	        </div>
		</c:when>
		<c:when test="${sessionScope.username eq 'seller'}">
			<div class="g-doc f-cb">
				<div class="user">
					卖家你好, <span class="name">${sessionScope.username }</span>!<a href="${ pageContext.request.contextPath }/logout">[退出]</a>
				</div>
				<ul class="nav">
		            <li><a href="${ pageContext.request.contextPath }/">首页</a></li>
	            	<li><a href="${ pageContext.request.contextPath }/public">发布</a></li>
	        	</ul>
	        </div>
		</c:when>
		<c:otherwise>
			 <div class="g-doc f-cb">
        		<div class="user">
                   	 请<a href="${ pageContext.request.contextPath }/login">[登录]</a>
        		</div>
        		<ul class="nav">
            		<li><a href="${ pageContext.request.contextPath }/">首页</a></li>
        		</ul>
    		</div>
		</c:otherwise>
	</c:choose>
</div>