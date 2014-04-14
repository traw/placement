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
<%@page import="org.in.placement.model.Student" %>
<%@page import="org.slf4j.Logger" %>
<%@page import="org.slf4j.LoggerFactory" %>
<%@page import="java.util.Enumeration" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="sun.org.mozilla.javascript.internal.json.JsonParser" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="java.util.Map" %>


<%
    Logger logger = LoggerFactory.getLogger(this.getClass());
    String errLabel = "error", errMsg;

    JSONObject responseJsonObject = new JSONObject();

    JSONObject jsonQuery = new JSONObject();
    Map<String, String[]> map = request.getParameterMap();
    for (Map.Entry<String, String[]> entry : map.entrySet()) {
        for (String param : entry.getValue()) {
            jsonQuery.put(entry.getKey(), param);
        }
    }
    StudentDao studentDao = new StudentDaoImpl();
    try {
        List<Student> studentList = studentDao.getStudentsForJSONQuery(jsonQuery);
        if (studentList.size() > 0) {
            JSONArray propertyKeysArray = new JSONArray();
            propertyKeysArray.add("Student ID");
            propertyKeysArray.add("Name");
            propertyKeysArray.add("Email");
            propertyKeysArray.add("Placed");
            propertyKeysArray.add("SSC Marks");
            propertyKeysArray.add("HSC Marks");
            propertyKeysArray.add("MCA Marks");
            responseJsonObject.put("keys", propertyKeysArray);

            JSONArray studentsJsonArray = new JSONArray();
            for (Student student : studentList) {
                JSONArray valueArray = new JSONArray();
                valueArray.add(student.getId());
                valueArray.add(student.getName());
                valueArray.add(student.getEmail());
                valueArray.add(student.isPlaced());
                valueArray.add(student.getSscMark());
                valueArray.add(student.getHscMark());
                valueArray.add(student.getMcaMark());

                studentsJsonArray.add(valueArray);
            }
            responseJsonObject.put("students", studentsJsonArray);
        } else {
            responseJsonObject.put(errLabel, "No Student Found");
        }
    } catch (Exception e) {
        responseJsonObject.put(errLabel, "Exception Occured: " + e.getMessage());
        e.printStackTrace();
    } finally {
        logger.error(responseJsonObject.toJSONString());
        out.print(responseJsonObject);
        out.flush();
    }
%>
