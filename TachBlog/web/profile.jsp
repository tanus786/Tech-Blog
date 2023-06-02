
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.User" %>
<% 
    User user = (User)session.getAttribute("currentUser");
    if(user==null){
    response.sendRedirect("login_page.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        <%= user.getName() %><br>
        <%= user.getEmail()%><br>
        <%= user.getAbout()%><br>
    </body>
</html>
