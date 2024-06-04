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
        
        <h3 style="font-weight:600; padding-top:4%; color:#161108;" class="text-uppercase">CUSTOMER MANAGE</h3>
        <hr/>
        <div class="text-end">
          
          <button class="btn btn-outline-dark" onclick="window.location.href='admin_dassh.jsp'">Back</button>
        </div>
        <table class="table mt-2" >
        <thead class="bg-dark">
            <tr>
              <th class="text-white text-center fw-normal">Cus ID</th>
              <th class="text-white text-center fw-normal">Name</th>
              <th class="text-white text-center fw-normal">Telephone Number</th>
              <th class="text-white text-center fw-normal">Address</th>
              <th class="text-white text-center fw-normal">Timestamp</th>
              <th class="text-white text-center fw-normal">Action</th>
            </tr>
        </thead>
        <tbody class="bg-white" id="cus_table">
            
            
        </tbody>
        </table>
    </div>
    
    <br/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
    <script src="https://widget.cloudinary.com/v2.0/global/all.js" type="text/javascript"></script>
    <script>
      
        listCustomer();
        function listCustomer() {
            $.ajax({
                url: "./servlet_all_user",
                type: 'POST',
                success: function(data) {
                    var tableBody = $('#cus_table');

                    // Clear the existing table content
                    tableBody.empty();

                    // Parse the JSON data received from the server
                    var users = JSON.parse(data);

                    // Iterate through the users and populate the table
                    for (var i = 0; i < users.length; i++) {
                        var user = users[i];

                        var row = $('<tr>');
                        row.append($('<td>').text(user.id));
                        row.append($('<td>').text(user.fullName));
                        row.append($('<td>').text(user.telephone));
                        row.append($('<td>').text(user.homeAddress));
                        row.append($('<td>').text(user.timestamp));

                        var actionCell = $('<td>').addClass('text-center');
                        var actionCell = $('<td>').addClass('text-center');
                        var statusButton = $('<button>').addClass('btn btn-sm');

                        if (user.status === "1") {
                            statusButton.addClass('btn-primary').text('Block');
                        } else if (user.status === "0") {
                            statusButton.addClass('btn-success').text('Enable');
                        }

                            statusButton.on('click', createStatusChangeHandler(user));

                        actionCell.append(statusButton);
                        row.append(actionCell);

                        tableBody.append(row);
                    }
                }
            });
        }
        
        function createStatusChangeHandler(user) {
            return function() {
                var newStatus = user.status === "1" ? "0" : "1";
                var statusMessage = newStatus === "1" ? "Block" : "Enable";

                Swal.fire({
                    title: `Are you sure you want to ${statusMessage.toLowerCase()} this user?`,
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes',
                    cancelButtonText: 'Cancel'
                }).then((result) => {
                    if (result.isConfirmed) {
                         $.ajax({
                            url: "./servlet_user_status_change",
                            type: 'POST',
                            data: { userId: user.id, newStatus: newStatus },
                            success: function(response) {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Success',
                                    text: `User status updated successfully!`
                                });
                                listCustomer();
                                statusButton.text(statusMessage);
                                if (newStatus === "1") {
                                    statusButton.removeClass('btn-success').addClass('btn-primary');
                                } else {
                                    statusButton.removeClass('btn-primary').addClass('btn-success');
                                }
                            },
                            error: function(error) {
                                console.error("Error updating user status:", error);
                            }
                        });
                    }
                });
            };
        }


        
    </script>
  </body>
</html>