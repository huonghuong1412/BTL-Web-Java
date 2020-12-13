package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.ConnectDB;
import models.Order;

public class OrderDAO {

	public OrderDAO() {

	}

	public static void addOrder(Order order) {
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
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
