<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Fahrzeug finden</title>
	<base href="${pageContext.request.requestURI}" />
	<link rel="stylesheet" type="text/css" href="../css/Autoliste.css">
	
	<script>
			document.addEventListener("DOMContentLoaded", init);
			function init() {
				document.getElementById("button").addEventListener("click", changeContent);
				var element = document.getElementById("marke");
				element.addEventListener("change", modelleAnzeigen);
			}
			
			function changeContent() {
				var searchURL = "../AutoListeServlet";
				
				var marke = document.getElementById("marke").value;
				searchURL += "?marke=" + encodeURIComponent(marke);	
	
				var modell = document.getElementById("modell").value;
				searchURL += "&modell=" + encodeURIComponent(modell);
				
				var tueren = document.getElementById("tueren").value;
				searchURL += "&tueren=" + encodeURIComponent(tueren);	
			
				var karosserie = document.getElementById("karosserie").value;
				searchURL += "&karosserie=" + encodeURIComponent(karosserie);	
				
				var schaltung = document.getElementById("schaltung").value;
				searchURL += "&schaltung=" + encodeURIComponent(schaltung);	
				
				var leistung = document.getElementById("leistung").value;
				searchURL += "&leistung=" + encodeURIComponent(leistung);
				
				var kraftstoff = document.getElementById("kraftstoff").value;
				searchURL += "&kraftstoff=" + encodeURIComponent(kraftstoff); 
				
				var sitzplaetze = document.getElementById("sitzplaetze").value;
				searchURL += "&sitzplaetze=" + encodeURIComponent(sitzplaetze); 
				
				var erstzulassung = document.getElementById("erstzulassung").value;
				searchURL += "&erstzulassung=" + encodeURIComponent(erstzulassung); 
	
				var preis = document.getElementById("preis").value;
				searchURL += "&preis=" + encodeURIComponent(preis); 
				
				var standort = document.getElementById("standort").value;
				searchURL += "&standort=" + encodeURIComponent(standort); 
				
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function(){
					if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
						var autoListe = JSON.parse(xmlhttp.responseText);
						if(autoListe == null || autoListe.length == 0){
							document.getElementById("hitlist").innerHTML = "Keine Treffer";
							return;
						}
						
						var ausgabe = "";
						var i;
						for(i=0; i < autoListe.length; i++){
							ausgabe += "<table>";
							ausgabe += "<tbody>";
							ausgabe += "<tr><td rowspan=\"3\">";
							ausgabe += "<img src=\"../BildServlet?id=" + autoListe[i].id + "\" width=\"300\" height=\"200\">"
							ausgabe += "</td><td colspan=\"3\">";
							ausgabe += "<a href=\"../CarViewServlet?id=" + autoListe[i].id + "\">" + autoListe[i].marke + " " + autoListe[i].modell + "</a>";
							ausgabe += "</td></tr>";
							ausgabe += "<tr><td>";
							ausgabe += "Kraftstoff: " + autoListe[i].kraftstoff;
							ausgabe += "</td><td>";
							ausgabe += "Leistung: " + autoListe[i].ps + " PS";
							ausgabe += "</td><td>";
							ausgabe += "";
							ausgabe += "</td></tr>";
							ausgabe += "<tr><td>";
							ausgabe += "Getriebe: " + autoListe[i].getriebe;
							ausgabe += "</td><td>";
							ausgabe += "Standort: " + autoListe[i].standort;
							ausgabe += "</td><td>";
							ausgabe += "<div id=\"preisAnzeige\">Preis: " + autoListe[i].preis + " €/Tag" + "</div>";
							ausgabe += "</td></tr>";
							ausgabe += "</tbody>";
							ausgabe += "</table>";
						}
						document.getElementById("hitlist").innerHTML = ausgabe;
						document.getElementById("treffer").innerHTML = i + " Ergebnisse für diese Suche";
					}
				}
				xmlhttp.open("GET", searchURL, true);
				xmlhttp.send();
			}
			
			var modelle = new Object();
			modelle["Audi"]= ["A1", "A2", "A3", "A4", "A5", "RS7"];
			modelle["BMW"] = ["120", "220", "320", "430", "520"];
			modelle["Volkswagen"] = ["Bora", "Golf", "Jetta", "Passat", "Polo", "Scirocco", "Sharan"];
			modelle["Mercedes-Benz"] = ["A-Klasse", "B-Klasse", "C-Klasse", "E-Klase", "GLK"]

			function modelleAnzeigen() {
				var abflug = document.getElementById("marke").value;
				var ausgabe = document.getElementById("modell");

				// bisherige Eintraege loeschen
				for (i = ausgabe.length; i > 0; i--) {
					ausgabe.options[i] = null;
				}

				// neue Eintraege
				if (abflug != "") {
					for (i = 0; i < modelle[abflug].length; i++) {
						ausgabe.options[i+1] = new Option(modelle[abflug][i]);
					}
				}
			}
	</script>
