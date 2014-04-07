<%--
  Created by IntelliJ IDEA.
  User: traw
  Date: 07/04/14
  Time: 05:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" type="text/css" href="bootstrap-3.1.1-dist/css/bootstrap.min.css">--%>
</head>
<body>
  <div id="top-nav" class="navbar navbar-left navbar-static-top">
      <div class="container">
          <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                  <span class="icon-toggle"></span>
              </button>
              <a class="navbar-brand" href="#">Dashboard</a>
          </div>
          <div class="navbar-collapse collapse">
              <ul class="nav navbar-nav navbar-right">

                  <li class="dropdown">
                      <a class="dropdown-toggle" role="button" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-user"></i> Admin <span class="caret"></span></a>
                      <ul id="g-account-menu" class="dropdown-menu" role="menu">
                          <li><a href="#">My Profile</a></li>
                      </ul>
                  </li>
                  <li><a href="#"><i class="glyphicon glyphicon-lock"></i> Logout</a></li>
              </ul>
          </div>
      </div><!-- /container -->
  </div>
</body>
</html>
