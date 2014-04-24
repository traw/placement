/**
 * 
 */
package org.in.placementv2.model;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.hibernate.Session;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 * @author traw
 *
 */
public class SkillDAOTest {

	static SkillDAO dao;
	/**
	 * @throws java.lang.Exception
	 */
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		dao = new SkillDAO();
	}

	/**
	 * @throws java.lang.Exception
	 */
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	/**
	 * Test method for {@link org.in.placementv2.model.SkillDAO#save(org.in.placementv2.model.Skill)}.
	 */
	@Test
	public void testSave() {
		fail("Not yet implemented"); // TODO
	}

	/**
	 * Test method for {@link org.in.placementv2.model.SkillDAO#delete(org.in.placementv2.model.Skill)}.
	 */
	@Test
	public void testDelete() {
		fail("Not yet implemented"); // TODO
	}

	/**
	 * Test method for {@link org.in.placementv2.model.SkillDAO#findById(java.lang.Long)}.
	 */
	@Test
	public void testFindById() {
		fail("Not yet implemented"); // TODO
	}

	/**
	 * Test method for {@link org.in.placementv2.model.SkillDAO#findByExample(org.in.placementv2.model.Skill)}.
	 */
	@Test
	public void testFindByExample() {
		fail("Not yet implemented"); // TODO
	}

	/**
	 * Test method for {@link org.in.placementv2.model.SkillDAO#findByProperty(java.lang.String, java.lang.Object)}.
	 */
	@Test
	public void testFindByProperty() {
		fail("Not yet implemented"); // TODO
	}

	/**
	 * Test method for {@link org.in.placementv2.model.SkillDAO#findByName(java.lang.Object)}.
	 */
	@Test
	public void testFindByName() {
		fail("Not yet implemented"); // TODO
	}

	/**
	 * Test method for {@link org.in.placementv2.model.SkillDAO#findAll()}.
	 */
	@Test
	public void testFindAll() {
		fail("Not yet implemented"); // TODO
	}

	/**
	 * Test method for {@link org.in.placementv2.model.SkillDAO#merge(org.in.placementv2.model.Skill)}.
	 */
	@Test
	public void testMerge() {
		fail("Not yet implemented"); // TODO
	}

	/**
	 * Test method for {@link org.in.placementv2.model.SkillDAO#attachDirty(org.in.placementv2.model.Skill)}.
	 */
	@Test
	public void testAttachDirty() {
		fail("Not yet implemented"); // TODO
	}

	/**
	 * Test method for {@link org.in.placementv2.model.SkillDAO#attachClean(org.in.placementv2.model.Skill)}.
	 */
	@Test
	public void testAttachClean() {
		fail("Not yet implemented"); // TODO
	}

	/**
	 * Test method for {@link org.in.placementv2.model.SkillDAO#getAllSkillsForIDs(java.util.Collection)}.
	 */
	@Test
	public void testGetAllSkillsForIDs() {
		List<Long> name = new ArrayList<>();
		name.add(1l);
		name.add(2l);
		name.add(3l);
		name.add(4l);
		List skillList = dao.getAllSkillsForIDs(name);
		assertNotNull(skillList);
	}

	/**
	 * Test method for {@link org.in.placementv2.dao.SkillDao#getSession()}.
	 */
	@Test
	public void testGetSession() {
		Session session = dao.getSession();
		assertNotNull(session);
	}

}
