
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
        <%@ include file="common/header_cus.jsp" %>
        <div class="container rounded" style="margin-top: 5%; padding: 5%;  background-image: url('https://i.imgur.com/JiyrXTP.jpeg'); background-size: cover; background-position: center;  transition: background-color 0.3s ease;" >
            <h2 class="text-white text-center"><span class="fw-bold text-warning">HURRY UP!</span> ORDER YOUR FOODS</h2>
        </div>
        <div class="container" style="margin-top: 2%;" >
            <div class="row">
                <div class="col-5">
                      <div class="card bg-white">
                          <div class="card-body" style="padding: 4%;">
                              <img src="https://thefab.lk/wp-content/uploads/2022/03/00000444.jpg" id="productImage" style="width:100%;" /> 
                              <div class="mt-5">
                                  
                                  <h5 class="mt-2 fw-normal">Unit Price : RS.<span id="price"></span></h5>
                                  <br/>
                                  <h5>Quantity</h5>
                                  <input type="number" class="form-control form-control-lg" id="qty" oninput="cal_price()"/>
                                  
                                  <div class="mt-5 text-center">
                                      <h4 class="mt-2 fw-bold">Total Price : <span id="t_price"></span></h4>
                                  </div>
                                 
                              </div>
                          </div>
                          <div class="card-footer border-0">
                              <div class="d-grid gap-2">
                                  <button class="btn btn-danger text-uppercase" type="button" onclick="add_to_cart()">Add To Cart</button>
                              </div>
                          </div>
                      </div>
                </div>
                <div class="col-7">
                    <div class="card bg-white">
                        <div class="card-body" style="padding: 3%;">
                            <h3 id="food_name"></h3>
                            <hr/>
                            <h6>Description : </h6>
                            <div id="description"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/><br/><br/>
    <%@ include file="common/footer.jsp" %>
    <script src="https://cdn.tiny.cloud/1/akxn7iktno5jpriljrrs530wh1pnmvfd1w9vgrr0ofx4uuo6/tinymce/5/tinymce.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
    <script src="https://widget.cloudinary.com/v2.0/global/all.js" type="text/javascript"></script>
    <script>
        
        loadFoodItem();
        function loadFoodItem() {
            const urlParams = new URLSearchParams(window.location.search);
            var id = urlParams.get('id');
            $.ajax({
                url: "./servlet_single_food",
                type: 'POST',
                data : {
                    id : id
                },
                success: function(data) {
                    var jsonObject = JSON.parse(data);
                    console.log(jsonObject);
                    document.getElementById("food_name").innerHTML = jsonObject[0].name;
                    document.getElementById("description").innerHTML = jsonObject[0].description;
                    document.getElementById("price").innerHTML = jsonObject[0].price;
                    var productImage = document.getElementById("productImage");
                        productImage.src = jsonObject[0].img;
                }
            });
        }

      
        function cal_price(){
            document.getElementById("t_price").innerHTML = (document.getElementById("qty").value * document.getElementById("price").innerHTML).toFixed(2);
        }
        
        function add_to_cart() {
            const urlParams = new URLSearchParams(window.location.search);
            var productId = urlParams.get('id');

            $.ajax({
                url: "./servlet_add_order",
                type: 'POST',
                data: {
                    user_id: localStorage.getItem("user_id"),
                    product_id: productId,
                    quantity: document.getElementById("qty").value,
                    price : document.getElementById("price").innerHTML
                },
                success: function(response) {
                    if (response == "1") {
                        Swal.fire({
                            icon: 'success',
                            title: 'Item added to cart',
                            showConfirmButton: true,
                         }).then(function() {
                            window.location.href = 'cus_menu.jsp';
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error adding item to cart',
                            text: 'Please try again later',
                        });
                    }
                },
                error: function(error) {
                    console.error("Error adding item to cart:", error);
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'An error occurred. Please try again later',
                    });
                }
            });
        }

    </script>
    </body>
</html>
