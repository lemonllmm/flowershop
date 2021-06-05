<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,pojo.Decorations"%>
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
		HashMap<String, Decorations> dec = (HashMap<String, Decorations>) session.getAttribute("decorations");
		//两种情况都会有action，buy和removeone
		String action = request.getParameter("action");
		if (action == null)
			action = "";

		if (action.equals("buy")) { //购买商品,
			//点击加入购物车，对应饰品action即为buy同时传入饰品的编号decNo=<%=entry.getKey()%
			String DecorationsNo = request.getParameter("decNo");
			Decorations temp = (Decorations) DecorationsCar.get(DecorationsNo);
			if (temp == null) {
				//如果 car 中不存在该商品
				temp = (Decorations)dec.get(DecorationsNo);
				temp.setBuyNum(1);
				DecorationsCar.put(DecorationsNo, temp);
			} else { //如果 car 中存在该商品，购买数量加 1 
				temp.setBuyNum(temp.getBuyNum() + 1);
			     DecorationsCar.put(DecorationsNo, temp);
			}
			session.setAttribute("DecorationsCar", DecorationsCar);
			//刷新的功能
			response.sendRedirect("decorationList.jsp");
		} else if (action.equals("removeone")) {
			//在购物车界面点击删除，对应的action为removeone同时传入饰品的编号
			String DecorationsNo = request.getParameter("decNo");
			DecorationsCar.remove(DecorationsNo);
			session.setAttribute("DecorationsCar", DecorationsCar);
			response.sendRedirect("showCar.jsp");
		} else if (action.equals("批量删除")) { //拓展题，利用js删除后，页面刷新后无法显示效果，所以采用hashmap对象操作
			 String[] decNos = request.getParameterValues("checkOne");//获取所有勾选了的复选框的值，并以数组返回
			 if(decNos.length>0){
				 for(int i=0;i<decNos.length;i++){//遍历数组中全部的值，逐一删除
					 DecorationsCar.remove(decNos[i]);
				 }
			 }
			 session.setAttribute("DecorationsCar", DecorationsCar); 
			 response.sendRedirect("showCar.jsp");
			}else if (action.equals("minus")) {//减
				   String decNo = request.getParameter("decNo");  
				   Decorations temp = (Decorations) DecorationsCar.get(decNo);
		           if(temp.getBuyNum()>1){//只有购买数量大于1的时候才能减操作
		           temp.setBuyNum(temp.getBuyNum()-1);
		           DecorationsCar.put(decNo, temp);
		           }
		           session.setAttribute("DecorationsCar", DecorationsCar); 
		    	   response.sendRedirect("showCar.jsp");
		           }else if(action.equals("plus")){//加
		               String decNo = request.getParameter("decNo");
		               Decorations temp=(Decorations)DecorationsCar.get(decNo);
		               temp.setBuyNum(temp.getBuyNum()+1);
		               DecorationsCar.put(decNo, temp);
		               session.setAttribute("DecorationsCar", DecorationsCar); 
			    	   response.sendRedirect("showCar.jsp");
		} else {
			response.sendRedirect("showCar.jsp");
		}
	%>

	
</body>
</html>