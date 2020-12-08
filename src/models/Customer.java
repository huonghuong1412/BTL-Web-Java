package models;

public class Customer {
	private int idCustomer;
	private String username;
	private String password;
	private String address;
	private String phone;
	private String fullname;
	
	public Customer() {
		
	}

	public Customer(int idCustomer, String username, String password, String address, String phone, String fullname) {
		super();
		this.idCustomer = idCustomer;
		this.username = username;
		this.password = password;
		this.address = address;
		this.phone = phone;
		this.fullname = fullname;
	}

	public int getIdCustomer() {
		return idCustomer;
	}

	public void setIdCustomer(int idCustomer) {
		this.idCustomer = idCustomer;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	

}
