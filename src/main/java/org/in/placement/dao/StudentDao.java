package org.in.placement.dao;

import java.beans.PropertyVetoException;
import java.sql.SQLException;
import java.util.List;

import org.in.placement.model.Skill;
import org.in.placement.model.Student;
import org.json.simple.JSONObject;

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
    /**
     * getStudentsForJSONQuery: takes JSON Object to query students,
     *  jsonQuery: contains elements used to query Students from Database
     *  Supported Parameters are :
     *    student_id : Student ID Number is an Integer.
     *
     *    student_name : Name of the Student.
     *
     *    student_email_id : Student Email ID.
     *
     *    select_is_placed : Enable/Disable to include
     *                       student_is_placed to query.
     *    is_placed : If student is placed Or not
     *
     *    ssc_marks : student SSC Marks
     *    ssc_marks_condition : student SSC Marks Condition, Based on which
     *                                  Students will be selected.
     *
     *    hsc_marks : student HSC Marks.
     *    hsc_marks_condition : student HSC Marks Condition, Based on which
     *                                  Students will be selected.
     *
     *    mca_marks : student MCA Marks.
     *    mca_marks_condition : student MCA Marks Condition, Based on which
     *                                  Students  will be selected
     * @param jsonQuery
     * @return
     */
    public List<Student> getStudentsForJSONQuery(JSONObject jsonQuery) throws PropertyVetoException, SQLException;

    public Student getStudentForID(long studentID) throws PropertyVetoException, SQLException;

    public List<Student> getStudents() throws PropertyVetoException, SQLException;

    public void deleteStudent(Student... students) throws PropertyVetoException, SQLException;

    public void deleteStudent(long studentID) throws PropertyVetoException, SQLException;

    public List<Student> getStudentsForSkillALike(String skillName) throws PropertyVetoException, SQLException;

    public void saveStudents(Student... student) throws SQLException, PropertyVetoException;

    public List<Skill> getStudentSkills(Student student) throws SQLException, PropertyVetoException;

    public List<Skill> getStudentSkills(long studentID) throws SQLException, PropertyVetoException;

    public void updateSkillsForStudent(Student student, List<Skill> skillsList) throws PropertyVetoException, SQLException;

    public void deleteStudentSkills(Student student) throws PropertyVetoException, SQLException;

    public void deleteStudentSkills(Student student, Skill... skills) throws PropertyVetoException, SQLException;

    public void addSkill(Skill... skills) throws PropertyVetoException, SQLException;

    public void deleteSkill(Skill... skills) throws PropertyVetoException, SQLException;
}
