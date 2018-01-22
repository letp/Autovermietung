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
<link rel="stylesheet" type="text/css" href="../css/Startseite.css"> 

<script>
			document.addEventListener("DOMContentLoaded", init);
			function init() {
				var searchURL = "../AutoSuchenServlet";
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
							ausgabe += "<div class=\"slider fade\" align=\"center\">";
							ausgabe += "<img id=\"slideBild\" src=\"../BildServlet?id=" + autoListe[i].id + ">";
							ausgabe += "<div id=\"text\"><a id=\"text\" href=\"../CarViewServlet?id=" + autoListe[i].id + "\">" + autoListe[i].marke + " " + autoListe[i].modell + "</a></div>";	
							ausgabe += "</div>";
						}
						document.getElementById("letzteAutos").innerHTML = ausgabe;		
						
						var slides = document.getElementsByClassName("slider");
						slides[0].style.display = "block";
					}
				}
				xmlhttp.open("GET", searchURL, true);
				xmlhttp.send();
			}
			
			var slideIndex = 1;
			
			function plusSlides(n){
				showSlides(slideIndex += n);
			}
			
			function showSlides(n){
				var i;
				var slides = document.getElementsByClassName("slider");
				var dots = document.getElementsByClassName("dot");
			
				if(n > slides.length){
					slideIndex = 1;
				}
				if(n < 1){
					slideIndex = slides.length;
				}
				
				for(i =0; i<slides.length; i++){
					slides[i].style.display = "none";
				}
				slides[slideIndex-1].style.display = "block";
			}
			
</script>
</head>
<body>
<%@ include file="Navigation.jsp" %>

<div>
	<img id="startbild" src="../img/Bild2.jpg">
</div>

<h2>Die aktuellsten Fahrzeuge</h2><hr>

<!--  vgl. https://www.w3schools.com/howto/howto_js_slideshow.asp -->
	<div class=slideshow-news>
	
		
		<div id="letzteAutos"></div>
		
			<button class="prev" onclick="plusSlides(-1)">&#10094;</button>
			<button class="next" onclick="plusSlides(1)">&#10095;</button>
		
		</div>
	<div style="text-align:center">
</div>

</body>
</html>
