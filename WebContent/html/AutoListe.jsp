<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Fahrzeug finden</title>
	
	
	<script>
			document.addEventListener("DOMContentLoaded", init);
			function init() {
				document.getElementById("button").addEventListener("click", changeContent);
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
	
				
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function(){
					if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
						var autoListe = JSON.parse(xmlhttp.responseText);
						if(autoListe == null || autoListe.length == 0){
							document.getElementById("hitlist").innerHTML = "Keine Treffer";
							return;
						}
						
						var ausgabe = "<table>";
						for(var i=0; i < autoListe.length; i++){
							ausgabe += "<tr><td>";
							ausgabe += "<a href=\"../CarViewServlet?id=" + autoListe[i].id + "\">" + autoListe[i].marke + " " + autoListe[i].modell + "</a>";
							//ausgabe += "<a href=\"../CarViewServlet?id=\${" + autoListe[i].id + "}\">" + autoListe[i].marke + " " + autoListe[i].modell + "</a>";
							ausgabe += "</td><td>";
							ausgabe += autoListe[i].kraftstoff
							ausgabe += "</td></tr>";
						}
						ausgabe += "</table>";
						document.getElementById("hitlist").innerHTML = ausgabe;
					}
				}
				xmlhttp.open("GET", searchURL, true);
				xmlhttp.send();
			}
	</script>
</head>
<body>

	<h1>Passendes Fahrzeug finden!</h1>
	<h2>Suche eingränzen:</h2>
	
	<form id="form">
	
		<table>
			<tr>
				<td>
					<label for="marke">Marke</label><br>
					<select id="marke">
						<option value="">Bitte wählen</option>
						<option value="Audi">Audi</option>
						<option value="BMW">BMW</option>
					</select>	
				</td>
				
				<td>
					<label for="modell">Modell</label><br>
					<select id="modell">
						<option value="">Bitte wählen</option>
						<option value="A5">A5</option>
						<option value="M4">M4</option>
					</select>	
				</td>
				
				<td>
					<label for="tueren">Türen</label><br>
					<select id="tueren">
						<option value="">Bitte wählen</option>
						<option value="3">3</option>
						<option value="5">5</option>
					</select>
			
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
					<label for="Schaltung">Schaltung</label><br>
					<select id="schaltung">
						<option value="">Bitte wählen</option>
						<option value="Automatik">Automatik</option>
						<option value="Manuell">Manuell</option>
					</select>	
				</td>
				
				<td>
					<label for="leistung">Leistung</label><br>
					<input type="text" name="leistung" id="leistung"  maxlength="4" size="4">
				</td>
				
				<td>
					<label for="Standort">Standort</label><br>
					<select id="standort">
						<option value="">Bitte wählen</option>
						<option value="München">München</option>
						<option value="Stuttgart">Stuttgart</option>
						<option value="Hamburg">Hamburg</option>
						<option value="Dortmund">Dortmund</option>
					</select>	
				</td>
			</tr>
			
			<tr>
				<td>
					
				</td>
			</tr>	
		</table>
	</form>
	<button id="button">Filter anwenden</button>
	
	<h3>Trefferliste</h3>
	<div id="hitlist">Keine Treffer</div>
	     
</body>
</html>