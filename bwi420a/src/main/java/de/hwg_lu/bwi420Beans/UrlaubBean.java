package de.hwg_lu.bwi420Beans;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;

import de.hwg_lu.bwi.jdbc.NoConnectionException;
import de.hwg_lu.bwi.jdbc.PostgreSQLAccess;

public class UrlaubBean {

	String urlaubsziel;
	String bewertung;
	String[] alleZiele; // erst mal null
	//alternativ String, HashMap<String, String>, Vector<String>
	
	public UrlaubBean() {
		this.alleZiele = new String[0];
		//String:  this.alleZiele = "";
		//HashMap: this.alleZiele = new HashMap<String, String>();
		//Vector:  this.alleZiele = new Vector<String>()
	}

	public void writeToDB() throws NoConnectionException, SQLException{
		String sql = "insert into urlaubsziele "
				+ "(urlaubsziel, bewertung) values (?,?)";
		System.out.println(sql);
		PreparedStatement prep = new PostgreSQLAccess().
												getConnection().
												prepareStatement(sql);
		for(String aktuZiel : alleZiele){//Test1: Test2
			String[] myValues = aktuZiel.split(": ");
			String urlaubsziel = myValues[0];
			String bewertung = myValues[1];
			prep.setString(1, urlaubsziel);
			prep.setString(2, bewertung);
			prep.executeUpdate();
		}
/*HashMap
 * 		for(String myKey : alleZiele.keyset()){
 * 			String urlaubsziel = myKey;
 * 			String bewertung = alleZiele.get(myKey);
 */
		System.out.println("Urlaubsziele in DB geschrieben");
	}
	public void writeData(){
		//String: this.alleZiele += urlaubsziel + ": " + bewertung
		//HashMap: this.alleZiele.put(urlaubsziel, bewertung)
		//Vector: this.alleZiele.add(urlaubsziel + ": " + bewertung);
		String[] newArray = java.util.Arrays.copyOf(this.alleZiele, this.alleZiele.length + 1);
		newArray[this.alleZiele.length] = urlaubsziel + ": " + bewertung;
		this.alleZiele = newArray;
	}
	public String getAlleZieleTextarea(){
		String html = "";
		for (String myZiel : this.alleZiele){
			html += myZiel + "\n";
		}
		System.out.println(html);
		return html;
		//String:  return this.alleZiele
		/*HashMap: for(String myKey : this.alleZiele.keySet()){
		 * 				String myValue = this.alleZiele.get(myKey);
		 * 				html += myKey + ": " + myValue + "\n"; 
		 * 			}
		 */
		//Vector:  wie Array
	}
	public void loescheAlles(){
		this.alleZiele = new String[0];
		//String:  this.alleZiele = "";
		//HashMap: this.alleZiele.clear();
		//Vector:  this.alleZiele.clear();
	}
	
	public String getUrlaubsziel() {
		return urlaubsziel;
	}
	public void setUrlaubsziel(String urlaubsziel) {
		this.urlaubsziel = urlaubsziel;
	}
	public String getBewertung() {
		return bewertung;
	}
	public void setBewertung(String bewertung) {
		this.bewertung = bewertung;
	}
	public String[] getAlleZiele() {
		return alleZiele;
	}
	public void setAlleZiele(String[] alleZiele) {
		this.alleZiele = alleZiele;
	}
}