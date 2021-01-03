package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
import models.Favorite;
import models.Product;

/**
 * Servlet implementation class FavouriteServlet
 */
@WebServlet("/FavouriteServlet")
public class FavouriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FavoriteDAO favoriteDAO;

	public FavouriteServlet() {
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

		if (session.getAttribute("user") != null) {
			// RequestDispatcher rd = request.getRequestDispatcher("views/admin/Order.jsp");
			// rd.forward(request, response);
			// response.sendRedirect(request.getContextPath() + "/listorder");
			doPost(request, response);
		} else {
			// RequestDispatcher rd = request.getRequestDispatcher("views/admin/Login.jsp");
			// rd.forward(request, response);
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

	private void removeFavourite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = ConnectDB.getConnection();
		HttpSession session = request.getSession();
		int idCustomer = Integer.parseInt(session.getAttribute("id").toString());
		int idProduct = Integer.parseInt(request.getParameter("ProductID"));

		boolean status = favoriteDAO.deleteFavorite(idCustomer, idProduct, conn);
		if (status) {
			RequestDispatcher rd = request.getRequestDispatcher("/FavouriteServlet?action=list&msg=sucuss");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/FavouriteServlet?action=error");
			rd.forward(request, response);
		}
	}

	private void addFavorite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = ConnectDB.getConnection();
		HttpSession session = request.getSession();
		// Object idCustomer = session.getAttribute("id");
		int idCustomer = Integer.parseInt(session.getAttribute("id").toString());
		int idProduct = Integer.parseInt(request.getParameter("ProductID"));
		// String idProduct = request.getParameter("ProductID");
		int count = favoriteDAO.existFavorite(idCustomer, idProduct, conn);
		if (count == 0) {
			boolean status = favoriteDAO.insertFavourite(new Favorite(idCustomer, idProduct), conn);
			// System.out.println("idProduct: "+ idProduct+" "+idCustomer +"status"+
			// status);
			if (status) {
				RequestDispatcher rd = request.getRequestDispatcher("/FavouriteServlet?action=list");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("/FavouriteServlet?action=error");
				rd.forward(request, response);
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/FavouriteServlet?action=list");
			rd.forward(request, response);
		}

	}

	private void listFavorite(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		HttpSession session = request.getSession();
		Connection conn = ConnectDB.getConnection();
		int idCustomer = Integer.parseInt(session.getAttribute("id").toString());
		List<Favorite> fv = FavoriteDAO.ListFavorite(idCustomer, conn);
		List<Product> products = new ArrayList<>();
		// request.setAttribute("Favorite", fv);
		for (Favorite i : fv) {
			int idProduct = i.getIdProduct();
			Product p = ProductDAO.getProductById(idProduct);
			products.add(p);
		}
		request.setAttribute("products", products);
		System.out.print("NameProduct: " + products.get(1).getProductName());
		// System.out.println("check idFavorite: "+ fv.get(2).getIdFavorite());
		String url = "/views/frontend/Favorite.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
		System.out.println("check2");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println(action);
		switch (action) {
		case "list":
			try {
				listFavorite(request, response);
			} catch (SQLException | ServletException | IOException e) {

				e.printStackTrace();
			}
			break;
		case "add":
			addFavorite(request, response);
			break;
		case "remove":
			removeFavourite(request, response);
			break;
		default:
			break;
		}
	}

}
