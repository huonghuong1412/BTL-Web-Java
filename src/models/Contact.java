package models;

public class Contact {
	
	private int ContactID;
	private int CustomerID;
	private String Email;
	private String Content;

	public Contact() {}

	public Contact(int contactID, int customerID, String email, String content) {
		super();
		ContactID = contactID;
		CustomerID = customerID;
		Email = email;
		Content = content;
	}

	public int getContactID() {
		return ContactID;
	}

	public void setContactID(int contactID) {
		ContactID = contactID;
	}

	public int getCustomerID() {
		return CustomerID;
	}

	public void setCustomerID(int customerID) {
		CustomerID = customerID;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	
	
}
