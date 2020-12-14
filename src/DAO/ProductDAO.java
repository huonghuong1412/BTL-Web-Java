package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.ConnectDB;
import models.Product;

public class ProductDAO {

	public ProductDAO() {

	}

	public static int getCountProducts(Connection conn, String category) {
		int count = 0;
		PreparedStatement state = null;
		String sql = "";
		if (category.contentEquals("all")) {
			sql = "select count(*) from product";
		} else {
			sql = "select count(*)\r\n" + "from product,category\r\n" + "where category.CategoryName='" + category
					+ "'\r\n" + "and product.CategoryID=category.CategoryID";
		}
		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			rs.next();
			count = rs.getInt("count(*)");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return count;
	}

	public static Product getProductById(int id) {
		Product product = null;
		PreparedStatement state = null;
		Connection conn = ConnectDB.getConnection();
		String sql = "select * from product where ProductID=" + id;

		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				int productID = rs.getInt("ProductID");
				String productName = rs.getString("ProductName");
				double price = rs.getDouble("Price");
				int quantity = rs.getInt("Quantity");
				String description = rs.getString("Description");
				String image = rs.getString("Image");
				String material = rs.getString("Material");
				int categoryID = rs.getInt("CategoryID");
				product = new Product(productID, productName, price, quantity, image, description, material,
						categoryID);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return product;
	}

	public static List<Product> getListProductByCategory(Connection conn, String category, int page) {
		List<Product> list = new ArrayList<Product>();

		PreparedStatement state = null;
		String sql = "";

		if (category.contentEquals("all")) {
			sql = "select * from product limit 12 offset " + (page - 1) * 12;
		} else if (category.contentEquals("allproduct")) {
			sql = "select * from product limit 6 offset " + (page - 1) * 6;
		}
		else {
			sql = "select product.*\r\n" + "from product,category\r\n" + "where category.CategoryName='" + category
					+ "'\r\n" + "and product.CategoryID=category.CategoryID limit 12 offset " + (page - 1) * 12;
		}

		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				int productID = rs.getInt("ProductID");
				String productName = rs.getString("ProductName");
				double price = rs.getDouble("Price");
				int quantity = rs.getInt("Quantity");
				String description = rs.getString("Description");
				String image = rs.getString("Image");
				String material = rs.getString("Material");
				int categoryID = rs.getInt("CategoryID");
				list.add(
						new Product(productID, productName, price, quantity, image, description, material, categoryID));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	public static List<Product> getListProductHome(Connection conn, String category) {
		List<Product> list = new ArrayList<Product>();

		PreparedStatement state = null;
		String sql = "select product.*\r\n" + "from product,category\r\n" + "where category.CategoryName='" + category
				+ "'\r\n" + "and product.CategoryID=category.CategoryID limit 8";

		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				int productID = rs.getInt("ProductID");
				String productName = rs.getString("ProductName");
				double price = rs.getDouble("Price");
				int quantity = rs.getInt("Quantity");
				String description = rs.getString("Description");
				String image = rs.getString("Image");
				String material = rs.getString("Material");
				int categoryID = rs.getInt("CategoryID");
				list.add(new Product(productID, productName, price, quantity, image, description, material, categoryID));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	public static List<Product> getAllProduct(Connection conn, int page) {
		List<Product> list = new ArrayList<Product>();
		PreparedStatement state = null;
		String sql = "select * from product limit 5 offset " + (page-1)*5;
		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt("ProductID"));
				product.setProductName(rs.getString("ProductName"));
				product.setPrice(rs.getDouble("Price"));
				product.setQuantity(rs.getInt("Quantity"));
				product.setDescription(rs.getString("Description"));
				product.setImage(rs.getString("Image"));
				product.setMaterial(rs.getString("Material"));
				list.add(product);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public static List<Product> searchProduct(Connection conn, String text) {
		List<Product> list = new ArrayList<Product>();

		PreparedStatement state = null;
		String sql = "select * from product where ProductName like " + "'%" + text + "%'";
		System.out.print(sql);

		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				int productID = rs.getInt("ProductID");
				String productName = rs.getString("ProductName");
				double price = rs.getDouble("Price");
				int quantity = rs.getInt("Quantity");
				String description = rs.getString("Description");
				String image = rs.getString("Image");
				String material = rs.getString("Material");
				int categoryID = rs.getInt("CategoryID");
				list.add(
						new Product(productID, productName, price, quantity, image, description, material, categoryID));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	public Product getProductByIdCart(int id) {
		Product product = null;
		PreparedStatement state = null;
		Connection conn = ConnectDB.getConnection();
		String sql = "select * from product where ProductID=" + id;

		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				int productID = rs.getInt("ProductID");
				String productName = rs.getString("ProductName");
				double price = rs.getDouble("Price");
				int quantity = rs.getInt("Quantity");
				String description = rs.getString("Description");
				String image = rs.getString("Image");
				String material = rs.getString("Material");
				int categoryID = rs.getInt("CategoryID");
				product = new Product(productID, productName, price, quantity, image, description, material,
						categoryID);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return product;
	}

	public static boolean insertProduct(Product product, Connection conn) {
		PreparedStatement preparedStatement = null;
		String sql = "INSERT INTO product (ProductName,Price,Quantity,Image,`Description`,Material,CategoryID) VALUES (?,?,?,?,?,?,?)";

		try {
			preparedStatement = conn.prepareStatement(sql);
			 preparedStatement.setString(1, product.getProductName());
			 preparedStatement.setDouble(2, product.getPrice());
			 preparedStatement.setInt(3, product.getQuantity());
			 preparedStatement.setString(4, product.getImage());
			 preparedStatement.setString(5, product.getDescription());
			 preparedStatement.setString(6, product.getMaterial());
			 preparedStatement.setInt(7, product.getCategoryID());
			 System.out.println(preparedStatement);
			 preparedStatement.executeUpdate();
			 return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	public static boolean deleteProduct (int id, Connection conn) {
		PreparedStatement state = null;
		String sql = "delete from product where ProductID = " + id;
		try {
			state = conn.prepareStatement(sql);
			int rs = state.executeUpdate();
			if(rs == 0) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
	}
	
	
	public static boolean updateProduct (Product product) {
		PreparedStatement state = null;
		Connection conn = ConnectDB.getConnection();
		
		String sql = "UPDATE product SET ProductName=?, Price=?, Quantity=?, `Description`=?, Material=?, CategoryID=? WHERE ProductID=?";
	
		try {
			state = conn.prepareStatement(sql);
			state.setString(1, product.getProductName());
			state.setDouble(2, product.getPrice());
			state.setInt(3, product.getQuantity());
			state.setString(4, product.getDescription());
			state.setString(5, product.getMaterial());
			state.setInt(6, product.getCategoryID());
			state.setInt(7, product.getProductID());
			System.out.println(state);
			int rs = state.executeUpdate();
			if(rs ==0) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

}
