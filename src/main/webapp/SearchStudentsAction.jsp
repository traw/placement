<%@include file="inc/taglibs.jsp" %>
<%@page import="org.slf4j.Logger" %>
<%@page import="org.slf4j.LoggerFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.in.placementv2.model.StudentDAO" %>
<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.in.placementv2.model.Student" %>


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
    StudentDAO studentDao = new StudentDAO();
    try {
        List<Student> studentList = studentDao.findStudentForJSONQuery(jsonQuery);
        if (studentList.size() > 0) {
            JSONArray propertyKeysArray = new JSONArray();
            propertyKeysArray.add(JspString.ID_FIELD);
            propertyKeysArray.add(JspString.NAME_FIELD);
            propertyKeysArray.add(JspString.EMAIL_ID_FIELD);
            propertyKeysArray.add(JspString.IS_PLACED_FIELD);
            propertyKeysArray.add(JspString.SSC_MARKS_FIELD);
            propertyKeysArray.add(JspString.HSC_MARKS_FIELD);
            propertyKeysArray.add(JspString.MCA_MARKS_FIELD);
            responseJsonObject.put("keys", propertyKeysArray);

            JSONArray studentsJsonArray = new JSONArray();
            for (Student student : studentList) {
                JSONArray valueArray = new JSONArray();
                valueArray.add(student.getId());
                valueArray.add(student.getName());
                valueArray.add(student.getEmailid());
                valueArray.add(student.getPlaced());
                valueArray.add(student.getSscmarks());
                valueArray.add(student.getHscmarks());
                valueArray.add(student.getMcamarks());

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
