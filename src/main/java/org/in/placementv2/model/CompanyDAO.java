package org.in.placementv2.model;

import java.util.*;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.in.placement.util.SQLDilect;
import org.in.placementv2.dao.SkillDao;
import org.in.placementv2.util.JspString;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Company entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see org.in.placementv2.model.Company
 * @author MyEclipse Persistence Tools
 */
public class CompanyDAO extends SkillDao implements SQLDilect, JspString {
	private static final Logger log = LoggerFactory.getLogger(CompanyDAO.class);
	// property constants
    public static final String ID = "id";
	public static final String NAME = "name";
	public static final String DESCRIPTION = "description";
	public static final String SSCMARKS = "sscmarks";
	public static final String HSCMARKS = "hscmarks";
	public static final String MCAMARKS = "mcamarks";

    // Query Parameter Strings
    public static final String SKILLS = "skills";

	public void save(Company transientInstance) {
		log.debug("saving Company instance");
        Session session = null;
        Transaction tx = null;
        try {
            session = getSession();
            tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
            tx.rollback();
			throw re;
		} finally {
            session.close();
        }
    }

	public void delete(Company persistentInstance) {
		log.debug("deleting Company instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Company findById(java.lang.Long id) {
		log.debug("getting Company instance with id: " + id);
		try {
			Company instance = (Company) getSession().get(
					"org.in.placementv2.model.Company", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Company instance) {
		log.debug("finding Company instance by example");
		try {
			List results = getSession()
					.createCriteria("org.in.placementv2.model.Company")
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
		log.debug("finding Company instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Company as model where model."
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

	public List findByDescription(Object description) {
		return findByProperty(DESCRIPTION, description);
	}

	public List findBySscmarks(Object sscmarks) {
		return findByProperty(SSCMARKS, sscmarks);
	}

	public List findByHscmarks(Object hscmarks) {
		return findByProperty(HSCMARKS, hscmarks);
	}

	public List findByMcamarks(Object mcamarks) {
		return findByProperty(MCAMARKS, mcamarks);
	}

	public List findAll() {
		log.debug("finding all Company instances");
		try {
			String queryString = "from Company";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Company merge(Company detachedInstance) {
		log.debug("merging Company instance");
		try {
			Company result = (Company) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Company instance) {
		log.debug("attaching dirty Company instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Company instance) {
		log.debug("attaching clean Company instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

    public List findCompanyForJSONQuery(JSONObject jsonQuery) throws ParseException {
        log.debug("finding students by query object");

        Map<String, Object> propertyIndexMap = new HashMap<>();
        StringBuffer compSqlQuery = new StringBuffer();
        compSqlQuery.append(SELECT + "DISTINCT C" + FROM + "Company AS C");
        int jsonQuerySize = jsonQuery.size(), paramCounter = 0;

        if (jsonQuery.get(VALIDATED_FIELD) != null) {
            jsonQuery.remove(VALIDATED_FIELD);
        }

        if(jsonQuery.get(NAME_FIELD) != null) {
            ++jsonQuerySize;
        }

        if (jsonQuerySize > 0) {

            String skillsArrayString = (String) jsonQuery.get(SKILL_SELECT_FIELD);
            if (skillsArrayString != null && !skillsArrayString.isEmpty()) {
                //JOIN Stud.skills Sk WHERE Sk.id IN (:ids)";
                compSqlQuery.append("JOIN C.skills Sk WHERE Sk.id IN (:" + SKILLS + ") ");
                JSONParser parser = new JSONParser();
                JSONArray skillsArray = (JSONArray) parser.parse(skillsArrayString);
                List<Long> skillIDList = new ArrayList<>();
                for (int i = 0; i < skillsArray.size(); ++i) {
                    skillIDList.add(Long.parseLong((String) skillsArray.get(i)));
                }
                propertyIndexMap.put(SKILLS, skillIDList);
                ++paramCounter;
            } else if (jsonQuerySize > 0){
                compSqlQuery.append(WHERE);
            }

            String companyId = (String) jsonQuery.get(ID_FIELD);
            if (companyId != null) {
                compSqlQuery.append((paramCounter > 0 && paramCounter < jsonQuerySize) ? " " + AND_CONDITION : "")
                        .append("C." + ID).append(EQUAL_TO_CONDITION).append(":"+ID+" " );
                propertyIndexMap.put(ID, Long.parseLong(companyId));
                ++paramCounter;
            }

            String compSearchString = (String) jsonQuery.get(NAME_FIELD);
            if (compSearchString != null) {
                compSqlQuery.append((paramCounter > 0 && paramCounter < jsonQuerySize) ? AND_CONDITION : "")
                        .append("C." + NAME).append(LIKE_CONDITION).append(":"+NAME+" ");
                propertyIndexMap.put(NAME, "%"+compSearchString+"%");
                ++paramCounter;
                // Search company Description
                compSqlQuery.append((paramCounter > 0 && paramCounter < jsonQuerySize) ? AND_CONDITION : "")
                        .append("C." + DESCRIPTION).append(LIKE_CONDITION).append(":"+DESCRIPTION+" ");
                propertyIndexMap.put(DESCRIPTION, "%"+compSearchString+"%");
                ++paramCounter;
            }

            String criteriaSscMarks = (String) jsonQuery.get(SSC_MARKS_FIELD);
            if (criteriaSscMarks != null) {
                compSqlQuery.append((paramCounter > 0 && paramCounter < jsonQuerySize) ? AND_CONDITION : "")
                        .append("C." + SSCMARKS).append((String) jsonQuery.get(SSC_MARKS_CONDITION_FIELD))
                        .append(":"+SSCMARKS+" ");
                propertyIndexMap.put(SSCMARKS, Float.parseFloat(criteriaSscMarks));
                ++paramCounter;
            }

            String criteriaHscMarks = (String) jsonQuery.get(HSC_MARKS_FIELD);
            if (criteriaHscMarks != null) {
                compSqlQuery.append((paramCounter > 0 && paramCounter < jsonQuerySize) ? AND_CONDITION : "")
                        .append("C." + HSCMARKS).append((String) jsonQuery.get(HSC_MARKS_CONDITION_FIELD))
                        .append(":"+HSCMARKS+" ");
                propertyIndexMap.put(HSCMARKS, Float.parseFloat(criteriaHscMarks));
                ++paramCounter;
            }

            String criteriaMcaMarks = (String) jsonQuery.get(MCA_MARKS_FIELD);
            if (criteriaMcaMarks != null) {
                compSqlQuery.append((paramCounter > 0 && paramCounter < jsonQuerySize) ? AND_CONDITION : "")
                        .append("C." + MCAMARKS).append((String) jsonQuery.get(MCA_MARKS_CONDITION_FIELD))
                        .append(" :" + MCAMARKS + " ");
                propertyIndexMap.put(MCAMARKS, Float.parseFloat(criteriaMcaMarks));
                ++paramCounter;
            }
        }
        compSqlQuery.append(" ORDER BY C." + NAME);


        try {
            Query query = getSession().createQuery(compSqlQuery.toString());

            for (Map.Entry<String, Object> entry : propertyIndexMap.entrySet()) {
                Object o = entry.getValue();
                if (o instanceof List) {
                    query.setParameterList(SKILLS, (Collection) entry.getValue());
                } else if (o instanceof String) {
                    query.setString(entry.getKey(), (String) o);
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
}