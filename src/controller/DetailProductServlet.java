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

import DAO.FavoriteDAO;
import DAO.ProductDAO;
import common.ConnectDB;
import models.Product;

/**
 * Servlet implementation class DetailProductServlet
 */
@WebServlet("/DetailProductServlet")
public class DetailProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DetailProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Product product = ProductDAO.getProductById(id);
		request.setAttribute("product", product);

		Connection conn = ConnectDB.getConnection();
		HttpSession session = request.getSession();

		// da dang nhap
		int like = 0;
		if (session.getAttribute("id") != null) {
			int idCustomer = Integer.parseInt(session.getAttribute("id").toString());
			int idProduct = Integer.parseInt(request.getParameter("id"));
			like = FavoriteDAO.existFavorite(idCustomer, idProduct, conn);

		}
		request.setAttribute("like", like);
		System.out.println("like: " + like);
		// System.out.println(idCustomer);
		RequestDispatcher rd = request.getRequestDispatcher("views/frontend/ProductDetail.jsp");
		rd.forward(request, response);
	}

}
