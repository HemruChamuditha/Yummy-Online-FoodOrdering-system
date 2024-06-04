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
        
        <h3 style="font-weight:600; padding-top:4%; color:#161108;" class="text-uppercase">FOODS MANAGE</h3>
        <hr/>
        <div class="text-end">
          <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#addModal">Add Foods</button>
          <button class="btn btn-outline-dark" onclick="window.location.href='admin_dassh.jsp'">Back</button>
        </div>
        <table class="table mt-2" >
        <thead class="bg-dark ">
            <tr>
              <th class="text-white text-center fw-normal"> ID</th>
              <th class="text-white text-center fw-normal">Name</th>
              <th class="text-white text-center fw-normal">Foods Category</th>
              <th class="text-white text-center fw-normal">Image</th>
              <th class="text-white text-center fw-normal">Action</th>
            </tr>
        </thead>
        <tbody class="bg-white food_tbl">
            
        </tbody>
        </table>
    </div>
    <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header bg-dark">
              <h1 class="modal-title fs-5 text-white" id="exampleModalLabel">Add Foods</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <div class="mb-3">
                <label for="fullName" class="form-label">Food Name</label>
                <input type="text" class="form-control" id="food_name" placeholder="">
              </div>
              <div class="mb-3">
                <label for="cetegory_img" class="form-label">Image</label>
                <input type="button" class="form-control" id="profile_photo" value="Upload File" onclick="uploadImageToCloudinary()">
                <span id="img_name">Please upload image</span>
              </div>
              <div class="mb-3">
                <label for="cetegory_img" class="form-label">Foods Category</label>
                <select  class="form-control" id="foods_category" >
                    <option>Select Foods Category</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="cetegory_img" class="form-label">Price</label>
                <input type="number" class="form-control" id="food_price" >
              </div>
              <div class="mb-3">
                <label for="cetegory_img" class="form-label">Description</label>
                <textarea placeholder="" class="form-control" id="description" rows="3"></textarea>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-success" onclick="save_Data()">Submit</button>
            </div>
          </div>
        </div>
    </div>
    
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header bg-dark">
                    <h1 class="modal-title fs-5 text-white" id="exampleModalLabel">Edit Foods</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="food_name" class="form-label">Food Name</label>
                        <input type="text" class="form-control" id="edit_food_name" placeholder="">
                        <input type="hidden" class="form-control" id="edit_food_id" placeholder="">
                    </div>
                   
                    <div class="mb-3">
                        <label for="foods_category" class="form-label">Foods Category</label>
                        <input class="form-control" id="edit_foods_category" disabled=""/>
                    </div>
                    <div class="mb-3">
                        <label for="food_price" class="form-label">Price</label>
                        <input type="number" class="form-control" id="edit_food_price">
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea placeholder="" class="form-control" id="editdescription" rows="3"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-success" onclick="update_action()">Update</button>
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
        
        var img_path = "";
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
                        img_path = imageUrl;
                        document.getElementById('img_name').innerHTML = imageUrl;
                    } else {
                        console.error("Error uploading image:", error);
                    }
                }
            );
        }
        
        tinymce.init({
            selector: '#description',
            plugins: 'advlist autolink lists link image charmap print preview anchor',
            toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright | bullist numlist outdent indent | link image',
            toolbar_mode: 'floating',
            toolbar_location: 'top',
	    height: 500,
        });
        
        
        tinymce.init({
            selector: '#editdescription',
            plugins: 'advlist autolink lists link image charmap print preview anchor',
            toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright | bullist numlist outdent indent | link image',
			toolbar_mode: 'floating',
            toolbar_location: 'top',
			height: 500,
        });
   
        function save_Data() {
         
            var editor = tinymce.get('description'); 
            var content = "";
            if (editor) {
                content = editor.getContent(); 
            }
            
            $.ajax({
                url: "./servlet_add_food",
                type: 'POST',
                data : {
                    foodName : document.getElementById('food_name').value,
                    foodCategory : document.getElementById('foods_category').value,
                    price : document.getElementById('food_price').value,
                    description : content,
                    image : document.getElementById('img_name').innerHTML
                },
                success: function(response) {
                    if (response === "1") {
                        // Show success message using SweetAlert2
                        Swal.fire({
                            title: 'Success!',
                            text: 'Food added successfully!',
                            icon: 'success'
                        });
                        listFood();
                        $('#addModal').modal('hide');
                    } else {
                        // Show error message using SweetAlert2
                        Swal.fire({
                            title: 'Error!',
                            text: 'Failed to add food.',
                            icon: 'error'
                        });
                    }
                }
            });
                     

                
        }
        
        listFoodCategory();
        function listFoodCategory(){
            
            $.ajax({
                url: "./servlet_list_food_category",
                type: 'POST',
                success: function(data) {
                     fcDropDown(data);
                }
            });
        }
        
        listFood();
        function listFood(){
            $.ajax({
                url: "./servlet_all_food",
                type: 'POST',
                success: function(data) {
                    populateTable(data); // Call the function to populate the table
                }
            });
        }

        function populateTable(data) {
            var tableBody = $(".food_tbl"); // Select the table body element
            tableBody.empty(); // Clear existing content

            var foods = JSON.parse(data); // Parse the JSON data

            for (var i = 0; i < foods.length; i++) {
                var food = foods[i];

                // Create a new row and populate it with data
                var row = $("<tr>");
                row.append($("<td class='text-center'>").text(food.id));
                row.append($("<td class='text-center'>").text(food.name));
                row.append($("<td class='text-center'>").text(food.food_category));
                var clickCell = $("<td class='text-center' style='cursor:pointer;'>").text('Click Me');
                clickCell.on('click', function() {
                    showImageAlert(food.img); // Show SweetAlert2 with the food image
                });
                row.append(clickCell);
                row.append($("<td class='text-center'>").html(
                    "<button class='btn btn-danger' onclick='confirmDelete(" + food.id + ")'>Delete</button>&nbsp;" +
                    "<button class='btn btn-success' onclick='editFood(" + food.id + ")'>Edit</button>"
                ));

                tableBody.append(row); 
            }
        }
        
        function showImageAlert(imageUrl) {
            Swal.fire({
                title: 'Food Image',
                html: "<img src='" + imageUrl + "' style='max-width: 100%;'>",
                showCloseButton: true,
                showConfirmButton: false
            });
        }

        // Function to edit a food item
        function editFood(id) {
            $.ajax({
                url: "./servlet_single_food",
                type: 'POST',
                data : {
                    id : id
                },
                success: function(data) {
                    var jsonObject = JSON.parse(data);
                    var editor = tinymce.get('editdescription');
                    console.log(jsonObject);
                    document.getElementById("edit_food_name").value = jsonObject[0].name;
                    document.getElementById("edit_foods_category").value = jsonObject[0].food_category;
                    document.getElementById("edit_food_price").value = jsonObject[0].price;
                    document.getElementById("edit_food_id").value = jsonObject[0].id;
                    editor.setContent(jsonObject[0].description);
                    $('#editModal').modal('show');
                }
            });
        }

        
        function fcDropDown(data) {
            var rows = data.split("!!!!"); 

            var selectDropdown = $("#foods_category");
            selectDropdown.empty();

            var option = $("<option>").text("Select Food Category");
                selectDropdown.append(option);
            for (var i = 0; i < rows.length; i++) {
                var fields = rows[i].split(",,"); 
                var foodCategory = fields[1];
                var option = $("<option>").text(foodCategory);
                selectDropdown.append(option);
            }
        }

        
        function confirmDelete(id) {
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
                    $.ajax({
                        url: "./servlet_delete_food", 
                        type: 'POST',
                        data: { id: id },
                        success: function(data) {
                            console.log(data);
                            if (data == "1") {
                                Swal.fire({
                                    title: 'Success',
                                    text: 'Food has been deleted.',
                                    icon: 'success'
                                });
                                listFood();
                            } else {
                                Swal.fire({
                                    title: 'Error',
                                    text: 'An error occurred while deleting the food.',
                                    icon: 'error'
                                });
                            }
                        },
                        error: function() {
                           Swal.fire({
                                title: 'Error',
                                text: 'An error occurred while deleting the food.',
                                icon: 'error'
                            });
                        }
                    });
              
            }
          });
        }
        
       
        
        function update_action() {
            var editor = tinymce.get('editdescription');

            var edit_food_name = document.getElementById("edit_food_name").value;
            var edit_foods_category = document.getElementById("edit_foods_category").value;
            var edit_food_price = document.getElementById("edit_food_price").value;
            var content = "";

            if (editor) {
                content = editor.getContent();
            }

            var food_id = document.getElementById("edit_food_id").value;
    
            // Prepare the data to be sent in the AJAX request
            var requestData = {
                food_id: food_id,
                edit_food_name: edit_food_name,
                edit_food_price: edit_food_price,
                content: content
            };
    
            // Make an AJAX request to save the data
            $.ajax({
                type: "POST", 
                url: "./servlet_update_food", 
                data: requestData,
                success: function(response) {
                    // Show success message with SweetAlert2
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: 'Food updated and saved successfully!'
                    });
                    listFood();
                    $('#editModal').modal('hide');
                },
                error: function(error) {
                    // Show error message with SweetAlert2
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Error updating and saving food'
                    });
                    console.error("Error updating and saving food:", error);
                }
            });
        }


    </script>
  </body>
</html>