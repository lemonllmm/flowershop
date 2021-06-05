package controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import com.jspsmart.upload.*;

import pojo.Decorations;
import db.AdminDao;
/**
 * Servlet implementation class BookAddServlet
 */
@WebServlet("/DecAddServlet")
public class DecAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private ServletConfig config;
    
    public DecAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
//初始化Servlet
    final public void init(ServletConfig config)throws ServletException{
    	this.config = config;
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			SmartUpload upload = new SmartUpload();//初始化创建对象
			upload.initialize(config,request,response);
			upload.setCharset("utf-8");//设置编码
			upload.setAllowedFilesList("jpg,jpeg,bmp,png");//允许上传的文件类型（扩展名）
			try {
			//文件上传
			upload.upload();
			upload.save("images");//文件存储到服务器端与当前文件同级的images子文件夹中
			//获取表单输入得饰品基本信息因表单提交为二进制形式,故不能使用request.getParameter()取得表单输入域的值
			}catch(SmartUploadException e){
				System.err.println(e.getMessage());
				
			}
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
		    	//通过 HttpServletRequest 类型的 request 取得 session 对象
				HttpSession session = request.getSession();
				//利用session进行多个页面之间传值
				session.setAttribute("decorations", decorations);
		    	  System.out.print(file.getFileName());
		    	AdminDao adminDao = new AdminDao();
		    	int result =adminDao.addDec(decorations);
		      if(result!=0) {
		    	
		    	response.sendRedirect("DecDisplayServlet");
	
		      }else {
		    	  response.setContentType("text/html; charset=UTF-8");
		    	  PrintWriter out = response.getWriter();
		    	 out.print("插入失败");
		      }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
