<!-- Peter -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav>	
	 <ul class="nav">   
        <li><a href="Startseite.jsp">Startseite</a></li>
		<li class=kategorie>
			<a href="#" class="drop">Kategorien</a> 
			<div class=dropdown_kategorie>
				<c:forEach items="${kategorien}" var="k">
				<a href="../../KategorieServlet?param=${k}">${k}</a>
				</c:forEach>
			</div>
		</li>
   		<li>
			<form method="post" action="../../SucheServlet">
			    <input id="suche1" name="suche1" placeholder="Titel oder ISBN">
			    <button type="submit" id="account" type="button">Suchen</button> 
			</form>
		</li>
		         <%
			if((Integer)session.getAttribute("logged") != null){
			    if((Integer)session.getAttribute("logged") == 1){
			%>
			
			<li class="right"><a id="konto" href="../../LogoutServlet">Logout</a></li>
			<%  
			}
			}
			%>
        <li class="right"><a href="Warenkorb.jsp" >Warenkorb</a></li>
        
        	 <%
			if((Integer)session.getAttribute("logged") != null){
			    if((Integer)session.getAttribute("logged") == 1){
			%>
			
			<li class="right"><a id="konto" href="Konto.jsp">Mein Konto</a></li>
			<%  
			}
			}
			%>
        	 <%
			if((Integer)session.getAttribute("logged") == null || (Integer)session.getAttribute("logged") == 0){
			%>
			
			<li class="right"><a id="konto" href="Login.jsp">Login</a></li>
			<%  
			}
		
			%>
        
        
        <li class="right"><a href="Verkaufen.jsp">Verkaufen</a></li>
	</ul>
</nav>
</body>
</html>
