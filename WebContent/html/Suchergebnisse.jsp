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
<link rel="stylesheet" type="text/css" href="AutoListe.css">
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ include file="Navigation.jsp"%>

	<h2>Suchergebnisse</h2>
	<hr>

	<c:choose>
		<c:when test="${suchanzahl > 0}">

			<c:forEach items="${autos}" var="a">
				<table>
					<tbody>

						<tr>
							<td rowspan="3"><img src="../BildServlet?id=${a.id}"
								width="300" height="200"></td>
							<td colspan="3"><a href="../CarViewServlet?id=${a.id}">${a.marke}
									${a.modell}</a></td>
						</tr>
						<tr>
							<td>Kraftstoff: ${a.kraftstoff}</td>
							<td>Leistung: ${a.ps} PS</td>
							<td></td>
						</tr>
						<tr>
							<td>Getriebe: ${a.getriebe}</td>
							<td>Standort: ${a.standort}</td>
							<td>
								<div id="preisAnzeige">Preis: ${a.preis} Euro/Tag</div>
							</td>
						</tr>
					</tbody>
				</table>
				<hr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<p>Keine Autos gefunden!</p>
		</c:otherwise>
	</c:choose>
</body>
</html>
