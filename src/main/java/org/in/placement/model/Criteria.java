package org.in.placement.model;

public class Criteria {
    private long compantID;
    private long skillID;
    private double sscMarks;
    private double hscMarks;
    private double mcaMarks;


    public Criteria() {
    }

    /**
     * @param sscMarks
     * @param hscMarks
     * @param mcaMarks
     */
    public Criteria(long compantID, long skillID, double sscMarks, double hscMarks, double mcaMarks) {
        this.compantID = compantID;
        this.skillID = skillID;
        this.sscMarks = sscMarks;
        this.hscMarks = hscMarks;
        this.mcaMarks = mcaMarks;
    }

    public long getCompantID() { return compantID; }

    public void setCompantID(long compantID) { this.compantID = compantID;}

    public long getSkillID() { return skillID; }

    public void setSkillID(long skillID) { this.skillID = skillID; }

    public double getSscMarks() { return sscMarks; }

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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Criteria criteria = (Criteria) o;

        if (compantID != criteria.compantID) return false;
        if (Double.compare(criteria.hscMarks, hscMarks) != 0) return false;
        if (Double.compare(criteria.mcaMarks, mcaMarks) != 0) return false;
        if (skillID != criteria.skillID) return false;
        if (Double.compare(criteria.sscMarks, sscMarks) != 0) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = (int) (compantID ^ (compantID >>> 32));
        result = 31 * result + (int) (skillID ^ (skillID >>> 32));
        temp = Double.doubleToLongBits(sscMarks);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(hscMarks);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(mcaMarks);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }

    @Override
    public String toString() {
        return "Criteria{" +
                "compantID=" + compantID +
                ", skillID=" + skillID +
                ", sscMarks=" + sscMarks +
                ", hscMarks=" + hscMarks +
                ", mcaMarks=" + mcaMarks +
                '}';
    }
}
