<!-- Peter -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mein Konto</title>

<link rel="stylesheet" type="text/css" href="../css/Konto.css">
<link rel="stylesheet" type="text/css" href="AutoListe.css">

<script>
	// Get the modal
	var modal = document.getElementById('id01');
		
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
		    modal.style.display = "none";
		}
	}
		
	function close(){
		modal.style.display = "none";
	}
</script>
</head>
<body>
<%@ include file="Navigation.jsp" %>
	
	<br>
	<div class="konto">
	<h2>Mein Account</h2>
	<br><b>Name: </b>${account.name}
	<br><b>Vorname: </b>${account.vorname}
	<br><b>Adresse: </b>${account.strasse} ${account.hnr} ${account.plz} ${account.stadt}
	<br><b>Email: </b>${account.email}
	<br>
	
	<!--modal vgl: https://www.w3schools.com/howto/tryit.asp?filename=tryhow_css_login_form_modal-->
	<button onclick="document.getElementById('id01').style.display='block'" class="bearb">Account bearbeiten</button>
	<div id="id01" class="modal">
		<form method="post" class="modal-content animate" action="../UpdateServlet">
			 <c:choose>
				<c:when test="${pwfalsch > 0}">
					<br>
					<a class = "rot">Passwörter stimmen nicht überein!</a>
				</c:when>
			</c:choose>
			<h1>Account bearbeiten</h1>
		    <label>Name <br></label>
		    <input type="text" name="name" id="name" value="${account.name}" required autofocus>
		    <br>
		    <label>Vorname</label> <br>
		    <input type="text" name="vorname" value="${account.vorname}" required>
		    <br>
		    <label>Email</label> <br>
		    <input type="email"  name="email" value="${account.email}" required>
		    <br>
		    <label>Straße </label> <br>
		    <input type="text" name="strasse" value="${account.strasse}" required>
		    <br>
		    <label>Hausnummer</label>
		    <br>
		    <input type="text" name="hausnummer" value="${account.hnr}" required>
		    <br>
		    <label>Stadt </label><br>
		    <input type="text" name="stadt" value="${account.stadt}" required>
		    <br>
		    <label>Postleitzahl </label>
		    <br>
		    <input type="text" name="postleitzahl" value="${account.plz}" required>
			<br>
		    <label>Passwort </label>
		    <br>
		    <input type="password" name="passwort" value="${account.passwort}" required>
			<br>
		    <label>Wiederhole Passwort</label> <br>
		    <input type="password" name="passwort2" value="${account.passwort2}" required>
		    <span id="message"></span>
			<br>
			<br>
		    
		    <button type="submit" class="account" onclick="document.getElementById('id01').style.display='none'">Aktualisieren!</button> 
		    <br>
		</form>
	</div>
	<button onclick="document.getElementById('id02').style.display='block'" class="delet">Account löschen</button>
	<div id="id02" class="modal">	
		<form method="post" class="modal-content animate" action="../DeleteServlet">
			<a>Account wirklich löschen?</a><br>
			<button type="submit" class="delete" >Ja</button>
			<button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancel">Nein</button>
		</form>	
	</div>
	</div>
	
	<div class="auto">
	<h1>Meine Autos</h1>
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
	
	</div>
	
	<div class="auto">
	<h1>Meine gemieteten Autos</h1>
	<c:forEach items="${mietautos}" var="a">
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
	
	</div>
	
</body>

</html>
