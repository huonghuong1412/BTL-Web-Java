package models;

public class Cart {
	private int CartID;
	private int Count;
	private int CustomerID;

	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(int cartID, int count, int customerID) {
		super();
		CartID = cartID;
		Count = count;
		CustomerID = customerID;
	}

	public int getCartID() {
		return CartID;
	}

	public void setCartID(int cartID) {
		CartID = cartID;
	}

	public int getCount() {
		return Count;
	}

	public void setCount(int count) {
		Count = count;
	}

	public int getCustomerID() {
		return CustomerID;
	}

	public void setCustomerID(int customerID) {
		CustomerID = customerID;
	}

	
}
