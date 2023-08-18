<%@page import="de.hwg_lu.bwi420Beans.GUIBean"%>
<%@page import="de.hwg_lu.bwi420Beans.AccountBean"%>
<%@page import="de.hwg_lu.bwi420Beans.MessageBean"%>
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
<jsp:useBean id="myAccount" class="de.hwg_lu.bwi420Beans.AccountBean" scope="session" />
<jsp:useBean id="myMessage" class="de.hwg_lu.bwi420Beans.MessageBean" scope="session" />
<jsp:useBean id="myGui" class="de.hwg_lu.bwi420Beans.GUIBean" scope="session" />

<jsp:getProperty name="myGui" property="headlineHtml" />
<!-- 
<table>
	<tr>
		<td>
			<h3>Willkommen am BWI420-Portal</h3>
		</td>
		<td>
			<a href="https://www.hwg-lu.de/">
				<img src="../img/HWGLU_logo.png" title="HWG Ludwigshafen" />
			</a>
		</td>
	</tr>
</table>
-->
<jsp:getProperty name="myMessage" property="messageHtml" />
	
<form action="./RegAppl.jsp" method="get">
	<table>
		<tr>
			<td>Nickname:</td>
			<td><input type="text" name="userid"
							value="<jsp:getProperty name='myAccount' property='userid' />"
				/>
			</td>
		</tr>
		<tr>
			<td>Passwort:</td>
			<td><input type="password" name="password" value="" /></td>
		</tr>
		<tr>
			<td>Alter:</td>
			<td><input type="number" name="age"
							value="<jsp:getProperty name="myAccount" property="ageForHtmlView" />" /></td>
		</tr>
		<tr>
			<td>E-Mail:</td>
			<td><input type="email" name="email"
							value="<jsp:getProperty name="myAccount" property="email" />"
					/>
			</td>
		</tr>
		<tr>
			<td><input type="submit" name="btnToLogin" value="zum Login" /></td>
			<td><input type="submit" name="btnRegister" value="Registrieren" /></td>
		</tr>
	</table>
</form>
</body>
</html>