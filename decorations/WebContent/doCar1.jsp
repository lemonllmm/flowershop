<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,pojo.Decorations,utils.ShopCar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车界面</title>
</head>
<body>
	<%
		//设置编码
		request.setCharacterEncoding("utf-8");
		//先从session中取出购物车信息
		HashMap<String, Decorations> DecorationsCar = (HashMap<String, Decorations>) session.getAttribute("decorations");
		//利用session页面之间共享购物车。更新购物车(商品的加减和删除)之前,先从 session 中取出购物车（HashMap 对象），
		//更新之后，将新的购物车（HashMap）对象存入 session.
		if (DecorationsCar == null) {
			//如果购物车为空,则新建购物车hashmap对象
			DecorationsCar = new HashMap<String, Decorations>();
		}
		//创建工具类对象
		ShopCar shop = new ShopCar();
		HashMap<String, Decorations> dec = (HashMap<String, Decorations>) session.getAttribute("decorations");
		//两种情况都会有action，buy和removeone
		String action = request.getParameter("action");
		String DecorationsNo = request.getParameter("decNo");
		if (action == null)
			action = "";
		if(action.equals("buy")){
			//调用方法
			shop.addItem(action, DecorationsNo, DecorationsCar, dec);
			session.setAttribute("DecorationsCar", DecorationsCar);
			//刷新的功能
			response.sendRedirect("decorationList.jsp");
		}
		else if (action.equals("removeone")) {
			shop.removeItem(DecorationsNo, DecorationsCar);
			session.setAttribute("DecorationsCar", DecorationsCar);
			response.sendRedirect("showCar.jsp");
			
		}
		else if (action.equals("批量删除")){
			 String[] decNos = request.getParameterValues("checkOne");//获取所有勾选了的复选框的值，并以数组返回
			shop.minuItem(decNos, DecorationsCar);
			
		}else {
			response.sendRedirect("showCar.jsp");
		}
%>

</body>
</html>