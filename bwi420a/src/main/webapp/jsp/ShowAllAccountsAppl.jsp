<%@page import="de.hwg_lu.bwi420Beans.ShowAllAccountsBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="saab" class="de.hwg_lu.bwi420Beans.ShowAllAccountsBean" scope="session" />
<%
String alleLoeschen = request.getParameter("alleLoeschen");
String zurueck = request.getParameter("zurueck");
String refresh = request.getParameter("refresh");
if (refresh == null) refresh = "";
if (zurueck == null) zurueck = "";
if (alleLoeschen == null) alleLoeschen = "";

if (alleLoeschen.equals("alle Accounts loeschen")){
	saab.alleAccountsLoeschen();
	response.sendRedirect("./ShowAllAccountsView.jsp");
}else if(zurueck.equals("zurueck")){
	session.removeAttribute("saab"); //damit es beim naechsten Mal neu gemacht wird
	response.sendRedirect("./PortalView.jsp");
}else if(refresh.equals("neu lesen")){
	saab.readAllAccountsFromDB();
	response.sendRedirect("./ShowAllAccountsView.jsp");
}else{
	
	response.sendRedirect("./ShowAllAccountsView.jsp");
}


%>
</body>
</html>