package org.in.placementv2.util;

import org.hibernate.Session;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class HibernateSessionFactoryTest {

    @Before
    public void setUp() throws Exception {

    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void testGetSession() throws Exception {
        Session session = null;
        session = HibernateSessionFactory.getSession();
        assertNotNull(session);
    }

    @Test
    public void testRebuildSessionFactory() throws Exception {

    }

    @Test
    public void testCloseSession() throws Exception {

    }

    @Test
    public void testGetSessionFactory() throws Exception {

    }

    @Test
    public void testSetConfigFile() throws Exception {

    }

    @Test
    public void testGetConfiguration() throws Exception {

    }
}