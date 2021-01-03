package models;

import java.sql.Timestamp;

public class History {

	private String ProductName;
	private String CategoryName;
	private int Quantity;
	private double UnitPrice;
	private Timestamp DateBuy;
	private double ThanhTien;
	private int Status;

	public History() {

	}

	public History(String productName, String categoryName, int quantity, double unitPrice, Timestamp dateBuy,
			double thanhTien, int status) {
		super();
		ProductName = productName;
		CategoryName = categoryName;
		Quantity = quantity;
		UnitPrice = unitPrice;
		DateBuy = dateBuy;
		ThanhTien = thanhTien;
		Status = status;
	}

	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String productName) {
		ProductName = productName;
	}

	public String getCategoryName() {
		return CategoryName;
	}

	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
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

	public Timestamp getDateBuy() {
		return DateBuy;
	}

	public void setDateBuy(Timestamp dateBuy) {
		DateBuy = dateBuy;
	}

	public double getThanhTien() {
		return ThanhTien;
	}

	public void setThanhTien(double thanhTien) {
		ThanhTien = thanhTien;
	}

	public int getStatus() {
		return Status;
	}

	public void setStatus(int status) {
		Status = status;
	}

	
}
