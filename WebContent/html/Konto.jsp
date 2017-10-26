<!-- Peter -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="nav.css">
<style>

		
		
		
		.cancel, .delete, .bearb, .account, .delet {
	    background-color: gray;
	    color: white;
	    width: 300px;
	    padding: 14px 20px;
	    margin: 8px 0;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	}
	.konto{
	border-style: solid;
	border-width: 2px;
	width: 700px;
	height: 400px;
	margin: 10px auto;
	padding: 16px;
	}


	input[type=text], input[type=password] {
	    padding: 12px;
	    width: 300px;
	    margin: 8px 0;
	    box-sizing: border-box;
	}	
	
	
	

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

.modal {
    display: none; 
    position: fixed; 
    z-index: 1; 
    left: 0;
    top: 0;
    border: 3px solid #f1f1f1;
  	padding: 0px 16px 16px;
    width: 100%; 
    height: 100%; 
    overflow: auto; 
    background-color: rgb(0,0,0); 
    background-color: rgba(0,0,0,0.4); 
}


.modal-content {
	padding-left: 50px;
    background-color: #fefefe;
    margin: 5% auto 15% auto; 
    border: 1px solid #888;
    width: 350px; 
}

/*Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}


.rot{
color: red;
}
</style>
</head>
<body>
<jsp:include page="Navigation.jsp"></jsp:include>
	
	<br>
	<div class="konto">
	<h2>Mein Account</h2>
	<br><b>Name: </b>${account.name}
	<br><b>Vorname: </b>${account.vorname}
	<br><b>Adresse: </b>${account.strasse} ${account.hnr} ${account.plz} ${account.stadt}
	<br><b>Email: </b>${account.email}
	<br>
	
	<!--modal vgl: https://www.w3schools.com/howto/tryit.asp?filename=tryhow_css_login_form_modal-->
	<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;" class="bearb">Account bearbeiten</button>
	<div id="id01" class="modal">
		<form method="post" class="modal-content animate" action="../../UpdateServlet">
			    <%
	if((Integer)session.getAttribute("pwfalsch") != null){
	    if((Integer)session.getAttribute("pwfalsch") == 1){
	%>
	<br>
	<a class = "rot">Passwörter stimmen nicht überein!</a>
	<%  
	}
	}
	%>
			<h1>Account bearbeiten</h1>
		    <label>Name <br></label>
		    <input type="text" name="name" id="name" value="${account.name}" required autofocus>
		    <br>
		    <label>Vorname</label> <br>
		    <input type="text" name="vorname" value="${account.vorname}" required>
		    <br>
		    <label>Email</label> <br>
		    <input type="text"  name="email" value="${account.email}" required>
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
		    <input type="password" name="passwort" value="${account.passwort}" onkeyup="check()" required>
			<br>
		    <label>Wiederhole Passwort</label> <br>
		    <input type="password" name="passwort2" value="${account.passwort2}" onkeyup="check()" required>
		    <span id="message"></span>
			<br>
			<br>
		    
		    <button type="submit" class="account">Aktualisieren!</button> 
		    <br>
		</form>
	</div>
	<button onclick="document.getElementById('id02').style.display='block'" style="width:auto;" class="delet">Account löschen</button>
	<div id="id02" class="modal">
		
		<form method="post" class="modal-content animate" action="../../DeleteServlet">
			<a>Account wirklich löschen?</a><br>
			<button type="submit" class="delete" >Ja</button>
			      <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancel">Nein</button>
		</form>
		
	</div>
	</div>
	
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
</body>
</html>
