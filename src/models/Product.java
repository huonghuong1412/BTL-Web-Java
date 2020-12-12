package models;

public class Product {

	private int ProductID;
	private String ProductName;
	private double Price;
	private int Quantity;
	private String Image;
	private String Description;
	private String Material;
	private int CategoryID;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int productID, String productName, double price, int quantity, String image, String description,
			String material, int categoryID) {
		super();
		this.ProductID = productID;
		this.ProductName = productName;
		this.Price = price;
		this.Quantity = quantity;
		this.Image = image;
		this.Description = description;
		this.Material = material;
		this.CategoryID = categoryID;
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

	public int getCategoryID() {
		return CategoryID;
	}

	public void setCategoryID(int categoryID) {
		CategoryID = categoryID;
	}

	

}
