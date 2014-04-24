<%@ page import="org.in.placementv2.util.JsonPropertyString" %>
<%@ page import="org.in.placementv2.util.JspString" %>
<%
    String operation = request.getParameter(JsonPropertyString.PARAM_OPERATION);
    String name_placeholder = null;
    if(operation.equals(JspString.OP_ADD_COMP)) {
        name_placeholder = JspString.COMPANY_NAME_PLACEHOLDER;
    } else if (operation.equals(JspString.OP_ADD_STUD)) {
        name_placeholder = JspString.STUDENT_NAME_PLACEHOLDER;
    }
%>
<div class="container">
    <form role="form" id="<%= JspString.ADD_COMP_STUD_FORM %>" name="<%= JspString.ADD_COMP_STUD_FORM %>"
          onsubmit="editStudOrComp(this);">
        <legend><p class="text-info text-left">Student Add Form</p></legend>
        <div class="row form-group">
            <div class="col-sm-4">
                <input type="hidden" id="<%= JspString.ID_FIELD %>" name="<%= JspString.ID_FIELD%>" value="">
                <input type="text" class="form-control" id="<%= JspString.NAME_FIELD %>" placeholder="<%= name_placeholder %>">
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
        <% if (operation.equals(JspString.OP_ADD_STUD)) { %>
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
        <% if (operation.equals(JspString.OP_ADD_COMP)) { %>
        <div class="row form-group">
            <div class="col-sm-8">
                <textarea class="form-control" rows="2" id="<%= JspString.COMP_DESCRIPTION %>" placeholder="Description"></textarea>
            </div>
        </div>
        <% } %>
        <div class="row form-group">
            <div class="col-sm-4">
                <button type="submit" class="btn btn-default">Submit</button>
            </div>
            <div class="col-sm-4">
                <button type="reset" class="btn btn-default">Reset</button>
            </div>
        </div>

    </form>
    <div class="row">
        <div class="col-sm-7 alert">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                <span class="glyphicon glyphicon-remove"></span>&times;
            </button>
            <strong>Response</strong> Alert body ...
        </div>
    </div>
</div>