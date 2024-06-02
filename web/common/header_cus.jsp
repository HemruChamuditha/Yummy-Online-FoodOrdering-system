<nav class="navbar navbar-expand-lg bg-white">
    <div class="container">
      <a class="navbar-brand" href="./cus_menu.jsp" style="font-size:25px; font-weight:700; color: #ce1212;">FRESH GRUB.</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          
        </ul>
        <form class="d-flex" role="search">
          <button class="btn btn-outline-danger" type="button" onclick="window.location.href='cus_cart.jsp'"><i class="bi bi-cart"></i></button>&nbsp;
          <button class="btn btn-outline-danger" type="button" onclick="logout()">Log Out</button>
        </form>
      </div>
    </div>
</nav>

<script>
function logout() {
    if (confirm("Are you sure you want to log out?")) {
        window.location.href = 'index.jsp';
    }
}
</script>