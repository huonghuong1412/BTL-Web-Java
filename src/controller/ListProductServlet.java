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

import DAO.ProductDAO;
import common.ConnectDB;
import models.Product;

/**
 * Servlet implementation class ListProductServlet
 */
@WebServlet("/ListProductServlet")
public class ListProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = ConnectDB.getConnection();
		String category = request.getParameter("category");
		List<Product> listProduct = null;
		String page = request.getParameter("page");
		if (page == null) {
			listProduct = ProductDAO.getListProductByCategory(conn, category, 1);
			request.setAttribute("products", listProduct);
			request.setAttribute("count", ProductDAO.getCountProducts(conn, category));
			request.setAttribute("category", category);
			request.setAttribute("currentpage", 1);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("views/frontend/ListProduct.jsp");
			dispatch.forward(request, response);
			
		} else {
			listProduct = ProductDAO.getListProductByCategory(conn, category, Integer.parseInt(page));
			request.setAttribute("products", listProduct);
			request.setAttribute("count", ProductDAO.getCountProducts(conn, category));
			request.setAttribute("category", category);
			request.setAttribute("currentpage", Integer.parseInt(page));
			
			RequestDispatcher dispatch = request.getRequestDispatcher("views/frontend/ListProduct.jsp");
			dispatch.forward(request, response);
		}
	}

}
