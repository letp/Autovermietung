<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loosBe.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Fahrzeugdetails</title>	
	<base href="${pageContext.request.requestURI}" />
	<link rel="stylesheet" type="text/css" href="../css/Carview.css">	
</head>
<body>	
	<%@ include file="Navigation.jsp" %>
	<h1>${requestScope.auto.marke} ${requestScope.auto.modell}</h1>
	
	<img src="../BildServlet?id=${requestScope.auto.id}" width="450" height="300">
		
	<h2>Technische Daten</h2>
		<table>
			<tr>
				<td>Leistung:</td>
				<td>${requestScope.auto.ps} Ps</td>
			</tr>
			
			<tr>
				<td>Getriebe:</td>
				<td>${requestScope.auto.getriebe}</td>
			</tr>
				
			<tr>
				<td>Kraftstoff:</td>
				<td>${requestScope.auto.kraftstoff}</td>
			</tr>
		</table>
		
	<h2>Fahrzeugdetails</h2>
		<table>
			<tr>
				<td>Sitzplaetze:</td>
				<td>${requestScope.auto.sitzplaetze}</td>
			</tr>
			
			<tr>
				<td>Tueren:</td>
				<td>${requestScope.auto.tueren}</td>
			</tr>
				
		</table>
		
	<h2>Standort</h2>
		<ul>
			<li>${requestScope.auto.standort}</li>
		</ul>
	 
	
	<h2>Kosten</h2>
		<ul>
			<li> ${requestScope.auto.preis} Euro/Tag</li>
		</ul>
	
	<div id="buchen">
		<a href="../BuchenServlet?id=${requestScope.auto.id}">Auto jetzt buchen !</a>
	</div>	
	
</body>
</html>