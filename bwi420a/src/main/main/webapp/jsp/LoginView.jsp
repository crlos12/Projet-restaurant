<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>