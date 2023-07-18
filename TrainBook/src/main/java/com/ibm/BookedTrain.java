package com.ibm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookedTrain extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
	    private static final String DB_USER = "javaweb";
	    private static final String DB_PASSWORD = "javaweb";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String from = request.getParameter("from");
        String to = request.getParameter("to");
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String cl = request.getParameter("cl");
        String type = request.getParameter("type");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
    	System.out.println(from+" "+to+" "+code+" "+name+" "+date+" "+cl+" "+type+" "+fname+" "+lname+" "+email);
    	Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String insertQuery = "INSERT INTO train_booking(id, from_station, to_station, train_code, train_name, travel_date, class, seat_type, first_name, last_name, email) "
                    + "VALUES (train_booking_seq.NEXTVAL, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertQuery);

            preparedStatement.setString(1, from);
            preparedStatement.setString(2, to);
            preparedStatement.setString(3, code);
            preparedStatement.setString(4, name);
            preparedStatement.setString(5, date);
            preparedStatement.setString(6, cl);
            preparedStatement.setString(7, type);
            preparedStatement.setString(8, fname);
            preparedStatement.setString(9, lname);
            preparedStatement.setString(10, email);

            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect("Success.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
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
