<%@page import="de.hwg_lu.bwi420Beans.GUIBean"%>
<%@page import="de.hwg_lu.bwi420Beans.MessageBean"%>
<%@page import="de.hwg_lu.bwi420Beans.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/Portal.css" />
</head>
<body>
<jsp:useBean id="myLogin" class="de.hwg_lu.bwi420Beans.LoginBean" scope="session" />
<jsp:useBean id="myMessage" class="de.hwg_lu.bwi420Beans.MessageBean" scope="session" />
<jsp:useBean id="myGui" class="de.hwg_lu.bwi420Beans.GUIBean" scope="session" />
<jsp:getProperty name="myGui" property="headlineHtml" />
<jsp:getProperty name="myMessage" property="messageHtml" />
<form action="./LoginAppl.jsp" method="get">
	<table>
		<tr>
			<td>Nickname:</td>
			<td><input type="text" name="userid" value="" /></td>
		</tr>
		<tr>
			<td>Passwort:</td>
			<td><input type="password" name="password" value="" /></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="btnLogin" value="Anmelden" /></td>
		</tr>
	</table>
</form>
<br>
noch kein Nickname? Registrieren Sie sich
<a href="./LoginAppl.jsp?zurReg=zurReg">hier</a>.
</body>
</html>