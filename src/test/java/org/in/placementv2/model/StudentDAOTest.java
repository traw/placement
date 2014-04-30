package org.in.placementv2.model;

import org.in.placementv2.util.JspString;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
        Student student = new Student();
        student.setName("urvashi");
        student.setEmailid("urvashi@gmail.com");
        student.setPlaced(true);
        student.setSscmarks(80f);
        student.setHscmarks(80f);
        student.setMcamarks(80f);

        Set studentSet  = new HashSet();
        studentSet.add(student);

        Skill skill1 = new Skill();
        skill1.setId(1l);
        skill1.setStudents(studentSet);
        Skill skill2 = new Skill();
        skill2.setId(2l);
        skill2.setStudents(studentSet);
        Skill skill3 = new Skill();
        skill3.setId(3l);
        skill3.setStudents(studentSet);

        Set<Skill> skillSet = new HashSet<>();
        skillSet.add(skill1);
        skillSet.add(skill2);
        skillSet.add(skill3);
        student.setSkills(skillSet);
        studentDAO.save(student);
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
        Pattern pattern = Pattern.compile("-?\\d+");
        String key = "selected_skill[12]";
        Matcher matcher = pattern.matcher(key);
        boolean b = matcher.find();
        if (b) {
            System.out.println(matcher.group(0));
        }
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
        o.put(JspString.ID_FIELD, "1");
        JSONArray array = new JSONArray();
        array.add(1l);
        array.add(2l);
        array.add(3l);
        //o.put(JspString.SKILL_SELECT_FIELD, array);
        List<Student> list = studentDAO.findByJSONQuery(o);
        for (Student student : list) {
            StringBuffer buffer = new StringBuffer();
            buffer.append(student.getName()).append(": ");
            Iterator<Skill> skillIterator = student.getSkills().iterator();
            while (skillIterator.hasNext()) {
                buffer.append(skillIterator.next().getName()).append(", ");
            }
            System.out.println(buffer.toString());
        }
        assertNotNull(list);
    }

    @Test
    public void testFindCompanies() throws Exception {
        //StringBuffer buffer = new StringBuffer();
        List<Company> list = studentDAO.findCompanies(1l);
        for (Company company : list) {
            StringBuffer buffer = new StringBuffer();
            buffer.append(company.getName()).append(": ");
            Iterator<Skill> skillIterator = company.getSkills().iterator();
            while (skillIterator.hasNext()) {
                buffer.append(skillIterator.next().getName()).append(", ");
            }
            System.out.println(buffer.toString());
        }

        //System.out.println(buffer.toString());
        assertNotNull(list);
    }
}