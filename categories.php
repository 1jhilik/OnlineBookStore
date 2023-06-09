<?php 
include('functions/userfunctions.php');
include('includes/header.php');
?>

<div class="py-3 bg-primary">
      <div class="container">
        <h6 class="text-white">Home/Categories</h6>
      </div>
</div>
<div class="py-3">
  <div class="container">
      <div class="row">
        <div class="col-md-12">
            <h1>Our Categories</h1>
            <hr>
                <div class="row">
                    <?php
                        $categories = getAllActive("categories"); 

                        if(mysqli_num_rows($categories) > 0)
                        {
                            foreach($categories as $item)
                            {
                              ?>
                              <div class="col-md-3">
                                <a href="products.php?category=<?= $item['slug']; ?>">
                                  <div class="card shadow  mb-5">
                                    <div class="card-body w-100">
                                      <img src="uploads/<?= $item['image']; ?>" alt="Category Image" class="w-100" id="card-img">
                                      <h4 class="text-center text-black pt-2"><?= $item['name']; ?></h4>
                                      
                                    </div>
                                  </div>
                                </a>
                              </div>
                              <?php
                            }
                        }
                        else
                        {
                          echo "No data available";
                        }
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include('includes/userfooter.php');
 include('includes/footer.php');?>
    