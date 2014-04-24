package org.in.placementv2.dao;

import org.hibernate.Session;
import org.in.placementv2.util.HibernateSessionFactory;

/**
 * Data access object (DAO) for domain model
 * @author MyEclipse Persistence Tools
 */
public class SkillDao implements IBaseHibernateDAO {
	
	public Session getSession() {
        return HibernateSessionFactory.getSession();
	}
	
}