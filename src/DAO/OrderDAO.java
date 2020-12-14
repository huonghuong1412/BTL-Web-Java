package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import common.ConnectDB;
import models.History;
import models.Order;
import models.OrderDetail;

public class OrderDAO {

	public OrderDAO() {

	}

	public static boolean addOrder(Order order) {
		Connection conn = ConnectDB.getConnection();
		String sql = "insert into `order` (OrderID, CustomerID, ProductID, UnitPrice, Quantity, `Status`, DateBuy, Note, Phone, Address) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement state = null;
		try {
			state = conn.prepareStatement(sql);
			state.setInt(1, order.getOrderID());
			state.setInt(2, order.getCustomerID());
			state.setInt(3, order.getProductID());
			state.setDouble(4, order.getUnitPrice());
			state.setInt(5, order.getQuantity());
			state.setInt(6, order.getStatus());
			state.setTimestamp(7, order.getDateBuy());
			state.setString(8, order.getNote());
			state.setString(9, order.getPhone());
			state.setString(10, order.getAddress());
			state.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	public static List<History> getListOrderByCustomer(Connection conn, int customerID) {
		List<History> list = new ArrayList<History>();
		PreparedStatement state = null;
		String sql = "SELECT product.ProductName, category.CategoryName, `order`.Quantity, `order`.UnitPrice, `order`.DateBuy, `order`.UnitPrice*`order`.Quantity as ThanhTien\r\n"
				+ "FROM `order`, product, category\r\n" + "where product.ProductID = `order`.ProductID\r\n"
				+ "and product.CategoryID = category.CategoryID\r\n" + "and `order`.CustomerID = " + customerID;
		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				String productName = rs.getString("ProductName");
				String categoryName = rs.getString("CategoryName");
				int quantity = rs.getInt("Quantity");
				double unitPrice = rs.getDouble("UnitPrice");
				Timestamp dateBuy = rs.getTimestamp("DateBuy");
				double thanhTien = rs.getDouble("ThanhTien");
				list.add(new History(productName, categoryName, quantity, unitPrice, dateBuy, thanhTien));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public static int getCountOrders(Connection conn) {
		int count = 0;
		PreparedStatement state = null;
		String sql = "";
		sql = "select count(*) from `order`";
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

	public static List<Order> getAllOrder(Connection conn, int page) {
		List<Order> list = new ArrayList<Order>();

		PreparedStatement state = null;
		String sql = "select * from `order` limit 6 offset " + (page - 1) * 6;
		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setOrderID(rs.getInt("OrderID"));
				order.setCustomerID(rs.getInt("CustomerID"));
				order.setProductID(rs.getInt("ProductID"));
				order.setUnitPrice(rs.getDouble("UnitPrice"));
				order.setQuantity(rs.getInt("Quantity"));
				order.setStatus(rs.getInt("Status"));
				order.setDateBuy(rs.getTimestamp("DateBuy"));
				order.setNote(rs.getString("Note"));
				order.setPhone(rs.getString("Phone"));
				order.setAddress(rs.getString("Address"));

				list.add(order);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public static OrderDetail getOrderDetailById(Connection conn, int id) {
		OrderDetail orderDetail = null;
		PreparedStatement state = null;
		String sql = "SELECT `order`.OrderID, customer.FullName, product.ProductName, `order`.Quantity, `order`.UnitPrice, `order`.`Status`, `order`.Phone, `order`.Address \r\n" + 
				"from `order`, product, customer\r\n" + 
				"where customer.CustomerID = `order`.CustomerID\r\n" + 
				"and product.ProductID = `order`.ProductID\r\n" + 
				"and `order`.OrderID = " + id;
		try {
			state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				int orderID = rs.getInt("OrderID");
				String fullName = rs.getString("FullName");
				String productName = rs.getString("ProductName");
				int quantity = rs.getInt("Quantity");
				double tongTien = rs.getDouble("UnitPrice");
				int status = rs.getInt("Status");
				String phone = rs.getString("Phone");
				String address = rs.getString("Address");
				orderDetail = new OrderDetail(orderID, fullName, productName, quantity, tongTien, status, phone, address);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return orderDetail;
	}
	
	public static Order getOrderById (int id) {
		Order order = null;
		Connection conn = ConnectDB.getConnection();
		PreparedStatement state = null;
		String sql = "SELECT * from `order` where OrderID = ?";
		try {
			state = conn.prepareStatement(sql);
			state.setInt(1, id);
			ResultSet rs = state.executeQuery();
			while(rs.next()) {
				int customerID = rs.getInt("CustomerID");
				int productID = rs.getInt("ProductID");
				double unitPrice = rs.getDouble("UnitPrice");
				int quantity = rs.getInt("Quantity");
				int status = rs.getInt("Status");
				Timestamp dateBuy = rs.getTimestamp("DateBuy");
				String note = rs.getString("Note");
				String phone = rs.getString("Phone");
				String address = rs.getString("Address");
				
				order = new Order(id, customerID, productID, unitPrice, quantity, status, dateBuy, note, phone, address);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return order;
	}
	
	public static boolean confirmOrder(Order order) {
		
		Connection conn = ConnectDB.getConnection();
		PreparedStatement state = null;
		String sql = "update `order` set `Status` = 1 where OrderID = ?"; 
		try {
			
			state = conn.prepareStatement(sql);
			state.setInt(1, order.getOrderID());
			int status = state.executeUpdate();
			if(status == 0) {
				return false;
			}
			
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

}
