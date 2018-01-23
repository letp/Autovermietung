/**
 * 
 */
document.addEventListener("DOMContentLoaded", init);

function init() {
	
	if (navigator.cookieEnabled == false) {
		document.getElementById("cooki").innerHTML = "Bitte aktivieren Sie Cookies!";
	}

	var searchURL = "AutoSuchenServlet";
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var autoListe = JSON.parse(xmlhttp.responseText);
			if (autoListe == null || autoListe.length == 0) {
				document.getElementById("letzteAutos").innerHTML = "Keine Fahrzeuge gefunden";
				return;
			}

			var ausgabe = "";
			for (var i = 0; i < autoListe.length; i++) {
				ausgabe += "<div class=\"sliderfade\" align=\"center\">";
				ausgabe += "<img id=\"slideBild\" src=\"BildServlet?id="
						+ autoListe[i].id + ">";
				ausgabe += "<div id=\"text\"><br><a id=\"text\" href=\"CarViewServlet?id="
						+ autoListe[i].id
						+ "\">"
						+ autoListe[i].marke
						+ " "
						+ autoListe[i].modell + "</a></div>";
				ausgabe += "</div>";
			}
			document.getElementById("letzteAutos").innerHTML = ausgabe;

			var slides = document.getElementsByClassName("sliderfade");
			slides[0].style.display = "block";
		}
	}
	xmlhttp.open("GET", searchURL, true);
	xmlhttp.send();
}

var slideIndex = 1;

function plusSlides(n) {
	showSlides(slideIndex += n);
}

function showSlides(n) {
	var i;
	var slides = document.getElementsByClassName("sliderfade");
	var dots = document.getElementsByClassName("dot");

	if (n > slides.length) {
		slideIndex = 1;
	}
	if (n < 1) {
		slideIndex = slides.length;
	}

	for (i = 0; i < slides.length; i++) {
		slides[i].style.display = "none";
	}
	slides[slideIndex - 1].style.display = "block";
}
