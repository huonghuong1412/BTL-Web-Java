package models;

public class OrderDetail {
	
	private int ProductID;
	private int OrderID;
	private int Quantity;

	public OrderDetail() {}

	public OrderDetail(int productID, int orderID, int quantity) {
		super();
		ProductID = productID;
		OrderID = orderID;
		Quantity = quantity;
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
	
	

}
