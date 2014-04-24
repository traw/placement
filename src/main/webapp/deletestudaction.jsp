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


<%
    Logger logger = LoggerFactory.getLogger(this.getClass());

    JSONObject jsonObject = new JSONObject();
    String errLabel = "error", errMsg;
    String studID = (String) request.getParameter("studID");
    try {
        if (studID == null || studID.isEmpty() || Long.parseLong(studID) > 0) {
            errMsg = "Invalid Student Id";
            logger.error("Invalid Student Id" + studID);
            jsonObject.put(errLabel, errMsg);
        } else {
            StudentDao studentDao = new StudentDaoImpl();
            studentDao.deleteStudent(Long.parseLong(studID));
            jsonObject.put("Success", "Deleted Student: " + studID);
        }
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
