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
        
        <h3 style="font-weight:600; padding-top:4%; color:#161108;" class="text-uppercase">Drivers MANAGE</h3>
        <hr/>
        <div class="text-end">
          <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#addModal">Add New Driver</button>
          <button class="btn btn-outline-dark" onclick="window.location.href='admin_dassh.jsp'">Back</button>
        </div>
        <table class="table mt-2" >
            <thead class="bg-dark">
                <tr>
                  <th class="text-white text-center fw-normal">Driver ID</th>
                  <th class="text-white text-center fw-normal">Name</th>
                  <th class="text-white text-center fw-normal">Telephone Number</th>
                  <th class="text-white text-center fw-normal">License Number</th>
                  <th class="text-white text-center fw-normal">Availability</th>
                  <th class="text-white text-center fw-normal">Action</th>
                </tr>
            </thead>
            <tbody class="bg-white" id="tbl_driving">

            </tbody>
        </table>
    </div>
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header bg-dark">
                <h1 class="modal-title fs-5 text-white" id="exampleModalLabel">Edit Driver</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="editDriverId">

                <div class="mb-3">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="editFullName" placeholder="">
                    <input type="hidden" class="form-control" id="editDriverID" placeholder="">
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" id="editAddress" placeholder="">
                </div>
                <div class="mb-3">
                    <label for="nic" class="form-label">NIC</label>
                    <input type="text" class="form-control" id="editNIC" placeholder="" disabled="true">
                </div>
                <div class="mb-3">
                    <label for="tel_number" class="form-label">Telephone Number</label>
                    <input type="tel" class="form-control" id="editTelNumber" placeholder="" disabled="true">
                </div>
                <div class="mb-3">
                    <label for="license_number" class="form-label">License Number</label>
                    <input type="text" class="form-control" id="editLicenseNumber" placeholder="" disabled="true">
                </div>
                <div class="mb-3">
                    <label for="license_level" class="form-label">License Level</label>
                    <select class="form-select" id="editLicenseLevel">
                        <option value="">Select License Level</option>
                        <option value="Light Weight Vehicle">Light Weight Vehicle</option>
                        <option value="Heavy Weight Vehicle">Heavy Weight Vehicle</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="driving_experience_years" class="form-label">Driving Experience (Years)</label>
                    <input type="number" class="form-control" id="editDrivingExperienceYears">
                </div>
                <div class="mb-3">
                      <label for="driving_experience_years" class="form-label">Status</label>
                      <select  class="form-select" id="editDrivingStatus">
                          <option value="">Select Status</option>
                          <option value="1">Available</option>
                          <option value="0">Not Available</option>
                      </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="updateDriver()">Update</button>
            </div>
        </div>
    </div>
    </div>

    <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header bg-dark">
              <h1 class="modal-title fs-5 text-white" id="exampleModalLabel">Add New Driver</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <div class="mb-3">
                <label for="fullName" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="fullName" placeholder="">
              </div>
              <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" placeholder="">
              </div>
              <div class="mb-3">
                <label for="nic" class="form-label">NIC</label>
                <input type="text" class="form-control" id="nic" oninput="validateNIC(this.value)" placeholder="">
                <div id="nic-error" style="color: red;"></div>  
              </div> 
                
              <div class="mb-3">
                <label for="tel_number" class="form-label">Telephone Number</label>
                <input type="tel" class="form-control" id="tel_number" oninput="validatePhoneNumber(this.value)" placeholder="">
                <div id="tel-number-error" style="color: red;"></div>
              </div>
              <div class="mb-3">
                <label for="address" class="form-label">License Number</label>
                <input type="text" class="form-control" id="license_number" placeholder="">
              </div>
              <div class="mb-3">
                <label for="address" class="form-label">License Level</label>
                <select type="text" class="form-select"  id="license_level">
                    <option value="">Select License Level</option>
                    <option value="Light Weight Vehicle">Light Weight Vehicle</option>
                    <option value="Heavy Weight Vehicle">Heavy Weight Vehicle</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="tel_number" class="form-label">Driving Experience (Years)</label>
                <input type="number" class="form-control" id="driving_experience_years" >
              </div>
              <div class="mb-3">
                <label for="profile_photo" class="form-label">Photo</label>
                <input type="button" class="form-control" id="profile_photo" value="Upload File" onclick="uploadImageToCloudinary()">
                <span id="img_name">Please upload image</span>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-success" onclick="submit_driver()">Submit</button>
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
      
        function submit_driver(){
            const fullNameInput = document.getElementById('fullName').value;
            const addressInput = document.getElementById('address').value;
            const nicInput = document.getElementById('nic').value;
            const telNumberInput = document.getElementById('tel_number').value;
            const licenseNumberInput = document.getElementById('license_number').value;
            const licenseLevelSelect = document.getElementById('license_level').value;
            const drivingExperienceInput = document.getElementById('driving_experience_years').value;

          
            const data = {
                    fullName: fullNameInput,
                    address: addressInput,
                    nic: nicInput,
                    telNumber: telNumberInput,
                    licenseNumber: licenseNumberInput,
                    licenseLevel: licenseLevelSelect,
                    drivingExperience: drivingExperienceInput,
                    img_path: img_path
            };
            
            $.ajax({
                url: './servlet_add_driver',
                method: 'POST',
                data: data,
                success: function(response) {
                   if (response == "1") {
                        Swal.fire({
                          icon: 'success',
                          title: 'Success!',
                          text: 'Driver data saved successfully.',
                        });
                        
                        document.getElementById('fullName').value = "";
                        document.getElementById('address').value = "";
                        document.getElementById('nic').value = "";
                        document.getElementById('tel_number').value = "";
                        document.getElementById('license_number').value = "";
                        document.getElementById('license_level').value = "";
                        document.getElementById('driving_experience_years').value = "";
                        $('#addModal').modal('hide');
                        listDriver();
                        
                    }else{
                        Swal.fire({
                            title: 'Error',
                            text: 'An error occurred while adding the driver.',
                            icon: 'error'
                        }); 
                    }

                },
                error: function(error) {
                  Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    text: 'An error occurred while saving driver data.',
                  });
                }
            });
        }
        
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
        
        listDriver();
        function listDriver(){
            
            $.ajax({
                url: "./servlet_list_driver",
                type: 'POST',
                success: function(data) {
                     populateTable(data);
                }
            });
        }
        
        function populateTable(data) {
            var rows = data.split("!!!!"); 

            var tableBody = $("#tbl_driving");
            tableBody.empty();

            for (var i = 0; i < rows.length; i++) {
                var fields = rows[i].split(",,"); 
                
                var status = "";
                if (parseInt(fields[10]) == 1) {
                    status = "Available";
                } else {
                    status = "Not Available";
                }

                var rowHtml = "<tr>" +
                    "<td class='text-center'>" + fields[0] + "</td>" +
                    "<td class='text-center'>" + fields[1] + "</td>" +
                    "<td class='text-center'>" + fields[4] + "</td>" +
                    "<td class='text-center'>" + fields[5] + "</td>" + 
                    "<td class='text-center'>" + status+ "</td>" +
                    "<td class='text-center'><button class='btn btn-danger btn-sm' onclick='delete_driver(" + fields[0] + ")'>Delect</button>&nbsp;<button class='btn btn-success btn-sm' onclick='edit_Driver(" + fields[0] + ")'>Edit</button></td>" +
                    "</tr>";
                tableBody.append(rowHtml); 
            }
        }

        function delete_driver(id) {
            Swal.fire({
                title: 'Confirm Deletion',
                text: 'Are you sure you want to delete this driver profile?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Delete',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    
                    $.ajax({
                        url: './servlet_delete_driver',
                        method: 'POST',
                        data: { id: id },
                        success: function(response) {
                            Swal.fire('Deleted!', 'Driver profile has been deleted.', 'success');
                            listDriver();
                        },
                        error: function(xhr, status, error) {
                            Swal.fire('Error', 'An error occurred while deleting the driver profile.', 'error');
                        }
                    });
                }
            });
        }
        
        function edit_Driver(id){
            $.ajax({
                url: "./servlet_single_driver",
                type: 'POST',
                data : {
                    id : id
                },
                success: function(data) {
                    var jsonObject = JSON.parse(data);
                    console.log(jsonObject);
                    $('#editModal').modal('show');
                    document.getElementById('editFullName').value = jsonObject[0].full_name;
                    document.getElementById('editAddress').value = jsonObject[0].address;
                    document.getElementById('editNIC').value = jsonObject[0].nic;
                    document.getElementById('editTelNumber').value = jsonObject[0].telephone_number;
                    document.getElementById('editLicenseNumber').value = jsonObject[0].license_number;
                    document.getElementById('editLicenseLevel').value = jsonObject[0].license_level;
                    document.getElementById('editDrivingExperienceYears').value = jsonObject[0].driving_experience_years;
                    document.getElementById('editDriverID').value = jsonObject[0].id;
                    document.getElementById('editDrivingStatus').value = jsonObject[0].status;
                }
            });
        }
        
        function updateDriver() {
            Swal.fire({
                title: 'Confirm Update',
                text: 'Are you sure you want to update this driver?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Update',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    
                    $('#editModal').modal('hide');
                    Swal.fire('Updated!', 'Driver information has been updated.', 'success');
                    update_action();
                }
            });
        }
        
        function update_action(){
            var fullName = document.getElementById('editFullName').value;
            var address = document.getElementById('editAddress').value;
            var licenseLevel  = document.getElementById('editLicenseLevel').value;
            var dyears = document.getElementById('editDrivingExperienceYears').value;
            var did = document.getElementById('editDriverID').value;
            var status = document.getElementById('editDrivingStatus').value;
            
            $.ajax({
                url: "./servlet_update_driver",
                type: 'POST',
                data : {
                    id : did,
                    editFullName : fullName,
                    editAddress : address,
                    editLicenseLevel : licenseLevel,
                    editDrivingExperienceYears : dyears,
                    status : status
                },
                success: function(data) {
                     if (data === "1") {
                        // Show success message using SweetAlert2
                        Swal.fire({
                            title: 'Success!',
                            text: 'Driver information has been updated.',
                            icon: 'success'
                        });
                        listDriver();
                    } else {
                        // Show error message using SweetAlert2
                        Swal.fire({
                            title: 'Error!',
                            text: 'Failed to update driver information.',
                            icon: 'error'
                        });
                    }
                }
            });
            
            
        }

        function validateNIC(nic) {
               const nicRegex = /^[0-9]{9}[VvXx]?$/; 

               if (!nicRegex.test(nic)) {
                   document.getElementById("nic-error").textContent = "Invalid NIC format";
               } else {
                   document.getElementById("nic-error").textContent = "";
               }
        }
        
        function validatePhoneNumber(phoneNumber) {
            const phoneNumberRegex = /^\d{10}$/; 

            if (!phoneNumberRegex.test(phoneNumber)) {
                document.getElementById("tel-number-error").textContent = "Invalid phone number format (10 digits required)";
            } else {
                document.getElementById("tel-number-error").textContent = "";
            }
        }
    </script>
  </body>
</html>