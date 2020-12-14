package admin_controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AdminDAO;
import common.HashPassword;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLoginServlet() {
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
			RequestDispatcher dispatch = request.getRequestDispatcher("views/admin/Home.jsp");
			dispatch.forward(request, response);
		} else {
			RequestDispatcher dispatch = request.getRequestDispatcher("views/admin/Login.jsp");
			dispatch.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			password = HashPassword.hashMD5(password.toCharArray());
			
			if (AdminDAO.login(username, password)) {
				HttpSession session = request.getSession();
				session.setAttribute("user", "admin");
				session.setAttribute("admin", "dmin avdvsdvsd");
				
				session.setMaxInactiveInterval(30*60);
				
				Cookie loginCookie = new Cookie("username", username);
				loginCookie.setMaxAge(30 * 60); // 30 phut
				response.addCookie(loginCookie);
				
				RequestDispatcher dispatch = request.getRequestDispatcher("views/admin/Home.jsp");
				dispatch.forward(request, response);
			} else {
				RequestDispatcher dispatch = request.getRequestDispatcher("views/admin/Login.jsp");
				dispatch.forward(request, response);
			}
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
