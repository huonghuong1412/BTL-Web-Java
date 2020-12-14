package controller;

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
import models.History;

/**
 * Servlet implementation class HistoryOrderServlet
 */
@WebServlet("/HistoryOrderServlet")
public class HistoryOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoryOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("user") != null) {
			doPost(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/Login.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = ConnectDB.getConnection();
		HttpSession session = request.getSession();
		int customerId = (int) session.getAttribute("id");
		List<History> list = OrderDAO.getListOrderByCustomer(conn, customerId);
		request.setAttribute("histories", list);
		RequestDispatcher rd = request.getRequestDispatcher("views/frontend/HistoryOrder.jsp");
		rd.forward(request, response);
	}

}
