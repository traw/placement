<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="org.in.placementv2.util.JspString" %>


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
                            <a name="search" id="<%= JspString.OP_SEARCH_STUD %>" onclick="getOperation('<%= JspString.OP_SEARCH_STUD %>');"
                               title="Search Student">
                                Search Student
                            </a>
                        </li>
                        <li>
                            <a name="addstudent.jsp" id="<%= JspString.OP_ADD_STUD %>" onclick="getOperation('<%= JspString.OP_ADD_STUD %>')"
                               title="Add Student">
                                Add Student
                            </a>
                        </li>
                        <li><a href="#">Delete Student</a></li>
                        <li><a href="#">Get Skill</a></li>
                        <li><a href="#">Update Skill</a></li>
                        <li><a href="#">Delete Skill</a></li>
                        <li><a href="#">View Companies</a></li>
                        <li>
                            <a name="search" id="<%= JspString.OP_SEARCH_COMP %>" onclick="getOperation('<%= JspString.OP_SEARCH_COMP %>');"
                               title="Search Company">
                                Search Companies
                            </a>
                        </li>
                        <li><a href="#">Search Student for company</a></li>
                    </ul>
                </div>
            </div>

            <!-- main area -->
            <div class="col-xs-9 col-sm-9" data-spy="scroll" data-target="#sidebar-nav">
                <div name="operationName" id="<%= JspString.TOP_PANEL %>">
                    <%--<c:import url="search.jsp"></c:import>--%>
                </div>
                <div name="resultName" id="<%= JspString.BOTTOM_PANEL %>" class="hidden"></div>
            </div>
        </div>
        <!-- /.col-xs-12 main -->
    </div>
    <!--/.row-->
    <%--<c:import url="inc/footer.jsp"></c:import>--%>
</div>
<!--/.container -->


<c:import url="inc/scripts.jsp"></c:import>
<c:import url="/studentformvalidate.jsp"></c:import>
<c:import url="/inc/commonFunction.jsp"></c:import>
</body>
</html>
