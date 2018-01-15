<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loosBe.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Autoübersicht</title>	
</head>
<body>

	<h1>${requestScope.auto.marke}</h1>
		<img src= "../img/audi.jpg" width="350" height="230" align="right" alt="audi">
	<h2>Technische Daten</h2>
		<ul>
			<li>Leistung: {PS}{KW}</li>
			<li>Getriebe: {Automatik}{Manuell}</li>
			<li>Kraftstoff: ${requestScope.auto.kraftstoff}</li>
		</ul>
		
	<h2>Ausstattung</h2>
		<ul>
			<li>Sitzplätze: {Anzahl Sitze}</li>
			<li>Türen: {Anzahl Türen}</li>
			<li>Klimaanlage: {ja/nein}</li>
		</ul>
		
	<h2>Standort</h2>
	{Standort}
	
	<h2>Kosten</h2>
	Preis pro Tag: {preisProTag}<br>
	
	<h2>Sonstiges</h2>
	{Sonstiges}
	
	
	
</body>
</html>