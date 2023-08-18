<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	for (int index = 0; index < 10; index++){
%>
		zuerst zeige ich den index an:
		<%= index + "<br>" %>
		Der index ist
<%
		String vorsilbe = (index % 2 == 0)?"":"un"; // ()?...:...
		out.print(vorsilbe + "gerade<br>");		
%>
<%		
	}
%>





<%
	String str = "Hallo1";
%>
	<%= str %>
<%
	if (str.length()%2 == 0){
%>
		 ist gerade
<%
	}else{
%>
		 ist ungerade		
<%
	}
%>
<br>





<%= new java.util.Date() %>
<br>
jetzt definiere ich eine Variable
<%
	java.util.Date myDate = new java.util.Date();
	String myDateString = myDate.toString();
%>

<br>
<%
	//<%= ist eine Abkürzung für <% out.println();
	out.println(myDateString);
	//Variable von oben ist hier noch gueltig
	out.println("<br>");
	out.println("Hallo out.print-Welt!");
	System.out.print("Hallo schnöde Konsole");
%>








</body>
</html>