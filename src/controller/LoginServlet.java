package controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CustomerDAO;
import common.ConnectDB;
import common.HashPassword;
import models.Customer;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "LoginServlet", urlPatterns = { "/login" })
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			// RequestDispatcher dispatch =
			// request.getRequestDispatcher("/views/frontend/Home.jsp");
			// dispatch.forward(request, response);
			response.sendRedirect(request.getContextPath() + "/home");
		} else {
			RequestDispatcher dispatch = request.getRequestDispatcher("/views/frontend/Login.jsp");
			dispatch.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Connection conn = ConnectDB.getConnection();

		try {
			password = HashPassword.hashPassword(password);

			Customer customer = CustomerDAO.login(username, password, conn);
			if (customer != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", customer);
				session.setAttribute("id", customer.getCustomerID());
				session.setAttribute("username", customer.getUserName());
				session.setAttribute("password", customer.getPassword());
				session.setAttribute("fullname", customer.getFullName());
				session.setAttribute("address", customer.getAddress());
				session.setAttribute("phone", customer.getPhone());

				// session.setMaxInactiveInterval(300);
				//
				// session.setAttribute("timeOutTimeInSeconds", 300);
				// session.setAttribute("showTimerTimeInSeconds", 30);
				session.setMaxInactiveInterval(30 * 60);

				//
				Cookie loginCookie = new Cookie("username", username);
				loginCookie.setMaxAge(30 * 60); // 30 phut
				response.addCookie(loginCookie);

				response.sendRedirect(request.getContextPath() + "/home");
			} else {
				request.setAttribute("message", "Tài khoản không tồn tại");
				RequestDispatcher dispatch = request.getRequestDispatcher("/views/frontend/Login.jsp");
				dispatch.forward(request, response);
			}

		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
