package admin_controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.OrderDAO;
import common.ConnectDB;
import models.OrderDetail;

/**
 * Servlet implementation class AdminDetailOrderServlet
 */
@WebServlet("/AdminDetailOrderServlet")
public class AdminDetailOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDetailOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("admin") != null) {
			doPost(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("views/admin/Login.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("OrderID"));
		Connection conn = ConnectDB.getConnection();
		OrderDetail orderDetail = OrderDAO.getOrderDetailById(conn, id);
		System.out.print("\nabc" + orderDetail);
		request.setAttribute("order", orderDetail);
		RequestDispatcher rd = request.getRequestDispatcher("views/admin/DetailOrder.jsp");
		rd.forward(request, response);
	}

}
