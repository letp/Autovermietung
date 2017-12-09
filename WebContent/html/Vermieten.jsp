<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Auto vermieten</title>
</head>
<body>
<%@ include file="Navigation.jsp" %>
<form method="post" action="../../VermietenServlet" enctype="multipart/form-data">
	    
	<h1>Auto anbieten</h1>
	
	<c:choose>
		<c:when test="${logged > 0}">
			<label>Marke <br></label>
		    <input type="text" name="marke" id="name" required autofocus>
		    <br>
		    <label>Bezeichnung</label> <br>
		    <input type="text" name="bezeichnung" required>
		    <br>
		    <label>Typ</label> <br>
		    <input type="text"  name="typ" required>
		    <br>
		    <label>Kraftstoff</label> <br>
		    <select name="kraftstoff">
		    	<option>Benzin</option>
		    	<option>Diesel</option>    
		    </select>
		    <br>
		    <label>Getriebe</label>
		    <br>
		    <select name="getriebe">
		    	<option>Manuell</option>
		    	<option>Automatik</option>    
		    </select>
		    <br>
		    <label>PS</label><br>
		    <input type="Number" name="ps" required>
		    <br>
		    <label>Topspeed</label><br>
			<input type="Number" name="speed" required>
			<br>
			<label>Bild</label>
			<input type="file" name="image" id="image" accept="image/*" >
		    <br>
		    <button type="submit" id="newcar" type="button">Auto anbieten!</button> 
		    <br>
		    
		</c:when>
		<c:otherwise>
			Bitte loggen sie sich ein zum Vermieten!
			<br>
			Sie haben noch keinen Account? 
			<br>
			<a href="NewAccount.jsp">Jetzt registrieien!</a>
		</c:otherwise>
	</c:choose>
</form>
</body>
</html>
