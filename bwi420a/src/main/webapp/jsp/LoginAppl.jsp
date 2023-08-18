<%@page import="de.hwg_lu.bwi420Beans.AccountBean"%>
<%@page import="java.sql.SQLException"%>
<%@page import="de.hwg_lu.bwi420Beans.MessageBean"%>
<%@page import="de.hwg_lu.bwi420Beans.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="myLogin" class="de.hwg_lu.bwi420Beans.LoginBean" scope="session" />
<jsp:useBean id="myMessage" class="de.hwg_lu.bwi420Beans.MessageBean" scope="session" />
<jsp:useBean id="myAccount" class="de.hwg_lu.bwi420Beans.AccountBean" scope="session" />
<%
String userid   = request.getParameter("userid");
String password = request.getParameter("password");
String btnLogin = request.getParameter("btnLogin");
String zurReg   = request.getParameter("zurReg");
if (btnLogin == null) btnLogin = "";
if (zurReg == null) zurReg = "";

if (btnLogin.equals("Anmelden")){
	myLogin.setUserid(userid);
	myLogin.setPassword(password);
	try{
		boolean loginGeklappt = myLogin.checkUseridPassword();
		if (loginGeklappt){
			myLogin.setLoggedIn(true);
			myMessage.setLoginSuccessful(userid);
			response.sendRedirect("./PortalView.jsp");
		}else{
			myLogin.setLoggedIn(false);
			myMessage.setLoginFailed();
			response.sendRedirect("./LoginView.jsp");		
		}
	}catch(SQLException se){
		se.printStackTrace();
		myLogin.setLoggedIn(false);
		myMessage.setDBError();
		response.sendRedirect("./LoginView.jsp");		
	}
}else if(zurReg.equals("zurReg")){
	//Daten aus AccountBean löschen
	myAccount.initialize();
	myMessage.setRegistrationWelcome();
	response.sendRedirect("./RegView.jsp");
}else{
	myLogin.setLoggedIn(false);
	myMessage.setGeneralWelcome();
	response.sendRedirect("./LoginView.jsp");
}
%>
</body>
</html>