<%@include file="../inc/taglibs.jsp"%>
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


<%
    Logger logger = LoggerFactory.getLogger(this.getClass());

    JSONObject jsonObject = new JSONObject();
    String errLabel = "error", errMsg;
    String studID = (String)request.getParameter("studID");
    if(studID == null || studID.isEmpty()){
        errMsg = "Invalid Student Id";
        logger.error("Invalid Student Id" + studID);
        jsonObject.put(errLabel, errMsg);
    } else {
        StudentDao studentDao = new StudentDaoImpl();
        try {
            Student student = studentDao.getStudentForID(Long.parseLong(studID));
            if(student!= null) {

                JSONArray studPropertyKeysArray = new JSONArray();
                int count = 0;
                studPropertyKeysArray.add(count++, "Student ID");
                studPropertyKeysArray.add(count++, "Name");
                studPropertyKeysArray.add(count++, "Email");
                studPropertyKeysArray.add(count++, "Placed");
                studPropertyKeysArray.add(count++, "SSC Marks");
                studPropertyKeysArray.add(count++, "HSC Marks");
                studPropertyKeysArray.add(count++, "MCA Marks");
                jsonObject.put("keys", studPropertyKeysArray);

                JSONArray studentsJsonArray = new JSONArray();
                int studentsCounter = 0;
                JSONArray studPropertyArray = new JSONArray();
                count = 0;
                studPropertyArray.add(count++, student.getId());
                studPropertyArray.add(count++, student.getName());
                studPropertyArray.add(count++, student.getEmail());
                studPropertyArray.add(count++, student.isPlaced());
                studPropertyArray.add(count++, student.getSscMark());
                studPropertyArray.add(count++, student.getHscMark());
                studPropertyArray.add(count++, student.getMcaMark());
                studentsJsonArray.add(studentsCounter++, studPropertyArray);
                jsonObject.put("students", studentsJsonArray);
            } else {
                jsonObject.put(errLabel, "No Student Found");
            }
        } catch (Exception e) {
            logger.error("Rajdip37: " + studID + ": " + e.getMessage());
            jsonObject.put(errLabel, "Exception Occured: " + e.getMessage());
            e.printStackTrace();
        } finally {
            logger.error(jsonObject.toJSONString());
            out.print(jsonObject);
            out.flush();
        }
    }
  %>

<%--<div name ="studentTable" class="table-responsive">
    <table class="table table-hover table-bordered">
        <caption>
          <h3 align="center">
           <span class="label label-primary">Student</span>
          </h3>
        </caption>
        <thead>
        <tr class="info">
            <c:forEach items="${studentColumns}" var="item">
                <th>${item}</th>
            </c:forEach>
            <th>Student ID</th>
            <th></th>
        </tr>
        </thead>

        <tr>
            <% Student student = (Student) request.getAttribute("student"); %>
            <td><%= student.getId()%></td>
            <td><%= student.getName()%></td>
            <td><%= student.getEmail()%></td>
            <td><%= student.isPlaced()%></td>
            <td><%= student.getSscMark()%></td>
            <td><%= student.getHscMark()%></td>
            <td><%= student.getMcaMark()%></td>
        </tr>
    </table>
</div>--%>
