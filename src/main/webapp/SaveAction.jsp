<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.in.placementv2.util.JsonPropertyString" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="SaveStud.jsp" %>
<%@ include file="SaveCompany.jsp" %>
<%@include file="SaveSkill.jsp" %>
<%
    Logger logger = LoggerFactory.getLogger(this.getClass());
    String object = request.getParameter(JsonPropertyString.PARAM_OBJ);
    String action = request.getParameter(JsonPropertyString.PARAM_ACTION);
    logger.error("SAVE_ACTION: OBJ= " + object+", ACT= " + action);
    if (object.equals(JspString.OBJ_STUD)) {
        saveStudent(request, response, out);
    } else if (object.equals(JspString.OBJ_COMP)) {
        saveCompany(request, response, out);
    } else if (object.equals(JspString.OBJ_SKILL)){
        saveSkill(request, response, out);
    }
%>