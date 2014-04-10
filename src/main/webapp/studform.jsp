<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>


<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@include file="inc/taglibs.jsp" %>
<html>
<head>
    <base href="<%=basePath%>">

    <title>Placement</title>
    <c:import url="inc/meta.jsp"></c:import>

</head>
<body>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="col-md-12">
            <div class="alert alert-info">
                <h4>Placement Cell</h4>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="col-md-3">
            <!-- left -->
            <a href="#"><strong><i class="glyphicon glyphicon-briefcase"></i> Toolbox</strong></a>
            <hr>
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#"><i class="glyphicon glyphicon-flash"></i> Search Student</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-link"></i> Add Student</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-list-alt"></i> Delete Student</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-book"></i> Get Student Skill</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-briefcase"></i> Delete Skills</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-time"></i> View Companies</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-plus"></i> Search Companies</a></li>
            </ul>
            <hr>
        </div>
        <div class="col-md-9">
            <c:import url="searchstudform.jsp"></c:import>
            <div id="result" class="hidden"></div>
        </div>

        <div id="footer navbar navbar-fixed-bottom">
            <div class="container">
                <c:import url="inc/footer.jsp"></c:import>
            </div>
        </div>
        <%--<div class="footer navbar navbar-fixed-bottom">
            <div class="container">
                <c:import url="inc/footer.jsp"></c:import>
            </div>
        </div>--%>
    </div>
</div>
</body>
</html>
