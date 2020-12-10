package models;

public class Admin {
	
	private int AdminID;
	private String UserName;
	private String Password;

	public Admin() {
		
	}

	public Admin(int adminID, String userName, String password) {
		super();
		AdminID = adminID;
		UserName = userName;
		Password = password;
	}

	public int getAdminID() {
		return AdminID;
	}

	public void setAdminID(int adminID) {
		AdminID = adminID;
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

	
}
