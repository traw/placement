package org.in.placementv2.model;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractStudent entity provides the base persistence definition of the
 * Student entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractStudent implements java.io.Serializable {

	// Fields

	private Long id;
	private String name;
	private String emailid;
	private String password;
	private Boolean placed;
	private Float sscmarks;
	private Float hscmarks;
	private Float mcamarks;
	private Set skills = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractStudent() {
	}

	/** minimal constructor */
	public AbstractStudent(String name, String emailid, String password,
			Boolean placed, Float sscmarks, Float hscmarks, Float mcamarks) {
		this.name = name;
		this.emailid = emailid;
		this.password = password;
		this.placed = placed;
		this.sscmarks = sscmarks;
		this.hscmarks = hscmarks;
		this.mcamarks = mcamarks;
	}

	/** full constructor */
	public AbstractStudent(String name, String emailid, String password,
			Boolean placed, Float sscmarks, Float hscmarks, Float mcamarks,
			Set skills) {
		this.name = name;
		this.emailid = emailid;
		this.password = password;
		this.placed = placed;
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

	public String getEmailid() {
		return this.emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getPlaced() {
		return this.placed;
	}

	public void setPlaced(Boolean placed) {
		this.placed = placed;
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