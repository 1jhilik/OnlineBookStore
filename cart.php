<?php 

include('functions/userfunctions.php');
include('includes/header.php');
include('authenticate.php');
?>

<div class="py-3 bg-primary">
      <div class="container">
        <h6 class="text-white">
        <a class="text-white" href="index.php">
              Home / 
              </a>
              <a class="text-white" href="cart.php">
              Cart 
              </a>
        </h6>
      </div>
</div>
<div class="py-5">
  <div class="container">
        <div class="">
              <div class="row">
                <div class="col-md-12">
              <div id="mycart">
              
                <?php 
                    $items = getCartItems();
                    if(mysqli_num_rows($items) > 0){
                      ?>
                      <div class="row align-items-center">
                              <div class="col-md-6">
                                <h5>Product</h5>
                              </div>
                              <div class="col-md-2">
                              <h6>Quantity</h6>
                              </div>
                              <div class="col-md-2">
                              <h6>Price</h6>
                              </div>
                              <div class="col-md-2">
                                <h6>Action</h6>
                              </div>
                      </div>
                      <div id="">
                      
                        <?php
                          foreach ($items as $citem)
                          {
                            ?>
                            <div class="card product_data shadow-sm mb-3">
                              <div class="row align-items-center">
                                <div class="col-md-2">
                                  <img src="uploads/<?=$citem['image'] ?>" alt="Image" width="60px" class="m-2 shadow">
                                </div>
                                <div class="col-md-4">
                                  <h5><?=$citem['name'] ?></h5>
                                </div>
                                <div class="col-md-2">
                                  <input type="hidden" class="prodId" value="<?=$citem['prod_id']?>">
                                <div class="input-group mb-3" style="width: 130px">
                                    <button class="input-group-text decrement-btn updateQty">-</button>
                                    <input type="text" class="form-control text-center input-qty bg-white" value="<?=$citem['prod_qty'] ?>" disabled>
                                    <button class="input-group-text increment-btn updateQty">+</button>
                                </div>
                                </div>
                                <div class="col-md-2">
                                <h5>$ <?=$citem['selling_price'] ?></h5>
                                </div>
                                
                                <div class="col-md-2">
                                  <button class="btn btn-sm btn-danger deleteItem" value="<?=$citem['cid']?>">Remove  <i class="fa fa-trash"></i></button>
                                </div>
                              </div>
                            </div>
                            <?php
                          }
                        
                        ?>
                      </div>
                      <div class="float-start">
                        <a href="checkout.php" class="btn btn-outline-primary">Proceed to Checkout</a>
                      </div>
                      <?php
                      }else{
                        ?>
                        <div class="card card-body shadow text-center">
                          <h4 class="py-3  fw-bold"> Your Cart is Empty</h4>
                        </div>
                        <?php
                      }
                      ?>
              </div>
                </div>
              </div>
        </div>
  </div>
</div>

<?php include('includes/userfooter.php');
 include('includes/footer.php');?>
    