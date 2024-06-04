<!doctype html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="./css/style_file.css" rel="stylesheet" >
    <title>Food Ordering</title>

  </head>
  <body style="background-color: #eee">
    <%@ include file="common/header_admin.jsp" %>
    <div class="container" >
        <div class="row pb-3 mt-5" style="background-color: white; border-radius:20px; border:2px solid #BA8B02;">
            <div class="col" style="padding-left: 5%;" >
                <h2 class="text-uppercase" style="padding-top: 10%; font-weight:700;">ADMIN dashboard</h2>
                <hr/>
            </div>
            <div class="col text-end pe-5">
                <img src="./img/admin_bg_img.png" class="p-4" style="width: 62%;" />
            </div>
        </div>
        <h4 style="font-weight:600; padding-top:4%; color:#161108;" class="text-uppercase">Action of the Admin panel</h4>
        <hr/>
        <div class="row row-cols-1 row-cols-md-3 g-4">
          <div class="col" style="cursor: pointer;" >
            <div class="card" style="background-color: #EAE4D3;" onclick="window.location.href='food_category.jsp'">
              <div class="p-4 text-center">
                <img src="./img/foods.png" class="card-img-top" alt="..." style="width: 160px;">
              </div>
              <div class="card-body">
                <h4 class="card-title text-uppercase text-center">Foods Category</h4>
              </div>
            </div>
          </div>
          <div class="col" style="cursor: pointer;">
            <div class="card"  style="background-color: #D3D6DE;" onclick="window.location.href='admin_foods.jsp'">
              <div class="p-4 text-center">
                <img src="./img/foods_cat.png" class="card-img-top" alt="..." style="width: 160px;">
              </div>
              <div class="card-body">
                <h4 class="card-title text-uppercase text-center">Foods</h4>
              </div>
            </div>
          </div>
          <div class="col" style="cursor: pointer;">
            <div class="card"  style="background-color: #E1E8DF;" onclick="window.location.href='admin_orders.jsp'">
              <div class="p-4 text-center">
                <img src="./img/ordering.png" class="card-img-top" alt="..." style="width: 160px;">
              </div>
              <div class="card-body">
                <h4 class="card-title text-uppercase text-center">Orders</h4>
              </div>
            </div>
          </div>
          <div class="col" style="cursor: pointer;">
            <div class="card"  style="background-color: #E1E8DF;" onclick="window.location.href='admin_customers.jsp'">
              <div class="p-4 text-center">
                <img src="./img/cus_rating.png" class="card-img-top" alt="..." style="width: 160px;">
              </div>
              <div class="card-body">
                <h4 class="card-title text-uppercase text-center">Customers</h4>
              </div>
            </div>
          </div>
          <div class="col" style="cursor: pointer;">
            <div class="card"  style="background-color: #D3D6DE;" onclick="window.location.href='admin_driving_team.jsp'">
              <div class="p-4 text-center">
                <img src="./img/admin_driver.png" class="card-img-top" alt="..." style="width: 160px;">
              </div>
              <div class="card-body">
                <h4 class="card-title text-uppercase text-center">Driving Team</h4>
              </div>
            </div>
          </div>
      </div>
    </div>
    <br/>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
  </body>
</html>