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
                    <ul class="nav nav-tabs" id="sidebar-nav">
                        <li>
                            <a class="btn btn-small btn-link" name="search" id="<%= JspString.OBJ_STUD %>"
                               onclick="getOperation('<%= JspString.FORM_SEARCH %>',
                                       '<%= JspString.OBJ_STUD %>', '<%= JspString.ACTION_SEARCH %>');"
                               title="Search Student">
                                Search Student
                            </a>
                        </li>
                        <li>
                            <a class="btn btn-small btn-link" name="addstudent.jsp" id="<%= JspString.OBJ_STUD %>"
                               onclick="getOperation('<%= JspString.FORM_ADD_EDIT%>',
                                       '<%= JspString.OBJ_STUD %>', '<%= JspString.ACTION_ADD %>')"
                               title="Add Student">
                                Add Student
                            </a>
                        </li>
                        <li>
                            <a class="btn btn-small btn-link" name="search" id="<%= JspString.OBJ_COMP %>"
                               onclick="getOperation('<%= JspString.FORM_SEARCH%>',
                                       '<%= JspString.OBJ_COMP %>', '<%= JspString.ACTION_SEARCH %>');"
                               title="Search Company">
                                Search Companies
                            </a>
                        </li>
                        <li>
                            <a class="btn btn-small btn-link" name="add" id="<%= JspString.OBJ_COMP %>"
                               onclick="getOperation('<%= JspString.FORM_ADD_EDIT %>',
                                       '<%= JspString.OBJ_COMP %>', '<%= JspString.ACTION_ADD %>');"
                               title="Add Compnay">
                                Add Company
                            </a>
                        </li>
                        <li><a class="btn btn-small btn-link" href="#">Get Skill</a></li>
                        <li><a class="btn btn-small btn-link" href="#">Update Skill</a></li>
                        <li><a class="btn btn-small btn-link" href="#">Delete Skill</a></li>
                        <li><a class="btn btn-small btn-link" href="#">View Companies</a></li>
                        <li><a class="btn btn-small btn-link" href="#">Search Student for company</a></li>
                    </ul>
                </div>
            </div>

            <!-- main area -->
            <div class="col-xs-9 col-sm-9" data-spy="scroll" data-target="#sidebar-nav">
                <div name="operationName" id="<%= JspString.TOP_PANEL %>">
                    <%--<c:import url="formsearch.jsp"></c:import>--%>
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
<c:import url="/validate.jsp"></c:import>
<c:import url="/inc/commonFunction.jsp"></c:import>
</body>
</html>
