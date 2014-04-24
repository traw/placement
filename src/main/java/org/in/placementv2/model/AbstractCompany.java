package org.in.placementv2.model;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractCompany entity provides the base persistence definition of the
 * Company entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractCompany implements java.io.Serializable {

	// Fields

	private Long id;
	private String name;
	private String description;
	private Float sscmarks;
	private Float hscmarks;
	private Float mcamarks;
	private Set skills = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractCompany() {
	}

	/** minimal constructor */
	public AbstractCompany(Float sscmarks, Float hscmarks, Float mcamarks) {
		this.sscmarks = sscmarks;
		this.hscmarks = hscmarks;
		this.mcamarks = mcamarks;
	}

	/** full constructor */
	public AbstractCompany(String name, String description, Float sscmarks,
			Float hscmarks, Float mcamarks, Set skills) {
		this.name = name;
		this.description = description;
		this.sscmarks = sscmarks;
		this.hscmarks = hscmarks;
		this.mcamarks = mcamarks;
		this.skills = skills;
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

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Float getSscmarks() {
		return this.sscmarks;
	}

	public void setSscmarks(Float sscmarks) {
		this.sscmarks = sscmarks;
	}

	public Float getHscmarks() {
		return this.hscmarks;
	}

	public void setHscmarks(Float hscmarks) {
		this.hscmarks = hscmarks;
	}

	public Float getMcamarks() {
		return this.mcamarks;
	}

	public void setMcamarks(Float mcamarks) {
		this.mcamarks = mcamarks;
	}

	public Set getSkills() {
		return this.skills;
	}

	public void setSkills(Set skills) {
		this.skills = skills;
	}

}