<%@include file="inc/taglibs.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: traw
  Date: 07/04/14
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@page import="org.in.placement.dao.StudentDao" %>
<%@page import="org.in.placement.dao.StudentDaoImpl" %>
<%@page import="org.json.simple.JSONObject" %>
<%@page import="org.slf4j.Logger" %>
<%@page import="org.slf4j.LoggerFactory" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.in.placementv2.model.Student" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>


<%
    Logger logger = LoggerFactory.getLogger(this.getClass());

    JSONObject jsonObject = new JSONObject();
    String errLabel = "error";

    JSONObject studJson = new JSONObject();
    Map<String, String[]> map = request.getParameterMap();
    for (Map.Entry<String, String[]> entry : map.entrySet()) {
        for (String param : entry.getValue()) {
            studJson.put(entry.getKey(), param);
        }
    }

    try {
        Student student = new Student();
        student.setName((String) studJson.get(JspString.NAME_FIELD));
        student.setEmailid((String) studJson.get(JspString.EMAIL_ID_FIELD));
        student.setPlaced(Boolean.parseBoolean((String) studJson.get(JspString.IS_PLACED_FIELD)));
        student.setSscmarks(Float.parseFloat((String) studJson.get(JspString.SSC_MARKS_FIELD)));
        student.setHscmarks(Float.parseFloat((String) studJson.get(JspString.HSC_MARKS_FIELD)));
        student.setMcamarks(Float.parseFloat((String) studJson.get(JspString.MCA_MARKS_FIELD)));

        Set skillSet = new HashSet();
        for (string)
        student.setSkills();
        StudentDao studentDao = new StudentDaoImpl();
        studentDao.saveStudents(student);
        jsonObject.put("Success", "Added Student: " + student.getName());

    } catch (NumberFormatException e) {
        jsonObject.put(errLabel, "Exception Occurred: " + e.getMessage());
    } catch (Exception e) {
        jsonObject.put(errLabel, "Exception Occurred: " + e.getMessage());
        e.printStackTrace();
    } finally {
        logger.error(jsonObject.toJSONString());
        out.print(jsonObject);
        out.flush();
    }
%>
