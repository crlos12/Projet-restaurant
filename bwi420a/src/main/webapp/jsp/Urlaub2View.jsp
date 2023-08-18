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
<h3>Hier werden die Urlaubsziele angezeigt:</h3>
<form action="./UrlaubAppl.jsp" method="get">
	<textarea cols="40" rows="6">
	</textarea><br>
	<input type="submit" name="eingeben" value="weitere eingeben" />
	<input type="submit" name="loeschen" value="alle loeschen" />
</form>
</body>
</html>