<%-- 
    Document   : register_page
    Created on : 02-Jun-2023, 12:38:32 pm
    Author     : tanus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <title>Login Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/MyStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include file = "Navbar.jsp" %>
        <main class="primary-bg p-5 ">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center">
                            <span class="fa fa-user-o fa-2x"></span><br>
                            <h4>Register Here</h4>
                        </div>
                        <div class="card-body">
                            <form id = "reg-form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name = "user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email Address</label>
                                    <input name = "user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name = "user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Select Gender</label><br>
                                    <input type="radio" id="gender" name="gender" value="Male"> Male
                                    <input type="radio" id="gender" name="gender" value="Female"> Female
                                    <input type="radio" id="gender" name="gender" value="Other"> Other
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" name="about" id =""rows="5" placeholder="Enter Something about yourself"></textarea>
                                </div>
                                <div class="form-check">
                                    <input name = "check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
                                </div><br>
                                <div class="container text-center " id="loader" style="display:none;">
                                    <span class = "fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please Wait</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-dark">Submit</button>
                            </form>
                        </div>
                        <div class="card-footer"></div>
                    </div>

                </div>
            </div>

        </main>



        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="JS/MyJS.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("Loaded");
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);
                    $("#submit-btn").hide();
                    $("#loader").show();


                    //send Register servlet

                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#loader").hide();
                            $("#submit-btn").show();
                            if(data.trim()==='done'){
                            swal({
                                title: "Registered Successfully!",
                                text: "Now redirecting to Login Pgage",
                                icon: "success",
                            })
                                    .then((value) => {
                                        window.location = "login_page.jsp"
                                    });
                                }
                                else{
                                    swal(data);
                                }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Something went Wrong..Try again.");
                            $("#loader").hide();
                            $("#submit-btn").show();
                        },
                        processData: false,
                        contentType: false

                    });
                })
            })
        </script>
    </body>
</html>
