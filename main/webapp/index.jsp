<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="CSS/styles.css" rel="stylesheet" type="text/css">
<title>OpenWeather</title>
</head>
<body onload="showCookieConsent()">

	<h1>Enter a city and country to show weather details</h1>
	<%-- Form där användaren ska skriva in stad och land och när man klickar på go kommer användaren skickas till OWservlet --%>
<div class="flex">
	<form action="OWservlet" method="get">
		City:<input type="text" name="city" class="city" /><br /> 
		Country:<input type="text" name="country" /><br /> 
		<input type="submit" value="go" class="btn" />
	</form>
</div>
</body>


<script type="text/javascript">
function showCookieConsent() {
	//Kontrollerar om consentGiven funktionen är "set", om cookien är "set" kommer den "return" och inte visa cookiebannern. Är cookien inte "set" skapas ett banner element och lägger till bannern på sidan.
	  if (getCookie('consentGiven')) {
	    return;
	  }
	//Banner som ber användaren acceptera cookies, om användaren inte accepterar sparas inga cookies.
	  var popup = document.createElement("div");
	  popup.innerHTML = "This website uses cookies. By continuing to use this site, you consent to our use of cookies. <button id='cookieConsentAgree'>Accept cookies</button>";
	  document.body.appendChild(popup);
	//När man klcikar Accept cookies knappen kallas setCookie funktionen som kommer sätta värdet till true och kommer vara true i 365 dagar eller tills användaren rensar cookies
	  document.getElementById('cookieConsentAgree').addEventListener('click', function() {
		  setCookie('consentGiven', true, 365);
	    //Tar bort popup fönstret efter Accept
	    document.body.removeChild(popup);
	  });
	}
	//function som hämtar cookie med (i detta fallet) namnet consentGiven
	function getCookie(name) {
	  var value = "; " + document.cookie;
	  var parts = value.split("; " + name + "=");
	  if (parts.length == 2) {
	    return parts.pop().split(";").shift();
	  }
	}

	function setCookie(name, value, days) {
	  var expires = "";
	  if (days) {
	    var date = new Date();
	    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
	    expires = "; expires=" + date.toUTCString();
	  }
	  document.cookie = name + "=" + (value || "") + expires + "; path=/";
	}
</script>
</html>