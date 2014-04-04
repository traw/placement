/**
 * 
 */
package org.in.placement.model;

/**
 * @author traw
 *
 */
public class Marks {
	private double sscMarks;
	private double hscMarks;
	private double mcamarks;
	/**
	 * @param sscMarks
	 * @param hscMarks
	 * @param mcamarks
	 */
	public Marks(double sscMarks, double hscMarks, double mcamarks) {
		super();
		this.sscMarks = sscMarks;
		this.hscMarks = hscMarks;
		this.mcamarks = mcamarks;
	}
	/**
	 * @return the sscMarks
	 */
	public double getSscMarks() {
		return sscMarks;
	}
	/**
	 * @param sscMarks the sscMarks to set
	 */
	public void setSscMarks(double sscMarks) {
		this.sscMarks = sscMarks;
	}
	/**
	 * @return the hscMarks
	 */
	public double getHscMarks() {
		return hscMarks;
	}
	/**
	 * @param hscMarks the hscMarks to set
	 */
	public void setHscMarks(double hscMarks) {
		this.hscMarks = hscMarks;
	}
	/**
	 * @return the mcamarks
	 */
	public double getMcamarks() {
		return mcamarks;
	}
	/**
	 * @param mcamarks the mcamarks to set
	 */
	public void setMcamarks(double mcamarks) {
		this.mcamarks = mcamarks;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(hscMarks);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(mcamarks);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(sscMarks);
		result = prime * result + (int) (temp ^ (temp >>> 32));
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
		if (!(obj instanceof Marks))
			return false;
		Marks other = (Marks) obj;
		if (Double.doubleToLongBits(hscMarks) != Double
				.doubleToLongBits(other.hscMarks))
			return false;
		if (Double.doubleToLongBits(mcamarks) != Double
				.doubleToLongBits(other.mcamarks))
			return false;
		if (Double.doubleToLongBits(sscMarks) != Double
				.doubleToLongBits(other.sscMarks))
			return false;
		return true;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Marks [sscMarks=" + sscMarks + ", hscMarks=" + hscMarks
				+ ", mcamarks=" + mcamarks + "]";
	}	
}
