/**
 * 
 */
package org.in.placement.util;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * @author traw
 * 
 */
public class DataSource {

	private static final int initialPoolSize = 10;
	private static final int acquireIncrement = 10;
	private static final int maxPoolSize = 200;
	private static final int minPoolSize = 10;
	private static final int maxStatements = 200;

	/*
	 * private static final String DEFAULT_DRIVER =
	 * "oracle.jdbc.driver.OracleDriver"; private static final String
	 * DEFAULT_URL = "jdbc:oracle:thin:@host:1521:placement"; private static
	 * DEFAULT_PASSWORD = "password"; final String DEFAULT_USERNAME =
	 * "username"; private static final String
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

	private ComboPooledDataSource cpds;
	private static DataSource datasource;
	private static Logger log = Logger.getLogger(DataSource.class);

	/**
	 * @throws PropertyVetoException
	 * 
	 */
	private DataSource() throws PropertyVetoException {
		log.info("Reading datasource.properties from classpath");
		cpds = new ComboPooledDataSource();
		cpds.setDriverClass(DEFAULT_DRIVER);
		cpds.setJdbcUrl(DEFAULT_URL);
		cpds.setUser(DEFAULT_USERNAME);
		cpds.setPassword(DEFAULT_PASSWORD);

		cpds.setInitialPoolSize(initialPoolSize);
		cpds.setAcquireIncrement(acquireIncrement);
		cpds.setMaxPoolSize(maxPoolSize);
		cpds.setMinPoolSize(minPoolSize);
		cpds.setMaxStatements(maxStatements);
	}
	
	public void setDummyDataSource() throws PropertyVetoException{
		log.info("Reading datasource.properties from classpath");
		cpds = new ComboPooledDataSource();
		cpds.setDriverClass("");
		cpds.setJdbcUrl("");
		cpds.setUser("");
		cpds.setPassword("");
	}

	public static DataSource getInstance() throws PropertyVetoException {
		if (datasource == null) {
			datasource = new DataSource();
		}
		return datasource;
	}

	public Connection getConnection() throws SQLException {
		return this.cpds.getConnection();
	}

	public static void main(String[] args) throws PropertyVetoException,
			SQLException {
		String existQuery = "SELECT * FROM users";
		DataSource dataSource = DataSource.getInstance();
		try (Connection connection = dataSource.getConnection()) {
			try (Statement statement = connection.createStatement()) {
				try (ResultSet res = statement.executeQuery(existQuery)) {
					while (res.next()) {
						System.out.println("User Detail: "
								+ res.getString("username") + " "
								+ res.getString("password"));
					}
				}
			}
		}
	}

}
