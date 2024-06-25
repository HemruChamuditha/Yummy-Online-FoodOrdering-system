
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
                <h3 class="text-center text-uppercase fw-normal">Password Reset</h3>
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
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" placeholder="" oninput="pass_validation()">
                            <small id="pass_validation"></small>
                        </div>
                        <div class="mb-3 pt-1">
                            <label for="confirmPassword" class="form-label">Confirm Password</label>
                            <input type="password" class="form-control" id="confirmPassword" placeholder="" oninput="pass_matching()">
                            <small id="pass_match_validation"></small>
                        </div>
                        <div class="mb-3 pt-1">
                            <div class="d-grid gap-2">
                                <button class="btn btn-dark text-uppercase" onclick="pass_update()">Reset</button>
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
        
          function pass_validation() {
                var passInput = document.getElementById("password");
                var passValidationMsg = document.getElementById("pass_validation");

                var passPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;
                if (passInput.value === "") {
                    passValidationMsg.innerHTML = "";
                } else if (!passPattern.test(passInput.value)) {
                    
                    passValidationMsg.style.color = "red";
                    passValidationMsg.innerHTML = "Password must contain at least 6 characters, \nincluding at least one uppercase letter, \none lowercase letter, and \none number.";
                } else {
                    passValidationMsg.style.color = "green";
                    passValidationMsg.innerHTML = "Strong Password.";
                }
            }
            
            function pass_matching() {
                var passInput = document.getElementById("password");
                var confirmPassInput = document.getElementById("confirmPassword");
                var passMatchValidationMsg = document.getElementById("pass_match_validation");

                if (confirmPassInput.value === "") {
                    passMatchValidationMsg.innerHTML = "";
                } else if (passInput.value !== confirmPassInput.value) {
                    passMatchValidationMsg.innerHTML = "Passwords do not match.";
                    passMatchValidationMsg.style.color = "red";
                } else {
                    passMatchValidationMsg.innerHTML = "Passwords are matched.";
                    passMatchValidationMsg.style.color = "green";
                }
            }
            
           function pass_update() {
                var passInput = document.getElementById("password").value;
                var username = document.getElementById("username").value;

                $.ajax({
                    url: "./pass_update_servlet", 
                    type: 'POST',
                    data: {
                        username: username,
                        newPassword: passInput
                    },
                    success: function(response) {
                        console.log(response)
                        if (parseInt(response) === 1) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Password Update Successful',
                                text: 'Your password has been updated successfully!',
                                confirmButtonText: 'OK'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    window.location.href = "login.jsp"; 
                                }
                            });
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Password Update Failed',
                                text: 'Failed to update password. Please try again later.',
                                confirmButtonText: 'OK'
                            });
                        }
                    },
                    error: function() {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'An error occurred while updating password.',
                            confirmButtonText: 'OK'
                        });
                    }
                });
            }

            
    </script>
</html>
