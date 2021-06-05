<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员登录</title>
<script type="text/javascript">
function change() {
document.getElementById("validate").src = "ValidateServlet?random=" + Math.random();
}
</script>

<link type="text/css" href = "css/login.css" rel = "stylesheet"/>
</head>
<body>

<div class = "login">
<h2>管理员登录</h2>
<div class = "content">
<form action="adminCheck.jsp" method = "post">
<div class = "frm">用户名:
<input type = "text" name = "username" class = "txtuser"/>
</div>
<div class = "frm">密&nbsp;&nbsp;&nbsp;码:
<input type = "password" name = "password" class = "txtpwd"/>
</div>
<div class="frm" >验证码：
<input class="aa" type="text" name="userVCode" class="textVcode" />
<span>
<!-- ValidateServle类通过编译后对应的 URL 映射地址。 change()，刷新验证码。   -->
<img src="ValidateServlet" id="validate" onclick="change()" />
<a href="javascript:change()">看不清，换一张</a>
</span>
</div>

<div class = "btns">
<input type = "submit" name = "login" class = "btnlogin" value=""/>
<input type = "button" name = "register" class = "btnregister"
                      onclick = "window.open('register.jsp')"/>

</div>
</form>
</div>
</div>
</body>
</html>