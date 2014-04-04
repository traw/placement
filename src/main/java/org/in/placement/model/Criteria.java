package org.in.placement.model;

public class Criteria {
	private double sscMarks;
	private double hscMarks;
	private double mcaMarks;
	
	/**
	 * @param sscMarks
	 * @param hscMarks
	 * @param mcaMarks
	 */
	public Criteria(double sscMarks, double hscMarks, double mcaMarks) {
		super();
		this.sscMarks = sscMarks;
		this.hscMarks = hscMarks;
		this.mcaMarks = mcaMarks;
	}

	public double getSscMarks() {
		return sscMarks;
	}

	public void setSscMarks(double sscMarks) {
		this.sscMarks = sscMarks;
	}

	public double getHscMarks() {
		return hscMarks;
	}

	public void setHscMarks(double hscMarks) {
		this.hscMarks = hscMarks;
	}

	public double getMcaMarks() {
		return mcaMarks;
	}

	public void setMcaMarks(double mcaMarks) {
		this.mcaMarks = mcaMarks;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(hscMarks);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(mcaMarks);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(sscMarks);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Criteria other = (Criteria) obj;
		if (Double.doubleToLongBits(hscMarks) != Double
				.doubleToLongBits(other.hscMarks))
			return false;
		if (Double.doubleToLongBits(mcaMarks) != Double
				.doubleToLongBits(other.mcaMarks))
			return false;
		if (Double.doubleToLongBits(sscMarks) != Double
				.doubleToLongBits(other.sscMarks))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Criteria [sscMarks=" + sscMarks + ", hscMarks=" + hscMarks
				+ ", mcaMarks=" + mcaMarks + "]";
	}		
	
}
