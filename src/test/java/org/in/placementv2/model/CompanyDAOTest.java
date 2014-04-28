package org.in.placementv2.model;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.HashSet;
import java.util.Set;

import static org.junit.Assert.*;

public class CompanyDAOTest {

    @Before
    public void setUp() throws Exception {

    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void testSave() throws Exception {
        Company company = new Company();
        company.setName("comp3");
        company.setDescription("comp3");
        company.setSscmarks(65f);
        company.setHscmarks(65f);
        company.setMcamarks(65f);

        Set skillSet = new HashSet();
        Set compSet = new HashSet();
        compSet.add(company);
        for (long i = 4; i < 6; ++i) {
            Skill skill = new Skill();
            skill.setId(i);
            skill.setCompanies(compSet);
            skillSet.add(skill);
        }
        company.setSkills(skillSet);
        CompanyDAO dao = new CompanyDAO();
        dao.save(company);
    }

    @Test
    public void testDelete() throws Exception {

    }

    @Test
    public void testFindById() throws Exception {

    }

    @Test
    public void testFindByExample() throws Exception {

    }

    @Test
    public void testFindByProperty() throws Exception {

    }

    @Test
    public void testFindByName() throws Exception {

    }

    @Test
    public void testFindByDescription() throws Exception {

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
    public void testFindCompanyForJSONQuery() throws Exception {

    }
}