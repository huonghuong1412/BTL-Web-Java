package models;

public class Product {

	private int ProductID;
	private String ProductName;
	private double Price;
	private int Quantity;
	private String Image;
	private String Description;
	private String Material;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int productID, String productName, double price, int quantity, String image, String description,
			String material) {
		super();
		ProductID = productID;
		ProductName = productName;
		Price = price;
		Quantity = quantity;
		Image = image;
		Description = description;
		Material = material;
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

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getMaterial() {
		return Material;
	}

	public void setMaterial(String material) {
		Material = material;
	}

	

}
