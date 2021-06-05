package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.AdminDao;
import pojo.Decorations;


@WebServlet("/DecDisplayServlet")
public class DecDisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DecDisplayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	AdminDao adminDao = new AdminDao();
	HashMap<String,Decorations> decorations = adminDao.selectDec();
	adminDao.close();
	HttpSession session = request.getSession();
	session.setAttribute("decorations", decorations);
	request.getRequestDispatcher("decorationList.jsp").forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
