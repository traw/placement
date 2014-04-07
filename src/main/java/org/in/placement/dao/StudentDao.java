package org.in.placement.dao;

import java.beans.PropertyVetoException;
import java.sql.SQLException;
import java.util.List;

import org.in.placement.model.Skill;
import org.in.placement.model.Student;

/*
CREATE TABLE IF NOT EXISTS student
(
 id bigserial PRIMARY KEY,
 name varchar(30) NOT NULL,
 emailid varchar(30) NOT NULL,
 password varchar(30) NOT NULL,
 placed boolean NOT NULL,
 sscmarks real NOT NULL,
 hscmarks real NOT NULL,
 mcamarks real NOT NULL
);
* */

/*
 CREATE TABLE IF NOT EXIST skill
 (
   id bigserial NOT NULL,
   name varchar(30),
   PRIMARY KEY(id)
 );
*/

 public interface StudentDao {
    static final String STUDENT_ID = "id";
    static final String STUDENT_NAME = "name";
    static final String EMAIL_ID = "emailid";
    static final String PASSWORD = "password";
    static final String PLACED = "placed";
    static final String SSC_MARKS = "sscmarks";
    static final String HSC_MARKS = "hscmarks";
    static final String MCA_MARKS = "mcamarks";

     static final String SKILL_ID = "id";
     static final String SKILL_NAME = "name";

	public Student getStudentForID(long studentID) throws PropertyVetoException, SQLException;
	public List<Student> getStudents() throws PropertyVetoException, SQLException;
	public void deleteStudent(Student... students) throws PropertyVetoException, SQLException;
	public void deleteStudent(long  studentID) throws PropertyVetoException, SQLException;
	public List<Student> getStudentsForSkillALike(String skillName) throws PropertyVetoException, SQLException;
	public void saveStudents(Student... student) throws SQLException, PropertyVetoException;
	
	public List<Skill> getStudentSkills(Student student) throws SQLException, PropertyVetoException;
	public List<Skill> getStudentSkills(long studentID) throws SQLException, PropertyVetoException;
	public void updateSkillsForStudent(Student student, List<Skill> skillsList) throws PropertyVetoException, SQLException;
	public void deleteStudentSkills(Student student) throws PropertyVetoException, SQLException;
	public void deleteStudentSkills(Student student, Skill... skills) throws PropertyVetoException, SQLException;
	public void addSkill(Skill... skills) throws PropertyVetoException, SQLException;
	public void deleteSkill(Skill...skills) throws PropertyVetoException, SQLException;
}
