package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Cart;
import models.Product;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Cart> cart = new ArrayList<Cart>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// RequestDispatcher rd =
		// request.getRequestDispatcher("views/frontend/Cart.jsp");
		// rd.forward(request, response);
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		String ProductID = request.getParameter("ProductID");
		System.out.print(ProductID);
		int productID = 1;
//		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int quantity = 1;
		if (command.equals("addCart")) {
			Product product = new Product(Integer.parseInt(ProductID), "", 0.0, 0, "", "", "", 0);
			addTocart(product);
			HttpSession session = request.getSession();
			session.setAttribute("cart", cart);
			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/Cart.jsp");
			rd.forward(request, response);
		} else if (command.equals("deleteCart")) {
			Product product = new Product(Integer.parseInt(ProductID), "", 0.0, 0, "", "", "", 0);
			deleteFromcart(product);
			HttpSession session = request.getSession();
			session.setAttribute("cart", cart);
			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/Cart.jsp");
			rd.forward(request, response);
		} else if (command.equals("removeCart")) {
			Product product = new Product(Integer.parseInt(ProductID), "", 0.0, 0, "", "", "", 0);
			removeFromcart(product);
			HttpSession session = request.getSession();
			session.setAttribute("cart", cart);
			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/Cart.jsp");
			rd.forward(request, response);
		} else if (command.equals("setCart")) {
			Product product = new Product(Integer.parseInt(ProductID), "", 0.0, 0, "", "", "", 0);
			setCart(product, quantity);
			HttpSession session = request.getSession();
			session.setAttribute("cart", cart);
			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/Cart.jsp");
			rd.forward(request, response);
		} else if(command.equals("viewCart")) {
			HttpSession session = request.getSession();
			session.setAttribute("cart", cart);
			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/Cart.jsp");
			rd.forward(request, response);
		}
	}

	// add to cart
	private String addTocart(Product product) {
		for(Cart item : cart) {
			if(item.getProduct().getProductID() == product.getProductID()) {
				item.setQuantity(item.getQuantity() + 1);
				return "cart";
			}
		}
		Cart c = new Cart();
		c.setProduct(product);
		c.setQuantity(1);
		cart.add(c);
		return "cart";
	}

	
	// delete 1 product in cart
	private String deleteFromcart(Product product) {
		for(Cart item : cart) {
			if(item.getProduct().getProductID() == product.getProductID() && item.getQuantity() > 1) {
				item.setQuantity(item.getQuantity() - 1);
				return "cart";
			}
		}
		return "cart";
	}

	private String removeFromcart(Product product) {
		for(Cart item : cart) {
			if(item.getProduct().getProductID() == product.getProductID()) {
				cart.remove(item);
				return "cart";
			}
		}
		return "cart";
	}

	private String setCart(Product product, int k) {
		for(Cart item : cart) {
			if(item.getProduct().getProductID() == product.getProductID()) {
				item.setQuantity(k);
				return "cart";
			}
		}
		Cart c = new Cart();
		c.setProduct(product);
		c.setQuantity(k);
		cart.add(c);
		return "cart";
	}

}
