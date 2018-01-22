<!-- Peter -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Startseite</title>
<link rel="stylesheet" type="text/css" href="../css/nav.css"> 
<link rel="stylesheet" type="text/css" href="../css/slider.css"> 

<script>
			document.addEventListener("DOMContentLoaded", init);
			function init() {
				var searchURL = "../../AutoSuchenServlet";
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function(){
					if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
						var autoListe = JSON.parse(xmlhttp.responseText);
						if(autoListe == null || autoListe.length == 0){
							document.getElementById("letzteAutos").innerHTML = "Keine Fahrzeuge gefunden";
							return;
						}
						
						var ausgabe = "";
						for(var i=0; i < autoListe.length; i++){
							ausgabe += "<div id=\"autoTabelle\">";
							ausgabe += "<table><tbody>";
							ausgabe += "<tr><td>";
							ausgabe += "<img src=\"../../BildServlet?id=" + autoListe[i].id + "\" width=\"200\" height=\"100\">";
							ausgabe += "</td></tr>";
							ausgabe += "<tr><td>";
							ausgabe += "<a href=\"../../CarViewServlet?id=" + autoListe[i].id + "\">" + autoListe[i].marke + " " + autoListe[i].modell + "</a>";
							ausgabe += "</td></tr>";
							ausgabe += "</tbody></table>";
							ausgabe += "</div>";
							
							ausgabe += "<div class=\"slider fade\"id=\"autoTabelle\" align=\"center\">";
							ausgabe += "<div class=\"bildnummer\">"+i+"/"+autoListe.length+ "</div>";
							ausgabe += "<img src=\"../../BildServlet?id=" + autoListe[i].id + "\" width=\"200\" height=\"100\">";
							ausgabe += "<div class=\"text\" href=\"../../CarViewServlet?id=" + autoListe[i].id + "\">" + autoListe[i].marke + " " + autoListe[i].modell + "</div>";	
						}
						}
						document.getElementById("letzteAutos").innerHTML = ausgabe;		
					}
				}
				xmlhttp.open("GET", searchURL, true);
				xmlhttp.send();
			}
			
			var slideIndex = 1;
			showSlides(slideIndex);
			
			function plusSlides(n) {
			  showSlides(slideIndex += n);
			}
			
			function currentSlide(n) {
			  showSlides(slideIndex = n);
			}
			
			function showSlides(n) {
			  var i;
			  var slides = document.getElementsByClassName("slider");
			  var dots = document.getElementsByClassName("dot");
			  if (n > slides.length) {slideIndex = 1}    
			  if (n < 1) {slideIndex = slides.length}
			  for (i = 0; i < slides.length; i++) {
			      slides[i].style.display = "none";  
			  }
			  slides[slideIndex-1].style.display = "block";  
			}
</script>
</head>
<body>
<%@ include file="Navigation.jsp" %>

<!--  vgl. https://www.w3schools.com/howto/howto_js_slideshow.asp -->
	<div class=slideshow-news>
	
		<div class="slider fade" align="center">
			<div class="bildnummer">1 / 3</div>
			<img src="../image/Auto.jpg" style="width:800px;height:400px">
			<div class="text">Welcome</div>
		</div>	
		<div class="slider fade" align="center" >
			<div class="bildnummer">2 / 3</div>
			<img src="../image/vermietung.jpg" style="width:1200px;max-height:400px" >
			<div class="text">News</div>
		</div>	
	
		
		<button class="prev" onclick="plusSlides(-1)">&#10094;</button>
		<button class="next" onclick="plusSlides(1)">&#10095;</button>
		
  		
	</div>
	<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
</div>

<div id="formSchnellsuche">
	<form id="schnellsuche" action="../SchnellsucheServlet" method="post">
		<table>
			<tr>
				<td colspan="3">
					<label for="suchText">Autos in der Nähe finden:</label>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="text" id="suchText" placeholder="Standort eingeben..">
				</td>
				<td>
					<button type="submit" id="submit">Suchen</button>
				</td>
			</tr>
			
			<tr>
				<td colspan="3">
					<a href ="AutoListe.jsp">Oder eine detaillierte Suche starten</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<h2>Die aktuellsten Fahrzeuge</h2><hr>
<div id="letzteAutos"></div>

</body>
</html>
