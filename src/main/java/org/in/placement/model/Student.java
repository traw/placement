package org.in.placement.model;

public class Student {
	private long id = -1l;
	private String name;
	private String email;
	private String password;
	private boolean isPlaced;
	private ROLE role = ROLE.STUDENT;
	private float sscMark;
	private float hscMark;
	private float mcaMark;
	
	
	/**
	 * 
	 */
	public Student() {
		
	}
	/**
	 * @param id
	 * @param name
	 * @param email
	 * @param passwordz
	 * @param marks
	 * @param isPlaced
	 */
	public Student(long id, String name, String email, String password, boolean isPlaced) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.isPlaced = isPlaced;
	}
	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the isPlaced
	 */
	public boolean isPlaced() {
		return isPlaced;
	}
	/**
	 * @param isPlaced the isPlaced to set
	 */
	public void setPlaced(boolean isPlaced) {
		this.isPlaced = isPlaced;
	}
	/**
	 * @return the role
	 */
	public ROLE getRole() {
		return role;
	}
	/**
	 * @param role the role to set
	 */
	public void setRole(ROLE role) {
		this.role = role;
	}
	/**
	 * @return the sscMark
	 */
	public float getSscMark() {
		return sscMark;
	}
	/**
	 * @param sscMark the sscMark to set
	 */
	public void setSscMark(float sscMark) {
		this.sscMark = sscMark;
	}
	/**
	 * @return the hscMark
	 */
	public float getHscMark() {
		return hscMark;
	}
	/**
	 * @param hscMark the hscMark to set
	 */
	public void setHscMark(float hscMark) {
		this.hscMark = hscMark;
	}
	/**
	 * @return the mcaMark
	 */
	public float getMcaMark() {
		return mcaMark;
	}
	/**
	 * @param mcaMark the mcaMark to set
	 */
	public void setMcaMark(float mcaMark) {
		this.mcaMark = mcaMark;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		return result;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Student))
			return false;
		Student other = (Student) obj;
		if (id != other.id)
			return false;
		return true;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", email=" + email
				+ ", password=" + password + ", isPlaced=" + isPlaced
				+ ", role=" + role + ", sscMark=" + sscMark + ", hscMark="
				+ hscMark + ", mcaMark=" + mcaMark + "]";
	}
	
	
}
