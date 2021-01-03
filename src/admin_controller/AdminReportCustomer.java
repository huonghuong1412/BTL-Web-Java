package admin_controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.OrderDAO;
import common.ConnectDB;
import models.ReportCustomer;

/**
 * Servlet implementation class AdminReportCustomer
 */
@WebServlet(name = "/AdminReportCustomer", urlPatterns = { "/listcustomer" })
public class AdminReportCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminReportCustomer() {
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
		if (session.getAttribute("admin") != null) {
			doPost(request, response);
			// RequestDispatcher dispatch =
			// request.getRequestDispatcher("views/admin/Customer.jsp");
			// dispatch.forward(request, response);
		} else {
			// RequestDispatcher rd = request.getRequestDispatcher("views/admin/Login.jsp");
			// rd.forward(request, response);
			response.sendRedirect(request.getContextPath() + "/adminlogin");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = ConnectDB.getConnection();
		List<ReportCustomer> list = OrderDAO.reportOrderByCustomer(conn);
		request.setAttribute("customers", list);
		RequestDispatcher dispatch = request.getRequestDispatcher("views/admin/Customer.jsp");
		dispatch.forward(request, response);
	}

}
