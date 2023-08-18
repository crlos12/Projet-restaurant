package de.hwg_lu.bwi420Beans;

import java.sql.SQLException;

import de.hwg_lu.bwi.jdbc.NoConnectionException;

public class AppTestAccountBean {

	public static void main(String[] args) throws SQLException {
		AccountBean myBean = new AccountBean();
		myBean.setUserid("testus3");
		myBean.setPassword("geheim");
		myBean.setAge(19);
		myBean.setEmail("testus3@abc.de");
		myBean.setActive("Y");
		myBean.setAdmin("N");
		String myBeanString = myBean.toString();
		System.out.println(myBeanString);
		
		myBean.insertAccountNoCheck();
		
	}
}
