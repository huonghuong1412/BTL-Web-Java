package models;

public class OrderDetail {
	
	private int ProductID;
	private int OrderID;
	private int Quantity;
	private String Size;
	private double UnitPrice;

	public OrderDetail() {}

	public OrderDetail(int productID, int orderID, int quantity) {
		super();
		ProductID = productID;
		OrderID = orderID;
		Quantity = quantity;
	}
	
	

	public OrderDetail(int productID, int orderID, int quantity, String size, double unitPrice) {
		super();
		ProductID = productID;
		OrderID = orderID;
		Quantity = quantity;
		Size = size;
		UnitPrice = unitPrice;
	}

	public int getProductID() {
		return ProductID;
	}

	public void setProductID(int productID) {
		ProductID = productID;
	}

	public int getOrderID() {
		return OrderID;
	}

	public void setOrderID(int orderID) {
		OrderID = orderID;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public String getSize() {
		return Size;
	}

	public void setSize(String size) {
		Size = size;
	}

	public double getUnitPrice() {
		return UnitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		UnitPrice = unitPrice;
	}
	
	

}
