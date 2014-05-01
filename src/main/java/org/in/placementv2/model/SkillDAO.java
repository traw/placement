package org.in.placementv2.model;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.in.placement.util.SQLDilect;
import org.in.placementv2.dao.SkillDao;
import org.in.placementv2.util.JspString;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for Skill
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see org.in.placementv2.model.Skill
 * @author MyEclipse Persistence Tools
 */
public class SkillDAO extends SkillDao implements SQLDilect, JspString {
	private static final Logger log = LoggerFactory.getLogger(SkillDAO.class);
	// property constants
    public static final String ID = "id";
	public static final String NAME = "name";

	public boolean save(Skill transientInstance) {
		log.debug("saving Skill instance");
        boolean ret = false;
        Session session = null;
        Transaction tx = null;
		try {
            session = getSession();
            tx = session.beginTransaction();
			session.saveOrUpdate(transientInstance);
            session.flush();
            tx.commit();
			log.debug("save successful");
            ret = true;
		} catch (RuntimeException re) {
			log.error("save failed", re);
            ret = false;
            tx.rollback();
			throw re;
		} finally {
            session.close();
            return ret;
        }
    }

	public void delete(Skill persistentInstance) {
		log.debug("deleting Skill instance");
        Session session = null;
        Transaction tx = null;
        try {
            session = getSession();
            tx = session.beginTransaction();
            session.delete(persistentInstance);
            session.flush();
            tx.commit();
            log.debug("delete successful.");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            tx.rollback();
            throw re;
        } finally {
            session.close();
        }
	}

	public Skill findById(java.lang.Long id) {
		log.debug("getting Skill instance with id: " + id);
		try {
			Skill instance = (Skill) getSession().get(
					"org.in.placementv2.model.Skill", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

    public List findByJSONQuery(JSONObject jsonQuery) {
        log.debug("finding Skills by query object");

        Map<String, Object> propertyIndexMap = new HashMap<>();
        StringBuffer skillSqlQuery = new StringBuffer();
        skillSqlQuery.append(SELECT + "DISTINCT S" + FROM + "Skill AS S");
        int jsonQuerySize = jsonQuery.size(), paramCounter = 0;

        if (jsonQuerySize > 0) {
            skillSqlQuery.append(WHERE);
            String companyId = (String) jsonQuery.get(ID_FIELD);
            if (companyId != null) {
                skillSqlQuery.append((paramCounter > 0 && paramCounter < jsonQuerySize) ? " " + AND_CONDITION : "")
                        .append("S." + ID).append(EQUAL_TO_CONDITION).append(":" + ID + " ");
                propertyIndexMap.put(ID, Long.parseLong(companyId));
                ++paramCounter;
            }

            String studentName = (String) jsonQuery.get(NAME_FIELD);
            if (studentName != null) {
                skillSqlQuery.append( (paramCounter > 0 && paramCounter < jsonQuerySize)  ? AND_CONDITION : "")
                        .append("S." + NAME).append(LIKE_CONDITION).append(":"+NAME+" ");
                propertyIndexMap.put(NAME, studentName);
                ++paramCounter;
            }
        }
        skillSqlQuery.append(" ORDER BY S." + NAME);
        log.error("SkillDAO:120 = "+ skillSqlQuery.toString());
        try {
            Query query = getSession().createQuery(skillSqlQuery.toString());

            for (Map.Entry<String, Object> entry : propertyIndexMap.entrySet()) {
                Object o = entry.getValue();
                 if (o instanceof String) {
                    query.setString(entry.getKey(), "%"+ o +"%");
                } else if (o instanceof Boolean) {
                    query.setBoolean(entry.getKey(), (Boolean) o);
                } else if (o instanceof Long ) {
                    query.setLong(entry.getKey(), (Long) o);
                } else if (o instanceof Float) {
                    query.setFloat(entry.getKey(), (Float) o);
                }
            }
            return query.list();
        } catch (RuntimeException e) {
            log.error("Error: " + e.getMessage());
            throw e;
        }

    }

	public List findByExample(Skill instance) {
		log.debug("finding Skill instance by example");
		try {
			List results = getSession()
					.createCriteria("org.in.placementv2.model.Skill")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Skill instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Skill as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findAll() {
		log.debug("finding all Skill instances");
		try {
			String queryString = "from Skill S order by S.name";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Skill merge(Skill detachedInstance) {
		log.debug("merging Skill instance");
		try {
			Skill result = (Skill) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Skill instance) {
		log.debug("attaching dirty Skill instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Skill instance) {
		log.debug("attaching clean Skill instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public List getAllSkillsForIDs(Collection idArray) {
		log.debug("Get all Skills matches skill id in idArray");
		String hql = "from Skill s WHERE s.id IN (:ids)";
		try {
			Query query = getSession().createQuery(hql);
			query.setParameterList("ids", idArray);
			return query.list();
		} catch (RuntimeException e) {
			log.error("Error: " + e.getMessage());
			throw e;
		}
	}
}