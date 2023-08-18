<%@page import="de.hwg_lu.bwi420Beans.UrlaubBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="ub" class="de.hwg_lu.bwi420Beans.UrlaubBean" scope="session" />
<%
String urlaubsziel = request.getParameter("urlaubsziel");
String bewertung   = request.getParameter("bewertung");
String anzeigen    = request.getParameter("anzeigen");
String eingeben    = request.getParameter("eingeben");
String loeschen    = request.getParameter("loeschen");

if (anzeigen == null) anzeigen = "";
if (eingeben == null) eingeben = "";
if (loeschen == null) loeschen = "";

if (anzeigen.equals("alle anzeigen")){
	response.sendRedirect("./Urlaub2View.jsp");
	
	} else if (eingeben.equals("weitere eingeben")){
	response.sendRedirect("./Urlaub1View.jsp ");
	
}else if (loeschen.equals("alle loeschen")){
	response.sendRedirect("./Urlaub2View.jsp");
	
}






%>
</body>
</html>