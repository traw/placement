package org.in.placementv2.model;

import org.in.placementv2.util.JspString;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.junit.Assert.*;

public class StudentDAOTest {

    StudentDAO studentDAO;
    @Before
    public void setUp() throws Exception {
        studentDAO = new StudentDAO();
    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void testSave() throws Exception {

    }

    @Test
    public void testDelete() throws Exception {

    }

    @Test
    public void testFindById() throws Exception {

    }

    @Test
    public void testFindByExample() throws Exception {
        Student student = new Student();
        Skill skill1 = new Skill();
        skill1.setId(1l);
        Skill skill2 = new Skill();
        skill2.setId(1l);
        Set<Skill> skillSet = new HashSet<>();
        skillSet.add(skill1);
        skillSet.add(skill2);
        student.setSkills(skillSet);
        List list = studentDAO.findByExample(student);
        assertNotNull(list);
    }

    @Test
    public void testFindByProperty() throws Exception {

    }

    @Test
    public void testFindByName() throws Exception {

    }

    @Test
    public void testFindByEmailid() throws Exception {

    }

    @Test
    public void testFindByPassword() throws Exception {

    }

    @Test
    public void testFindByPlaced() throws Exception {

    }

    @Test
    public void testFindBySscmarks() throws Exception {

    }

    @Test
    public void testFindByHscmarks() throws Exception {

    }

    @Test
    public void testFindByMcamarks() throws Exception {

    }

    @Test
    public void testFindAll() throws Exception {

    }

    @Test
    public void testMerge() throws Exception {

    }

    @Test
    public void testAttachDirty() throws Exception {

    }

    @Test
    public void testAttachClean() throws Exception {

    }

    @Test
    public void testFindStudentForJSONQuery() throws Exception {
        JSONObject  o = new JSONObject();
        o.put(JspString.MCA_MARKS_CONDITION_FIELD, "<=");
        o.put(JspString.MCA_MARKS_FIELD, "60");
        JSONArray array = new JSONArray();
        array.add(1l);
        array.add(2l);
        array.add(3l);
        //o.put(JspString.SKILL_SELECT_FIELD, array);
        List<Student> list = studentDAO.findStudentForJSONQuery(o);
        for (Student student : list) {
            System.out.println(student.getName());
        }
        assertNotNull(list);
    }
}