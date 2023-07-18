package com.ibm;

import java.io.IOException;

import javax.servlet.http.Cookie;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login extends HttpServlet {
	private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "javaweb";
    private static final String DB_PASSWORD = "javaweb";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve parameter values from the request
    	String email = request.getParameter("logEmail");
        String password = request.getParameter("logPassword");

        // JDBC objects
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Establish a database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare the SQL INSERT statement

            String selectQuery = "SELECT * FROM railway_users WHERE EMAIL=? AND PASSWORD=?";
            preparedStatement = connection.prepareStatement(selectQuery);

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            ResultSet rs = preparedStatement.executeQuery();
                
            if (rs.next()) {
            	String firstName = rs.getString("first_name");
            	String lastName = rs.getString("last_name");
            	String emailc = rs.getString("email");
            	
            	Cookie firstNameCookie = new Cookie("firstName", firstName);
                Cookie lastNameCookie = new Cookie("lastName", lastName);
                Cookie emailCookie = new Cookie("email", emailc);

                // Set cookie expiration time (optional, adjust as needed)
                firstNameCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days (in seconds)
                lastNameCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days (in seconds)
                emailCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days (in seconds)

                // Add cookies to the response
                response.addCookie(firstNameCookie);
                response.addCookie(lastNameCookie);
                response.addCookie(emailCookie);
                RequestDispatcher rd = request.getRequestDispatcher("Booking.jsp");
                rd.forward(request, response);
            } else {
                // User not found or incorrect credentials
                String errorMessage = "Incorrect username or password!";
                request.setAttribute("errorMessage", errorMessage);
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.forward(request, response);
            }


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Replace with the appropriate error page
        } finally {
            // Close resources
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
	}

