package org.in.placement.dao;

import junit.framework.TestCase;
import org.in.placement.model.Student;

/**
 * Created by traw on 09/04/14.
 */
public class StudentDaoImplTest extends TestCase {
    public void testGetStudentForID() throws Exception {
        long studId = 1l;
        StudentDao studentDao = new StudentDaoImpl();
        Student student = studentDao.getStudentForID(studId);
        assertNotNull(student);
    }

    public void testGetStudents() throws Exception {

    }

    public void testGetStudentsForSkillALike() throws Exception {

    }

    public void testSaveStudents() throws Exception {

    }

    public void testGetStudentSkills() throws Exception {

    }

    public void testGetStudentSkills1() throws Exception {

    }

    public void testUpdateSkillsForStudent() throws Exception {

    }

    public void testDeleteStudent() throws Exception {

    }

    public void testDeleteStudent1() throws Exception {

    }

    public void testDeleteStudentSkills() throws Exception {

    }

    public void testDeleteStudentSkills1() throws Exception {

    }

    public void testAddSkill() throws Exception {

    }

    public void testDeleteSkill() throws Exception {

    }
}
