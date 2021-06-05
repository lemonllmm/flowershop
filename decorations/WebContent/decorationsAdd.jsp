<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加饰品信息界面</title>
<link type="text/css" href="css/decorationsAdd.css" rel="stylesheet" />
</head>
<body>
<%
if((String)session.getAttribute("username") ==null){
  response.sendRedirect("adminLogin.jsp"); 
}else{

%>
<div class="banner">

	<h2 class="h">增加饰品</h2>
	
	<div class=".aside">
		<form name="frm1" action="DecAddServlet" method="post" enctype="multipart/form-data">
			<div class="box">
				<label class="i-label">饰品编号</label>
				 <input type="text" name="decNo" class="i-text" />
			</div>
			<div class="box">
				<label class="i-label">饰品名称</label> 
				<input type="text" name="decName" class="i-text" />
			</div>
			<div class="box">
				<label class="i-label">设计者</label> <input type="text" name="author"
					class="i-text" />
			</div>
			<div class="box">
				<label class="i-label">材质</label> <select name="press" size="1"
					class="i-text" style="height: 34px;">
					<option value="白银">白银</option>
					<option value="蓝水钻">蓝水钻</option>
					<option value="黄金">黄金</option>
					</select>
			</div>
			<div class="box">
			<label class="i-label">设计年份</label>
			<input type="date" name="pressDate" class="i-text"/>
			</div>
			<div class="box">
				<label class="i-label">库存</label>
				 <input type="text" name="decNum" class="i-text" />
			</div>
			<div class="box">
				<label class="i-label">原价</label> <input type="text" name="orgPrice" class="i-text" />
			</div>
			<div class="box">
				<label class="i-label">现价</label> <input type="text" name="nowPrice" class="i-text" />
			</div>
			<div class="box">
				<label class="i-label">图片</label> <input type="file" name="decCover" class="i-text" />
			</div>
			<div class="btns">
				<span class="i-text"> <input type="submit" value="提	交">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="清除">
				</span>
			</div>
<div align="right">欢迎您：<%= (String)session.getAttribute("username") %></div>
		</form>
</div>
	</div>
	<%
}
	%>
</body>
</html>