package admin_controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.OrderDAO;
import models.Order;

/**
 * Servlet implementation class ConfirmOrderServlet
 */
@WebServlet("/ConfirmOrderServlet")
public class ConfirmOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admin") != null) {
//			RequestDispatcher rd = request.getRequestDispatcher("views/admin/Order.jsp");
//			rd.forward(request, response);
//			response.sendRedirect(request.getContextPath() + "/listorder");
			doPost(request, response);
		} else {
//			RequestDispatcher rd = request.getRequestDispatcher("views/admin/Login.jsp");
//			rd.forward(request, response);
			response.sendRedirect(request.getContextPath() + "/adminlogin");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("OrderID"));
		try {
			Order order = OrderDAO.getOrderById(id);
			order.setStatus(1);
			OrderDAO.confirmOrder(order);
//			RequestDispatcher rd = request.getRequestDispatcher("views/admin/Order.jsp");
//			rd.forward(request, response);
			response.sendRedirect(request.getContextPath() + "/listorder");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
