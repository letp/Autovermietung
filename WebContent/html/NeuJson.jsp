<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core"%>
[
	<c:forEach var="auto" items="${neu}" varStatus="status">
		{
			"id":${auto.id},
			"marke":"${auto.marke}",
			"modell":"${auto.modell}"
		}<c:if test="${not status.last}">,</c:if>
	</c:forEach>
]