<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.jspsmart.upload.*,pojo.*,db.AdminDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>饰品信息上传</title>
</head>
<body>
<%
//try-catch捕获异常
try{
	SmartUpload upload = new SmartUpload();//初始化创建对象
	upload.initialize(pageContext);
	upload.setCharset("utf-8");//设置编码
	upload.setAllowedFilesList("jpg,jpeg,bmp,png");//允许上传的文件类型（扩展名）
	//文件上传
	upload.upload();
	upload.save("images");//文件存储到服务器端与当前文件同级的images子文件夹中
	//获取表单输入得饰品基本信息因表单提交为二进制形式,故不能使用request.getParameter()取得表单输入域的值

	String decNo = upload.getRequest().getParameter("decNo");
	String decName = upload.getRequest().getParameter("decName");
	String author = upload.getRequest().getParameter("author");
	String press = upload.getRequest().getParameter("press");
	String pressDate = upload.getRequest().getParameter("pressDate");
	String decNum = upload.getRequest().getParameter("decNum");
	String orgPrice = upload.getRequest().getParameter("orgPrice");
	String nowPrice = upload.getRequest().getParameter("nowPrice");
	//遇到得问题:这里使用File会报错，因为它返回的是SmartFile对象
	SmartFile file = upload.getFiles().getFile(0);
	Decorations decorations = new Decorations();
	decorations.setDecNo(decNo);
	decorations.setDecName(decName);
	decorations.setAuthor(author);
     decorations.setAuthor(author);
     decorations.setPress(press);
     decorations.setPressDate(pressDate);
     int num;
     if(decNum==null||decNum.trim().equals("")){
    	 num = 0;
    	 
     }else{
    	 //因为通过upload.getRequest().getParameter("bookNum")返回值类型为String，
    	 //需通过 Integer.parseInt(bookNum)将其转换为 int
    	 num=Integer.parseInt(decNum);
    	 
     }
     float oPrice,nPrice;
     if(orgPrice==null||orgPrice.trim().equals("")){
    	 oPrice=0;
     }else{
    	 //转成float类型
    	 oPrice=Float.parseFloat(orgPrice);
     }
    	if(nowPrice==null||nowPrice.trim().equals("")){
    		nPrice = 0;
    	} else{
    		nPrice =Float.parseFloat(nowPrice);
    		
    	}
    	decorations.setDecNum(num);
    	decorations.setOrgPrice(oPrice);
    	decorations.setNowPrice(nPrice);
    	decorations.setDecCover(file.getFileName());
    	//用hashMap从session中取出所有图书列表对象，若为空，则新建
    	//HashMap<String,Decorations> decoration = (HashMap<String,Decorations>)session.getAttribute("decorations");
         session.setAttribute("decorations", decorations);
    	AdminDao adminDao  = new AdminDao();
        int result =  adminDao.addDec(decorations);
        if(result!=0){
         response.sendRedirect("decorationList.jsp");//实现页面跳转
        }else{
        	out.print("添加失败");
        }
}catch(Exception e){
	out.print(e.getMessage());
	
}

%>
</body>
</html>