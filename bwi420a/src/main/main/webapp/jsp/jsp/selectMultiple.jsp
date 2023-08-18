<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Lass uns Eis essen gehen</h2>
<form action="./selectMultiple.jsp" method="get">
Wer geht mit: <input type="text" name="mitesser" value="" />
<br>
Was essen wir:
<select name="eissorte" multiple>
	<option>Spaghettieis</option>
	<option>Krokantbecher</option>
	<option>Karamelbecher</option>
	<option>Walnussbecher</option>
</select>
<br>
<input type="submit" name="bestellen" value="bestellen" />
</form>
<br>
<%
out.print("==============================<br>");
String mitesser  = request.getParameter("mitesser");
String[] eissorte  = request.getParameterValues("eissorte");
if (eissorte == null) eissorte = new String[0];
String bestellen = request.getParameter("bestellen");
if (bestellen == null) bestellen = "";

out.print("name: mitesser, value: " + mitesser + "<br>");
//for (int index = 0; index < eissorte.length; index++){
//	String eis = eissorte[index];
for (String eis : eissorte){
	out.print("name: eissorte, value: " + eis + "<br>");
}
out.print("name: bestellen, value: " + bestellen + "<br>");
out.print("==============================<br>");
Enumeration<String> myParamNames = request.getParameterNames();
while(myParamNames.hasMoreElements()){
	String myParamName = myParamNames.nextElement();
	String[] myParamValues =  request.getParameterValues(myParamName);
	if (myParamValues == null) myParamValues = new String[0];
	for (String myParamValue : myParamValues){
		out.print("name: " + myParamName + " , value: " + myParamValue + "<br>");
	}
}
out.print("==============================<br>");
Enumeration<String> myHeaderNames = request.getHeaderNames();
while(myHeaderNames.hasMoreElements()){
	String myHeaderName = myHeaderNames.nextElement();
	Enumeration<String> myHeaderValues = request.getHeaderNames();
	
	while(myHeaderNames.hasMoreElements()){
	
	String myHeaderValue= myHeaderNames.nextElement();
		out.print("name: " + myHeaderName + " , value: " + myHeaderValue + "<br>");
	}
}


%>
</body>
</html>