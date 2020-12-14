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

import DAO.ProductDAO;
import common.ConnectDB;
import models.Product;

/**
 * Servlet implementation class AdminProductServlet
 */
@WebServlet("/AdminProductServlet")
public class AdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminProductServlet() {
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
		if(session.getAttribute("admin") != null) {
			doPost(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("views/admin/Login.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = ConnectDB.getConnection();
		List<Product> listProduct = null;
		String page = request.getParameter("page");

		if (page == null) {
			listProduct = ProductDAO.getListProductByCategory(conn, "allproduct", 1);
			request.setAttribute("products", listProduct);
			request.setAttribute("count", ProductDAO.getCountProducts(conn, "all"));
			request.setAttribute("currentpage", 1);

			RequestDispatcher dispatch = request.getRequestDispatcher("views/admin/Products.jsp");
			dispatch.forward(request, response);

		} else {
			listProduct = ProductDAO.getListProductByCategory(conn, "allproduct", Integer.parseInt(page));
			request.setAttribute("products", listProduct);
			request.setAttribute("count", ProductDAO.getCountProducts(conn, "all"));
			request.setAttribute("currentpage", Integer.parseInt(page));

			RequestDispatcher dispatch = request.getRequestDispatcher("views/admin/Products.jsp");
			dispatch.forward(request, response);
		}

	}

}
