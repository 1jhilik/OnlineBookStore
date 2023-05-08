
<nav class="navbar navbar-expand-lg navbar-dark sticky-top bg-dark shadow" style="background-color: #e3f2fd;"> 
  <div class="container">
    <a class="navbar-brand fs-2 fw-bolder fst-italic" href="index.php"><i class="fa fa-book"></i> BookLy</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.php">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="categories.php">Categories</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="publisher_list.php">Publishers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cart.php">Cart</a>
        </li>
       
        
        <?php
          if(isset($_SESSION['auth']))
          {
            
            ?>
            <li class="nav-item">
          
          </li>
              <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> <i class="fa fa-user"></i>
              <?= $_SESSION['auth_user']['name']; ?>
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="my-order.php">My Orders</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><a class="dropdown-item" href="logout.php">Logout </a></li>
              
            </ul>
            </li>
            <?php
          }
          else
          {
            ?>
            <li class="nav-item">
              <a class="nav-link" href="register.php">Register</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="login.php">Login</a>
            </li>
        <?php

          }
        ?>
        
        
      </ul> 
      <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
      </form> 
    </div>
  </div>
</nav>