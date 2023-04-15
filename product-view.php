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
              <h6>Product Description:</h6>
              <p><?= $product['description'];?></p>
              
            </div>
          </div>
        </div>
      </div> 
<!-- <div class="container ">
  <div class="row">
    <div class="col-md-6 ">
      <div class="card mt-5">
        <div class="card-header bg-danger">
          <h4 class="text-white">Add Review</h4>
        </div>
        <div class="card-body">
          <form action="code.php" method="POST" enctype="multipart/form-data">
            <div class="row">
            <div class="col-md-12">
            <form action="code.php" method="POST">
                  <label class="mb-0">Rating</label>
                  <select name="review_id" class="form-select mb-2" >
                    <option selected>Select Rating</option>
                      <option value="0"<?=$data['status'] == 0?"selected":"" ?>>Awesome</option>
                      <option value="1">Great</option>
                      <option value="2" >Good</option>
                      <option value="3" >bad</option>

                  </select>  
                    
            </form>
                      
                                       
                  
              </div>
              
             
              <div class="col-md-12">
                
                  <label  class="mb-0">Review</label>
                  <textarea rows="3" required name="review" placeholder="Enter Your Review" class="form-control mb-2"></textarea>
              </div>
              
              <div class="col-md-12">
                <button type="submit" class="btn btn-primary" name="add_product_btn">Save</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div> -->

<form method="POST" action="add_review.php">
    <label for="review_content">Enter your review:</label><br>
    <textarea id="review_content" name="review_content"></textarea><br>
    <label for="rating">Rating:</label>
    <select id="rating" name="rating">
        <option value="1">1 star</option>
        <option value="2">2 stars</option>
        <option value="3">3 stars</option>
        <option value="4">4 stars</option>
        <option value="5">5 stars</option>
    </select><br>
    <input type="submit" value="Submit">
</form>


<!-- <div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <h4>Add Review</h4>
        </div>
        <section class="account-form">

          <form action="" method="post">
            
            <a href="product-view.php?get_id=<?= $get_id; ?>" class="option-btn">go back</a>
            <p class="text-white bg-dark">review title <span>*</span></p>
            <input type="text" name="title" required maxlength="50" placeholder="enter review title" class="box">
            <p class="text-white bg-dark">review description</p>
            <textarea name="description" class="box" placeholder="enter review description" maxlength="1000" cols="30" rows="10"></textarea>
            <p class="text-white bg-dark">review rating <span>*</span></p>
            <select name="rating" class="box" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
            <input type="submit" value="submit review" name="submit" class="btn btn-success">
            
          </form>

        </section>  
      </div>
    </div>
  </div>
</div> -->
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
    