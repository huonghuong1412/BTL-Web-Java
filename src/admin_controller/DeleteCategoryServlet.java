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

/**
 * Servlet implementation class DeleteCategoryServlet
 */
@WebServlet("/DeleteCategoryServlet")
public class DeleteCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("admin") != null) {
//			response.sendRedirect("views/admin/Products.jsp");
//			RequestDispatcher rd = request.getRequestDispatcher("views/admin/Category.jsp");
//			rd.forward(request, response);
			doPost(request, response);
		} else {
//			RequestDispatcher rd = request.getRequestDispatcher("views/admin/Login.jsp");
//			rd.forward(request, response);
			response.sendRedirect(request.getContextPath() + "/adminlogin");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = ConnectDB.getConnection();
		int id = Integer.parseInt(request.getParameter("CategoryID"));
		boolean status = CategoryDAO.deleteCategory(id, conn);
		if(status) {
//			RequestDispatcher rd=request.getRequestDispatcher(request.getContextPath() + "/admincategory");
//			rd.forward(request, response);
			response.sendRedirect(request.getContextPath() + "/admincategory");
		} else {
			
		}
	}

}
