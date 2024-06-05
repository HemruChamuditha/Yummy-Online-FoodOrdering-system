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
        
        <h3 style="font-weight:600; padding-top:4%; color:#161108;" class="text-uppercase">FOODS CATEGORY MANAGE</h3>
        <hr/>
        <div class="text-end">
          <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#addModal">Add Foods Category</button>
          <button class="btn btn-outline-dark" onclick="window.location.href='admin_dassh.jsp'">Back</button>
        </div>
        <table class="table mt-2" >
            <thead class="bg-dark">
                <tr>
                  <th class="text-white text-center fw-normal">Category ID</th>
                  <th class="text-white text-center fw-normal">Name</th>
                  <th class="text-white text-center fw-normal">Action</th>
                </tr>
            </thead>
            <tbody class="bg-white"id="food_Category_list">

            </tbody>
        </table>
    </div>
    <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header bg-dark">
              <h1 class="modal-title fs-5 text-white" id="exampleModalLabel">Add Foods Category</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <div class="mb-3">
                <label for="fullName" class="form-label">Category Name</label>
                <input type="text" class="form-control" id="categoryName" placeholder="">
              </div>
              <div class="mb-3">
                <label for="cetegory_img" class="form-label">Image</label>
                <input type="button" class="form-control" value="upload_imge" id="cetegory_img" onclick="uploadImageToCloudinary()" >
                <span id="img_name"></span>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-success" onclick="submit()">Submit</button>
            </div>
          </div>
        </div>
    </div>
    <br/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
    <script src="https://widget.cloudinary.com/v2.0/global/all.js" type="text/javascript"></script>

    <script>
      

        function confirmDelete() {
          Swal.fire({
            title: 'Are you sure?',
            text: 'This action cannot be undone!',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!'
          }).then((result) => {
            if (result.isConfirmed) {
              // Perform delete operation here
              Swal.fire(
                'Deleted!',
                'Your data has been deleted.',
                'success'
              );
            }
          });
        }
        
        function submit(){
             var categoryName = document.getElementById("categoryName").value;
             var img = "Img";
             
             $.ajax({
                type: "POST",
                url: "./servlet_add_food_category", 
                data: {
                    category_name: categoryName,
                    image: document.getElementById("img_name").innerHTML
                },
                success: function(response) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: response, 
                        showConfirmButton: true,
                    });
                    listFoodCategory();
                },
                error: function(xhr, status, error) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Something went wrong!',
                    });
                }
             });
        }
    </script>
    <script>
        function uploadImageToCloudinary() {
            var cloudName = "ddiitrb3o";

            cloudinary.setCloudName(cloudName);

            cloudinary.openUploadWidget(
                {
                    cloudName: cloudName,
                    uploadPreset: "ml_default", 
                    sources: ["local", "url"],
                    multiple: false,
                    cropping: false,
                    defaultSource: "local",
                    clientAllowedFormats: ["png", "jpg", "jpeg"],
                    maxFileSize: 5000000 
                },
                function (error, result) {
                    if (!error && result && result.event === "success") {
                        var imageUrl = result.info.secure_url;
                        document.getElementById("img_name").innerHTML = imageUrl;

                    } else {
                        console.error("Error uploading image:", error);
                    }
                }
            );
        }
        listFoodCategory();
        function listFoodCategory(){
            
            $.ajax({
                url: "./servlet_list_food_category",
                type: 'POST',
                success: function(data) {
                     populateTable(data);
                }
            });
        }
        
        function populateTable(data) {
            var rows = data.split("!!!!"); 

            var tableBody = $("#food_Category_list");
            tableBody.empty();

            for (var i = 0; i < rows.length; i++) {
                var fields = rows[i].split(",,"); 
                var rowHtml = "<tr>" +
                    "<td class='text-center'>" + fields[0] + "</td>" +
                    "<td class='text-center'>" + fields[1] + "</td>" +
                    "<td class='text-center'><button class='btn btn-danger btn-sm' onclick='delete_fc(" + fields[0] + ")'>Delect</button>&nbsp;<button class='btn btn-success btn-sm' onclick='edit_fc(" + fields[0] + ")'>Edit</button></td>" +
                    "</tr>";
                tableBody.append(rowHtml); 
            }
        }
        
        function delete_fc(id) {
            Swal.fire({
                title: 'Confirm Deletion',
                text: 'Are you sure you want to delete this item?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    
                    $.ajax({
                        url: "./servlet_delete_food_category", 
                        type: 'POST',
                        data: { id: id },
                        success: function(data) {
                            console.log(data);
                            if (data == "1") {
                                Swal.fire({
                                    title: 'Success',
                                    text: 'Category name has been updated.',
                                    icon: 'success'
                                });
                                 listFoodCategory();
                            } else {
                                Swal.fire({
                                    title: 'Error',
                                    text: 'An error occurred while updating the category name.',
                                    icon: 'error'
                                });
                            }
                        },
                        error: function() {
                           Swal.fire({
                                title: 'Error',
                                text: 'An error occurred while deleting the item.',
                                icon: 'error'
                            });
                        }
                    });
                }
            });
      }
        
      function edit_fc(id) {
            Swal.fire({
                title: 'Confirm Edit',
                text: 'Are you sure you want to edit this food category?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Yes, edit it',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    edit_action(id);
                }
            });
      }

      function edit_action(id){
          
            Swal.fire({
                title: 'Edit Food Category',
                html:
                    '<input id="newCategoryName" class="swal2-input" placeholder="New Category Name">',
                showCancelButton: true,
                confirmButtonText: 'Edit',
                cancelButtonText: 'Cancel',
                preConfirm: () => {
                    const newCategoryName = Swal.getPopup().querySelector('#newCategoryName').value;
                    if (!newCategoryName) {
                        Swal.showValidationMessage('Please enter a new category name');
                    }
                    return newCategoryName;
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    const newCategoryName = result.value;
                    $.ajax({
                        url: "./servlet_edit_food_category", 
                        type: 'POST',
                        data: { id: id, newCategoryName: newCategoryName },
                        success: function(data) { 
                            if (data == "1") {
                                    Swal.fire({
                                        title: 'Success',
                                        text: 'Category name has been updated.',
                                        icon: 'success'
                                    });
                                    listFoodCategory();
                                
                            } else {
                                Swal.fire({
                                    title: 'Error',
                                    text: 'An error occurred while updating the category name.',
                                    icon: 'error'
                                });
                            }
                        },
                        error: function() {
                            Swal.fire({
                                title: 'Error',
                                text: 'An error occurred while updating the category name.',
                                icon: 'error'
                            });
                        }
                    });
                }
            });
        }

      
    </script>

  </body>
</html>