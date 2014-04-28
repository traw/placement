<%@ page import="org.in.placementv2.util.JsonPropertyString" %>
<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.in.placementv2.model.SkillDAO" %>
<%@ page import="org.in.placementv2.model.Skill" %>
<%@ page import="java.util.List" %>
<%

    String obj = request.getParameter(JsonPropertyString.PARAM_OBJ);
    String action = request.getParameter(JsonPropertyString.PARAM_ACTION);
    String name_placeholder = null;
    String legend_placeholder = null;
    String skill_label = null;
    if (action.equals(JspString.ACTION_ADD)) {
        skill_label = JspString.LABEL_SKILL_ADD;
        if (obj.equals(JspString.OBJ_COMP)) {
            name_placeholder = JspString.COMPANY_NAME_PLACEHOLDER;
            legend_placeholder = JspString.LEGEND_ADD_COMP;
        } else if (obj.equals(JspString.OBJ_STUD)) {
            name_placeholder = JspString.STUDENT_NAME_PLACEHOLDER;
            legend_placeholder = JspString.LEGEND_ADD_STUD;
        }
    } else if (action.equals(JspString.ACTION_EDIT)) {
        skill_label = JspString.LABEL_SKILL_REMOVE;
        if (obj.equals(JspString.OBJ_COMP)) {
            name_placeholder = JspString.COMPANY_NAME_PLACEHOLDER;
            legend_placeholder = JspString.LEGEND_EDIT_COMP;
        } else if (obj.equals(JspString.OBJ_STUD)) {
            name_placeholder = JspString.STUDENT_NAME_PLACEHOLDER;
            legend_placeholder = JspString.LEGEND_EDIT_STUD;
        }
    }
%>
<div class="container">
    <form role="form" id="<%= obj %>_<%= action %>" name="<%= obj %>_<%= action %>">
        <legend><p class="text-info text-left"><%= legend_placeholder %>
        </p></legend>
        <div class="row form-group">
            <div class="col-sm-4">
                <input type="hidden" id="<%= JspString.ID_FIELD %>" name="<%= JspString.ID_FIELD%>" value="">
                <input type="text" class="form-control" id="<%= JspString.NAME_FIELD %>"
                       placeholder="<%= name_placeholder %>">
            </div>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="<%= JspString.SSC_MARKS_FIELD %>" placeholder="SSC Marks">
            </div>
        </div>
        <div class="row form-group">
            <div class="col-sm-4">
                <input type="text" class="form-control" id="<%= JspString.HSC_MARKS_FIELD %>" placeholder="HSC Marks">
            </div>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="<%= JspString.MCA_MARKS_FIELD %>" placeholder="MCA Marks">
            </div>
        </div>
        <% if (obj.equals(JspString.OBJ_STUD)) { %>
        <div class="row form-group">
            <div class="col-sm-4">
                <div class="checkbox">
                    <label> <input type="checkbox" id="<%= JspString.IS_PLACED_FIELD %>"> Is Placed </label>
                </div>
            </div>
            <div class="col-sm-4">
                <input type="email" class="form-control" id="<%= JspString.EMAIL_ID_FIELD %>" placeholder="Email ID">
            </div>
        </div>
        <% } %>
        <% if (obj.equals(JspString.OBJ_COMP)) { %>
        <div class="row form-group">
            <div class="col-sm-8">
                <textarea class="form-control" rows="2" id="<%= JspString.COMP_DESCRIPTION %>"
                          placeholder="Description"></textarea>
            </div>
        </div>
        <% } %>
        <div class="row">
            <div class="col-lg-4">
                <span class="label label-default" style="font-size: large"><%= skill_label %></span>
            </div>
            <div class="form-group input-group-sm">
                <div class="col-sm-4 col-sm-offset-0">
                    <select name="name" id="<%= JspString.SKILL_SELECT_FIELD %>"
                            class="selectpicker form-control dropupAuto" multiple data-selected-text-format="count">
                        <%
                            if (action.equals(JspString.ACTION_ADD)) {
                                SkillDAO skillDAO = new SkillDAO();
                                List<Skill> skillList = skillDAO.findAll();
                                for (org.in.placementv2.model.Skill skill : skillList) {
                        %>
                        <option value="<%= skill.getId() %>"><%= skill.getName() %>
                        </option>
                        <% }
                        }%>
                    </select>
                </div>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-sm-4">
                <button type="submit" class="btn btn-success" onclick="saveStudOrComp('<%= obj %>', '<%= action %>');">Save</button>
            </div>
            <div class="col-sm-4">
                <button type="reset" class="btn btn-default">Reset</button>
            </div>
        </div>
    </form>
    <div class="row">
        <div class="col-sm-7 alert-danger hidden">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                <span class="glyphicon glyphicon-remove-circle"></span>
            </button>
            <strong>Response</strong> Alert body ...
        </div>
    </div>
</div>
<div id="<%= JspString.ALERTS %>" class="alert hidden">
    <strong>Error Message </strong>
</div>
<hr/>