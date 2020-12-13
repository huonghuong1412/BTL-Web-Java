package models;

import java.sql.Timestamp;

public class Order {
	
	private int OrderID;
	private int CustomerID;
	private int ProductID;
	private double UnitPrice;
	private int Quantity;
	private int Status;
	private Timestamp DateBuy;
	private String Note;
	private String Phone;
	private String Address;
	
	public Order() {}

	public Order(int orderID, int customerID, int productID, double unitPrice, int quantity, int status, Timestamp dateBuy,
			String note, String phone, String address) {
		super();
		OrderID = orderID;
		CustomerID = customerID;
		ProductID = productID;
		UnitPrice = unitPrice;
		Quantity = quantity;
		Status = status;
		DateBuy = dateBuy;
		Note = note;
		Phone = phone;
		Address = address;
	}

	public int getOrderID() {
		return OrderID;
	}

	public void setOrderID(int orderID) {
		OrderID = orderID;
	}

	public int getCustomerID() {
		return CustomerID;
	}

	public void setCustomerID(int customerID) {
		CustomerID = customerID;
	}

	public int getProductID() {
		return ProductID;
	}

	public void setProductID(int productID) {
		ProductID = productID;
	}

	public double getUnitPrice() {
		return UnitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		UnitPrice = unitPrice;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public int getStatus() {
		return Status;
	}

	public void setStatus(int status) {
		Status = status;
	}

	public Timestamp getDateBuy() {
		return DateBuy;
	}

	public void setDateBuy(Timestamp dateBuy) {
		DateBuy = dateBuy;
	}

	public String getNote() {
		return Note;
	}

	public void setNote(String note) {
		Note = note;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	

}
