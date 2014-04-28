<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.in.placementv2.util.JsonPropertyString" %>
<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="java.util.List" %>
<%@ page import="org.in.placementv2.model.SkillDAO" %>
<%
    String paramObj = request.getParameter(JsonPropertyString.PARAM_OBJ);
    String paramAction = request.getParameter(JsonPropertyString.PARAM_ACTION);
    String input_1_Id = null;
    String input_2_Id = null;
    String input_3_Id = null;
    String input_4_Id = null;
    String input_5_Id = null;
    String input_6_Id = null;
    String input_7_Id = null;

    String input_1_Type = null;
    String input_2_Type = null;
    String input_3_Type = null;
    String input_4_Type = null;
    String input_5_Type = null;
    String input_6_Type = null;
    String input_7_Type = null;

    String select_1_Id = null;
    String select_2_Id = null;
    String select_3_Id = null;
    String select_4_Id = null;

    String placeHolder_1 = null;
    String placeHolder_2 = null;
    String placeHolder_3 = null;

    String legend_string = null;

    if (paramObj.equals(JspString.OBJ_COMP)) {
        input_1_Id = JspString.COMPANY_ID;
        input_2_Id = JspString.SEARCH_STRING;

        input_1_Type = JspString.INPUT_TYPE_TEXT;
        input_2_Type = JspString.INPUT_TYPE_TEXT;

        placeHolder_1 = JspString.COMPANY_ID_PLACEHOLDER;
        placeHolder_2 = JspString.COMPANY_NAME_PLACEHOLDER;

        legend_string = JspString.LEGEND_SEARCH_COMP;
    } else if (paramObj.equals(JspString.OBJ_STUD)) {
        input_1_Id = JspString.ID_FIELD;
        input_2_Id = JspString.NAME_FIELD;
        input_3_Id = JspString.EMAIL_ID_FIELD;
        input_4_Id = JspString.SELECT_IS_PLACED_FIELD;

        input_1_Type = JspString.INPUT_TYPE_TEXT;
        input_2_Type = JspString.INPUT_TYPE_TEXT;
        input_3_Type = JspString.INPUT_TYPE_EMAIL;
        input_4_Type = JspString.INPUT_TYPE_CHECKBOX;

        placeHolder_1 = JspString.STUDENT_ID_PLACEHOLDER;
        placeHolder_2 = JspString.STUDENT_NAME_PLACEHOLDER;

        select_1_Id = JspString.IS_PLACED_FIELD;
        placeHolder_3 = JspString.EMAIL_ID_PLACEHOLDER;

        legend_string = JspString.LEGEND_SEARCH_STUD;
    }

    if (paramObj.equals(JspString.OBJ_STUD) || paramObj.equals(JspString.OBJ_COMP)) {
        input_5_Id = JspString.SSC_MARKS_FIELD;
        input_5_Type = JspString.INPUT_TYPE_TEXT;
        select_2_Id = JspString.SSC_MARKS_CONDITION_FIELD;

        input_6_Id = JspString.HSC_MARKS_FIELD;
        input_6_Type = JspString.INPUT_TYPE_TEXT;
        select_3_Id = JspString.HSC_MARKS_CONDITION_FIELD;

        input_7_Id = JspString.MCA_MARKS_FIELD;
        input_7_Type = JspString.INPUT_TYPE_TEXT;
        select_4_Id = JspString.MCA_MARKS_CONDITION_FIELD;
    }
%>
<form class="form" id="<%= paramObj %>_<%= paramAction %>" name="<%= paramObj %>_<%= paramAction %>" role="form">
    <legend><p class="text-info text-left"><%= legend_string %></p></legend>
    <div class="row">
        <div class="col-sm-4">
            <div class="form-group">
                <input class="form-control" id="<%= input_1_Id %>" name="input_1" size="30"
                       type="<%= input_1_Type %>"
                       placeholder="<%= placeHolder_1 %>">
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <input class="form-control" id="<%= input_2_Id %>" name="input_2" size="30"
                       type="<%= input_2_Type %>"
                       placeholder="<%= placeHolder_2 %>">
            </div>
        </div>
    </div>
    <% if (paramObj.equals(JspString.OBJ_STUD)) { %>
    <div class="row">
        <div class="col-sm-4">
            <div class="form-group">
                <input class="form-control" id="<%= input_3_Id %>" name="input_3" size="30"
                       type="<%= input_3_Type %>"
                       placeholder="<%= placeHolder_3 %>">
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group input-group">
                	<span class="input-group-addon">
        				<input name="input_4" id="<%= input_4_Id %>" type="<%= input_4_Type %>">
      				</span>
                <select name="select_1" id="<%= select_1_Id  %>" class="form-control">
                    <option>IsPlaced</option>
                    <option>Not Placed</option>
                </select>
            </div>
        </div>
    </div>
    <% } %>
    <div class="row">
        <div class="col-sm-4">
            <div class="form-group">
                <input class="form-control" id="<%= input_5_Id %>" name="input_5" size="30"
                       type="<%= input_5_Type %>"
                       placeholder="Student SSC Marks">
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group input-group">
                <span class="input-group-addon">SSC Marks Condition</span>
                <select name="select_2" id="<%= select_2_Id %>" class="form-control">
                    <option></option>
                    <option>=</option>
                    <option>&lt;=</option>
                    <option>&gt;=</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">
            <div class="form-group">
                <input class="form-control" id="<%= input_6_Id %>" name="input_6" size="30"
                       type="<%= input_6_Type %>"
                       placeholder="Student HSC Marks">
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group input-group">
                    <span class="input-group-addon">
        				<span class="">HSC Marks Condition</span>
      				</span>
                <select name="select_3" id="<%= select_3_Id %>" class="form-control">
                    <option></option>
                    <option>=</option>
                    <option>&lt;=</option>
                    <option>&gt;=</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">
            <div class="form-group">
                <input class="form-control" id="<%= input_7_Id %>" name="input_7" size="30"
                       type="<%= input_7_Type %>"
                       placeholder="Student MCA Marks">
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group input-group">
                    <span class="input-group-addon">
        			    <span class="">MCA Marks Condition</span>
      				</span>
                <select name="select_4" id="<%= select_4_Id %>" class="form-control">
                    <option></option>
                    <option>=</option>
                    <option>&lt;=</option>
                    <option>&gt;=</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <span class="label label-default" style="font-size: large"><%= JspString.LABEL_SKILL_SEARCH %></span>
        </div>
        <div class="form-group input-group-sm">
            <div class="col-sm-4 col-sm-offset-0">
                <select name="name" id="<%= JspString.SKILL_SELECT_FIELD %>"
                        class="selectpicker form-control dropupAuto" multiple data-selected-text-format="count">
                    <%
                        SkillDAO skillDAO = new SkillDAO();
                        List<org.in.placementv2.model.Skill> skillList = skillDAO.findAll();
                        for (org.in.placementv2.model.Skill skill : skillList) {
                    %>
                    <option value="<%= skill.getId() %>"><%= skill.getName() %>
                    </option>
                    <% } %>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">
            <button type="button" class="btn center-block bg-primary" onclick="search('<%= paramObj %>', '<%= paramAction %>');" style="width: 159px; ">
                <span>Search</span>
            </button>
        </div>
        <div class="col-sm-4">
            <button type="reset" class="btn bg-primary " style="width: 159px; ">
                <span>Reset</span>
            </button>
        </div>
    </div>
</form>
<div id="<%= JspString.ALERTS %>" class="alert hidden">
    <strong>Error Message </strong>
</div>
<hr/>

