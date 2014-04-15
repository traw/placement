<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@include file="inc/taglibs.jsp" %>
<html>
<head>
    <title>Placement</title>
    <c:import url="inc/meta.jsp"></c:import>

</head>
<body>

<div class="page-container">
    <c:import url="inc/header.jsp"></c:import>
    <div class="container">
        <div class="row row-offcanvas row-offcanvas-left">
            <!-- sidebar -->
            <div class="col-xs-3 col-sm-2 sidebar-offcanvas " id="sidebar" role="navigation">
                <div data-spy="affix" data-offset-top="45" data-offset-bottom="90">
                    <ul class="nav" id="sidebar-nav">
                        <li>
                            <a name="searchstudform.jsp" id="search_student" onclick="getOperation('search_student');"
                               title="Search Student">
                                Search Student
                            </a>
                        </li>
                         <li><a href="#">Add Student</a></li>
                         <li><a href="#">Delete Student</a></li>
                         <li><a href="#">Get Skill</a></li>
                         <li><a href="#">Update Skill</a></li>
                         <li><a href="#">Delete Skill</a></li>
                         <li><a href="#">View Companies</a></li>
                         <li><a href="#">Search Companies</a></li>
                         <li><a href="#">Search Student for company</a></li>
                    </ul>
                </div>
            </div>

            <!-- main area -->
            <div class="col-xs-9 col-sm-9" data-spy="scroll" data-target="#sidebar-nav">
                <div name="operationName" id="scratchpad">
                    <c:import url="searchstudform.jsp"></c:import>
                </div>
                <div name="resultName" id="result_id" class="row hidden"></div>
            </div>
        </div>
        <!-- /.col-xs-12 main -->
    </div>
    <!--/.row-->
    <c:import url="inc/footer.jsp"></c:import>
</div>
<!--/.container-->
<c:import url="inc/commonFunction.jsp"></c:import>
<c:import url="searchstudentform.jsp"></c:import>
<script type="text/javascript" src="searchstudentform.jsp"></script>
</body>
</html>
