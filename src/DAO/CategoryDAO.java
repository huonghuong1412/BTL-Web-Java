package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.ConnectDB;
import models.Category;

public class CategoryDAO {

	public CategoryDAO() {

	}

	public List<Category> getAllCategory() {
		Connection conn = ConnectDB.getConnection();
		List<Category> list = new ArrayList<>();
		PreparedStatement state = null;
		String sql = "select * from category";

		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				Category category = new Category();
				category.setCategoryID(rs.getInt("CategoryID"));
				category.setCategoryName(rs.getString("CategoryName"));
				list.add(category);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;

	}

	public static boolean insertCategory(Category category, Connection conn) {
		PreparedStatement state = null;
		String sql = "insert into category(name_category) values(?)";
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
		String sql = "delete from category where id=" + id;
		try {
			state = conn.prepareStatement(sql);
			int rs = state.executeUpdate();
			if (rs == 0) {
				return false;
			} else {
				sql = "delete from product_category where id_category=" + id;
				state = conn.prepareStatement(sql);
				rs = state.executeUpdate();
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

}
