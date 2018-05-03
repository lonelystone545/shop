<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>

<script>
	function checkForm(){
		//校验用户名
		//获得用户名文本框值
		var username = document.getElementById("username").value;
		if(username == null || username==''){
			alert("用户名不能为空!");
			return false;//这样表单不会提交
		}
		
		//校验密码
		//获得密码文本框值
		var password = document.getElementById("password").value;
		if(password == null || password ==''){
			alert("密码不能为空!");
			return false;//这样表单不会提交
		}
		return false;
	}
</script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<form class="m-from m-form-ht n-login" id="loginForm" onsubmit="return checkForm();" autocomplete="off" >
		<div class="fmitem">
			<label class="fmlab">用户名: </label>
			<div class="fmipt">
				<input class="u-ipt" name="username" id="username" autofocus/>
			</div>
		</div>
		<div class="fmitem">
			<label class="fmlab">密  码: </label>
			<div class="fmipt">
				<input class="u-ipt" name="password" id="password" type="password"/>
			</div>
		</div>
		<div class="fmitem fmitem-nolab fmitem-btn">
			<div class="fmipt">
				<button type="submit" class="u-btn u-btn-primary u-btn-block">登  录</button>
			</div>
		</div>
	</form>
	
	<div class="n-foot">
   		<p>版权所有：网易金融<a href="http://mooc.study.163.com/smartSpec/detail/85002.htm">Java开发工程师(Web方向)</a></p>
	</div>
	<script type="text/javascript">
		var contextPath = "${pageContext.request.contextPath}";
	</script>
	<script type="text/javascript" src="js/md5.js"></script>
	<script type="text/javascript" src="js/global.js"></script>
	<script type="text/javascript" src="js/pageLogin.js"></script>
</body>
</html>