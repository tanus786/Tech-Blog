<%-- 
    Document   : show_blog_page
    Created on : 06-Jun-2023, 4:34:33 pm
    Author     : tanus
--%>
<%
int postId = Integer.parseInt(request.getParameter("post_id"));

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h1><%= postId %></h1>
    </body>
</html>
