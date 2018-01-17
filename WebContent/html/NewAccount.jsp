<!-- Peter -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account</title>
<link rel="stylesheet" type="text/css" href="../css/Login.css">

</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="login">
<form method="post" action="../../AccountServlet">

	
	 <c:choose>
		<c:when test="${pwfalsch > 0}">
			<br>
			<a class = "rot">Passwörter stimmen nicht überein!</a>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${vorhanden > 0}">
			<br>
			<a class = "rot">Email Adresse bereits vergeben!</a>
		</c:when>
	</c:choose>
	<h1>Neuer Account</h1>
    <label>Name <br></label>
    <input type="text" name="name" id="name" required autofocus>
    <br>
    <label>Vorname</label> <br>
    <input type="text" name="vorname" required>
    <br>
    <label>Email</label> <br>
    <input type="email"  name="email" required>
    <br>
    <label>Straße </label> <br>
    <input type="text" name="strasse" required>
    <br>
    <label>Hausnummer</label>
    <br>
    <input type="text" name="hausnummer" required>
    <br>
    <label>Stadt </label><br>
    <input type="text" name="stadt" required>
    <br>
    <label>Postleitzahl </label>
    <br>
    <input type="text" name="postleitzahl" required>
	<br>
    <label>Passwort </label>
    <br>
    <input type="password" name="passwort" required>
	<br>
    <label>Wiederhole Passwort</label> <br>
    <input type="password" name="passwort2" required>
    <span id="message"></span>
	<br>
	<br>
    
    <button type="submit" id="account" type="button">Registrieren!</button> 
    <br>
</form>
</div>      

</body>
</html>
