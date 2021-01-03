package models;

public class ReportProduct {
	private int ProductID;
	private String ProductName;
	private double Price;
	private String CategoryName;
	private int Times;
	public ReportProduct() {
		// TODO Auto-generated constructor stub
	}
	public ReportProduct(int productID, String productName, double price, String categoryName, int times) {
		super();
		ProductID = productID;
		ProductName = productName;
		Price = price;
		CategoryName = categoryName;
		Times = times;
	}
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public double getPrice() {
		return Price;
	}
	public void setPrice(double price) {
		Price = price;
	}
	public String getCategoryName() {
		return CategoryName;
	}
	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}
	public int getTimes() {
		return Times;
	}
	public void setTimes(int times) {
		Times = times;
	}

	
}
