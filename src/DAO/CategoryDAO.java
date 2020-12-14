package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.ConnectDB;
import models.Category;

public class CategoryDAO {

	public CategoryDAO() {

	}

	public static List<Category> getAllCategory() {
		Connection conn = ConnectDB.getConnection();
		List<Category> list = new ArrayList<Category>();
		PreparedStatement state = null;
		String sql = "select * from category";

		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				int categoryID = rs.getInt("CategoryID");
				String categoryName = rs.getString("CategoryName");

				list.add(new Category(categoryID, categoryName));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;

	}

	public static List<Category> getListCategory(Connection conn) {
		List<Category> lstcate = new ArrayList<Category>();
		PreparedStatement ptmt = null;

		String sql = "select * from category";

		try {
			ptmt = conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Category pro = new Category();
				pro.setCategoryID(rs.getInt("CategoryID"));
				pro.setCategoryName(rs.getString("CategoryName"));
				lstcate.add(pro);
			}
			ptmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lstcate;
	}

	public static boolean insertCategory(Category category, Connection conn) {
		PreparedStatement state = null;
		String sql = "insert into category(CategoryName) values( ? )";
		try {
			state = conn.prepareStatement(sql);
			state.setString(1, category.getCategoryName());
			int status = state.executeUpdate();
			if (status == 0) {
				return false;
			}
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	public static boolean deleteCategory(int id, Connection conn) {
		PreparedStatement state = null;
		String sql = "delete from category where CategoryID = " + id;
		try {
			state = conn.prepareStatement(sql);
			int rs = state.executeUpdate();
			if (rs == 0) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

}
