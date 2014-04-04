<%@page import="org.in.placement.dao.UserDaoImpl"%>
<%@page import="org.in.placement.dao.UserDao"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="org.in.placement.util.*" %>
<%
    String username= request.getParameter("uname");   
    String password = request.getParameter("pass");
    UserDao userDao = new UserDaoImpl();
    if (userDao.containUser(username, password)) {
        session.setAttribute("userid", username);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>

