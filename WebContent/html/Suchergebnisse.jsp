<!-- Peter -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Suchergebnisse</title>
<link rel="stylesheet" type="text/css" href="nav.css"> 
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="Navigation.jsp" %>

<h2>Suchergebnisse</h2><hr>

	<c:choose>
			<c:when test="${suchanzahl > 0}">
				
				<c:forEach items="${autos}" var="a">
					<br>
					<img src="../../BildServlet?id=${a.id}" width="75" height="75" alt="${a.bezeichnung}">
					<a href="../../AutoServlet?param1=${a.id}">${a.bezeichnung}</a>
					<br><hr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<p>Keine Bücher gefunden!</p>
			</c:otherwise>
		</c:choose>

	<footer class="foot">
	<br>
	Student Book Store 2017
	<br>
	<a href="Verkaufen.jsp">Buch verkaufen</a>
	<br>
	<a href="Login.jsp">Login</a>
	<br>
	<a href="Account.jsp">Registrieren</a>
	<br>
	</footer>
</body>
</html>
