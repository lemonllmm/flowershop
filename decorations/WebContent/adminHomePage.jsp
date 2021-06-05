<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="db.AdminDao,java.util.*,pojo.Decorations"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员操作界面</title>
<link type="text/css" href="css/decorations.css" rel="stylesheet" />

</head>
<body>

<%
	//HashMap<String, Decorations> decs = (HashMap<String, Decorations>) session.getAttribute("decorations");
    //通过链接数据库,实现selectDec()方法
    AdminDao adminDao = new AdminDao();
    HashMap<String,Decorations> decs = adminDao.selectDec();
    //session.setAttribute("decorations", "decs");
%>




	<%
		//如果没有饰品信息
		if (decs == null || decs.size() == 0) {
	%>
	<div>没有商品可显示!</div>

	<%
		} else {
	%>
	<div class="content">
		<ul>
			<%
				Decorations dec;
					//遍历HashMap,显示所有饰品信息	通过 HashMap 的 entrySet()方法，可遍历 HashMap。
					for (HashMap.Entry<String, Decorations> entry : decs.entrySet()) {
						dec = (Decorations) entry.getValue();
			%>
			<li class="single">
			<a class="pic" href="" target="_blank">
			<img class="imgclass" src='images/<%=dec.getDecCover()%>' />
			</a>
				<div class="desc">
					<p>
						<a href="" target="_blank"> <%=dec.getDecName()%>
						</a>
					</p>
					<p>
						<span>现价：&yen;<%=dec.getNowPrice()%></span> <span class="orgprice">&nbsp;&nbsp;定价：
							<span class="org">&yen;<%=dec.getOrgPrice()%></span>
						</span>
					</p>
				<div class="star">
  
</div>
				
					<p>

						<span> <a href=""><%=dec.getAuthor()%></a>&nbsp;著

						</span> <span> /<%=dec.getPressDate()%></span> <span> /<a href=""><%=dec.getPress()%></a>
						</span>
					</p>
					<p class="detail"></p>
					<div>
				
					</div>
				</div></li>
			<%
			}
			%>
		</ul>
		
		<div class="bncar">
			<a class="bn" href='decorationsAdd.jsp'>添加商品</a>
		</div>


</div>
<%
	}
%>


</body>
</html>