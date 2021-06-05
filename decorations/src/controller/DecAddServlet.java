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
//��ʼ��Servlet
    final public void init(ServletConfig config)throws ServletException{
    	this.config = config;
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			SmartUpload upload = new SmartUpload();//��ʼ����������
			upload.initialize(config,request,response);
			upload.setCharset("utf-8");//���ñ���
			upload.setAllowedFilesList("jpg,jpeg,bmp,png");//�����ϴ����ļ����ͣ���չ����
			try {
			//�ļ��ϴ�
			upload.upload();
			upload.save("images");//�ļ��洢�����������뵱ǰ�ļ�ͬ����images���ļ�����
			//��ȡ���������Ʒ������Ϣ����ύΪ��������ʽ,�ʲ���ʹ��request.getParameter()ȡ�ñ��������ֵ
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
			//����������:����ʹ��File�ᱨ����Ϊ�����ص���SmartFile����
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
		    	 //��Ϊͨ��upload.getRequest().getParameter("bookNum")����ֵ����ΪString��
		    	 //��ͨ�� Integer.parseInt(bookNum)����ת��Ϊ int
		    	 num=Integer.parseInt(decNum);
		    	 
		     }
		     float oPrice,nPrice;
		     if(orgPrice==null||orgPrice.trim().equals("")){
		    	 oPrice=0;
		     }else{
		    	 //ת��float����
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
		    	//ͨ�� HttpServletRequest ���͵� request ȡ�� session ����
				HttpSession session = request.getSession();
				//����session���ж��ҳ��֮�䴫ֵ
				session.setAttribute("decorations", decorations);
		    	  System.out.print(file.getFileName());
		    	AdminDao adminDao = new AdminDao();
		    	int result =adminDao.addDec(decorations);
		      if(result!=0) {
		    	
		    	response.sendRedirect("DecDisplayServlet");
	
		      }else {
		    	  response.setContentType("text/html; charset=UTF-8");
		    	  PrintWriter out = response.getWriter();
		    	 out.print("����ʧ��");
		      }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
