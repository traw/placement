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

    static final String STUDENT_TABLE = "student";



    static final String STUDENT_ID = "id";
    static final String STUDENT_NAME = "name";
    static final String EMAIL_ID = "emailid";
    static final String PASSWORD = "password";
    static final String IS_PLACED = "placed";
    static final String SSC_MARKS = "sscmarks";
    static final String HSC_MARKS = "hscmarks";
    static final String MCA_MARKS = "mcamarks";

    static final String SKILL_TABLE = "skill";
    static final String SKILL_ID = "id";
    static final String SKILL_NAME = "name";

    static final String STUDENT_SKILL_TABLE = "student_skill";
    static final String STUDENT_SKILL_TABLE_STUDENT_ID = "student_id";
    static final String STUDENT_SKILL_TABLE_SKILL_ID = "skill_id";

    static final String STUDENT_ID_QUERY_CONDITION = "student_id" ;
    static final String STUDENT_NAME_QUERY_CONDITION = "student_name";
    static final String STUDENT_EMAIL_ID_QUERY_CONDITION = "student_email_id";
    static final String SELECT_STUDENT_IS_PLACED_QUERY_CONDITION = "select_student_is_placed";
    static final String STUDENT_IS_PLACED_QUERY_CONDITION = "student_is_placed";
    static final String STUDENT_SSC_MARKS_QUERY_CONDITION = "student_ssc_marks";
    static final String STUDENT_SSC_MARKS_CONDITION_QUERY_CONDITION = "student_ssc_marks_condition";
    static final String STUDENT_HSC_MARKS_QUERY_CONDITION = "student_hsc_marks";
    static final String STUDENT_HSC_MARKS_CONDITION_QUERY_CONDITION = "student_hsc_marks_condition";
    static final String STUDENT_MCA_MARKS_QUERY_CONDITION = "student_mca_marks";
    static final String STUDENT_MCA_MARKS_CONDITION_QUERY_CONDITION = "student_mca_marks_condition";
    static final String WHERE = " WHERE ";
    static final String AND_CONDITION = " AND ";
    static final String LIKE_CONDITION = " LIKE ";
    static final String EQUAL_TO_CONDITION = " = ";
    static final String LESS_THAN_EQUAL_CONDITION = " <= ";
    static final String GREATER_THAN_EQUAL_CONDITION = " >= ";
    static final String QUESTION_MARK = " ? ";



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
     *    student_is_placed : If student is placed Or not
     *
     *    student_ssc_marks : student SSC Marks
     *    student_ssc_marks_condition : student SSC Marks Condition, Based on which
     *                                  Students will be selected.
     *
     *    student_hsc_marks : student HSC Marks.
     *    student_hsc_marks_condition : student HSC Marks Condition, Based on which
     *                                  Students will be selected.
     *
     *    student_mca_marks : student MCA Marks.
     *    student_mca_marks_condition : student MCA Marks Condition, Based on which
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
