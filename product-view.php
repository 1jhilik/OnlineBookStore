<?php 
include('functions/userfunctions.php');
include('includes/header.php');
;


if(isset($_GET['product']))
{
    $product_slug = $_GET['product'];
    $product_data = getSlugActive("products",$product_slug);
    $product = mysqli_fetch_array($product_data);

    if($product)
    {
        ?>
      <div class="py-3 bg-primary">
          <div class="container">
            <h6 class="text-white">
              <a class="text-white" href="categories.php">
              Home / 
              </a>
              <a class="text-white" href="categories.php">
              Categories / 
              </a>
              
              <?= $product['name'];?></h6>
          </div>
      </div>

      <div class="bg-light py-4">
        <div class="container product_data mt-3">
          <div class="row">
            <div class="col-md-4">
              <div class="shadow">
                <img src="uploads/<?= $product['image'];?>" alt="Product Image" class="w-100">
              </div>
            </div>
            <div class="col-md-8 mt-3">
              <h4 class="fw-bold"><?= $product['name'];?>
                <span class="float-start text-danger"><?php if($product['trending']){echo "Trending";} ?></span>
            </h4>
            <p class="text-primary "><?= $product['small_description'];?></p>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    
                    <a href="view-review.php">reviews</a><a href="functions/addreview.php">ss</a>
                    
              <hr>
              <div class="row">
              <div class="col-md-6">
                  <h4>$ <span class="text-success fw-bold"><?= $product['selling_price'];?></span></h4>
                </div>
                <div class="col-md-6">
                  <h5>$ <s class="text-danger"> <?= $product['original_price'];?></s></h5>
                </div>
                
              </div>
              <div class="row">
                <div class="col-md-4">
                    <div class="input-group mb-3" style="width: 130px">
                        <button class="input-group-text decrement-btn">-</button>
                        <input type="text" class="form-control text-center input-qty bg-white" value="1" disabled>
                        <button class="input-group-text increment-btn">+</button>
                    </div>
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-md-6">
                  <button class="btn btn-primary px-4 addToCartBtn"  value="<?= $product['id']; ?>"><i class="fa fa-shopping-cart me-2"></i> Add to Cart</button>
                </div>
                <div class="col-md-6">
                  <button class="btn btn-danger px-4" ><i class="fa fa-heart me-2"></i> Add to Wishlist</button>
                </div>
              </div>
              <hr>
              <h6 class="fw-bold">Product Description:</h6>
              <p><?= $product['description'];?></p>
              
              <p><?= $product['meta_keywords'];?></p>
              <h6 class="fw-bold">Product Details:</h6>
              <p><?= $product['meta_description'];?></p>
              
              
            </div>
          </div>
          
        </div>
      </div> 
      

<!-- add Review -->
  <?php if(isset($_SESSION['auth'])){ ?>
      <div class="container float-start mb-5">
        <div class="row">
          <div class="col-md-6 ">
            <div class="card mt-5">
              <div class="card-header bg-danger">
                <h4 class="text-white">Add Review</h4>
              </div>
                <form action="functions/addreview.php" method="POST">
                  <input type="hidden" name="prod_id" class="form-control" value="<?= $product['id'] ?>">
                    <label for="rating">Rating:</label>
                    <select name="rating" class="form-select ">
                        <option value="1">1 star</option>
                        <option value="2">2 stars</option>
                        <option value="3">3 stars</option>
                        <option value="4">4 stars</option>
                        <option value="5">5 stars</option>
                    </select>
                    <input type="text" name="title" class="form-control" placeholder="Title">
                    <label for="review_content">Enter your review:</label><br>
                  <textarea name="review" class="form-control " rows="2" title="Review"></textarea>
                  
                  <button type="submit" class="btn btn-primary mt-2 w-100">Submit</button>
                  
                </form>
                  </div>
                
              </div>
            </div>
          </div>
        </div>
      </div>
  
 <?php } ?>
      

      <?php 


    }
    else
    {
      echo "Product Not Found";
    }
}
else
{
  echo "Something Went Wrong";
}



include('includes/footer.php');?>
    