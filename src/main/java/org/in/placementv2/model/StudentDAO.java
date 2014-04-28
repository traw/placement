package org.in.placementv2.model;

import java.util.*;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.in.placementv2.dao.SkillDao;
import org.in.placementv2.util.JspString;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.in.placement.util.SQLDilect;

/**
 * A data access object (DAO) providing persistence and search support for
 * Student entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 *
 * @author MyEclipse Persistence Tools
 * @see org.in.placementv2.model.Student
 */
public class StudentDAO extends SkillDao implements SQLDilect, JspString {
    private static final Logger log = LoggerFactory.getLogger(StudentDAO.class);
    // property constants
    public static final String ID = "id";
    public static final String NAME = "name";
    public static final String EMAILID = "emailid";
    public static final String PLACED = "placed";
    public static final String SSCMARKS = "sscmarks";
    public static final String HSCMARKS = "hscmarks";
    public static final String MCAMARKS = "mcamarks";

    // Query Parameter Strings
    public static final String SKILLS = "skills";

    public void save(Student transientInstance) {
        log.debug("saving Student instance");
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

    public void delete(Student persistentInstance) {
        log.debug("deleting Student instance");
        try {
            getSession().delete(persistentInstance);
            log.debug("delete successful.");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    public Student findById(java.lang.Long id) {
        log.debug("getting Student instance with id: " + id);
        try {
            Student instance = (Student) getSession().get(
                    "org.in.placementv2.model.Student", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }

    public List findByExample(Student instance) {
        log.debug("finding Student instance by example");
        try {
            List results = getSession()
                    .createCriteria("org.in.placementv2.model.Student")
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
        log.debug("finding Student instance with property: " + propertyName
                + ", value: " + value);
        try {
            String queryString = "from Student as model where model."
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

    public List findByEmailid(Object emailid) {
        return findByProperty(EMAILID, emailid);
    }

    public List findByPlaced(Object placed) {
        return findByProperty(PLACED, placed);
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
        log.debug("finding all Student instances");
        try {
            String queryString = "from Student";
            Query queryObject = getSession().createQuery(queryString);
            return queryObject.list();
        } catch (RuntimeException re) {
            log.error("find all failed", re);
            throw re;
        }
    }

    public Student merge(Student detachedInstance) {
        log.debug("merging Student instance");
        try {
            Student result = (Student) getSession().merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Student instance) {
        log.debug("attaching dirty Student instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void attachClean(Student instance) {
        log.debug("attaching clean Student instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public List findStudentForJSONQuery(JSONObject jsonQuery) throws ParseException {
        log.debug("finding students by query object");

        Map<String, Object> propertyIndexMap = new HashMap<>();
        StringBuffer studentSqlQuery = new StringBuffer();
        studentSqlQuery.append(SELECT + "DISTINCT S" + FROM + "Student AS S ");
        int jsonQuerySize = jsonQuery.size(), paramCounter = 0;

        if (jsonQuery.get(VALIDATED_FIELD) != null) {
            jsonQuery.remove(VALIDATED_FIELD);
        }

        if (jsonQuerySize > 0) {

            String skillsArrayString = (String) jsonQuery.get(SKILL_SELECT_FIELD);
            if (skillsArrayString != null && !skillsArrayString.isEmpty()) {
                //JOIN Stud.skills Sk WHERE Sk.id IN (:ids)";
                studentSqlQuery.append("JOIN S.skills Sk WHERE Sk.id IN (:" + SKILLS + ") ");
                JSONParser parser = new JSONParser();
                JSONArray skillsArray = (JSONArray) parser.parse(skillsArrayString);
                List<Long> skillIDList = new ArrayList<>();
                for (int i = 0; i < skillsArray.size(); ++i) {
                    skillIDList.add(Long.parseLong((String) skillsArray.get(i)));
                }
                propertyIndexMap.put(SKILLS, skillIDList);
                ++paramCounter;
            } else if (jsonQuerySize > 0){
                studentSqlQuery.append(WHERE);
            }

            String studentId = (String) jsonQuery.get(ID_FIELD);
            if (studentId != null) {
                studentSqlQuery.append((paramCounter > 0 && paramCounter < jsonQuerySize) ? " "+ AND_CONDITION : "")
                        .append("S." + ID).append(EQUAL_TO_CONDITION).append(":"+ID+" " );
                propertyIndexMap.put(ID, Long.parseLong(studentId));
                ++paramCounter;
            }

            String studentName = (String) jsonQuery.get(NAME_FIELD);
            if (studentName != null) {
                studentSqlQuery.append( (paramCounter > 0 && paramCounter < jsonQuerySize)  ? AND_CONDITION : "")
                        .append("S." + NAME).append(LIKE_CONDITION).append(":"+NAME+" ");
                propertyIndexMap.put(NAME, studentName);
                ++paramCounter;
            }

            String studentEmail = (String) jsonQuery.get(EMAIL_ID_FIELD);
            if (studentEmail != null) {
                studentSqlQuery.append((paramCounter > 0 && paramCounter < jsonQuerySize)  ? AND_CONDITION : "")
                        .append("S." + EMAILID).append(LIKE_CONDITION).append(":"+EMAILID+" ");
                propertyIndexMap.put(EMAILID, studentEmail);
                ++paramCounter;
            }

            boolean selectIsPlaced = Boolean.parseBoolean((String) jsonQuery.get(SELECT_IS_PLACED_FIELD));
            if (selectIsPlaced) {
                boolean studentIsPlaced = Boolean.parseBoolean((String) jsonQuery.get(IS_PLACED_FIELD));
                studentSqlQuery.append((paramCounter > 0 && paramCounter < jsonQuerySize) ? AND_CONDITION : "")
                        .append("S." + PLACED).append(LIKE_CONDITION).append(":"+PLACED+" ");
                propertyIndexMap.put(PLACED, studentIsPlaced);
                ++paramCounter;
            }

            String studentSscMarks = (String) jsonQuery.get(SSC_MARKS_FIELD);
            if (studentSscMarks != null) {
                studentSqlQuery.append((paramCounter > 0 && paramCounter < jsonQuerySize) ? AND_CONDITION : "")
                        .append("S." + SSCMARKS).append((String) jsonQuery.get(SSC_MARKS_CONDITION_FIELD))
                        .append(":"+SSCMARKS+" ");
                propertyIndexMap.put(SSCMARKS, Float.parseFloat(studentSscMarks));
                ++paramCounter;
            }

            String studentHscMarks = (String) jsonQuery.get(HSC_MARKS_FIELD);
            if (studentHscMarks != null) {
                studentSqlQuery.append((paramCounter > 0 && paramCounter < jsonQuerySize) ? AND_CONDITION : "")
                        .append("S." + HSCMARKS).append((String) jsonQuery.get(HSC_MARKS_CONDITION_FIELD))
                        .append(":"+HSCMARKS+" ");
                propertyIndexMap.put(HSCMARKS, Float.parseFloat(studentHscMarks));
                ++paramCounter;
            }

            String studentMcaMarks = (String) jsonQuery.get(MCA_MARKS_FIELD);
            if (studentMcaMarks != null) {
                studentSqlQuery.append((paramCounter > 0 && paramCounter < jsonQuerySize) ? AND_CONDITION : "").append("S." + MCAMARKS).
                        append((String) jsonQuery.get(MCA_MARKS_CONDITION_FIELD)).append(" :"+MCAMARKS+" ");
                propertyIndexMap.put(MCAMARKS, Float.parseFloat(studentMcaMarks));
                ++paramCounter;
            }
        }
        studentSqlQuery.append(" ORDER BY S." + NAME);

        log.error("StudentDAO:278 = "+ studentSqlQuery.toString());
        try {
            Query query = getSession().createQuery(studentSqlQuery.toString());

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