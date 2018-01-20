<!-- Peter -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/nav.css">

</head>
<script>
	document.body.className = document.body.className + " js_enabled";
	function cookie() {
		if (navigator.cookieEnabled == false) {
			document.getElementById("cooki").innerHTML = "Bitte aktivieren Sie Cookies!";
		}
	}
</script>
<noscript>Bitte aktivieren Sie JavaScript!</noscript>
<body onload="cookie()">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<p id="cooki"></p>
	<nav>
	<ul class="nav">
		<li><a href="Startseite.jsp">Startseite</a></li>
		<li><a href="AutoListe.jsp">Detailsuche</a></li>

		<li>
			<form method="post" action="../SucheServlet">
				<input id="suche1" name="suche1" placeholder="Modellbezeichnung">
				<button type="submit" id="suche" type="button">Suchen</button>
			</form>
		</li>


		<c:choose>
			<c:when test="${logged > 0}">
				<li class="right"><a id="konto" href="../LogoutServlet">Logout</a></li>
			</c:when>
			<c:otherwise>
				<li class="right"><a id="konto" href="Login.jsp">Login</a></li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${logged > 0}">
				<li class="right"><a id="konto" href="Konto.jsp">Mein Konto</a></li>
			</c:when>
		</c:choose>
		<li class="right"><a href="Zusammenfassung.html">Warenkrob</a></li>
		<li class="right"><a href="Vermieten.jsp">Vemieten</a></li>
	</ul>
	</nav>
</body>
</html>