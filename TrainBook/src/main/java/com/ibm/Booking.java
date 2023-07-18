package com.ibm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Booking
 */
public class Booking extends HttpServlet {
	
	 @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	        // Retrieve parameter values from the request
	    	String from = request.getParameter("From");
	        String to = request.getParameter("To");
	        String date = request.getParameter("date");
	        String cl = request.getParameter("class");
	        String type = request.getParameter("type");
	        // JDBC objects
	        Cookie fromCookie = new Cookie("from", from);
            Cookie toCookie = new Cookie("to", to);
            Cookie dateCookie = new Cookie("date", date);
            Cookie clCookie = new Cookie("cl", cl);
            Cookie typeCookie = new Cookie("type", type);

            fromCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days (in seconds)
            toCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days (in seconds)
            dateCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days (in seconds)
            clCookie.setMaxAge(60 * 60 * 24 * 30);
            typeCookie.setMaxAge(60 * 60 * 24 * 30);
            // Add cookies to the response
            response.addCookie(fromCookie);
            response.addCookie(toCookie);
            response.addCookie(dateCookie);
            response.addCookie(clCookie);
            response.addCookie(typeCookie);
            RequestDispatcher rd = request.getRequestDispatcher("BookTrain.jsp");
            rd.forward(request, response);

	        }
	    }

