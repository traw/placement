/**
 *
 */
package org.in.placement.dao;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import org.in.placement.model.Skill;
import org.in.placement.model.Student;
import org.in.placement.util.*;
import org.in.placementv2.util.JspString;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



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


/**
 * @author traw
 */
public class StudentDaoImpl implements StudentDao, TableString, SQLDilect, JspString {
    private static final Logger log = LoggerFactory.getLogger(StudentDaoImpl.class);

    /**
     *
     */
    public StudentDaoImpl() {
        // TODO Auto-generated constructor stub
    }

    /**
     * getStudentsForJSONQuery: takes JSON Object to query students,
     * jsonQuery: contains elements used to query Students from Database
     * Supported Parameters are :
     * student_id : Student ID Number is an Integer.
     * student_name : Name of the Student.
     * student_email_id : Student Email ID.
     * is_placed : If student is placed Or not
     * ssc_marks : student SSC Marks
     * ssc_marks_condition : student SSC Marks Condition, Based on which
     * Students will be selected .
     * Default Condition is ==.
     * hsc_marks : student HSC Marks
     * hsc_marks_condition : student HSC Marks Condition, Based on which
     * Students will be selected. Default Condition is ==.
     * mca_marks : student MCA Marks
     * mca_marks_condition : student MCA Marks Condition, Based on which
     *
     * Students  will be selected. Default Condition is ==.
     *
     * @param jsonQuery
     * @return
     */
    @Override
    public List<Student> getStudentsForJSONQuery(JSONObject jsonQuery) throws PropertyVetoException, SQLException {

        int propertyToInsertCount = 0;
        Map<Integer, Object> propertyIndexMap = new HashMap<>();
        List<Student> studentList = new ArrayList<>();
        StringBuffer studentSqlQuery = new StringBuffer();
        studentSqlQuery.append(SELECT + "*" + FROM + STUDENT_TABLE);
        if (jsonQuery.size() > 0) {

            studentSqlQuery.append(WHERE);

            String studentId = (String) jsonQuery.get(ID_FIELD);
            if (studentId != null) {
                studentSqlQuery.append(STUDENT_ID_COL).append(EQUAL_TO_CONDITION).append(QUESTION_MARK);
                propertyIndexMap.put(++propertyToInsertCount, Long.parseLong(studentId));
            }

            String studentName = (String) jsonQuery.get(NAME_FIELD);
            if (studentName != null) {
                studentSqlQuery.append(AND_CONDITION).append(STUDENT_NAME_COL).append(LIKE_CONDITION).append(QUESTION_MARK);
                propertyIndexMap.put(++propertyToInsertCount, studentName);
            }

            String studentEmail = (String) jsonQuery.get(EMAIL_ID_FIELD);
            if (studentEmail != null) {
                studentSqlQuery.append(AND_CONDITION).append(EMAIL_ID_COL).append(LIKE_CONDITION).append(QUESTION_MARK);
                propertyIndexMap.put(++propertyToInsertCount, studentEmail);
            }

            boolean selectIsPlaced = Boolean.parseBoolean((String) jsonQuery.get(SELECT_IS_PLACED_FIELD));
            if (selectIsPlaced) {
                boolean studentIsPlaced = Boolean.parseBoolean((String) jsonQuery.get(IS_PLACED_FIELD));
                studentSqlQuery.append(AND_CONDITION).append(IS_PLACED_COL).append(LIKE_CONDITION).append(QUESTION_MARK);
                propertyIndexMap.put(++propertyToInsertCount, studentIsPlaced);
            }

            String studentSscMarks = (String) jsonQuery.get(SSC_MARKS_FIELD);
            if (studentSscMarks != null) {
                studentSqlQuery.append(AND_CONDITION).append(SSC_MARKS_COL).
                        append((String) jsonQuery.get(SSC_MARKS_CONDITION_FIELD)).append(QUESTION_MARK);
                propertyIndexMap.put(++propertyToInsertCount, Long.parseLong(studentSscMarks));
            }

            String studentHscMarks = (String) jsonQuery.get(HSC_MARKS_FIELD);
            if (studentHscMarks != null) {
                studentSqlQuery.append(AND_CONDITION).append(HSC_MARKS_COL).
                        append((String) jsonQuery.get(HSC_MARKS_CONDITION_FIELD)).append(QUESTION_MARK);
                propertyIndexMap.put(++propertyToInsertCount, Long.parseLong(studentHscMarks));
            }

            String studentMcaMarks = (String) jsonQuery.get(MCA_MARKS_FIELD);
            if (studentMcaMarks != null) {
                studentSqlQuery.append(AND_CONDITION).append(MCA_MARKS_COL).
                        append((String) jsonQuery.get(MCA_MARKS_CONDITION_FIELD)).append(QUESTION_MARK);
                propertyIndexMap.put(++propertyToInsertCount, Long.parseLong(studentMcaMarks));
            }

            String skillString = (String) jsonQuery.get(SKILL_SELECT_FIELD);
            if (skillString != null) {

            }
        }
        studentSqlQuery.append(" ORDER BY id");
        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            try (PreparedStatement statement = connection
                    .prepareStatement(studentSqlQuery.toString())) {

                for (int count = 1; count <= propertyIndexMap.size(); ++count) {
                    Object o = propertyIndexMap.get(count);
                    if (o instanceof Long) {
                        statement.setLong(count, (Long) o);
                    } else if (o instanceof String) {
                        statement.setString(count, (String) o);
                    } else if (o instanceof Boolean) {
                        statement.setBoolean(count, (Boolean) o);
                    }
                }

                try (ResultSet res = statement.executeQuery()) {
                    if (res.next()) {
                        log.error("StudentDaoImpl71");
                        Student stud = new Student();
                        stud.setId(res.getLong(STUDENT_ID_COL));
                        stud.setName(res.getString(STUDENT_NAME_COL));
                        stud.setEmail(res.getString(EMAIL_ID_COL));
                        stud.setPassword(res.getString(PASSWORD_COL));
                        stud.setPlaced(res.getBoolean(IS_PLACED_COL));
                        stud.setSscMark(res.getFloat(SSC_MARKS_COL));
                        stud.setHscMark(res.getFloat(HSC_MARKS_COL));
                        stud.setMcaMark(res.getFloat(MCA_MARKS_COL));
                        studentList.add(stud);
                    }
                    log.error("StudentDaoImpl82");
                } catch (SQLException e) {
                    log.error("Placement85: " + e.getMessage(), e);
                    e.printStackTrace();
                    throw e;
                }
            } catch (SQLException e) {
                log.error("Placement90: " + e.getMessage(), e);
                e.printStackTrace();
                throw e;
            }
        }

