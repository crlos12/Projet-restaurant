<%@page import="de.hwg_lu.bwi420Beans.GUIBean"%>
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
<jsp:useBean id="gui" class="de.hwg_lu.bwi420Beans.GUIBean" scope="session" />
<jsp:useBean id="saab" class="de.hwg_lu.bwi420Beans.ShowAllAccountsBean" scope="session" />
<jsp:getProperty name="gui" property="headlineHtml" />

<h3>BWI420 Alle Accounts</h3>
<form action="./ShowAllAccountsAppl.jsp" method="get">
	<input type="submit" name="alleLoeschen" value="alle Accounts loeschen" />
	<input type="submit" name="zurueck" value="zurueck" />
	<input type="submit" name="refresh" value="neu lesen" />
</form>

<jsp:getProperty name="saab" property="accountsFromVectorAsHtml" />



</body>
</html>