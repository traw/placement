package org.in.placementv2.model;

import java.util.Set;

/**
 * Company entity. @author MyEclipse Persistence Tools
 */
public class Company extends AbstractCompany implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Company() {
	}

	/** minimal constructor */
	public Company(Float sscmarks, Float hscmarks, Float mcamarks) {
		super(sscmarks, hscmarks, mcamarks);
	}

	/** full constructor */
	public Company(String name, String description, Float sscmarks,
			Float hscmarks, Float mcamarks, Set skills) {
		super(name, description, sscmarks, hscmarks, mcamarks, skills);
	}

}
