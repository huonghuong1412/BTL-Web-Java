package models;

public class Customer {
	private int CustomerID;
	private String UserName;
	private String Password;
	private String Address;
	private String Phone;
	private String FullName;
	
	public Customer() {
		
	}

	public Customer(int customerID, String userName, String password, String address, String phone, String fullName) {
		super();
		CustomerID = customerID;
		UserName = userName;
		Password = password;
		Address = address;
		Phone = phone;
		FullName = fullName;
	}

	public int getCustomerID() {
		return CustomerID;
	}

	public void setCustomerID(int customerID) {
		CustomerID = customerID;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getFullName() {
		return FullName;
	}

	public void setFullName(String fullName) {
		FullName = fullName;
	}

	

}
