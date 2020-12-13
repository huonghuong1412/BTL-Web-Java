package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.OrderDAO;
import DAO.ProductDAO;
import models.Cart;
import models.Order;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		if (username != null) {
			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/Order.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/Login.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String note = request.getParameter("note");

		HttpSession session = request.getSession();
		List<Cart> cart = new ArrayList<Cart>();

		int customerID = (int) session.getAttribute("id");

		try {
			ProductDAO productDAO = new ProductDAO();

			if (session.getAttribute("cart") != null) {
				cart = (ArrayList<Cart>) session.getAttribute("cart");
			}

			if (cart != null) {
				for (Cart c : cart) {
					Order order = new Order(0, customerID,
							productDAO.getProductByIdCart(c.getProduct().getProductID()).getProductID(),
							productDAO.getProductByIdCart(c.getProduct().getProductID()).getPrice(), c.getQuantity(), 0,
							new Timestamp(new Date().getTime()), note, phone, address);
					OrderDAO.addOrder(order);

				}
			}

			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/Order.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
