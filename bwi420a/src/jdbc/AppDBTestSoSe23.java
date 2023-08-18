package de.hwg_lu.bwi.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AppDBTestSoSe23 {

	Connection dbConn;
	String dbSchema = "bwi420_636106";
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		AppDBTestSoSe23 myAppObj = new AppDBTestSoSe23();

		myAppObj.dbConn = new PostgreSQLAccess().getConnection();
		
		myAppObj.doSomething();
	}
	
	public void doSomething() throws ClassNotFoundException, SQLException{
		System.out.println("doSomething() gestartet");
//		this.createConnection();
//		this.dropSchema();
//		this.createSchema();
//		this.setSchema();
//		this.dropTableAccount();
//		this.createTableAccount();
		this.insertAccount();
		this.showAllAccounts();
	}
	public void showAllAccounts() throws SQLException{
		String sql = "select userid, password, age, email, active, admin, length(password) from account";
		System.out.println(sql);
		ResultSet dbRes = this.dbConn.prepareStatement(sql).executeQuery();
		while(dbRes.next()){
			//aktuelle Zeile lesen und ausgeben
			System.out.println(
				dbRes.getString("userid") +
				dbRes.getString("password") +
				dbRes.getInt("age") +
				dbRes.getString("email") +
				dbRes.getString("active") +
				dbRes.getString("admin") + 
				dbRes.getInt(7)
			);
		}
		//wenn next() false ergibt: Keine Zeilen mehr zu lesen
	}
	public void insertAccount() throws SQLException{
		String sql ="insert into account (userid, password, age, email, active, admin) values (?,?,?,?,?,?)";
		System.out.println(sql);
		PreparedStatement prepInsert = this.dbConn.prepareStatement(sql);
		prepInsert.setString(1, "testuser2");
		prepInsert.setString(2, "geheim");
		prepInsert.setInt(3, 18);
		prepInsert.setString(4, "testuser1@abc.de");
		prepInsert.setString(5, "Y");
		prepInsert.setString(6, "N");
		prepInsert.executeUpdate();
		System.out.println("testuser1 erfolgreich eingefuegt");
	}
	public void dropTableAccount() throws SQLException{
		String sql = "drop table if exists account";
		System.out.println(sql);
		this.dbConn.prepareStatement(sql).executeUpdate();
		System.out.println("Table Account gedropped");
	}
	
	public void createTableAccount() throws SQLException{
		String sql = "create table account("
				+ "			userid   char(32)     not null primary key   ,"
				+ "			password char(32)     not null               ,"
				+ "			age      int          not null default 18    ,"
				+ "			email    varchar(256) not null default ''    ,"
				+ "			active   char(1)      not null default 'Y'   ,"
				+ "			admin    char(1)      not null default 'N'   )";
		System.out.println(sql);
		this.dbConn.prepareStatement(sql).executeUpdate();
		System.out.println("Table Account angelegt");
	}
	public void setSchema() throws SQLException{
		String sql = "set schema '" + this.dbSchema + "'";
		System.out.println(sql);
		this.dbConn.prepareStatement(sql).executeUpdate();
		System.out.println("Schema " + this.dbSchema + " als Standard gesetzt");
	}
	public void dropSchema() throws SQLException{
		String sql = "drop schema if exists " + this.dbSchema + " cascade";
		System.out.println(sql);
		this.dbConn.prepareStatement(sql).executeUpdate();
		System.out.println("Schema " + this.dbSchema + " gel�scht.");
	}
	public void createSchema() throws SQLException{
		//Statement als String
		String sql = "create schema if not exists " + this.dbSchema + "";
		System.out.println(sql);
		//Statement als Object, Voraussetzung: dbConn
		PreparedStatement prep = this.dbConn.prepareStatement(sql);
		prep.executeUpdate();
		System.out.println("Schema " + this.dbSchema + " angelegt.");
	}
	public void createConnection() throws ClassNotFoundException, SQLException{
		Class.forName("org.postgresql.Driver");
		this.dbConn = DriverManager.getConnection(
				"jdbc:postgresql://143.93.200.243:5435/BWUEBDB",
				"user1",
				"pgusers"
		);
		System.out.println("JDBC-Connection hergestellt");
	}
	
	
	
}
