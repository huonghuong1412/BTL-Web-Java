package controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ContactDAO;
import common.ConnectDB;
import models.Contact;

/**
 * Servlet implementation class ContactControler
 */
@WebServlet("/ContactController")
public class ContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		Connection conn = ConnectDB.getConnection();
		
		int customerID = Integer.parseInt(request.getParameter("userid"));
		String email = request.getParameter("mail");
		String content = request.getParameter("feedback");
		
		Contact contact = new Contact(customerID, email, content);
		boolean status = ContactDAO.insertFeedBack(contact, conn);
		if(status) {
			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/ContactUs.jsp?msg=valid");
			rd.forward(request, response);
			System.out.println("Luu phan hoi thanh cong");
			
		}
		else {
			System.out.println("Chua luu hoi thanh cong");
			response.sendRedirect("views/frontend/ContactUs.jsp/msg=invalid");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
