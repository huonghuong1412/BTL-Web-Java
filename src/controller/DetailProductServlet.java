package controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Config.ConnectDB;
import DAO.ProductDAO;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Connection conn = ConnectDB.getConnection();
		Product product = ProductDAO.getProductById(id, conn);
		request.setAttribute("product", product);
		
		RequestDispatcher rd = request.getRequestDispatcher("views/frontend/ProductDetail.jsp");
		rd.forward(request, response);
	}

}
