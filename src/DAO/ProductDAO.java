package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
			sql = "select count(*)\r\n" + 
					"from product,category,product_category\r\n" + 
								"where category.CategoryName='" + category + "'\r\n" + "	"
										+ "and category.CategoryID=product_category.CategoryID\r\n"
								+ "and product.ProductID=product_category.ProductID";
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

	public static Product getProductById(int id, Connection conn) {
		Product product = new Product();
		PreparedStatement state = null;
		String sql = "select * from product where ProductID=" + id;

		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			rs.next();
			product.setProductID(rs.getInt("ProductID"));
			product.setProductName(rs.getString("ProductName"));
			product.setPrice(rs.getDouble("Price"));
			product.setQuantity(rs.getInt("Quantity"));
			product.setDescription(rs.getString("Description"));
			product.setImage(rs.getString("Image"));
			product.setMaterial(rs.getString("Material"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		return product;
	}
	
	public static List<Product> getListProductByCategory (Connection conn, String category, int page) {
		List<Product> list = new ArrayList<Product>();
		
		PreparedStatement state = null;
		String sql = "";
		if(category.contentEquals("all")) {
			sql = "select * from product limit 12 offset "+(page-1)*12;;
		} else {
//			sql="select product.*\r\n" + 
//					"from product,category,product_category\r\n" + 
//					"where category.CategoryName='"+category+"'\r\n" + 
//					"	and category.CategoryID=product_category.CategoryID\r\n" + 
//					"    and product.ProductID=product_category.ProductID limit 12 offset "+(page-1)*12;
			sql = "SELECT product.*\r\n" + 
					"from product, category, product_catogory" + 
					"where category.CategoryName ="+category+"" + 
					"and category.CategoryID = product_catogory.CategoryID" + 
					"and product.ProductID = product_catogory.ProductID";
		}
		
		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) {
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
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static List<Product> getAllProduct(Connection conn) {
		List<Product> list = new ArrayList<Product>();
		PreparedStatement state = null;
		String sql = "select * from product";
		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()) {
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
	
	public static boolean insertProduct(Product product, Connection conn, int category) {
		PreparedStatement state = null;
		String sql = "insert into product(ProductName,Price,Quantity,Image,Description,Material)" + "values(?,?,?,?,?,?)";
	
		try {
			state = conn.prepareStatement(sql);
			state.setString(1, product.getProductName());
			state.setDouble(2, product.getPrice());
			state.setInt(3, product.getQuantity());
			state.setString(4, product.getImage());
			state.setString(5, product.getDescription());
			state.setString(6, product.getMaterial());
			
			int k = state.executeUpdate();
			if(k==0) {
				return false;
			} else {
				sql = "SELECT LAST_INSERT_ID() as id";
				state = conn.prepareStatement(sql);
				ResultSet rs = state.executeQuery();
				rs.next();
				int idProduct = rs.getInt("id");
				
				sql="insert into product_category(ProductID, CategoryID) values("+idProduct+","+category+")";
				state=conn.prepareStatement(sql);
				state.executeUpdate(sql);
				return true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

}
