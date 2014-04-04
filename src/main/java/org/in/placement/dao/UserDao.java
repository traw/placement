package org.in.placement.dao;

import java.beans.PropertyVetoException;
import java.sql.SQLException;

import org.in.placement.model.User;

public interface UserDao {	
	public boolean containUser(String username, String password) throws SQLException, PropertyVetoException;
	public boolean containUser(User user) throws SQLException, PropertyVetoException;
	public void addUser(String username, String password) throws PropertyVetoException, SQLException;
	public void addUser(User user) throws PropertyVetoException, SQLException;
	public void deleteUser(User user) throws PropertyVetoException, SQLException; 	
}
