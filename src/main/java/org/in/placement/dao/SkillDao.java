package org.in.placement.dao;

import org.in.placement.model.Company;
import org.in.placement.model.Skill;
import org.in.placement.model.Student;

import java.beans.PropertyVetoException;
import java.util.List;

public interface SkillDao {
    /**
     * Get all skills
     * @return
     */
    public List<Skill> getSkills() throws PropertyVetoException;

    /**
     * Returns skill which matches searchSkill String
     * @param searchSkill
     * @return List of Skill matches searchSkill
     */
    public List<Skill> getSkillsALike(String searchSkill);


    /**
     * update skill if skill already exist OR
     * save skill if it doesn't exist in database
     * @param skill
     */
    public void saveOrUpdateSkill(Skill skill);

    /**
     * Delete Skill/s from database
     * @param skills
     */
    public void deleteSkills(Skill... skills);

    /**
     * get Student Skills
     * @param student
     * @return List<skill> : Skills for Student
     */
    public List<Skill> getSkillsForStudent(Student student);

    /**
     * get Students Skills given student id
     * @param studentId
     * @return List<skill> : Skills for Student
     */
    public List<Skill> getSkillsForStudent(long studentId);

    /**
     * Save if not exist or update is exist skills for student in
     * Database
     * @param student
     * @param skills : Skills to be add or updated
     */
    public void saveOrUpdateSkillSForStudent(Student student, Skill... skills);

    /**
     * Save if not exist or update is exist skills for student in
     * Database
     * @param studentID
     * @param skills
     */
    public void saveOrUpdateSkillSForStudentID(long studentID, Skill... skills);


    /**
     * get Company Skills
     * @param company
     * @return List<skill> : Skills for Company
     */
    public List<Skill> getSkillsForCompany(Company company);

    /**
     * get Company Skills given Company id
     * @param companyID
     * @return List<skill> : Skills for Company
     */
    public List<Skill> getSkillsForCompany(long companyID);

    /**
     * Save if not exist or update is exist skills for student in
     * Database
     * @param company
     * @param skills : Skills to be add or updated
     */
    public void saveOrUpdateSkillSForCompany(Company company, Skill... skills);

    /**
     * Save if not exist or update is exist skills for student in
     * Database
     * @param companyID
     * @param skills
     */
    public void saveOrUpdateSkillSForCompanyID(long companyID, Skill... skills);

}
