<!-- Peter -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Startseite</title>
<link rel="stylesheet" type="text/css" href="../css/slider.css">

</head>
<body>

	<%@ include file="Navigation.jsp"%>
	
	<header>
	<h1 role="heading" align="center">Autovermietung</h1>
	</header>

	<!--  vgl. https://www.w3schools.com/howto/howto_js_slideshow.asp -->
	<div class=slideshow-news>

		<div class="slider fade" align="center">
			<div class="bildnummer">1 / 2</div>
			<img src="../image/Auto.jpg" style="width: 800px; height: 400px">
			<div class="text">Welcome</div>
		</div>
		<div class="slider fade" align="center">
			<div class="bildnummer">2 / 2</div>
			<img src="../image/vermietung.jpg" style="width: 1200px; max-height: 400px">
			<div class="text">Welcome</div>
		</div>


		<button class="prev" onclick="plusSlides(-1)">&#10094;</button>
		<button class="next" onclick="plusSlides(1)">&#10095;</button>


	</div>
	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span>
	</div>

	<h2 >Aktuelle Autos</h2>
	<hr />
	<div id="neu"></div>

	<br>

	<footer class="foot"> <br>

	Autovermietung <br>
	<a href="Login.jsp">Login</a> <br>
	<a href="NewAccount.jsp">Registrieren</a> <br>
	</footer>

	<script>
		document.addEventListener("DOMContentLoaded", getneu);

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
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slides[slideIndex - 1].style.display = "block";
		}

		function getneu() {
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function() {
				console.log("Callback reached with status " + xmlhttp.status
						+ " and ready State " + xmlhttp.readyState);
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var neu = JSON.parse(xmlhttp.responseText);
					var ausgabe = "<figure>";
					for (var i = 0; i < neu.length; i++) {

						ausgabe += "<figure>";
						ausgabe += "<a>" + neu[i].modell"</a>";
						ausgabe += "</figure>";

					}
					ausgabe += "</figure>";

					document.getElementById("neu").innerHTML = ausgabe;
				}
			}
			xmlhttp.open("GET", "../../NeuServlet", true);
			xmlhttp.send();
		}
	</script>
</body>
</html>
