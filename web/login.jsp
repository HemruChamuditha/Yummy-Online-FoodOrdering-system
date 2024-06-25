
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Food Ordering</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./css/style_file.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
    <body style="background-color: #eee">
        <%@ include file="common/header.jsp" %>
        <div class="container" >
            
        <div class="row row-cols-1 row-cols-md-3 g-4 " style="margin-top: 7%;">
            <div class="col">
            
            </div>
            <div class="col">
                <h3 class="text-center text-uppercase fw-normal">Sign in</h3>
                <div class="card">
                    <center>
                        <img src="https://cdn-icons-png.flaticon.com/256/4113/4113036.png" class="card-img-top pt-5" alt="..." style="width: 40%;">
                    </center>
                    <div class="card-body">
                        <div class="mb-3 pt-3">
                            <label for="username" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="username" placeholder="">
                        </div>
                        <div class="mb-3 pt-1">
                            <label for="pass" class="form-label">Password</label>
                            <input type="password" class="form-control" id="pass" placeholder="">
                        </div>
                        <div class="mb-3 pt-1">
                            <div class="d-grid gap-2">
                                <button class="btn btn-dark text-uppercase" onclick="login()">Login</button>
                            </div>
                            <div class="text-end" style="cursor: pointer;" onclick="pass_reset()">
                                <h6>Password Reset</h6>
                            </div>
                        </div>
                        <br/>
                        <hr/>
                        <div class="text-center" style="cursor: pointer;" onclick="reg_page()">
                            <h6>I do not have a account.</h6>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
            
            </div>
        </div>
        <br/>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
    <script>
        function reg_page(){
            window.location.href="reg.jsp";
        }
        
        function pass_reset(){
            window.location.href="pass_reset.jsp";
        }

        function login(){
            
            var username = document.getElementById("username").value;
            var pass = document.getElementById("pass").value;
            $.ajax({
                    url: "./servlet_user_login",
                    type: "POST",
                    data: {
                        username :username,
                        password : pass,
                    },
                    success: function (response) {
                        console.log(response);
                        const array = response.split(',');
                        
                        if(parseInt(response) == "0"){
                            Swal.fire({
                                icon: "error",
                                title: "Login Fail.",
                                text: "An error occurred while login the user. Please try again later.",
                            });
                        }else{
                            if((array[1].replace(/\s/g, '')) === "admin"){
                                // Success message
                                Swal.fire({
                                    icon: "success",
                                    title: "User login successful!",
                                    text: "User has been logged successfully.",
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        // Redirect to login page
                                        window.location.href = "admin_dassh.jsp";
                                    }
                                });
                            }else{

                                Swal.fire({
                                    icon: "success",
                                    title: "User login successful!",
                                    text: "User has been logged successfully.",
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        // Redirect to login page
                                        window.location.href = "cus_menu.jsp";
                                        localStorage.setItem("user_id", array[0]);

                                    }
                                });

                            }
                      }
                    },
                    error: function () {
                        // Error message
                        Swal.fire({
                            icon: "error",
                            title: "Failed to register user",
                            text: "An error occurred while login the user. Please try again later.",
                        });
                    },
             });
        }
    </script>
</html>
