package models;

public class Favorite {
	private int idFavorite;
	private int idCustomer;
	private int idProduct;
	public Favorite(int idFavorite, int idCustomer, int idProduct) {
		super();
		this.idFavorite = idFavorite;
		this.idCustomer = idCustomer;
		this.idProduct = idProduct;
	}
	
	
	
	public Favorite(int idCustomer, int idProduct) {
		super();
		this.idCustomer = idCustomer;
		this.idProduct = idProduct;
	}



	public Favorite() {
		super();
	}
	public int getIdFavorite() {
		return idFavorite;
	}
	public void setIdFavorite(int idFavorite) {
		this.idFavorite = idFavorite;
	}
	public int getIdCustomer() {
		return idCustomer;
	}
	public void setIdCustomer(int idCustomer) {
		this.idCustomer = idCustomer;
	}
	public int getIdProduct() {
		return idProduct;
	}
	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}
	
	
}
