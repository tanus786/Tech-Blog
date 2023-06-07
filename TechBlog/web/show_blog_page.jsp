<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="Error_page.jsp"  %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postId);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getTitle()%> || TechBlog </title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/MyStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .post-title{
                font-weight: 100;
                fost-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 20px;
            }
            .post-code{

            }
            .post-user{
                font-size: 20px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top: 15px;
            }
            body{
                background: url(Image/bg2.jpg);
                background-size: cover;
                background-attachment: fixed;
            }


        </style>
    </head>
    <body>
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-bookmark-o"></span>  TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><span class="fa fa-thumb-tack"></span>  HOME <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-folder-open-o"></span>  CATEGORIES
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-phone"></span>  CONTACT US</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle = "modal"data-target = "#add-post-modal"><span class="fa fa-paper-plane-o"></span>  Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <a class="nav-link nav-item" href="#" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle-o"></span>  <%= user.getName()%></a>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span>  LOGOUT</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--end of navbar-->

        <!--Main content of Bode-->
        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header bg-dark text-white">
                            <h4 class="post-title"><%= p.getTitle()%></h4>
                        </div>
                        <div class="card-body">
                            <p class="post-content"><%= p.getContent()%></p>
                            <img class="card-img-top my-2" src="blog_pic/<%= p.getPics()%>" alt="alt"/>
                            <br>
                            <br>
                            <div class="post-code">
                                <pre><%= p.getCode()%></pre>
                            </div>
                            <div class="row my-3 row-user">
                                <div class="col-md-8">
                                    <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%>

                                    <p class="post-user">
                                        Posted by :
                                        <a href="#"><%= ud.getUserByUserId(p.getUserId()).getName()%> </a>
                                    </p>
                                </div>
                                <div class="col-md-4">
                                    <p class="post-date"> <%= p.getDate().toLocaleString()%>   </p>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-outline-dark btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                            <a href="#" class="btn btn-outline-dark btn-sm"><i class="fa fa-commenting-o"></i><span>5</span></a>
                        </div>
                    </div>
                </div>
            </div>  
        </div>


        <!--End of main Content of body-->


        <!--Profile modal-->

        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-bg">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" alt="img" style="border-radius: 50%; max-width: 100px;"/><br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
                            <!--Details-->
                            <div id="profile-detail">
                                <table class="table table-striped mt-3">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><%= user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%= user.getGender()%></td> 
                                        </tr>
                                        <tr>
                                            <th scope="row">About:</th>
                                            <td><%= user.getAbout()%></td> 
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered Date:</th>
                                            <td><%= user.getRdate()%></td> 
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--Profile Edit-->
                            <div id="profile-edit" style="display:none;">
                                <h3>Please Edit Carefully!</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID:</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td> <input class="form-control" type="email" name="user_email" value="<%= user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Name:</td>
                                            <td> <input class="form-control" type="text" name="user_name" value="<%= user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password:</td>
                                            <td> <input class="form-control" type="password" name="user_password" value="<%= user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Gender:</td>
                                            <td><%= user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <td>About:</td>
                                            <td> 
                                                <textarea row="4" class="form-control" name="user_about"><%= user.getAbout()%></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile:</td>
                                            <td>
                                                <input class = "form-control" type="file" name="profile"/>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id = "edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end of  profile modal-->

        <!--Post modal-->

        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the Post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            <div class="form-group">
                                <select class="form-control" name = "cid">
                                    <option selected disabled>---Select Category---</option>
                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>                                    
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name ="pTitle" type="text" placeholder="Enter Post Title" class="form-control" />
                            </div>
                            <div class="form-group">
                                <textarea name ="pContent" class="form-control" style="height:200px;" placeholder="Enter Your Content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name ="pCode" class="form-control" style="height:200px;" placeholder="Enter Your Programming Code(If any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select Pic:</label><br>
                                <input name ="pic" type="file"/>

                            </div>
                            <div class="container text-center">
                                <button class="btn btn-primary" type="submit">Post</button>

                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--end of post modal-->

        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="JS/MyJS.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-btn').click(function () {
                    if (editStatus == false) {
                        $('#profile-detail').hide();
                        $('#profile-edit').show();
                        editStatus = true;
                        $(this).text("Back");
                    } else {
                        $('#profile-detail').show();
                        $('#profile-edit').hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }
                });
            });
        </script>
        <!--now add post js-->
        <script>
            $(document).ready(function () {
                $("#add-post-form").on("submit", function (event) {

                    event.preventDefault();
                    let form = new FormData(this);
                    //                    Calling to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //                                    success
                            console.log(data);
                            if (data.trim() === 'done') {
                                swal("Good job!", "Posted Successfully!!", "success");
                            } else {
                                swal("Error!!", "Something Went Wrong!!", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //                                    error
                            swal("Error!!", "Something Went Wrong!!", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                }
                );

            });

        </script>

    </body>
</html>
