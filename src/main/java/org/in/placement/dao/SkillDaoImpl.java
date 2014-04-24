package org.in.placement.dao;

import org.in.placement.model.Company;
import org.in.placement.model.Skill;
import org.in.placement.model.Student;
import org.in.placement.util.DataSource;
import org.in.placementv2.util.JspString;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * CREATE TABLE skill
 * (
 *   id bigserial NOT NULL,
 *   name varchar(30),
 *   PRIMARY KEY(id)
 * );
 *
 * CREATE TABLE student_skill
 * (
 *   student_id long,
 *   skill_id  long,
 *   FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
 *   FOREIGN KEY (skill_id) REFERENCES skill(id) ON DELETE CASCADE,
 *   PRIMARY KEY (student_id, skill_id)
 * );
 *
 * CREATE TABLE company_skill
 * (
 *   company_id long,
 *   skill_id  long,
 *   FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE,
 *   FOREIGN KEY (skill_id) REFERENCES skill(id) ON DELETE CASCADE,
 *   PRIMARY KEY (company_id, skill_id)
 * );
 *
 */
public class SkillDaoImpl implements SkillDao, JspString {

    public static final String SKILL_TABLE = "skill";
    public static final String STUDENT_SKILL_TABLE = "student_skill";
    public static final String COMPANY_SKILL_TABLE = "company_skill";

    /*Skill table Columns */
    public static final String SKILL_ID_COL = "id";
    public static final String SKILL_NAME_COL = "name";

    /*Student_skill Table columns */
    public static final String STUDENTSKILL_STUD_ID_COL = "student_id";
    public static final String STUDENTSKILL_SKILL_ID_COL = "skill_id";
    /**
     * Get all skills
     *
     * @return
     */
    @Override
    public List<Skill> getSkills() throws PropertyVetoException {
        List<Skill>  skillList = new ArrayList<>();
        String query  = "SELECT * FROM " + SKILL_TABLE;
        DataSource dataSource = DataSource.getInstance();
        try(Connection connection = dataSource.getConnection()) {
            try(Statement statement = connection.createStatement()) {
                try(ResultSet set = statement.executeQuery(query)) {
                    while (set.next()) {
                        Skill skill = new Skill();
                        skill.setId(set.getLong(SKILL_ID_COL));
                        skill.setSkillName(set.getString(SKILL_NAME_COL));
                        skillList.add(skill);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return skillList;
    }

    /**
     * Returns skill which matches searchSkill String
     *
     * @param searchSkill
     * @return List of Skill matches searchSkill
     */
    @Override
    public List<Skill> getSkillsALike(String searchSkill) {
        return null;
    }

    /**
     * update skill if skill already exist OR
     * save skill if it doesn't exist in database
     *
     * @param skill
     */
    @Override
    public void saveOrUpdateSkill(Skill skill) {

    }

    /**
     * Delete Skill/s from database
     *
     * @param skills
     */
    @Override
    public void deleteSkills(Skill... skills) {

    }

    /**
     * get Student Skills
     *
     * @param student
     * @return List<skill> : Skills for Student
     */
    @Override
    public List<Skill> getSkillsForStudent(Student student) {
        return null;
    }

    /**
     * get Students Skills given student id
     *
     * @param studentId
     * @return List<skill> : Skills for Student
     */
    @Override
    public List<Skill> getSkillsForStudent(long studentId) {
        return null;
    }

    /**
     * Save if not exist or update is exist skills for student in
     * Database
     *
     * @param student
     * @param skills  : Skills to be add or updated
     */
    @Override
    public void saveOrUpdateSkillSForStudent(Student student, Skill... skills) {

    }

    /**
     * Save if not exist or update is exist skills for student in
     * Database
     *
     * @param studentID
     * @param skills
     */
    @Override
    public void saveOrUpdateSkillSForStudentID(long studentID, Skill... skills) {

    }

    /**
     * get Company Skills
     *
     * @param company
     * @return List<skill> : Skills for Company
     */
    @Override
    public List<Skill> getSkillsForCompany(Company company) {
        return null;
    }

    /**
     * get Company Skills given Company id
     *
     * @param companyID
     * @return List<skill> : Skills for Company
     */
    @Override
    public List<Skill> getSkillsForCompany(long companyID) {
        return null;
    }

    /**
     * Save if not exist or update is exist skills for student in
     * Database
     *
     * @param company
     * @param skills  : Skills to be add or updated
     */
    @Override
    public void saveOrUpdateSkillSForCompany(Company company, Skill... skills) {

    }

    /**
     * Save if not exist or update is exist skills for student in
     * Database
     *
     * @param companyID
     * @param skills
     */
    @Override
    public void saveOrUpdateSkillSForCompanyID(long companyID, Skill... skills) {

    }
}
