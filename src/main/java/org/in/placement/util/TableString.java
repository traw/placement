package org.in.placement.util;

/**
 * Created by traw on 17/04/14.
 */
public interface TableString {

    /* Table Names */
    static final String STUDENT_TABLE = "student";
    public static final String COMAPNY_TABLE = "company";
    public static final String COMPANY_CRITERIA_TABLE = "company_criteria";
    public static final String COMPANY_SKILL_TABLE = "company_skill";
    public static final String SKILL_TABLE = " skill ";

    /* student Table Columns */
    static final String STUDENT_ID_COL = "id";
    static final String STUDENT_NAME_COL = "name";
    static final String EMAIL_ID_COL = "emailid";
    static final String PASSWORD_COL = "password";
    static final String IS_PLACED_COL = "placed";
    static final String SSC_MARKS_COL = "sscmarks";
    static final String HSC_MARKS_COL = "hscmarks";
    static final String MCA_MARKS_COL = "mcamarks";

    /* skill Table Columns */
    static final String SKILL_ID_COL = "id";
    static final String SKILL_NAME_COL = "name";

    /*student_skill Table columns */
    static final String STUDENT_SKILL_TABLE = "student_skill";
    static final String STUDENTSKILL_STUDENT_ID_COL = "student_id";
    static final String STUDENTSKILL_SKILL_ID_COL = "skill_id";


    /* Company table columns */
    public static final String COMAPNY_ID_COL = "id";
    public static final String COMAPNY_NAME_COL = "name";
    public static final String COMPANY_DESCRIPTION_COL = "description";
    public static final String COMP_SSC_MARKS_COL = "sscmarks";
    public static final String COMP_HSC_MARKS_COL = "hscmarks";
    public static final String COMP_MCA_MARKS_COL = "mcamarks";


    /* company_skill Table columns */
    public static final String COMPANYSKILL_COMPANY_ID_COL = "company_id";
    public static final String COMPANYSKILL_SKILL_ID_COL = "skill_id";
}
