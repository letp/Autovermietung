<!-- Peter -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Startseite</title>
	
	<link rel="stylesheet" type="text/css" href="nav.css"> 
	<style>
	
		
		input{
		height: 20px;
		width: 300px;
	    margin: 8px 0;
	    box-sizing: border-box;
	    padding: 12px;
		}
		
		<!-- style für slider -->
		* {box-sizing:border-box}
		
		.slideshow-news {
			  
			  position: relative;
			  margin: auto;
			}
			
			.slider {
			    display: none;
			}
		
		.prev, .next {
		  cursor: pointer;
		  position: absolute;
		  top: 50%;
		  width: auto;
		  margin-top: -22px;
		  padding: 16px;
		  color: white;
		  font-weight: bold;
		  font-size: 18px;
		  transition: 0.6s ease;
		  border-radius: 0 3px 3px 0;
		}
		.next {
		  right: 0;
		  border-radius: 3px 0 0 3px;
		}
		
		.prev:hover, .next:hover {
		  background-color: rgba(0,0,0,0.8);
		}
		.text {
		  color: #f2f2f2;
		  font-size: 15px;
		  padding: 8px 12px;
		  position: absolute;
		  bottom: 8px;
		  width: 100%;
		  text-align: center;
		}
		
		.bildnummer {
		  color: #f2f2f2;
		  font-size: 12px;
		  padding: 8px 12px;
		  position: absolute;
		  top: 0;
		}
		
		figure{
			  margin: 0;
			}
			
			figure.bild{
			  display: inline-block;
			  padding: 10px;
			  width: 250px;
			  hight: 250px;
			  border: 1px solid gainsboro;
			}
		

	</style>
	
</head>
<body> 

<jsp:include page="Navigation.jsp"></jsp:include>
	<header>
		<h1 role="heading" align="center">
			Autovermietung
		</h1>
	</header>
	
	<!--  vgl. https://www.w3schools.com/howto/howto_js_slideshow.asp -->
	<div class=slideshow-news>
	
		<div class="slider fade" align="center">
			<div class="bildnummer">1 / 3</div>
			<img src="Auto.jpg" style="width:800px;height:400px">
			<div class="text">Welcome</div>
		</div>	
		<div class="slider fade" align="center" >
			<div class="bildnummer">2 / 3</div>
			<img src="welcome.jpg" style="width:1200px;max-height:400px" >
			<div class="text">News,Angebote</div>
		</div>	
		<div class="slider fade" align="center">
			<div class="bildnummer">3 / 3</div>
			<img src="welcome.jpg" style="width:1200px;max-height:400px" >
			<div class="text">News,Angebote</div>
		</div>	
		
		<button class="prev" onclick="plusSlides(-1)">&#10094;</button>
		<button class="next" onclick="plusSlides(1)">&#10095;</button>
		
  		
	</div>
	<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<h2 class=beliebteArtikel role="heading">
    <span>Beliebteste Autos</span>
   		</h2>
   		<hr/>
   		<figure>
   		
   		<figure class="bild" width="250" height="250">
   			<img src="bmw.jpg" href="CarView.html" width="250" height="170" alt="Auto1"><br>
   			<a>Auto1</a> 
   		</figure>
   		
   		<figure class="bild">
   			<img src="bmw.jpg" href="CarView.html" width="250" height="170" alt="Auto2"><br>
   			<a href="CarView.html" >Auto2</a> 
   		</figure>
   		<figure class="bild">
   			<img src="bmw.jpg" href="CarView.html" width="250" height="170" alt="Auto3"><br>
   			<a href="CarView.html" >Auto3</a>  
   		</figure>
	</figure>
	
	<br>

	<footer class="foot">
	<br>
	
	Autovermietung
	<br>
	<a href="Login.jsp">Login</a>
	<br>
	<a href="NewAccount.jsp">Registrieren</a>
	<br>
	</footer>

	<script>
	
	
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
</body>
</html>
