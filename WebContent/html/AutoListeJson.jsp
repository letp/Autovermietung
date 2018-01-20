<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core"%>
[
	<c:forEach var="auto" items="${autos}" varStatus="status">
		{
			"id":${auto.id},
			"marke":"${auto.marke}",
			"modell":"${auto.modell}",
			"kraftstoff":"${auto.kraftstoff}",
			"getriebe":"${auto.getriebe}",
			"ps":"${auto.ps}",
			"karosserie":"${auto.karosserie}",
			"preis":"${auto.preis}",
			"standort":"${auto.standort}"
		}<c:if test="${not status.last}">,</c:if>
	</c:forEach>
]