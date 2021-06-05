<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>表单处理页面</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");//设置编码格式 %>
    <%--用<jsp:useBean>创建 JavaBean 对象，用于存储个人注册信息，class：此对象对应得包，类名称 --%>
    <jsp:useBean id="myRegister" class="pojo.User" />
    <%-- 用<jsp:setProperty>获取表单输入的信息，赋给 JavaBean 对象的各个属性,property="*"意为 request 请求中所有参数的值将被一一赋给 Bean 中与参数具有相同名字的属性。 --%>
    <jsp:setProperty property="*" name="myRegister"/>
    <%--拓展练习获取复选框过程中出现得问题：获取复选框信息时报错：引用["]，在值内使用必须被转义，解决方法将“”变成'' 
    注意参数一定要和工具bean里得名称一样！！
    --%>
  <%String[] array= request.getParameterValues("like");
 // out.print(Arrays.toString(array));
  %>  
 <jsp:setProperty property="like" name="myRegister" value="<%=Arrays.toString(array)%>"/>  
 
<h2>注册信息如下:</h2>
<hr>
<%-- 用<jsp:getProperty>获取 JavaBean 对象的各个属性值 ,property属性用于指定javaBean实例对象得属性名--%>
姓名：<jsp:getProperty name="myRegister" property="username"/><br/>
密码：<jsp:getProperty name="myRegister" property="userpwd"/><br/>
性别：<jsp:getProperty name="myRegister" property="sex"/><br/>
生日：<jsp:getProperty name="myRegister" property="birthday"/><br/>
邮箱：<jsp:getProperty name="myRegister" property="mail"/><br/>
城市：<jsp:getProperty name="myRegister" property="selProvince"/>
<jsp:getProperty name="myRegister" property="selCity"/><br/>
职位：<jsp:getProperty name="myRegister" property="work"/><br/>
喜好：<jsp:getProperty name="myRegister" property="like"/><br/>
个人介绍：<jsp:getProperty name="myRegister" property="intro"/><br/>

</body>
</html>