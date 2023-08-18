package de.hwg_lu.bwi420Beans;

public class GUIBean {

	public GUIBean() {
		
	}
	
	public String getHeadlineHtml(){
		String html = "";
		html += "<table>";
		html += "<tr>";
		html += "	<td>";
		html += "		<h3>Willkommen am BWI420-Portal</h3>";
		html += "	</td>";
		html += "	<td>";
		html += "		<a href='https://www.hwg-lu.de/'>";
		html += "			<img src='../img/HWGLU_logo.png' title='HWG Ludwigshafen' />";
		html += "		</a>";
		html += "	</td>";
		html += "</tr>";
		html += "</table>";
		return html;
	}

}
