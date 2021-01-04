package admin_controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ProductDAO;
import models.Product;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateProductServlet() {
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
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));
		Product product1 = ProductDAO.getProductById(id);

		String productName = request.getParameter("ProductName");
		String price = request.getParameter("Price");
		String quantity = request.getParameter("Quantity");
//		Part image = request.getPart("Image");
		String image = request.getParameter("Image");
		System.out.print(image);
		String description = request.getParameter("Description");
		String material = request.getParameter("Material");
		String category = request.getParameter("CategoryID");
		
		System.out.println("check3 "+ image);
		System.out.println("name:"+productName +" category: " + category +"id: "+id );
		
//		try {
			
			
			product1.setProductName(productName);
			product1.setPrice(Double.parseDouble(price));
			product1.setQuantity(Integer.parseInt(quantity));
			product1.setImage(image);
			product1.setDescription(description);
			product1.setMaterial(material);
			product1.setCategoryID(Integer.parseInt(category));
//			
//			product1.setImage(image.getSubmittedFileName().toString());
//			
//			System.out.print(category);
////			
			boolean status = ProductDAO.updateProduct(product1);
			System.out.println("status" + status);
			if(status) {
				RequestDispatcher rd = request.getRequestDispatcher("/UpdateProductController?msg=updated");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("UpdateProductController?msg=noupdate");
				rd.forward(request, response);
			}
		
	}

}
