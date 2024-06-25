
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
                <h3 class="text-center text-uppercase fw-normal">Sign Up</h3>
                <div class="card">
                    <center>
                        <img src="https://cdn-icons-png.flaticon.com/256/4113/4113036.png" class="card-img-top pt-5" alt="..." style="width: 40%;">
                    </center>
                    <div class="card-body">
                        <div class="mb-3 pt-3">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="name" placeholder="">
                        </div>
                        <div class="mb-3 pt-1">
                            <label for="address" class="form-label">Home Address</label>
                            <input type="text" class="form-control" id="address" placeholder="">
                        </div>
                        <div class="mb-3 pt-1">
                            <label for="telephone" class="form-label">Telephone</label>
                            <input type="tel" class="form-control" id="telephone" placeholder="" oninput="tel_validation()">
                            <small id="tel_validation"></small>
                        </div>
                        <div class="mb-3 pt-1">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="email" placeholder="" oninput="email_validation()">
                            <small id="email_validation"></small>
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
                            <label for="favoriteFood" class="form-label">Favorite Food</label>
                            <select  class="form-select" id="favoriteFood" >
                                <option>Select Favorite Food</option>
                                <option value="pizza">Pizza</option>
                                <option value="burger">Burger</option>
                                <option value="sushi">Sushi</option>
                                <option value="pasta">Pasta</option>
                                <option value="taco">Taco</option>
                                <option value="sushi">Sushi</option>
                                <option value="sandwich">Sandwich</option>
                                <option value="ramen">Ramen</option>
                                <option value="salad">Salad</option>
                                <option value="steak">Steak</option>
                                <option value="ice-cream">Ice Cream</option>
                                <option value="curry">Curry</option>
                                <option value="hot-dog">Hot Dog</option>
                                <option value="sushi">Sushi</option>
                                <option value="noodles">Noodles</option>
                                <option value="chicken-wings">Chicken Wings</option>
                                <option value="pancakes">Pancakes</option>
                                <option value="sushi">Sushi</option>
                                <option value="doughnut">Doughnut</option>
                            </select>
                        </div>

                        <div class="mb-3 pt-1">
                            <div class="text-center">
                                <div class="g-recaptcha" data-sitekey="6LeJCqInAAAAAMPltsa-OHq5XgXaeoWrxeMmTG77"></div>
                            </div>
                            <div class="d-grid gap-2 mt-2">
                                <button class="btn btn-dark text-uppercase" onclick="submit()">Register</button>
                            </div>
                        </div>
                        <br/>
                        <hr/>
                        <div class="text-center" onclick="login_page()">
                            <h6>I have a account.</h6>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
            
            </div>
        </div>
        <br/>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>

        <script>
            function email_validation() {
                var emailInput = document.getElementById("email");
                var emailValidationMsg = document.getElementById("email_validation");

                var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (emailInput.value === "") {
                    emailValidationMsg.innerHTML = "";
                } else if (!emailPattern.test(emailInput.value)) {
                    emailValidationMsg.innerHTML = "Invalid email address";
                    emailValidationMsg.style.color = "red";
                } else {
                    emailValidationMsg.innerHTML = "";
                    emailValidationMsg.style.color = "green";
                }
            }
            
            function tel_validation() {
                var telInput = document.getElementById("telephone");
                var telValidationMsg = document.getElementById("tel_validation");

                var telPattern = /^\d{10}$/;
                if (telInput.value === "") {
                    telValidationMsg.innerHTML = "";
                } else if (!telPattern.test(telInput.value)) {
                    telValidationMsg.innerHTML = "Invalid telephone number. Please enter a 10-digit number.";
                    telValidationMsg.style.color = "red";
                } else {
                    telValidationMsg.innerHTML = "";
                    
                }
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
                    passValidationMsg.style.color = "red";
                } else {
                    passMatchValidationMsg.innerHTML = "Passwords are matched.";
                    passValidationMsg.style.color = "green";
                }
            }
            
            function login_page(){
                window.location.href="login.jsp";
            }
            
            function submit(){
                
                const recaptchaResponse = grecaptcha.getResponse();
                if (recaptchaResponse === "") {
                    Swal.fire({
                        icon: "error",
                        title: "Please check recapture.",
                        text: "You must check grecaptcha to do registration process.",
                    });
                    return;
                }
                
                // Retrieve the form data
                const name = document.getElementById("name").value;
                const address = document.getElementById("address").value;
                const telephone = document.getElementById("telephone").value;
                const email = document.getElementById("email").value;
                const password = document.getElementById("password").value;
                const favoriteFood = document.getElementById("favoriteFood").value;
                
                
                // Send AJAX request to the server to save the user data
                $.ajax({
                    url: "./servlet_user_reg",
                    type: "POST",
                    data: {
                        fullName: name,
                        homeAddress: address,
                        telephone: telephone,
                        emailAddress: email,
                        password: password,
                        favoriteFood: favoriteFood,
                    },
                    success: function (response) {
                          
                        if(parseInt(response) == 1){
                            // Success message
                            Swal.fire({
                                icon: "success",
                                title: "User registration successful!",
                                text: "User has been registered successfully.",
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    // Redirect to login page
                                    window.location.href = "login.jsp";
                                }
                            });
                        }else{
                            Swal.fire({
                                icon: "error",
                                title: "Failed to register user",
                                text: "An error occurred while registering the user. Please try again later.",
                            });
                        }
                    },
                    error: function () {
                        // Error message
                        Swal.fire({
                            icon: "error",
                            title: "Failed to register user",
                            text: "An error occurred while registering the user. Please try again later.",
                        });
                    },
                });
            }
        </script>
    </body>
</html>
