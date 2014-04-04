/**
 * 
 */
package org.in.placement.dao;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.in.placement.model.User;
import org.in.placement.util.DBUtil;
import org.in.placement.util.DataSource;

/**
 * @author traw
 * 
 */
public class UserDaoImpl implements UserDao {

	/**
	 * 
	 */
	public UserDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean containUser(String username, String password)
			throws SQLException, PropertyVetoException {
		boolean exist = false;
		String existQuery = "SELECT * FROM users WHERE username = ? AND password = ?";
		DataSource dataSource = DataSource.getInstance();
		try (Connection conn = dataSource.getConnection()) {
			try (PreparedStatement stmt = conn.prepareStatement(existQuery)) {
				stmt.setString(1, username);
				stmt.setString(2, password);
				try (ResultSet res = stmt.executeQuery()) {
					if (res.next()) {
						exist = true;
					}
				}
			} catch (SQLException e) {
				throw e;
			}
		}
		return exist;
	}

	@Override
	public boolean containUser(User user) throws SQLException, PropertyVetoException {
		return containUser(user.getUserName(), user.getPassword());
	}

	@Override
	public void addUser(String username, String password)
			throws PropertyVetoException, SQLException {
		if (containUser(username, password)) {
			return;
		}

		String addQuery = "INSERT INTO user (username, password) VALUES (?, ?)";
		DataSource dataSource = DataSource.getInstance();
		try (Connection conn = dataSource.getConnection()) {
			try (PreparedStatement stmt = conn.prepareStatement(addQuery)) {
				stmt.setString(1, username);
				stmt.setString(2, password);
				stmt.execute();
			} catch (SQLException e) {
				conn.rollback();
				throw e;
			}
		}

	}

	@Override
	public void addUser(User user) throws PropertyVetoException, SQLException {
		addUser(user.getUserName(), user.getPassword());
	}

	@Override
	public void deleteUser(User user) throws PropertyVetoException,
			SQLException {
		String deleteUserQuery = "DELETE FROM user WHARE username = ?";
		DataSource dataSource = DataSource.getInstance();
		try (Connection conn = dataSource.getConnection()) {
			try (PreparedStatement stmt = conn
					.prepareStatement(deleteUserQuery)) {
				stmt.setString(1, user.getUserName());
				stmt.execute();
			} catch (SQLException e) {
				conn.rollback();
				throw e;
			}
		}
	}

}
