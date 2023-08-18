<%@page import="de.hwg_lu.bwi420Beans.MessageBean"%>
<%@page import="java.sql.SQLException"%>
<%@page import="de.hwg_lu.bwi420Beans.AccountBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="myAccount" class="de.hwg_lu.bwi420Beans.AccountBean" scope="session" />
<jsp:useBean id="myMessage" class="de.hwg_lu.bwi420Beans.MessageBean" scope="session" />

Diese Seite sollte niemals sichtbar sein
<%!	//JSP-Deklaration fuer weitere Methoden
	public String denullify(String s){
//		if (s == null) return ""; else return s;
//		return "" + s;
		return (s==null)?"":s;
	}
	public String[] denullify(String[] sA){
		if (sA != null) return sA;
		else return new String[0];
	}
%>
<%	//Bean-Code
/*
AccountBean myAccount = (AccountBean) session.getAttribute("myAccount");
if (myAccount == null){
	myAccount = new AccountBean();
	session.setAttribute("myAccount", myAccount);
}
MessageBean myMessage = (MessageBean) session.getAttribute("myMessage");
if (myMessage == null){
	myMessage = new MessageBean();
	session.setAttribute("myMessage", myMessage);
}
*/
//alle Parameter einlesen
String userid = request.getParameter("userid");
String password = request.getParameter("password");
String ageString = request.getParameter("age");
String email = request.getParameter("email");
String btnToLogin = this.denullify(request.getParameter("btnToLogin"));
String btnRegister = this.denullify(request.getParameter("btnRegister"));
//Parameter aufbereiten, z.B. Button-null-check
if (btnToLogin == null) btnToLogin = "";
if (btnRegister == null) btnRegister = "";
int age = 0;
try{
	age = Integer.parseInt(ageString);
}catch(NumberFormatException nfe){
	nfe.printStackTrace();
	age = -1;
}

//Aktionsweiche
if (btnRegister.equals("Registrieren")){
	System.out.println("Registrieren");
	
	myAccount.setUserid(userid);
	myAccount.setPassword(password);
	myAccount.setAge(age);
	myAccount.setEmail(email);
	myAccount.setActive("Y");
	myAccount.setAdmin("N");
	
	MessageBean newMessage = myAccount.checkAccountData();
	if (newMessage != null){
		session.setAttribute("myMessage", newMessage);
	}else{
		try{
			boolean accountAngelegt = myAccount.insertAccountIfNotExists();
			if (accountAngelegt){
	//			myMessage.setInfoMessage("Account " + userid + " wurde angelegt");
	//			myMessage.setActionMessage("Gehen Sie jetzt zur Anmeldung");
				myMessage.setAccountCreated(userid);
			}else{
				myMessage.setAccountAlreadyExists(userid);
			}
		}catch(SQLException se){
			// Datenbankfehler aufgetreten
			myMessage.setDBError();
			se.printStackTrace();
		}
	}
	response.sendRedirect("./RegView.jsp");
}else if(btnToLogin.equals("zum Login")){
	System.out.println("zum Login");
	myMessage.setGeneralWelcome();
	response.sendRedirect("./LoginView.jsp");
}else{
	System.out.println("else-Zweig");
	myMessage.setGeneralWelcome();
	response.sendRedirect("./LoginView.jsp");
}





//Restposten
System.out.println("userid: " + userid);
System.out.println("password: " + password);
System.out.println("ageString: " + ageString);
System.out.println("age: " + age);
System.out.println("email: " + email);
System.out.println("btnToLogin: " + btnToLogin);
System.out.println("btnRegister: " + btnRegister);
%>
</body>
</html>