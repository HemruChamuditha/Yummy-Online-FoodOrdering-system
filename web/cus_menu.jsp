
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
                <div class="col-3">
                    <div class="card bg-white">
                        <div class="card-body">
                            <h5>Filter Menu</h5>
                            <hr/>
                            <div class="mt-2">
                                <label>Food Category</label>
                                <select  class="form-control" id="foods_category" >
                                    <option>Select Foods Category</option>
                                </select>
                            </div>
                            <div class="mt-3">
                              <label>Food Name</label>
                              <input type="text" class="form-control" id="food_name" />
                            </div>
                            <div class="d-grid gap-2 mt-3" style="padding-bottom: 20%;">
                                <button class="btn btn-dark" onclick="search_food()" >Filter</button>
                                <button class="btn btn-outline-dark" onclick="clear_filter()">Clear Filter</button>
                             
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-9">
                    <div class="card bg-white">
                        <div class="card-body" style="padding: 3%;">
                            <h3>CAKES MENU</h3>
                            <hr/>
                            <div class="row row-cols-1 row-cols-md-3 g-4">
                                
                              </div>
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
            
        function clear_filter(){
            
            document.getElementById('foods_category').value = "";
            document.getElementById('food_name').value = "";
            listFood();
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

        listFood();
        function listFood(){
            $.ajax({
                url: "./servlet_all_food",
                type: 'POST',
                success: function(data) {
                    load_Data(data); 
                }
            });
        }
        
        function load_Data(strdata) {
            var data = JSON.parse(strdata);
            var cardContainer = $(".row-cols-1.row-cols-md-3.g-4"); // Select the card container
            
            // Clear any existing content
            cardContainer.empty();

            // Loop through the data and create a card for each item
            for (var i = 0; i < data.length; i++) {
                var item = data[i];

                // Create card elements
                var cardCol = $("<div>").addClass("col");
                var card = $("<div>").addClass("card");
                var cardImg = $("<img>").addClass("card-img-top").attr("src", item.img).attr("alt", "Item Image");
                var cardBody = $("<div>").addClass("card-body");
                var cardTitle = $("<h5>").addClass("card-title text-center").css("color", "#ce1212").text(item.name);
                var cardPrice = $("<p>").addClass("text-center fw-bold").text("RS. " + item.price);
                var cardButton = $("<button>").addClass("btn btn-danger btn-sm").text("View and Cart").on("click", function() {
                    // Handle button click, e.g., redirect to a page
                    window.location.href = "cus_one_item.jsp?id="+item.id;
                });

                // Assemble card elements
                cardBody.append(cardTitle, cardPrice, $("<center>").append(cardButton));
                card.append(cardImg, cardBody);
                cardCol.append(card);
                cardContainer.append(cardCol);
            }
        }
        
        function search_food(){
           var foods_category = document.getElementById('foods_category').value;
           var food_name = document.getElementById('food_name').value;
           
            $.ajax({
                url: "./servlet_filter_foods",
                type: 'POST',
                data : {
                    foods_category: foods_category,
                    food_name:food_name
                },
                success: function(data) {
                    load_Data(data); 
                }
            });
           
        }
        </script>
    </body>
</html>
