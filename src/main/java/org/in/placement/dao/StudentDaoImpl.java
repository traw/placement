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
import java.util.ArrayList;
import java.util.List;

import org.in.placement.model.Skill;
import org.in.placement.model.Student;
import org.in.placement.util.DataSource;
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
public class StudentDaoImpl implements StudentDao {
    private static final Logger log = LoggerFactory.getLogger(StudentDaoImpl.class);

    /**
     *
     */
    public StudentDaoImpl() {
        // TODO Auto-generated constructor stub
    }

    /*
     * (non-Javadoc)
     *
     * @see org.in.placement.dao.StudentDao#getStudentForID(long)
     */
    @Override
    public Student getStudentForID(long studentID)
            throws PropertyVetoException, SQLException {
        Student stud = null;
        String sqlQuery = "SELECT * FROM student WHERE id = ?";

        DataSource dataSource = null;

        dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            try (PreparedStatement statement = connection
                    .prepareStatement(sqlQuery)) {
                statement.setLong(1, studentID);
                try (ResultSet res = statement.executeQuery()) {
                    if (res.next()) {
                        stud = new Student();
                        stud.setId(res.getLong(STUDENT_ID));
                        stud.setName(res.getString(STUDENT_NAME));
                        stud.setEmail(res.getString(EMAIL_ID));
                        stud.setPassword(res.getString(PASSWORD));
                        stud.setPlaced(res.getBoolean(PLACED));
                        stud.setSscMark(res.getFloat(SSC_MARKS));
                        stud.setHscMark(res.getFloat(HSC_MARKS));
                        stud.setMcaMark(res.getFloat(MCA_MARKS));
                    }
                }
            } catch (SQLException e) {
                log.error(e.getMessage(), e);
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
        String sql = "SELECT * FROM student";

        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            try (Statement statement = connection.createStatement()) {
                try (ResultSet res = statement.executeQuery(sql)) {
                    while (res.next()) {
                        Student stud = new Student();
                        stud.setId(res.getLong(STUDENT_ID));
                        stud.setName(res.getString(STUDENT_NAME));
                        stud.setEmail(res.getString(EMAIL_ID));
                        stud.setPassword(res.getString(PASSWORD));
                        stud.setPlaced(res.getBoolean(PLACED));
                        stud.setSscMark(res.getFloat(SSC_MARKS));
                        stud.setHscMark(res.getFloat(HSC_MARKS));
                        stud.setMcaMark(res.getFloat(MCA_MARKS));
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
        String sqlQuery = " SELECT * FROM student WHERE id IN ("
                + " SELECT student_id FROM student_skill WHERE skill_id IN ("
                + " SELECT id FROM skill WHERE name LIKE ?))";

        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            try (PreparedStatement statement = connection
                    .prepareStatement(sqlQuery)) {
                statement.setString(1, "%" + skillName + "%");
                try (ResultSet res = statement.executeQuery()) {
                    while (res.next()) {
                        Student stud = new Student();
                        stud.setId(res.getLong(STUDENT_ID));
                        stud.setName(res.getString(STUDENT_NAME));
                        stud.setEmail(res.getString(EMAIL_ID));
                        stud.setPassword(res.getString(PASSWORD));
                        stud.setPlaced(res.getBoolean(PLACED));
                        stud.setSscMark(res.getFloat(SSC_MARKS));
                        stud.setHscMark(res.getFloat(HSC_MARKS));
                        stud.setMcaMark(res.getFloat(MCA_MARKS));
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
        String sqlQuery = "INSERT INTO student "
                + " (name, email, password, placed, sscMark, hscmark, mcamark)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?)";

        String updateQuery = "UPDATE student "
                + " SET "
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
        String skillQuery = "SELECT * FROM skill " + "WHERE id IN ("
                + "SELECT  skill_id FROM student_skill "
                + "WHERE  student_id = ?)";

        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            try (PreparedStatement statement = connection
                    .prepareStatement(skillQuery)) {
                statement.setLong(1, studentID);
                try (ResultSet res = statement.executeQuery()) {
                    while (res.next()) {
                        Skill skill = new Skill(res.getLong(SKILL_ID),
                                res.getString(SKILL_NAME));
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
        String skillsUpdateQuery = "INSERT INTO student_skill "
                + "(student_id, skill_id) " + "VALUES (?, ?)";
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
        String deleteQuery = "DELETE FROM student WHERE id = ?";
        long studentID;
        DataSource dataSource = DataSource.getInstance();

        try (Connection connection = dataSource.getConnection()) {
            connection.setAutoCommit(false);
            for (Student student : students) {
                studentID = student.getId();
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
            }
            connection.commit();
            connection.setAutoCommit(true);
        }
    }

    @Override
    public void deleteStudent(long studentID) throws PropertyVetoException,
            SQLException {
        String deleteQuery = "DELETE FROM student WHERE id = ?";

        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            connection.setAutoCommit(false);
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
        String deleteStudentSkillQuery = "DELETE FROM student_skill WHERE student_id = ? AND skill_id = ?";
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
        String insertSkillQuery = "INSERT INTO skill (name) VALUES (?)";

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
        String insertSkillQuery = "DELETE FROM skill WHERE id = ?)";

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
        String deleteStudentSkill = "DELETE FROM student_skill WHERE skill_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(deleteStudentSkill)) {
            statement.setLong(1, skillID);
        } catch (SQLException e) {
            connection.rollback();
            connection.setAutoCommit(true);
            throw e;
        }
    }
}