</head>
<body>
	<%@ include file="Navigation.jsp" %>
	<h1>Passendes Fahrzeug finden!</h1>
	<h2>Suche eingränzen:</h2>
	
	<form id="form">
		<fieldset>
		<table>
			<tr>
				<td>
					<label for="marke">Marke</label><br>
					<select id="marke">
						<option value="">Bitte wählen</option>
						<option value="Audi">Audi</option>
						<option value="BMW">BMW</option>
						<option value="Mercedes-Benz">Mercedes-Benz</option>
						<option value="Volkswagen">Volkswagen</option>
					</select>	
				</td>
				
				<td>
					<label for="modell">Modell</label><br>
					<select id="modell">
						<option value="">Bitte wählen</option>
					</select>	
				</td>
				
				<td>
					<label for="Schaltung">Schaltung</label><br>
					<select id="schaltung">
						<option value="">Bitte wählen</option>
						<option value="Automatik">Automatik</option>
						<option value="Manuell">Manuell</option>
					</select>	
				</td>
				
				<td>
					<label for="kraftstoff">Kraftstoff</label><br>
					<select id="kraftstoff">
						<option value="">Bitte wählen</option>
						<option value="Benzin">Benzin</option>
						<option value="Diesel">Diesel</option>
						<option value="Gas">Gas</option>
					</select>	
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="karosserie">Karosserie</label><br>
					<select id="karosserie">
						<option value="">Bitte wählen</option>
						<option value="Limousine">Limousine</option>
						<option value="Kombi">Kombi</option>
						<option value="Cabrio">Cabrio</option>
						<option value="Van">Van</option>
						<option value="Geländewagen">Geländewagen</option>
						<option value="Sportwagen">Sportwagen</option>
						<option value="Transporter">Transporter</option>
					</select>	
				</td>
				
				<td>
					<label for="tueren">Türen</label><br>
					<select id="tueren">
						<option value="">Bitte wählen</option>
						<option value="3">3</option>
						<option value="5">5</option>
					</select>
				</td>
				
				<td>
					<label for="sitzplaetze">Sitzplätze</label><br>
					<select id="sitzplaetze">
						<option value="">Bitte wählen</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
					</select>
				</td>
				
				<td>
					<label for="leistung">Leistung ab</label><br>
					<select id="leistung">
						<option value="">Bitte wählen</option>
						<option value="50">50 Ps</option>
						<option value="100">100 Ps</option>
						<option value="150">150 Ps</option>
						<option value="200">200 Ps</option>
						<option value="250">250 Ps</option>
						<option value="300">300 Ps</option>
					</select>
				</td>
			</tr>
				
			<tr>
				<td>
					<label for="erstzulassung">Erstzulassung ab</label><br>
					<select id="erstzulassung">
						<option value="">Bitte wählen</option>
						<option value="1980">1980</option>
						<option value="1990">1990</option>
						<option value="1995">1995</option>
						<option value="2000">2000</option>
						<option value="2005">2005</option>
						<option value="2010">2010</option>
						<option value="2015">2015</option>
					</select>
				</td>
				
				<td>
					<label for="preis">Preis bis</label><br>
					<select id="preis">
						<option value="">Bitte wählen</option>
						<option value="10">10 €</option>
						<option value="15">15 €</option>
						<option value="20">20 €</option>
						<option value="25">25 €</option>
						<option value="30">30 €</option>
						<option value="35">35 €</option>
						<option value="40">40 €</option>
						<option value="45">45 €</option>
						<option value="50">50 €</option>
					</select>
				</td>
				
				<td>
					<label for="standort">Standort</label><br>
					<select id="standort">
						<option value="">Bitte wählen</option>
						<option value="Augsburg">Augsburg</option>
						<option value="München">München</option>
						<option value="Stuttgart">Stuttgart</option>
						<option value="Hamburg">Hamburg</option>
						<option value="Dortmund">Dortmund</option>
					</select>	
				</td>
		
			</tr>
			
		</table>
			
		</fieldset>
	</form>
	
	<button id="button">Filter anwenden</button>

	<div id="treffer"></div>
	<div id="hitlist"></div>
	     
</body>
</html>