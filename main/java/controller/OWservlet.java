package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GettheWeather;
import model.weatherBean;

@WebServlet("/OWservlet")
public class OWservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		//Hämtar det anändaren skrivit in i formuläret
		String cityStr = request.getParameter("city");
		String countryStr = request.getParameter("country");

		String temp = "";
		//hämtar en array med cookies från 	metoden getCookies och sparar i cookies arrayen
		Cookie[] cookies = request.getCookies();
		//for loop som itererar cookie-arrayen och kollar om det finns någon cookie som har namnet "userInput" om det är sant tildelar det värdet på cookien och sparas i temp-variablen.
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("userInput")) {
				temp = cookies[i].getValue();
			}
		}
		//loopar arrayen igen för att se om namnet på cookien är "consentGiven". Om hittas kommer det skapas en ny cookie och läggs till i response objektet med hjälp av addCookie metoden
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("consentGiven")) {
				response.addCookie(new Cookie("userInput", temp + "<br>" + cityStr + countryStr));
			}
		}
//		String[] tempSplit = temp.split("<br>");
		
		weatherBean wBean = new weatherBean(cityStr, countryStr);
		GettheWeather.getWeather(wBean);
		request.setAttribute("wBean", wBean);
		//Skickar användaren till showWeather.jsp
		RequestDispatcher rd = request.getRequestDispatcher("showWeather.jsp");
		rd.forward(request, response);

	}
}
