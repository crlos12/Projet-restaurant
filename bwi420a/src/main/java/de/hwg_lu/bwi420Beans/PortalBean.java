package de.hwg_lu.bwi420Beans;

import java.sql.ResultSet;
import java.sql.SQLException;

import de.hwg_lu.bwi.jdbc.NoConnectionException;
import de.hwg_lu.bwi.jdbc.PostgreSQLAccess;

public class PortalBean {

	public PortalBean() {
		
	}
	
	public String getWebApplicationsAsHtmlLink() throws NoConnectionException, SQLException{
		String html = "";
		String sql = "select applPath, applName from webapplication";
		System.out.println(sql);
		ResultSet dbRes = new PostgreSQLAccess().
								getConnection().
								prepareStatement(sql).
								executeQuery();
		while (dbRes.next()){
			String myApplPath = dbRes.getString("applPath");
			String myApplName = dbRes.getString("applName");
			html += "<li><a href='./PortalAppl.jsp?applicationPath=" + myApplPath 
							+ "'>" + myApplName + "</a></li>\n";
		}
		return html;
	}

}
