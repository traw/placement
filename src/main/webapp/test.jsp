<%@ page import="org.in.placement.dao.StudentDao" %>
<%@ page import="org.in.placement.dao.StudentDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="org.in.placement.model.Student" %>
<%--
  Created by IntelliJ IDEA.
  User: traw
  Date: 06/04/14
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

 <%@include file="inc/taglibs.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><fmt:message key="login.title"/></title>
</head>
<body>
<c:import url="inc/logo.jsp"></c:import>
<%
    StudentDao studentDao = new StudentDaoImpl();
    List<Student> students = studentDao.getStudents();
    request.setAttribute("studentDisp", students);
%>
<disply:table name="studentDisp">
    <disply:column property="id" title="ID"></disply:column>
    <disply:column property="name" title="Name"></disply:column>
    <disply:column property="email" title="Email ID"></disply:column>
    <disply:column property="password"></disply:column>
    <disply:column property="placed" title="Is Placed"></disply:column>
    <disply:column property="sscMark" title="SSC marks"></disply:column>
    <disply:column property="hscMark" title="HSC Marks"></disply:column>
    <disply:column property="mcaMark" title="MCA Marks"></disply:column>
</disply:table>
<H2><fmt:message key="loggedin.msg">
    <fmt:param value="$(requestScope.userid)" />
</fmt:message></H2>

<c:import url="inc/footer.jsp"></c:import>
</body>
</html>