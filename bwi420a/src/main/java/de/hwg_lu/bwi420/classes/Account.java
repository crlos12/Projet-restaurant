package de.hwg_lu.bwi420.classes;
public class Account {
	String userid;
	String password;
	int age;
	String email;
	String active;
	String admin;
	public Account(String userid, String password, int age, String email, String active, String admin) {
		super();
		this.userid = userid;
		this.password = password;
		this.age = age;
		this.email = email;
		this.active = active;
		this.admin = admin;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	
}