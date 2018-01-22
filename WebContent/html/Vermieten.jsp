<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Auto vermieten</title>

<link rel="stylesheet" type="text/css" href="../css/Vermieten.css">
</head>
<body>
<%@ include file="Navigation.jsp" %>
<form method="post" id="form" action="../VermietenServlet" enctype="multipart/form-data">
	    
	<h1>Auto anbieten</h1>
	
	<c:choose>
		<c:when test="${logged > 0}">
			<label>Marke <br></label>
		    <select name="marke" required>
		    	<option>Audi</option>
		    	<option>BMW</option>
		    	<option>Mercedes-Benz</option>   
		    	<option>Volkswagen</option>       
		    </select>
		    <br>
		    <label>Bezeichnung</label> <br>
		    <input type="text" name="bezeichnung" required>
		    <br>
		    <label>Karosserie</label> <br>
		    <select name="karosserie" required>
		    	<option>Limousine</option>
		    	<option>Kombi</option>
		    	<option>Cabrio</option>   
		    	<option>Van</option>   
		    	<option>Geländewagen</option>    
		    	<option>Sportwagen</option>  
		    	<option>Transporter</option>       
		    </select>
		    <br>
		    <label>Erstzulassung</label> <br>
		    <input type="Number"  name="erst" required>
		    <br>
		    <label>Türen</label><br>
		    <select name="tueren" required>
		    	<option>3</option>
		    	<option>5</option>    
		    </select>
		    <br>
		    <label>Sitzplätze</label><br>
		   	  <select name="sitzplaetze" required>
		    	<option>2</option>
		    	<option>3</option>    
		    	<option>4</option> 
		    	<option>5</option> 
		    	<option>6</option> 
		    	<option>7</option> 
		    </select>
		    <br>
		    <label>Standort</label><br>
		    <input type="text" name="standort" required>
		    <br>
		    <label>Kraftstoff</label>
		    <br>
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
			<label>Bild</label>
			<input type="file" name="image" id="image" accept="image/*"  required>
		    <br>
		    <label>Preis pro Tag</label><br>
		    <input type="Number" name="preis" required>
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
