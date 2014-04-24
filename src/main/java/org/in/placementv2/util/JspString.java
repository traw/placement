package org.in.placementv2.util;

/**
 * Created by traw on 17/04/14.
 */
public interface JspString {

    public static final String OP_SEARCH_STUD = "search_stud";
    public static final String OP_ADD_STUD = "add_stud";
    public static final String OP_SEARCH_COMP = "search_comp";
    public static final String OP_DEL_STUD = "del_stud";
    public static final String OP_ADD_COMP = "add_comp";
    public static final String OP_DEL_COMP = "del_comp";

    public static final String TOP_PANEL = "top_panel";
    public static final String BOTTOM_PANEL = "bottom_panel";

    /* Form input types */
    public static final String INPUT_TYPE_TEXT = "text";
    public static final String INPUT_TYPE_EMAIL = "email";
    public static final String INPUT_TYPE_CHECKBOX = "checkbox";

    /* Student fields */

    static final String ID_FIELD = "Id" ;
    static final String NAME_FIELD = "Name";
    static final String EMAIL_ID_FIELD = "EmailId";
    static final String SELECT_IS_PLACED_FIELD = "select_is_placed";
    static final String IS_PLACED_FIELD = "IsPlaced";
    static final String SSC_MARKS_FIELD = "SscMarks";
    static final String SSC_MARKS_CONDITION_FIELD = "sscmarks_condition";
    static final String HSC_MARKS_FIELD = "HscMarks";
    static final String HSC_MARKS_CONDITION_FIELD = "hscmarks_condition";
    static final String MCA_MARKS_FIELD = "McaMarks";
    static final String MCA_MARKS_CONDITION_FIELD = "mcamarks_condition";
    static final String SKILL_SELECT_FIELD = "selected_skill";
    static final String VALIDATED_FIELD = "validated";

    public static final String STUDENT_ID_PLACEHOLDER = "Student ID";
    public static final String STUDENT_NAME_PLACEHOLDER = "Student Name";
    public static final String EMAIL_ID_PLACEHOLDER = "Email ID";


    /* Company fields */
    public static final String COMPANY_ID = "compID";
    public static final String SEARCH_STRING = "search_string";
    public static final String COMP_DESCRIPTION = "comp_description";

    public static final String COMPANY_ID_PLACEHOLDER = "Company ID";
    public static final String COMPANY_NAME_PLACEHOLDER = "Company Name";


    /* Forms ID's */
    public static final String SEARCH_FORM = "search_form";
    public static final String ADD_COMP_STUD_FORM = "add_comp_stud_form";
    public static final String ADD_SKILL_FORM = "add_skill_form";


}
