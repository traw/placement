<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tomcat Version</title>
</head>
<body>
Tomcat Version : <%= application.getServerInfo() %><br>
Servlet Specification Version :
<%= application.getMajorVersion() %>.<%= application.getMinorVersion() %> <br>
JSP version :
<%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %><br>
</body>
</html>
