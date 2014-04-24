package org.in.placementv2.model;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractSkill entity provides the base persistence definition of the Skill
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractSkill implements java.io.Serializable {

	// Fields

	private Long id;
	private String name;
	private Set students = new HashSet(0);
	private Set companies = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractSkill() {
	}

	/** full constructor */
	public AbstractSkill(String name, Set students, Set companies) {
		this.name = name;
		this.students = students;
		this.companies = companies;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set getStudents() {
		return this.students;
	}

	public void setStudents(Set students) {
		this.students = students;
	}

	public Set getCompanies() {
		return this.companies;
	}

	public void setCompanies(Set companies) {
		this.companies = companies;
	}

}