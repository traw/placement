/**
 * 
 */
package org.in.placement.model;

/**
 * @author traw
 *
 */
public class Company {
	private long id;
	private String name;
	private String description;
	private float sscMarks;
    private float hscMarks;
    private float mcaMarks;

    public Company() {
    }

    public Company(long id, String name, String description, float sscMarks, float hscMarks, float mcaMarks) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.sscMarks = sscMarks;
        this.hscMarks = hscMarks;
        this.mcaMarks = mcaMarks;
    }

    /**
     *
     * @return id : company id
     */
    public long getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     *
     * @return name : Company name
     */
    public String getName() {
        return name;
    }

    /**
     *
     * @param name : set company name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     *
     * @return description : get company description
     */
    public String getDescription() {
        return description;
    }

    /**
     *
     * @param description : set company description
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     *
     * @return sscMarks : get company criteria for SSC marks
     */
    public float getSscMarks() {
        return sscMarks;
    }

    /**
     *
     * @param  sscMarks : get company criteria for SSC marks
     */
    public void setSscMarks(float sscMarks) {
        this.sscMarks = sscMarks;
    }

    /**
     *
     * @return hscMarks : get company criteria for HSC marks
     */
    public float getHscMarks() {
        return hscMarks;
    }

    /**
     *
     * @param  hscMarks : set company criteria for HSC marks
     */
    public void setHscMarks(float hscMarks) {
        this.hscMarks = hscMarks;
    }

    /**
     *
     * @return hscMarks : get company criteria for mac marks
     */
    public float getMcaMarks() {
        return mcaMarks;
    }
    /**
     *
     * @param mcaMarks :  set company criteria for MCA marks
     */
    public void setMcaMarks(float mcaMarks) {
        this.mcaMarks = mcaMarks;
    }

    /**
     *
     * @param o : Other Company Object (o) to comapre
     * @return
     */
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Company company = (Company) o;

        if (id != company.id) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }

    @Override
    public String toString() {
        return "Company{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", sscMarks=" + sscMarks +
                ", hscMarks=" + hscMarks +
                ", mcaMarks=" + mcaMarks +
                '}';
    }

}
