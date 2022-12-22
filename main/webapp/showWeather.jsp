<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.weatherBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./CSS/styles.css" rel="stylesheet" type="text/css">

<title>the weather</title>
</head>
<body>
	<p class="weather-info">
	<%

	weatherBean wBean = (weatherBean) request.getAttribute("wBean"); 
	out.println("<br>The clouds in " + wBean.getCityStr() + " is " + wBean.getCloudsStr() + ". <br><br> The last update was: " + wBean.getLastupdateStr() + "<br><br>");
	out.println("The wind is: " + wBean.getWindSpeedStr() + "m/s");
	
	%>
	</p>


	<br><br>
	<div class="flex">
		<form action="OWservlet" method="get">
			City:<input type="text" name="city" class="city"/><br /> 
			Country:<input type="text" name="country" /><br /> 
			<input type="submit" value="go" class="btn" />
		</form>
	</div>

	<div class="last-search">
		<h2>Recent searches:</h2>
		<%-- Visar användarens senaste sökningar --%>
		<p>	
		${cookie["userInput"].getValue()}
		</p>
	</div>
	
</body>
</html>