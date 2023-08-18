package de.hwg_lu.bwi420Beans;
import java.sql.*;
import java.util.Vector;

import de.hwg_lu.bwi.jdbc.NoConnectionException;
import de.hwg_lu.bwi.jdbc.PostgreSQLAccess;
import de.hwg_lu.bwi420.classes.Account;

public class ShowAllAccountsBean {

	Vector<Account> allAccounts; //ist erst mal null
	
	public ShowAllAccountsBean() throws SQLException {
		this.allAccounts = new Vector<Account>();
		this.readAllAccountsFromDB();
	}
	public void alleAccountsLoeschen () throws NoConnectionException, SQLException{
		//loeschen aus Vector und Datenbank
		this.allAccounts.clear();
		new PostgreSQLAccess().
					getConnection().
					prepareStatement("DELETE FROM account").
					executeUpdate();
	}
	public String getAccountsFromVectorAsHtml(){
		String html = "";
		html += "<table>\n";
		html += "<tr>\n";
		html += "<th>userid</th><th>password</th><th>age</th><th>email</th><th>active</th><th>admin</th>";
		html += "</tr>\n";
		for (Account currentAccount : this.allAccounts){
			html += "<tr>\n";
			html += "<td>" + currentAccount.getUserid()   + "</td>\n";
			html += "<td>" + currentAccount.getPassword() + "</td>\n";
			html += "<td>" + currentAccount.getAge()      + "</td>\n";
			html += "<td>" + currentAccount.getEmail()    + "</td>\n";
			html += "<td>" + currentAccount.getActive()   + "</td>\n";
			html += "<td>" + currentAccount.getAdmin()    + "</td>\n";
			html += "</tr>\n";
		}
		html += "</table>\n";
		return html;
	}
	public void readAllAccountsFromDB() throws SQLException{
		this.allAccounts.clear();
		String sql = "select userid, password, age, email, active, admin from account";
		System.out.println(sql);
		Connection dbConn = new PostgreSQLAccess().getConnection();
		ResultSet dbRes = dbConn.prepareStatement(sql).executeQuery();
		while(dbRes.next()){
			Account newAccount = new Account(
				dbRes.getString("userid"),
				dbRes.getString("password"),
				dbRes.getInt("age"),
				dbRes.getString("email"),
				dbRes.getString("active"),
				dbRes.getString("admin")
			);
			allAccounts.add(newAccount);
		}
	}
	public String getAccountsFromDBAsHtml() throws SQLException{
		String html = "";
		String sql = "select userid, password, age, email, active, admin from account";
		System.out.println(sql);
		Connection dbConn = new PostgreSQLAccess().getConnection();
		ResultSet dbRes = dbConn.prepareStatement(sql).executeQuery();
		html += "<table>\n";
		html += "<tr>\n";
		html += "<th>userid</th><th>password</th><th>age</th><th>email</th><th>active</th><th>admin</th>";
		html += "</tr>\n";
		while(dbRes.next()){
			html += "<tr>\n";
			html += "<td>" + dbRes.getString("userid") + "</td>\n";
			html += "<td>" + dbRes.getString("password") + "</td>\n";
			html += "<td>" + dbRes.getInt("age") + "</td>\n";
			html += "<td>" + dbRes.getString("email") + "</td>\n";
			html += "<td>" + dbRes.getString("active") + "</td>\n";
			html += "<td>" + dbRes.getString("admin") + "</td>\n";
			html += "</tr>\n";
		}
		html += "</table>\n";
		return html;
	}

}
