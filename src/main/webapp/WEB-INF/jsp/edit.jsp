<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑页面</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="g-doc">
		<div class="m-tab m-tab-fw m-tab-simple f-cb">
			<h2>内容编辑</h2>
		</div>
		<div class="n-public">
			<form class="m-form m-form-ht" id="form" method="post" action="editSubmit" onSubmit="return false;" autocomplete="off">
				<div class="fmitem">
					<label class="fmlab">标题: </label>
					<div class="fmipt">
						<input type="hidden" name="pid" value="${product.pid }"/>
						<input class="u-ipt ipt" name="pname" value="${product.pname }" placeholder="2-80字符"/>
					</div>
				</div>
				<div class="fmitem">
	                <label class="fmlab">摘要：</label>
	                <div class="fmipt">
	                    <input class="u-ipt ipt" name="summary" value="${product.summary}" placeholder="2-140字符"／>
	                </div>
            	</div>
            	<div class="fmitem">
            		<label class="fmlab">图片：</label>
           			<div class="fmipt" id="uploadType">
	                	<input name="pic" type="radio" value="url" checked /> 图片地址
						<input name="pic" type="radio" value="file" /> 本地上传
					</div>	
            	</div>
            	<div class="fmitem">
                	<label class="fmlab"></label>
               		<div class="fmipt" id="urlUpload">
                    	<input class="u-ipt ipt"  name="image" value="${product.image}" placeholder="图片地址"/>
                	</div>
                	<div class="fmipt" id="fileUpload"  style="display:none">
	                    <input class="u-ipt ipt" name="file" type="file" id="fileUp"/>
	                    <button class="u-btn u-btn-primary" id="upload">上传</button>
               		</div>
            	</div>
            	<div class="fmitem">
	                <label class="fmlab">正文：</label>
	                <div class="fmipt">
	                    <textarea class="u-ipt" name="detail" rows="10" placeholder="2-1000个字符">${product.detail}</textarea>
	                </div>
            	</div>
	            <div class="fmitem">
	                <label class="fmlab">价格：</label>
	                <div class="fmipt">
	                    <input class="u-ipt price" name="price" value="${product.price}"/>元
	                </div>
	            </div>
	            <div class="fmitem fmitem-nolab fmitem-btn">
	                <div class="fmipt">
	                    <button type="submit" class="u-btn u-btn-primary u-btn-lg">保 存</button>
	                </div>
	            </div>
			</form>
			 <span class="imgpre"><img src="${product.image}" alt="" id="imgpre"></span>
		</div>	
	</div>
	<div class="n-foot">
    	<p>版权所有：网易金融<a href="http://mooc.study.163.com/smartSpec/detail/85002.htm">Java开发工程师(Web方向)</a></p>
	</div>
	<script type="text/javascript" src="js/global.js"></script>
	<script type="text/javascript" src="js/public.js"></script>
</body>
</html>