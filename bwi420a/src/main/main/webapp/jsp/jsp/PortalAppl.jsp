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
<%
String applicationPath = request.getParameter("applicationPath");
String btnLogout = request.getParameter("btnLogout");
if (btnLogout == null) btnLogout = "";

if (applicationPath != null){
	String targetPath = "./" + applicationPath;
	response.sendRedirect(targetPath);
}else if(btnLogout.equals("Abmelden")){
	myLogin.setLoggedIn(false);
	myMessage.setLogoutSuccessful();
	response.sendRedirect("./LoginView.jsp");
}else{
	if (myLogin.isLoggedIn()){
		myMessage.setPortalWelcome();
		response.sendRedirect("./PortalView.jsp");
	}else{
		myMessage.setGeneralWelcome();
		response.sendRedirect("./LoginView.jsp");
	}
}

%>
</body>
</html>