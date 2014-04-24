package org.in.placementv2.model;

import java.util.Set;

/**
 * Skill entity. @author MyEclipse Persistence Tools
 */
public class Skill extends AbstractSkill implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Skill() {
	}

	/** full constructor */
	public Skill(String name, Set studentSkills, Set companySkills) {
		super(name, studentSkills, companySkills);
	}

}
