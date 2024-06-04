
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
            <h2 class="text-white text-center"><span class="fw-bold text-warning">YOUR CART</span></h2>
        </div>
        <div class="container " style="margin-top: 2%;" >
            <div class="row  mb-5">
                
                <div class="col-9 ">
                    <div class="card bg-white">
                        <div class="card-body" style="padding: 3%;">
                            <h3>CART ITEM</h3>
                            <hr/>
                             <table class="table mt-2" >
                                <thead >
                                    <tr>
                                      <th class="text-white text-center fw-normal bg-dark">Item ID</th>
                                      <th class="text-white text-center fw-normal bg-dark">Item Name</th>
                                      <th class="text-white text-center fw-normal bg-dark">Quantity</th>
                                      <th class="text-white text-center fw-normal bg-dark">Unit Price</th>
                                      <th class="text-white text-center fw-normal bg-dark">T. Price</th>
                                      <th class="text-white text-center fw-normal bg-dark">Remove</th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white" id="cart_tbl">
                                   
                                </tbody>
                             </table>
                        </div>
                </div>
                </div>
                <div class="col-3">
                    <div class="card bg-white">
                        <div class="card-body">
                            <div class="text-center pt-3">
                                <h2 >RS. <span id="t_price"></span></h2>
                                <h5>Total Price</h5>
                            </div>
                            <hr/>
                            <div id="paypal-container"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <%@ include file="common/footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
        <script src="https://widget.cloudinary.com/v2.0/global/all.js" type="text/javascript"></script>

        <script>
            var itemList = []; 
            var t_price = 0.0;
            fun_load_order();
            function fun_load_order(){
                 $.ajax({
                    url: "./servlet_ordered_list",
                    type: 'POST',
                    data : {
                        user_id : localStorage.getItem("user_id")
                    },
                    success: function(data) {
                        var orderData = JSON.parse(data);
                        var cartTableBody = document.getElementById('cart_tbl');
                            cartTableBody.innerHTML = '';
                        for (var i = 0; i < orderData.length; i++) {
                            var order = orderData[i];
                            console.log(order);
                            itemList.push(orderData[i].order_id);
                            
                            t_price = t_price + parseFloat((order.quantity * order.price));
                            document.getElementById("t_price").innerHTML = t_price.toFixed(2);
                            
                            var row = document.createElement('tr');
                            row.innerHTML = `
                                <td class="text-center">`+order.order_id+`</td>
                                <td class="text-center">`+order.food_name+`</td>
                                <td class="text-center">`+order.quantity+`</td>
                                <td class="text-center">Rs.`+order.price+`</td>
                                <td class="text-center">Rs.`+(order.quantity * order.price)+`</td>
                                <td class="text-center">
                                    <button class="btn btn-danger btn-sm" onclick="removeCartItem(`+order.order_id+`)">Remove</button>
                                </td>
                            `;

                            cartTableBody.appendChild(row);
                        }
                    }
                });
            }
            
            function removeCartItem(id){
                Swal.fire({
                    title: 'Are you sure you want to remove this item from the cart?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes',
                    cancelButtonText: 'Cancel'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: './servlet_order_item_delete',
                            method: 'POST',
                            data: { id: id },
                            success: function(response) {
                                Swal.fire('Deleted!', 'Cart item has been deleted.', 'success');
                                fun_load_order();
                            },
                            error: function(xhr, status, error) {
                                Swal.fire('Error', 'An error occurred while deleting the driver profile.', 'error');
                            }
                        });
                    }
                });
           }
           
         

        </script>
        <script src="https://www.paypal.com/sdk/js?client-id=ATWrJS52s-x3Bv35BnBe85xLXFbVDfCumhZ4aeCWsd_2QXDJ_yQUyKfNKW7NybJY5Ex-yJdaZInSeTVr"></script>

        <script>
            paypal.Buttons({
                createOrder: function(data, actions) {
                    return actions.order.create({
                        purchase_units: [{
                            amount: {
                                value: document.getElementById("t_price").innerHTML 
                                
                            }
                        }]
                    });
                },
                onApprove: function(data, actions) {
                    return actions.order.capture().then(function(details) {
                        console.log('Transaction completed:', details);
                        var shippingAddress = details.purchase_units[0].shipping.address;
                        console.log(shippingAddress);
                        var address = shippingAddress.address_line_1 + ' , ' +
                                      shippingAddress.admin_area_2 + ', ' +
                                      shippingAddress.admin_area_1 + ', ' +
                                      shippingAddress.country_code + ', ' +
                                      shippingAddress.postal_code;
                        console.log(address);
                  
                        fun_place_order(localStorage.getItem("user_id") , itemList , address);
                    });
                },
                onError: function(error) {
                    console.error('Error:', error);
                }
            }).render('#paypal-container'); 
            
            function fun_place_order(user_id , itemList , address) {
                $.ajax({
                    url: "./servlet_place_order", 
                    type: "POST",
                    data: {
                        user_id: user_id
                    },
                    success: function(response) {
                        console.log(response);
                        if (parseInt(response) === 1) {
                           
                                fun_complete_placing_order(itemList , address);
                                fun_load_order();
                            
                        } else {
                            Swal.fire({
                                icon: "error",
                                title: "Oops... Level 02",
                                text: "Something went wrong. Please try again.",
                            });
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log("Error:", error);
                        Swal.fire({
                            icon: "error",
                            title: "Oops... Level 02",
                            text: "An error occurred. Please try again later.",
                        });
                    }
                });
            }
            
          function fun_complete_placing_order(itemList , address) {
            var itemList = itemList.join(','); 
            var cusId = localStorage.getItem("user_id"); 
            var totalPrice = document.getElementById("t_price").innerHTML; 

            $.ajax({
                url: "./servlet_complete_order_placing",
                type: 'POST',
                data: {
                    itemList: itemList,
                    cusId: cusId,
                    totalPrice: totalPrice,
                    location : address
                },
                success: function(response) {
                    if (parseInt(response) === 1) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Order Placed',
                            text: 'Your order has been successfully placed!',
                            confirmButtonText: 'OK'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = "cus_cart.jsp";
                                
                            }
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error. Level 03',
                            text: 'Failed to place the order. Please try again.',
                            confirmButtonText: 'OK'
                        });
                    }
                },
                error: function() {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'An error occurred while processing your request. Please try again.',
                        confirmButtonText: 'OK'
                    });
                }
            });
        }


        </script> 
    </body>
</html>
