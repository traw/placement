/**
 * 
 */
package org.in.placement.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author traw
 * 
 */
public class DBUtil implements AutoCloseable {

	private static Connection conn = null;

	
	/*
	 * private static final String DEFAULT_DRIVER =
	 * "oracle.jdbc.driver.OracleDriver"; private static final String
	 * DEFAULT_URL = "jdbc:oracle:thin:@host:1521:placement"; private static
	 * final String DEFAULT_USERNAME = "username"; private static final String
	 * DEFAULT_PASSWORD = "password";
	 */

	private static final String DEFAULT_DRIVER = "org.postgresql.Driver";
	private static final String DEFAULT_URL = "jdbc:postgresql://localhost:5432/postgres";
	private static final String DEFAULT_USERNAME = "traw";
	private static final String DEFAULT_PASSWORD = "root";

	/*
	 * private static final String DEFAULT_DRIVER = "com.mysql.jdbc.Driver";
	 * private static final String DEFAULT_URL =
	 * "jdbc:mysql://localhost:3306/placement"; private static final String
	 * DEFAULT_USERNAME = "party"; private static final String DEFAULT_PASSWORD
	 * = "party";
	 */

	public static Connection getConnection() {
	
		if (conn != null) {
			return conn;
		}
	   
		try {
			
			Class.forName(DEFAULT_DRIVER).newInstance();
		
	} catch (ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
		System.err.println("ClassNotFoundException Occured: "
				+ ex.getMessage());
	}

		
		try {
			conn = DriverManager.getConnection(DEFAULT_URL, DEFAULT_USERNAME,
					DEFAULT_PASSWORD);
		} catch (SQLException sqlEx) {
			System.err.println("SQLException Occured: " + sqlEx.getMessage());
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return conn;
	}

	public static void closeConnection() {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException ex) {
			System.err.println("SQLException Occured: " + ex.getMessage());
		}
	}

	@Override
	public void close() throws Exception {
		closeConnection();
	}

	public static void main(String[] args) throws SQLException {
		Connection conn = DBUtil.getConnection();
		String existQuery = "SELECT * FROM user WHERE username = 'rajdip' AND password = 'password'";
		//conn.close();
		System.out.println(conn.isClosed());
		//conn.prepareStatement(sql);
		Statement statement = conn.createStatement();
		//PreparedStatement statement = conn.prepareStatement(existQuery);
		//statement.setString(1, "rajdip");
		//statement.setString(2, "password");
		ResultSet res = statement.executeQuery(existQuery);
		while (res.next()) {
			System.out.println("User Detail: " + res.getString("usename") + " "
					+ res.getString("password"));
		}
	}
}
