<!doctype html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="./css/style_file.css" rel="stylesheet" >
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.6"></script>

    <title>Yummy.</title>

  </head>
  <body style="background-color: #eee" >
    <%@ include file="common/header_admin.jsp" %>
    <div class="container bg-white mt-5 rounded pb-5  pr-">
        
        <h3 style="font-weight:600; padding-top:4%; color:#161108;" class="text-uppercase">ORDERS MANAGING</h3>
        <hr/>
        <div class="text-end">
          
          <button class="btn btn-outline-dark" onclick="window.location.href='admin_dassh.jsp'">Back</button>
        </div>
        <table class="table mt-2" >
        <thead class="bg-dark">
            <tr>
              <th class="text-white text-center fw-normal">Order ID</th>
              <th class="text-white text-center fw-normal">Customer</th>
              <th class="text-white text-center fw-normal">Location</th>
              <th class="text-white text-center fw-normal">Order Status</th>
              <th class="text-white text-center fw-normal">Placed Date  and Time</th>
              <th class="text-white text-center fw-normal">Action</th>
            </tr>
        </thead>
        <tbody class="bg-white" id="placed_order_list">
           
        </tbody>
        </table>
    </div>
     <div class="modal fade" id="viewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header bg-dark">
              <h1 class="modal-title fs-5 text-white" id="exampleModalLabel">Order Details</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div style="background-color:#EDEBD9;" class="p-3 rounded">
                    <div class="mb-1">
                        <h5>Customer's Information</h5>
                    </div>
                    <hr/>
                    <div class="mb-1">
                      <label for="fullName" class="form-label">Customer Name : Kasun Tharaka</label>
                      
                    </div>
                    <div class="mb-1">
                      <label for="Address" class="form-label">Location: 43/3, Horana , Sri Lanka.</label>
                    </div>
                     <div class="mb-1">
                      <label for="Address" class="form-label">Telephone: 0711811098</label>
                    </div>
                </div>
                <br/>
                <div style="background-color:#EDEBD9;" class="p-3 rounded">
                    <div class="mb-1">
                        <h5>Ordered Items</h5>
                    </div>
                    <hr/>
                     <table class="table mt-2" >
                        <thead class="bg-dark">
                            <tr>
                              <th class="text-white text-center fw-normal">Item ID</th>
                              <th class="text-white text-center fw-normal">Item</th>
                              <th class="text-white text-center fw-normal">Quantity</th>
                              <th class="text-white text-center fw-normal">Price</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white" >
                            <tr>
                              <th class="text-dark text-center fw-normal">011</th>
                              <th class="text-dark text-center fw-normal">Egg Bun</th>
                              <th class="text-dark text-center fw-normal">4</th>
                              <th class="text-dark text-center fw-normal">RS.300.00</th>
                            </tr>
                        </tbody>
                     </table>
                    <center>
                        <h3 class="mt-5">Total Price : Rs. 300.00</h3>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-warning" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-success">Accept</button>
              <button type="button" class="btn btn-danger">Rejecct</button>
            </div>
          </div>
        </div>
    </div>
    <br/>
    
    <script src="https://cdn.tiny.cloud/1/akxn7iktno5jpriljrrs530wh1pnmvfd1w9vgrr0ofx4uuo6/tinymce/5/tinymce.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
    <script src="https://widget.cloudinary.com/v2.0/global/all.js" type="text/javascript"></script>
    <script>
       
       
      function showDriverSelection(orderid) {
            $.ajax({
                url: "./servlet_list_driver",
                type: 'POST',
                success: function(data) {
                    console.log(data);
                    var driverDataArray = data.split('!!!!'); 
            
                    var driverOptions = "";
                    driverDataArray.forEach(function(driverData) {
                        
                        var driverProperties = driverData.split(',,'); 
                        var id = driverProperties[0];
                        var name = driverProperties[1];

                        driverOptions += '<option value="' + id + '">' + name + '</option>';
                    });
                    
                    Swal.fire({
                        title: 'Select Driver',
                        html: '<select id="driverSelect" class="form-select">' + driverOptions + '</select>',
                        showCancelButton: true,
                        confirmButtonText: 'Submit',
                        cancelButtonText: 'Cancel',
                        reverseButtons: true,
                        focusConfirm: false,
                        preConfirm: () => {
                            const driverSelect = document.getElementById('driverSelect');
                            const selectedDriver = driverSelect.value;
                            if (!selectedDriver) {
                                Swal.showValidationMessage('Please select a driver');
                            }
                            return selectedDriver;
                        }
                    }).then((result) => {
                        if (result.isConfirmed) {
                            const selectedDriver = result.value;
                            
                            submitDelivery(selectedDriver , orderid);
                            
                        }
                    });
                },
                error: function(error) {
                    console.error("Error fetching driver list:", error);
                }
            });
        }

      

       function submitDelivery(driver , corder_id) {
           console.log("Order ID : " + corder_id+" driver : "+driver);
           $.ajax({
                url: "./servlet_assign_driver", 
                type: 'POST',
                data: {
                    id: corder_id.toString(),
                    newDriver: driver.toString()
                },
                success: function(response) {
                    if (response == "1") {
                        loadPlacedOrders(); 
                        Swal.fire('Success!', 'The order is being delivered by ' + driver + '.', 'success');
                    } else {
                        Swal.fire('Error!', 'Failed to update driver information.', 'error');
                    }
                },
                error: function(error) {
                    Swal.fire('Error!', 'An error occurred while updating driver information.', 'error');
                    console.error("Error updating driver:", error);
                }
            });
        }

        
        function items_list(){
            var myModal = new bootstrap.Modal(document.getElementById('viewModal'));
            myModal.show();
        }
        
        function loadPlacedOrders() {
            $.ajax({
                url: "./servlet_admin_view_all_orders",
                type: 'POST',
                success: function(data) {
                    var placedOrderList = $('#placed_order_list');

                    // Clear the existing table content
                    placedOrderList.empty();

                    var orders = JSON.parse(data);

                    for (var i = 0; i < orders.length; i++) {
                        var order = orders[i];
                        console.log(order);
                        var row = $('<tr>');

                        row.append($('<td class="text-center">').text(order.corder_id));
                        row.append($('<td>').text(order.customer_name));
                        row.append($('<td>').text(order.location));
                        row.append($('<td>').addClass('text-center').text(getStatusMessage(order.status)));

                        row.append($('<td>').addClass('text-center').text(order.order_date));

                        var actionCell = $('<td>').addClass('text-center');
                        
                        if (order.status === '1') {
                            var acceptButton = $('<button>').addClass('btn btn-success me-2').text('Accept').click(function(currentOrder) {
                                return function() {
                                        currentOrder.status = 2;
                                        updateOrderStatus(currentOrder);                             };
                            }(order));

                            var rejectButton = $('<button>').addClass('btn btn-danger').text('Reject').click(function(currentOrder) {
                                return function() {
                                        currentOrder.status = 0;
                                        updateOrderStatus(currentOrder); 
                                };
                            }(order));

                            actionCell.append(acceptButton);
                            actionCell.append(rejectButton);
                        }else if(order.status === '2'){
                            var deliveryBtn = $('<button>').addClass('btn btn-success').text('Delivery').click(function(currentOrder) {
                                return function() {
                                        currentOrder.status = 3;
                                        
                                        updateOrderStatus2(currentOrder); 
                                };
                            }(order));
                            actionCell.append(deliveryBtn);
                        }
                        
                        row.append(actionCell);
                        placedOrderList.append(row);
                    }
                }
            });
        }

        $(document).ready(function() {
            loadPlacedOrders();
        });
        
        function getStatusMessage(status) {
            switch (status) {
                case '1':
                    return 'Order Placed';
                case '2':
                    return 'Order Accepted';
                case '3':
                    return 'Order Delivered';
                case '0':
                    return 'Order Rejected';
                default:
                    return 'Unknown Status';
            }
        }

        function updateOrderStatus(order) {
            $.ajax({
                url: "./servlet_order_accept_or_reject", 
                type: 'POST',
                data: {
                    orderId : order.corder_id,
                    newStatus : (order.status).toString()
                },
                success: function(response) {
                    
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: 'Order status updated successfully!',
                        timer: 1500 
                    });
                    loadPlacedOrders();
                },
                error: function(error) {
                    console.error("Error updating order status:", error);
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Failed to update order status. Please try again.',
                    });
                }
            });
        }
        
        function updateOrderStatus2(order) {
            
            $.ajax({
                url: "./servlet_order_accept_or_reject", 
                type: 'POST',
                data: {
                    orderId : order.corder_id,
                    newStatus : (order.status).toString()
                },
                success: function(response) {
                   showDriverSelection(order.corder_id); 
                },
                error: function(error) {
                    
                }
            });
        }

    </script>
  </body>
</html>