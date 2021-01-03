package models;

public class ReportCustomer {
	private int CustomerID;
	private String FullName;
	private String Address;
	private String Phone;
	private int Times;

	public ReportCustomer() {
		
	}

	public ReportCustomer(int customerID, String fullName, String address, String phone, int times) {
		super();
		CustomerID = customerID;
		FullName = fullName;
		Address = address;
		Phone = phone;
		Times = times;
	}

	public int getCustomerID() {
		return CustomerID;
	}

	public void setCustomerID(int customerID) {
		CustomerID = customerID;
	}

	public String getFullName() {
		return FullName;
	}

	public void setFullName(String fullName) {
		FullName = fullName;
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

	public int getTimes() {
		return Times;
	}

	public void setTimes(int times) {
		Times = times;
	}
	
	

}
