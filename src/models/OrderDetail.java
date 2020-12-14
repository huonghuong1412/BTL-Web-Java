package models;

public class OrderDetail {
	private int OrderID;
	private String FullName;
	private String ProductName;
	private int Quantity;
	private double UnitPrice;
	private int Status;
	private String Phone;
	private String Address;

	public OrderDetail() {
		// TODO Auto-generated constructor stub
	}

	public OrderDetail(int orderID ,String fullName, String productName, int quantity, double unitPrice, int status, String phone,
			String address) {
		super();
		OrderID = orderID;
		FullName = fullName;
		ProductName = productName;
		Quantity = quantity;
		UnitPrice = unitPrice;
		Status = status;
		Phone = phone;
		Address = address;
	}

	
	
	public int getOrderID() {
		return OrderID;
	}

	public void setOrderID(int orderID) {
		OrderID = orderID;
	}

	public String getFullName() {
		return FullName;
	}

	public void setFullName(String fullName) {
		FullName = fullName;
	}

	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String productName) {
		ProductName = productName;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	

	public double getUnitPrice() {
		return UnitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		UnitPrice = unitPrice;
	}

	public int getStatus() {
		return Status;
	}

	public void setStatus(int status) {
		Status = status;
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
