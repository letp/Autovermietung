<!-- Peter -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="../../login.css">
</head>
<body>

<div class="login">

<form method="POST" action=../../LoginServlet>
    <div class="container">

    	<h2>Login</h2><br>
    	    <%
	if((Integer)session.getAttribute("logfalsch") != null){
	    if((Integer)session.getAttribute("logfalsch") == 1){
	%>
	
	<a class = "rot">Passwort oder Email falsch!</a><br>
	<br>
	<%  
	}
	}
	%>
	    <label> Email </label><br>
	    <input type="text" placeholder="Email" name="email" required><br>
	
	    <label>Passwort </label><br>
	    <input type="password" placeholder="Passwort" name="passwort" required><br>

	     
	    <button type="submit">Login!</button><br>
    </div> 
    <br>
    <a href="Account.jsp"> Noch kein Konto? Jetzt registrieren!</a>
</form>
</div>
</body>
</html>
