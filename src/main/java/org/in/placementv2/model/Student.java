package org.in.placementv2.model;

import java.util.Set;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */
public class Student extends AbstractStudent implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** minimal constructor */
	public Student(String name, String emailid,
			Boolean placed, Float sscmarks, Float hscmarks, Float mcamarks) {
		super(name, emailid, placed, sscmarks, hscmarks, mcamarks);
	}

	/** full constructor */
	public Student(String name, String emailid,
			Boolean placed, Float sscmarks, Float hscmarks, Float mcamarks,
			Set skills) {
		super(name, emailid, placed, sscmarks, hscmarks, mcamarks,
				skills);
	}

}
