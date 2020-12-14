package admin_controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import DAO.ProductDAO;
import common.ConnectDB;
import models.Product;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/AddProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 100MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB

public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductServlet() {
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
			response.sendRedirect("views/admin/InsertProduct.jsp");
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
		request.setCharacterEncoding("UTF-8");
		
		Connection conn = ConnectDB.getConnection();

		String productName = request.getParameter("ProductName");
		String price = request.getParameter("Price");
		String quantity = request.getParameter("Quantity");
		Part image = request.getPart("Image");
		String description = request.getParameter("Description");
		String material = request.getParameter("Material");
		int category = Integer.parseInt(request.getParameter("CategoryID"));

		Product product = new Product();
		product.setProductName(productName);
		product.setPrice(Double.parseDouble(price));
		product.setQuantity(Integer.parseInt(quantity));
		// product.setImage(image);
		product.setDescription(description);
		product.setMaterial(material);
		product.setCategoryID(category);
		product.setImage(image.getSubmittedFileName().toString());;
		
		boolean status = ProductDAO.insertProduct(product, conn);
		if(status) {
			RequestDispatcher rd = request.getRequestDispatcher("/AdminProductServlet");
			rd.forward(request, response);
		}

	}

}
