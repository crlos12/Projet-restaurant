package de.hwg_lu.bwi420Beans;
import java.sql.*;

import de.hwg_lu.bwi.jdbc.NoConnectionException;
import de.hwg_lu.bwi.jdbc.PostgreSQLAccess;

public class LoginBean {

	String userid;
	String password;
	boolean loggedIn;
	
	public LoginBean() {
		this.setLoggedIn(false);
	}
	public String getLoginCheckRedirectHtml(){
		String html = "";
		if (!this.isLoggedIn()){
			html = "<meta http-equiv='refresh' content='0; URL=./PortalAppl.jsp'>";
		}
		return html;
	}
	public boolean checkUseridPassword() throws SQLException{
		//true: userid/pw Kombination existiert in der Datenbank
		//false: userid/pw Kombination existiert nicht in der Datenbank
		String sql = "select userid from account where userid = ? and password = ?";
		System.out.println(sql);
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, this.userid);
		prep.setString(2, this.password);
		ResultSet dbRes = prep.executeQuery();
		return dbRes.next();
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
	public boolean isLoggedIn() {
		return loggedIn;
	}
	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}
}
