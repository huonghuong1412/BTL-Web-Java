package controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Config.ConnectDB;
import DAO.AdminDAO;
import DAO.CustomerDAO;
import models.Customer;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.sendRedirect("views/frontend/Login.jsp");
		RequestDispatcher dispatch = request.getRequestDispatcher("views/frontend/Login.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Connection conn = ConnectDB.getConnection();
		
		if(AdminDAO.login(username, password)) {
			request.setAttribute("admin", "dmin avdvsdvsd");
//			RequestDispatcher dispatch = request.getRequestDispatcher("views/admin/Home.jsp");
//			dispatch.forward(request, response);
			response.sendRedirect("views/admin/Home.jsp");
		} else {
			Customer customer = CustomerDAO.login(username, password, conn);
			if(customer != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", customer);
				session.setAttribute("id", customer.getCustomerID());
				session.setAttribute("username", customer.getUserName());
				session.setAttribute("password", customer.getPassword());
				session.setAttribute("fullname", customer.getFullName());
				session.setAttribute("address", customer.getAddress());
				session.setAttribute("phone", customer.getPhone());
				response.sendRedirect("views/frontend/Home.jsp");
			} else {
				request.setAttribute("message", "Tài khoản không tồn tại");
				RequestDispatcher dispatch = request.getRequestDispatcher("views/frontend/Login.jsp");
				dispatch.forward(request, response);
			}
		}
	}

}
