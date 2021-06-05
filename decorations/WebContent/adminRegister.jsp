<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员注册界面</title>
<link type="text/css" href="css/register.css" rel = "stylesheet"/>
<script type="text/javascript " src="js/register.js"></script>
<style>
.banner{
	position:relative;
	background:url("images/theme-pic.jpg") no-repeat 0 200px;
	margin: 0 auto;
	width:1000px;
	height:678px;
}
.aside{
	position:absolute;
	left:60%;
	top:120px;
	width:400px;
	padding:20px;
	background:rgb(252,252,252);
	box-shadow:0px 1px 5px 0px rgb(0,0,0,3);
	order-radius:8px;
}
body{
	background:rgb(242,242,242);
}

</style>
</head>
<body>
<div class = "banner">
	<div class="aside">
		<form  action="doRegister.jsp" method="post" name="form1" onSubmit="return check(this)">
			<!-- action表示当提交表单时，向何处发送表单数据 -->
			<div class = "box">
				<label class = "i-label">*用户名</label>
				<!-- label标签主要是方便鼠标点击使用，增强用户操作体验 -->
				<input type="text" name="username" id="username" class = "i-text" onfocus="usernameFocus()" onblur="usernameBlur()"/>
			</div>
			<div id="usernameId"></div>
			<div class = "box">
				<label class = "i-label" >*密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
				 <input type="password" name="userpwd" id="userpwd" class = "i-text" onfocus="userpwdFocus()" onblur="userpwdBlur()"/>
			</div>
			<div id="userpwdId"></div>
			<div class = "box">
				<label class = "i-label">*密码确认</label> 
				<input type="password" name="userpwd2" id="userpwd2" class = "i-text" onfocus="userpwd2Focus()" onblur="userpwd2Blur()"/>
			</div>
		
		</form>
		</div>
	</div>
</body>

</html>