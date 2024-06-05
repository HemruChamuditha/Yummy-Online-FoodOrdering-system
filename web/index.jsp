<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Food Ordering</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./css/style_file.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
  <body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container">
          <a class="navbar-brand" href="index.jsp" style="font-size:25px; font-weight:700; color: #ce1212;">FRESH GRUB.</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#about">About</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#contact">Contact Us</a>
                </li>
               
            </ul>
            <form class="d-flex" role="search">
                <button class="btn btn-outline-danger" type="button" onclick="join_now()">JOIN NOW</button>
            </form>
          </div>
        </div>
    </nav>
    <div style="background-color: #eee">
        <div class="container" style="padding-top: 6%; padding-bottom: 10%;">
           <div class="row row-cols-1 row-cols-md-2 g-4">
             <div class="col">
               <div class="card border-0 bg-transparent ">
                 
                 <div class="card-body">
                   <h1 class="card-title" style="font-size: 65px;">Enjoy Your Healthy Delicious Food</h1>
                   <p class="card-text " style="letter-spacing: 2px; color:#334d50;">Satisfy Your Cravings, Anytime, Anywhere: Experience the Convenience and Delight of Our Food Delivery Service!</p>
                   
                   <br/>
                   <button class="btn_style text-uppercase">Order Now</button>
                   <button class="btn_style_bg_white"><i  class="bi bi-play-btn"></i> WATCH US</button>
                 </div>
               </div>
             </div>
             <div class="col ">
               <div class="card border-0 bg-transparent ">
                   <center>
                        <img src="https://bootstrapmade.com/demo/templates/Yummy/assets/img/hero-img.png" class="" style="width:60%;" alt="...">
                   </center>
                 </div>
             </div>
           </div>
            
        </div>
    </div>
    <div style="padding-top: 10%;" id="about">
        <div class="container" >
        <h1 class="text-uppercase text-center fw-normal">About Us</h1>
        <br/><br/>
         <div class="row row-cols-1 row-cols-md-2 g-4">
             <div class="col">
                  <img src="./img/shop.jpg" style="width:100%;"/>
             </div>
             <div class="col">
                 <p class="text-muted">Welcome to Yummy, your one-stop destination for delicious food delivered right to your doorstep. We are passionate about providing high-quality, flavorful meals that satisfy your cravings and make your taste buds dance.</p>
    
                <p class="text-muted">At Yummy, we believe that great food should be accessible and convenient. That's why we've created an easy-to-use online platform where you can explore a wide range of culinary delights and have them delivered directly to you.</p>

                <p class="text-muted">Why choose Yummy?</p>

                <ol>
                  <li class="text-muted">Extensive menu featuring a diverse selection of dishes for all tastes and dietary preferences.</li>
                  <li class="text-muted">Fresh, locally-sourced ingredients ensuring every bite is bursting with flavor and nutrition.</li>
                  <li class="text-muted">Effortless online ordering through our user-friendly website and mobile app.</li>
                  <li class="text-muted">Real-time order tracking to keep you updated on the status of your delivery.</li>
                  <li class="text-muted">Convenient and secure payment options for a seamless checkout experience.</li>
                  <li class="text-muted">Fast and reliable delivery service, ensuring your food arrives fresh and on time.</li>
                  <li class="text-muted">Special offers and discounts for loyal customers.</li>
                  <li class="text-muted">Responsive customer support, ready to assist you with any inquiries or concerns.</li>
                  <li class="text-muted">Flexible delivery options to cater to your schedule and location.</li>
                  <li class="text-muted">Commitment to highest standards of food preparation, hygiene, and safety.</li>
                </ol>

                <p class="text-muted">Join us on this culinary adventure and experience the joy of convenient, delicious food delivered right to your door. Whether you're craving a quick snack, planning a family meal, or hosting a special occasion, Yummy is here to serve you.</p>
             </div>
         </div>
        </div>
    </div>
    <div style="padding-top: 10%;" id="contact">
       <div class="container" >
       <h1 class="text-uppercase text-center fw-normal">Contact Us</h1>
       <br/><br/>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63350.80992308565!2d79.87106062119912!3d7.076553389018986!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2f740b8451b07%3A0x7a32909a84e124c9!2sJa-Ela%2C%20Sri%20Lanka!5e0!3m2!1sen!2suk!4v1689574740091!5m2!1sen!2suk" style='width:100%;' height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            <div class="row" style="margin-top: 5%;">
                <div class="col p-4" style="background-color: #EAEAE2; border: 10px solid white; ">
                    <h4>Our Address</h4>
                    <p class="text-muted"> 43/2, Horana, Sri Lanka</p>
                </div>
                <div class="col p-4" style="background-color: #EAEAE2; border: 10px solid white;">
                    <h4>Email Address</h4>
                    <p class="text-muted">yummy@gmail.com</p>
                </div>
            </div>
            <div class="row" >
                <div class="col p-4" style="background-color: #EAEAE2; border: 10px solid white; ">
                    <h4>Call Us</h4>
                    <p class="text-muted">+ 94 71 10 22098</p>
                </div>
                <div class="col p-4" style="background-color: #EAEAE2; border: 10px solid white;">
                    <h4>Opening Hours</h4>
                    <p class="text-muted">Mon-Sat: 11AM - 23PM; Sunday: Closed</p>
                </div>
            </div>
       </div>
    </div>
    <div style=" padding-bottom: 25%;">
       <div class="container" >
           <br/><br/>
           <div class="row">
               <div class="col">
                   <input type="text" class="form-control form-control-lg" placeholder="Your Name" id="name"/>
               </div>
               <div class="col">
                   <input type="text" class="form-control form-control-lg" placeholder="Your Email" id="email"/>
               </div>
           </div>
           <div class="row mt-3">
               <div class="col">
                   <input type="text" class="form-control form-control-lg" placeholder="Subject" id="subject"/>
               </div>
           </div>
           <div class="row mt-3">
               <div class="col">
                <textarea class="form-control" rows="6" value="Message" id="message"></textarea>
               </div>
           </div>
           <div class="row mt-3">
               <div class="col text-center">
                    
                        <button class="btn btn-danger text-uppercase" type="button" onclick="send_Email()">Send Message</button>
                    
               </div>
           </div>
       </div>
    </div>
    <%@ include file="common/footer.jsp" %>
    <script src="https://cdn.emailjs.com/dist/email.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>

    <script>
        function join_now(){ 
            window.location.href="login.jsp";
        }
        
        function send_Email(){
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            var subject = document.getElementById("subject").value;
            var message = document.getElementById("message").value;
            
            emailjs.init("fmLMz3ug7heS17KyE");
            const templateParams = {
                from_name: name,
                from_email: email,
                subject: subject,
                message: message,
            };
            
            emailjs.send("service_6pwgg9k", "template_xev7ghp", templateParams)
            .then(function(response) {
                console.log("Email sent:", response);
                Swal.fire({
                    icon: "success",
                    title: "Email sent successfully!",
                });
            }, function(error) {
                console.error("Email sending failed:", error);
                Swal.fire({
                    icon: "error",
                    title: "Email sending failed.",
                });
            });
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  </body>
</html>