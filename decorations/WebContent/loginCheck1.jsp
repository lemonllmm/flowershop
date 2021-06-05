<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="db.UserDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录界面</title>
</head>
<body>
	<%
		//设置编码
		request.setCharacterEncoding("utf-8");
		//获取用户名
		String username = request.getParameter("username");
		//获取密码
		String password = request.getParameter("password");
		//利用session进行多个页面之间传值
		session.setAttribute("username", username);
		session.setAttribute("password", password);
		//创建对象
		UserDao userDao = new UserDao();
		//调用方法
		int result = userDao.login(username, password);
		String userVCode = request.getParameter("userVCode");
		String validateCode = (String) session.getAttribute("validateCode");
		if (userVCode.equalsIgnoreCase(validateCode)) {

			//返回一表示登录成功跳转到登录成功界面
			if (result == 1) {
				response.sendRedirect("success.jsp");
			} else if (result == 0) {
				response.sendRedirect("error.jsp");//登录失败
			} else {
				out.print("系统出现异常");
			}
		} else{
	 out.println("<script>alert('验证码输入错误！');history.go(-1);</script>");
		}
		%>
</body>
</html>