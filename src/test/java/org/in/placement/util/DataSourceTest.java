package org.in.placement.util;

import org.in.placement.util.DataSource;
import org.in.placement.util.DataSource.*;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import junit.framework.TestCase;

public class DataSourceTest extends TestCase {

	protected DataSource dataSource;

	protected void setUp() throws PropertyVetoException {
		dataSource = DataSource.getInstance();
	}

	public void test_type() throws Exception {
		assertNotNull(DataSource.class);
	}

	public void test_getInstance_A$() throws Exception {
		DataSource actual = DataSource.getInstance();
		assertNotNull(actual);
	}

	public void test_getConnection_A$() throws Exception {
		Connection actual = dataSource.getConnection();
		assertNotNull(actual);
	}
}
