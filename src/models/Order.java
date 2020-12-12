package models;

import java.sql.Timestamp;

public class Order {
	
	private int OrderID;
	private double Total;
	private int TotalProduct;
	private int Status;
	private int CustomerID;
	private Timestamp DateBuy;
	private String Note;

	public Order() {}

	public Order(int orderID, double total, int totalProduct, int status, int customerID) {
		super();
		OrderID = orderID;
		Total = total;
		TotalProduct = totalProduct;
		Status = status;
		CustomerID = customerID;
	}
	
	

	public Order(int orderID, double total, int totalProduct, int status, int customerID, Timestamp dateBuy,
			String note) {
		super();
		OrderID = orderID;
		Total = total;
		TotalProduct = totalProduct;
		Status = status;
		CustomerID = customerID;
		DateBuy = dateBuy;
		Note = note;
	}

	public int getOrderID() {
		return OrderID;
	}

	public void setOrderID(int orderID) {
		OrderID = orderID;
	}

	public double getTotal() {
		return Total;
	}

	public void setTotal(double total) {
		Total = total;
	}

	public int getTotalProduct() {
		return TotalProduct;
	}

	public void setTotalProduct(int totalProduct) {
		TotalProduct = totalProduct;
	}

	public int getStatus() {
		return Status;
	}

	public void setStatus(int status) {
		Status = status;
	}

	public int getCustomerID() {
		return CustomerID;
	}

	public void setCustomerID(int customerID) {
		CustomerID = customerID;
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
	
	

}