        return studentList;

    }

    /**
     * (non-Javadoc)     *
     *
     * @see org.in.placement.dao.StudentDao#getStudentForID(long)
     * throw PropertyVetoException, SQLException
     */
    @Override
    public Student getStudentForID(long studentID)
            throws PropertyVetoException, SQLException {
        Student stud = null;
        String sqlQuery = "SELECT * FROM " + STUDENT_TABLE + " WHERE id = ?";

        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            try (PreparedStatement statement = connection
                    .prepareStatement(sqlQuery)) {
                statement.setLong(1, studentID);
                try (ResultSet res = statement.executeQuery()) {
                    if (res.next()) {
                        log.error("StudentDaoImpl71");
                        stud = new Student();
                        stud.setId(res.getLong(STUDENT_ID_COL));
                        stud.setName(res.getString(STUDENT_NAME_COL));
                        stud.setEmail(res.getString(EMAIL_ID_COL));
                        stud.setPassword(res.getString(PASSWORD_COL));
                        stud.setPlaced(res.getBoolean(IS_PLACED_COL));
                        stud.setSscMark(res.getFloat(SSC_MARKS_COL));
                        stud.setHscMark(res.getFloat(HSC_MARKS_COL));
                        stud.setMcaMark(res.getFloat(MCA_MARKS_COL));
                    }
                    log.error("StudentDaoImpl82");
                } catch (SQLException e) {
                    log.error("Placement85: " + e.getMessage(), e);
                    e.printStackTrace();
                    throw e;
                }
            } catch (SQLException e) {
                log.error("Placement90: " + e.getMessage(), e);
                e.printStackTrace();
                throw e;
            }
        }
        return stud;
    }

    /*
     * (non-Javadoc)
     *
     * @see org.in.placement.dao.StudentDao#getStudents()
     */
    @Override
    public List<Student> getStudents() throws PropertyVetoException,
            SQLException {
        List<Student> students = new ArrayList<Student>();
        String sql = "SELECT * FROM " + STUDENT_TABLE;

        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            try (Statement statement = connection.createStatement()) {
                try (ResultSet res = statement.executeQuery(sql)) {
                    while (res.next()) {
                        Student stud = new Student();
                        stud.setId(res.getLong(STUDENT_ID_COL));
                        stud.setName(res.getString(STUDENT_NAME_COL));
                        stud.setEmail(res.getString(EMAIL_ID_COL));
                        stud.setPassword(res.getString(PASSWORD_COL));
                        stud.setPlaced(res.getBoolean(IS_PLACED_COL));
                        stud.setSscMark(res.getFloat(SSC_MARKS_COL));
                        stud.setHscMark(res.getFloat(HSC_MARKS_COL));
                        stud.setMcaMark(res.getFloat(MCA_MARKS_COL));
                        students.add(stud);
                    }
                }
            } catch (SQLException e) {
                log.error(e.getMessage(), e);
                throw e;
            }
        }
        return students;
    }

    /*
     * (non-Javadoc)
     *
     * @see
     * org.in.placement.dao.StudentDao#getStudentsForSkillALike(java.lang.String
     * )
     */
    @Override
    public List<Student> getStudentsForSkillALike(String skillName)
            throws PropertyVetoException, SQLException {
        List<Student> students = new ArrayList<Student>();
        String sqlQuery = " SELECT * FROM "+STUDENT_TABLE+ WHERE + "id IN ("
                + " SELECT student_id FROM "+ STUDENT_SKILL_TABLE +" WHERE skill_id IN ("
                + " SELECT id FROM "+ SKILL_TABLE +" WHERE name LIKE ?))";

        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            try (PreparedStatement statement = connection
                    .prepareStatement(sqlQuery)) {
                statement.setString(1, "%" + skillName + "%");
                try (ResultSet res = statement.executeQuery()) {
                    while (res.next()) {
                        Student stud = new Student();
                        stud.setId(res.getLong(STUDENT_ID_COL));
                        stud.setName(res.getString(STUDENT_NAME_COL));
                        stud.setEmail(res.getString(EMAIL_ID_COL));
                        stud.setPassword(res.getString(PASSWORD_COL));
                        stud.setPlaced(res.getBoolean(IS_PLACED_COL));
                        stud.setSscMark(res.getFloat(SSC_MARKS_COL));
                        stud.setHscMark(res.getFloat(HSC_MARKS_COL));
                        stud.setMcaMark(res.getFloat(MCA_MARKS_COL));
                        students.add(stud);
                    }
                }
            } catch (SQLException e) {
                log.error(e.getMessage(), e);
                throw e;
            }
        }

        return students;
    }

    /*
     * (non-Javadoc)
     *
     * @see
     * org.in.placement.dao.StudentDao#saveStudents(org.in.placement.model.Student
     * [])
     */
    @Override
    public void saveStudents(Student... students) throws SQLException,
            PropertyVetoException {
        String sqlQuery = INSERT_INTO + STUDENT_TABLE
                + " (name, email, password, placed, sscMark, hscmark, mcamark)"
                +  VALUES+ "(?, ?, ?, ?, ?, ?, ?)";

        String updateQuery = UPDATE + STUDENT_TABLE
                + SET
                + " name = ? , email = ?, password= ?, placed = ?, sscMark = ?, hscmark = ?, mcamark =?";

        DataSource dataSource = DataSource.getInstance();
        try (Connection conn = dataSource.getConnection()) {
            conn.setAutoCommit(false);
            for (Student student : students) {
                try (PreparedStatement stmt = conn.prepareStatement(student
                        .getId() == -1 ? sqlQuery : updateQuery)) {
                    stmt.setString(1, student.getName());
                    stmt.setString(2, student.getEmail());
                    stmt.setString(3, student.getPassword());
                    stmt.setBoolean(4, student.isPlaced());
                    stmt.setFloat(5, student.getSscMark());
                    stmt.setFloat(6, student.getHscMark());
                    stmt.setFloat(7, student.getMcaMark());
                    stmt.executeUpdate();
                } catch (SQLException e) {
                    System.err.println("SQLException Occurred: "
                            + e.getMessage());
                    conn.rollback();
                    conn.setAutoCommit(true);
                }
            }
            conn.commit();
            conn.setAutoCommit(true);
        }
    }

    /*
     * (non-Javadoc)
     *
     * @see
     * org.in.placement.dao.StudentDao#getStudentSkills(org.in.placement.model
     * .Student)
     */
    @Override
    public List<Skill> getStudentSkills(Student student) throws SQLException,
            PropertyVetoException {
        return getStudentSkills(student.getId());
    }

    /*
     * (non-Javadoc)
     *
     * @see org.in.placement.dao.StudentDao#getStudentSkills(long)
     */
    @Override
    public List<Skill> getStudentSkills(long studentID) throws SQLException,
            PropertyVetoException {
        List<Skill> skills = new ArrayList<Skill>();
        String skillQuery = SELECT + "*"+FROM+ SKILL_TABLE + WHERE + SKILL_ID_COL + IN + "("
                + SELECT + STUDENTSKILL_SKILL_ID_COL + FROM + STUDENT_SKILL_TABLE
                + WHERE + STUDENTSKILL_STUDENT_ID_COL + "= ?)";

        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            try (PreparedStatement statement = connection
                    .prepareStatement(skillQuery)) {
                statement.setLong(1, studentID);
                try (ResultSet res = statement.executeQuery()) {
                    while (res.next()) {
                        Skill skill = new Skill(res.getLong(SKILL_ID_COL),
                                res.getString(SKILL_NAME_COL));
                        skills.add(skill);
                    }
                }
            } catch (SQLException e) {
                log.error(e.getMessage(), e);
                throw e;
            }
        }
        return skills;
    }

    /*
     * (non-Javadoc)
     *
     * @see
     * org.in.placement.dao.StudentDao#updateSkilsForStudent(org.in.placement
     * .model.Student, java.util.List)
     */
    @Override
    public void updateSkillsForStudent(Student student, List<Skill> skillsList)
            throws PropertyVetoException, SQLException {
        String skillsUpdateQuery = INSERT_INTO + STUDENT_SKILL_TABLE
                + "("+STUDENTSKILL_STUDENT_ID_COL+","+STUDENTSKILL_SKILL_ID_COL+")" + VALUES +"(?, ?)";
        long studentID = student.getId();

        DataSource dataSource = DataSource.getInstance();

        try (Connection connection = dataSource.getConnection()) {
            connection.setAutoCommit(false);
            for (Skill skill : skillsList) {
                try (PreparedStatement statement = connection
                        .prepareStatement(skillsUpdateQuery)) {
                    statement.setLong(1, studentID);
                    statement.setLong(2, skill.getId());
                    statement.execute();
                } catch (SQLException e) {
                    connection.rollback();
                    connection.setAutoCommit(true);
                    log.error(e.getMessage(), e);
                    throw e;
                }
            }
            connection.commit();
            connection.setAutoCommit(true);
        }
    }

    @Override
    public void deleteStudent(Student... students)
            throws PropertyVetoException, SQLException {
        if (students.length == 1) {
            deleteStudent(students[0].getId());
            return;
        }
        long studentID;
        DataSource dataSource = DataSource.getInstance();

        try (Connection connection = dataSource.getConnection()) {
            connection.setAutoCommit(false);
            for (Student student : students) {
                studentID = student.getId();
                deleteStudent(studentID, connection);
            }
            connection.commit();
            connection.setAutoCommit(true);
        }
    }

    @Override
    public void deleteStudent(long studentID) throws PropertyVetoException,
            SQLException {
        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            connection.setAutoCommit(false);
            deleteStudent(studentID, connection);
            connection.commit();
            connection.setAutoCommit(true);
        }
    }

    private void deleteStudent(long studentID, Connection connection) throws SQLException {
        String deleteQuery = DELETE_FROM + STUDENT_TABLE + WHERE + STUDENT_ID_COL +" = ?";
        deleteStudentSkills(studentID, connection);
        try (PreparedStatement statement = connection
                .prepareStatement(deleteQuery)) {
            statement.setLong(1, studentID);
            statement.execute();
        } catch (SQLException e) {
            connection.rollback();
            connection.setAutoCommit(true);
            throw e;
        }
        connection.commit();
        connection.setAutoCommit(true);
    }

    private void deleteStudentSkills(long studentID, Connection connection)
            throws SQLException {
        String skillsDeleteQuery = "DELETE FROM student_skill WHERE student_id = ?";
        try (PreparedStatement statement = connection
                .prepareStatement(skillsDeleteQuery)) {
            statement.setLong(1, studentID);
            statement.execute();
        } catch (SQLException e) {
            connection.rollback();
            throw e;
        }
    }

    @Override
    public void deleteStudentSkills(Student student)
            throws PropertyVetoException, SQLException {
        long studentID = student.getId();

        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            deleteStudentSkills(studentID, connection);
        }

    }

    @Override
    public void deleteStudentSkills(Student student, Skill... skills)
            throws PropertyVetoException, SQLException {
        String deleteStudentSkillQuery = "DELETE FROM " + STUDENT_SKILL_TABLE + WHERE
                + STUDENTSKILL_STUDENT_ID_COL + " = ? AND " + STUDENTSKILL_SKILL_ID_COL + " = ?";
        long studentID = student.getId();
        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            connection.setAutoCommit(false);
            for (Skill skill : skills) {
                try (PreparedStatement statement = connection
                        .prepareStatement(deleteStudentSkillQuery)) {
                    statement.setLong(1, studentID);
                    statement.setLong(2, skill.getId());
                    statement.execute();
                } catch (SQLException e) {
                    connection.rollback();
                    connection.setAutoCommit(true);
                    throw e;
                }
            }
            connection.commit();
            connection.setAutoCommit(true);
        }
    }

    @Override
    public void addSkill(Skill... skills) throws PropertyVetoException,
            SQLException {
        String insertSkillQuery =  INSERT_INTO + SKILL_TABLE + " (name) "+VALUES+"(?)";

        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            connection.setAutoCommit(false);
            for (Skill skill : skills) {
                try (PreparedStatement statement = connection
                        .prepareStatement(insertSkillQuery)) {
                    statement.setString(1, skill.getSkillName());
                    statement.execute();
                } catch (Exception e) {
                    connection.commit();
                    connection.setAutoCommit(true);
                    throw e;
                }
            }
            connection.commit();
            connection.setAutoCommit(true);
        }
    }

    @Override
    public void deleteSkill(Skill... skills) throws PropertyVetoException,
            SQLException {
        String insertSkillQuery = DELETE_FROM + SKILL_TABLE + WHERE + SKILL_ID_COL +" = ?";

        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            connection.setAutoCommit(false);
            for (Skill skill : skills) {
                cascadeDeleteSkill(skill.getId(), connection);
                try (PreparedStatement statement = connection
                        .prepareStatement(insertSkillQuery)) {
                    statement.setLong(1, skill.getId());
                    statement.execute();
                } catch (SQLException e) {
                    connection.rollback();
                    connection.setAutoCommit(true);
                    throw e;
                }
            }
            connection.commit();
            connection.setAutoCommit(true);
        }
    }

    private void cascadeDeleteSkill(long skillID, Connection connection) throws PropertyVetoException, SQLException {
        String deleteStudentSkill = DELETE_FROM + STUDENT_SKILL_TABLE + WHERE + STUDENTSKILL_SKILL_ID_COL +" = ?";
        try (PreparedStatement statement = connection.prepareStatement(deleteStudentSkill)) {
            statement.setLong(1, skillID);
        } catch (SQLException e) {
            connection.rollback();
            connection.setAutoCommit(true);
            throw e;
        }
    }
}
