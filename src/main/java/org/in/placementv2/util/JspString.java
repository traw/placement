package org.in.placementv2.util;

/**
 * Created by traw on 17/04/14.
 */
public interface JspString {

    /* Forms ID's */
    public static final String FORM_SEARCH = "formsearch";
    public static final String FORM_ADD_EDIT = "formedit";
    public static final String FORM_SKILL_ADD = "formskilledit";

    /*Form Operation Object */
    public static final String OBJ_STUD = "stud";
    public static final String OBJ_COMP = "comp";
    public static final String OBJ_SKILL = "skill";

     /* Form operation Action */
    public static final String ACTION_ADD = "add";
    public static final String ACTION_EDIT = "edit";
    public static final String ACTION_SEARCH = "search";
    public static final String ACTION_DEL = "del";

    /* Form Component*/
    public static final String TOP_PANEL = "top_panel";
    public static final String BOTTOM_PANEL = "bottom_panel";

    public static final String ALERTS = "alerts";

    /* Form input types */
    public static final String INPUT_TYPE_TEXT = "text";
    public static final String INPUT_TYPE_EMAIL = "email";
    public static final String INPUT_TYPE_CHECKBOX = "checkbox";

    /* Form fields */
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


    /* Form fields for Company */
    public static final String SEARCH_STRING = "Search String";
    public static final String COMP_DESCRIPTION = "comp_description";

    public static final String COMPANY_ID_PLACEHOLDER = "Company ID";
    public static final String COMPANY_NAME_PLACEHOLDER = "Company Name";


    // Form legend field
    public static final String LEGEND_SEARCH_STUD = "Student Search Form";
    public static final String LEGEND_ADD_STUD = "Student Add Form";
    public static final String LEGEND_EDIT_STUD = "Student Edit Form";

    public static final String LEGEND_SEARCH_COMP = "Company Search Form";
    public static final String LEGEND_ADD_COMP = "Company Add Form";
    public static final String LEGEND_EDIT_COMP = "Company Edit Form";


    /* Skill label */
    public static final String LABEL_SKILL_REMOVE = "Select Skills to Remove";
    public static final String LABEL_SKILL_ADD = "Select Skills to Add";
    public static final String LABEL_SKILL_SEARCH = "Select Skills to Search";
}
