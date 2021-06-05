<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>意见及建议</title>
<link type="text/css" rel="stylesheet" href="../css/mail.css">
<script type="text/javascript">
function checkform(myform){
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	if (!reg.test(theform.mail.value)) {
		alert("请填写正确的邮箱格式!");
		theform.mail.value == "";
		theform.mail.focus();
		return false;
	}
	
}
</script>
</head>
<body>
<div class="mail">
<div class="content">
<form name="mailform" method="post" action="doMail.jsp" onSubmit="return" checkform(this)>
<div class="box">
<span>收件人：</span>
<input name="to" type="text" id="to" title="收件人" size="50">
</div>
<div class="box">
<span>发件人：</span>
<input name="form" type="text" id="form" title="发件人" size="50">
</div>
<div class="box">
<span>密&nbsp;&nbsp;&nbsp;码</span>
<input name="password" type="password" id="password" title="发件人信箱密码" size="51">

</div>
<div class="box">
<span>主&nbsp;&nbsp;&nbsp;题</span>
<textarea name="content" cols="39" rows="6" id="content" title="邮件内容">
</textarea>
</div>
<div class="btus">
<input name="Submit" type="submit" value="发送"/>&nbsp;
<input name="Submit2" type="reset" value="重置"/>
</div>
</form>
</div>
</div>
</body>
</html>