/**
 * 
 */
package org.in.placement.model;

/**
 * @author traw
 *
 */
public enum ROLE {
	STUDENT("student"),
	PLACEMENT_OFFICER("placement officer");
	
	private final String role;
	private ROLE(String role) {
		this.role = role;
	}
	
	
	boolean equals(String roleName) {
		
		return roleName == null ? false : this.role.equalsIgnoreCase(roleName);
	}
	
	@Override
	public String toString() {
		return role;
	}
}
