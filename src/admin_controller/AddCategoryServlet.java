package admin_controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CategoryDAO;
import common.ConnectDB;
import models.Category;

/**
 * Servlet implementation class AddCategoryServlet
 */
@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("admin") != null) {
//			RequestDispatcher rd = request.getRequestDispatcher("views/admin/InsertCategory.jsp");
//			rd.forward(request, response);
			doPost(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("views/admin/Login.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String categoryName = request.getParameter("CategoryName");
		
		Category category = new Category();
		category.setCategoryName(categoryName);
		Connection conn = ConnectDB.getConnection();
		boolean status = CategoryDAO.insertCategory(category, conn);
		if(status) {
//			RequestDispatcher rd = request.getRequestDispatcher("/AdminCategoryServlet");
//			rd.forward(request, response);
			response.sendRedirect(request.getContextPath() + "/admincategory");
		} else {
			request.setAttribute("mesaage", "Not OK");
			RequestDispatcher rd = request.getRequestDispatcher("views/admin/InsertCategory.jsp");
			rd.forward(request, response);
		}
	}

}
