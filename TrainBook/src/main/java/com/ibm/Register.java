package com.ibm;

import java.io.IOException;

import javax.servlet.http.Cookie;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {
	private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "javaweb";
    private static final String DB_PASSWORD = "javaweb";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve parameter values from the request
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("name");
        String email = request.getParameter("email");
        String mobileNumber = request.getParameter("mobile");
        String password = request.getParameter("password");

        // JDBC objects
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Establish a database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare the SQL INSERT statement
            String insertQuery = "INSERT INTO RAILWAY_USERS(FIRST_NAME, LAST_NAME, USERNAME, EMAIL, MOBILE_NUMBER, PASSWORD) "
                                + "VALUES (?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertQuery);

            // Set the parameters for the SQL query
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, username);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, mobileNumber);
            preparedStatement.setString(6, password);

            // Execute the SQL query
            int rowsInserted = preparedStatement.executeUpdate();

            // Process the result (you can redirect to a success page or display a message)
            if (rowsInserted > 0) {
            	// Set cookies for user information
                Cookie firstNameCookie = new Cookie("firstName", firstName);
                Cookie lastNameCookie = new Cookie("lastName", lastName);
                Cookie emailCookie = new Cookie("email", email);

                // Set cookie expiration time (optional, adjust as needed)
                firstNameCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days (in seconds)
                lastNameCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days (in seconds)
                emailCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days (in seconds)

                // Add cookies to the response
                response.addCookie(firstNameCookie);
                response.addCookie(lastNameCookie);
                response.addCookie(emailCookie);
                
                response.sendRedirect("Booking.jsp"); // Replace with the appropriate success page
            } else {
                response.sendRedirect("error.jsp"); // Replace with the appropriate error page
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

