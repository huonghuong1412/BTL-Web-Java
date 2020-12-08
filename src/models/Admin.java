package models;

public class Admin {
	
	private int idAdmin;
	private String username;
	private String password;
	private String fullname;

	public Admin() {
		
	}

	public Admin(int idAdmin, String username, String password, String fullname) {
		super();
		this.idAdmin = idAdmin;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
	}

	public int getIdAdmin() {
		return idAdmin;
	}

	public void setIdAdmin(int idAdmin) {
		this.idAdmin = idAdmin;
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

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	

}
