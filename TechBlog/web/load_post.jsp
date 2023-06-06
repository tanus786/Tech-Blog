<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">
    <%
        Thread.sleep(1000);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPost();
        } else {
            posts = d.getPostByCatId(cid);
        }
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No Post In This Category!</h3>");
            return;
        }
        for (Post p : posts) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pic/<%= p.getPics()%>" alt="alt"/>
            <div class="card-body">
                <b><%=  p.getTitle()%></b>
                <p><%= p.getContent()%></p>
<!--                <pre><%=  p.getCode()%></pre>-->

            </div>
            <div class="card-footer text-center">
                <a href="#" class="btn btn-outline-dark btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                <a href="#" class="btn btn-outline-dark btn-sm"><i class="fa fa-commenting-o"></i><span>5</span></a>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-dark btn-sm">Read More</a>
            </div>
        </div>
    </div>



    <%
        }
    %>
</div>