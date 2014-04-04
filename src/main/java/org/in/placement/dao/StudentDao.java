package org.in.placement.dao;

import java.beans.PropertyVetoException;
import java.sql.SQLException;
import java.util.List;

import org.in.placement.model.Skill;
import org.in.placement.model.Student;

public interface StudentDao {
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
