package controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CustomerDAO;
import common.ConnectDB;
import common.HashPassword;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePassword() {
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
			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/ChangePassword.jsp");
			rd.forward(request, response);
		} else {
			// RequestDispatcher rd =
			// request.getRequestDispatcher("views/frontend/Login.jsp");
			// rd.forward(request, response);
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		String oldPass = request.getParameter("oldPass");
		String newPassword = request.getParameter("newPass");
		Connection conn = ConnectDB.getConnection();
		try {
			oldPass = HashPassword.hashPassword(oldPass);
			if (oldPass.equals(session.getAttribute("password")) == true) {
				newPassword = HashPassword.hashPassword(newPassword);
				if (CustomerDAO.changePassword(id, newPassword, conn)) {
					session.setAttribute("id", id);
					request.setAttribute("success", "ok");
//					response.sendRedirect(request.getContextPath() + "/profile");
					RequestDispatcher rd = request.getRequestDispatcher("views/frontend/ChangePassword.jsp");
					rd.forward(request, response);
				} else {
					RequestDispatcher rd = request.getRequestDispatcher("views/frontend/ChangePassword.jsp");
					rd.forward(request, response);
				}
			} else {
				request.setAttribute("message", "not ok");
				RequestDispatcher rd = request.getRequestDispatcher("views/frontend/ChangePassword.jsp");
				rd.forward(request, response);
			}
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}
