<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<base href="${pageContext.request.requestURI}" />
	<title>Fahrzeug suchen</title>
</head>
	
<body>
	
	<%@ include file="Navigation.jsp" %>
	
	<form id="suchenFormular" method="post" action="../AutoSuchenServlet">
			<select name="marke">
				<option value="val">Marke</option>
				<option value="val">Audi</option>
				<option value="val1">BMW</option>
			</select>
			
			<select name="modell">
				<option value="val">Modell</option>
				<option value="val">A5</option>
				<option value="val1">A7</option>
			</select>
			
			<select name="karosserie">
				<option value="val">Karosserie</option>
				<option value="val">Limousine</option>
				<option value="val1">Cabrio</option>
			</select>
			
			<select name="erstzulassung">
				<option value="val">Erstzulassung ab</option>
				<option value="val">2017</option>
				<option value="val1">2016</option>
			</select>
			
			<select name="kraftstoff">
				<option value="val">Kraftstoff</option>
				<option value="val">Benzin</option>
				<option value="val1">Diesel</option>
				<option value="val2">Gas</option>
			</select>
			
			<select name="preis">
				<option value="val">Preis pro Tag bis</option>
				<option value="val">10 </option>
				<option value="val1">100 </option>
			</select>
			
			<input type="text" name="standort" id="standort" placeholder="Stadt/PLZ">
			
			<button type="submit">Treffer</button>
	</form>
</body>	
</html>