<!-- Peter -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.requestURI}" />
<title>Account</title>
<link rel="stylesheet" type="text/css" href="login.css">

<script>

function check() {
	  if (document.getElementById("passwort").value ==
	    document.getElementById("passwort2").value) {
	    document.getElementById("message").style.color = "green";
	    document.getElementById("message").innerHTML = "matching";
	  } else {
	    document.getElementById("message").style.color = "red";
	    document.getElementById("message").innerHTML = "not matching";
	  }
	}
</script>
</head>
<body>

<div class="login">
<form method="post" action="../../AccountServlet">
	    <%
	if((Integer)session.getAttribute("pwfalsch") != null){
	    if((Integer)session.getAttribute("pwfalsch") == 1){
	%>
	<br>
	<a class = "rot">Passwörter stimmen nicht überein!</a>
	<%  
	}
	}
	%>
	<%
	
	if((Integer)session.getAttribute("vorhanden") != null){
	    if((Integer)session.getAttribute("vorhanden") == 1){
	%>
	<br>
	<a class = "rot">Email Adresse bereits vergeben!</a>
	<%  
	}
	}
	%>
	<h1>Neuer Account</h1>
    <label>Name <br></label>
    <input type="text" name="name" id="name" required autofocus>
    <br>
    <label>Vorname</label> <br>
    <input type="text" name="vorname" required>
    <br>
    <label>Email</label> <br>
    <input type="text"  name="email" required>
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
    <input type="password" name="passwort" onkeyup="check()" required>
	<br>
    <label>Wiederhole Passwort</label> <br>
    <input type="password" name="passwort2" onkeyup="check()" required>
    <span id="message"></span>
	<br>
	<br>
    
    <button type="submit" id="account" type="button">Registrieren!</button> 
    <br>
</form>
</div>      
    <a
    	href="#"> ABG
    </a>

</body>
</html>
