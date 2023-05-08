<?php 
include('functions/userfunctions.php');
include('includes/header.php');

?>
<div class="py-3 bg-primary">
      <div class="container">
        <h6 class="text-white">Categories/publisher</h6>
      </div>
</div>
<div class="py-3">
  <div class="container">
      <div class="row">
        <div class="col-md-12">
            <h1>Book's Publishers</h1>
            <hr>
                <div class="row">
                    <?php
                        $trendingProducts = getAllTrending();
                        if(mysqli_num_rows($trendingProducts) > 0)
                        {
                          foreach($trendingProducts as $item)
                          {                      
                              ?>
                              <div class="col-md-3">
															<a href="product-view.php?product=<?= $item['slug']; ?>">
                                  <div class="card shadow  mb-5"  style=" width: 250px; height: 300px;">
                                    <div class="card-body">
                                      <img src="uploads/<?= $item['image']; ?>" alt="Category Image"  id="card-img" style=" width: 100px; height: 150px;">
                                      <p class=" text-black pt-2">Book's Name: <?= $item['name']; ?></p>
																			<p class=" text-black pt-2"> <span class="fw-bold"> Publishers Name:</span> <?= $item['meta_title']; ?></p>
																			
                                      
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

      <div class="container mb-5" style="margin-left: 300px;">
        <div class="row">
          <div class="col-md-6 ">
            <div class="card mt-5">
              <div class="card-header bg-danger">
                <h4 class="text-white content-center">Add Comment</h4>
              </div>
                <form action="view-comment.php" method="POST">
								<label class="mb-0">Upload Image</label>
                  <input type="file" required name="image" class="form-control mb-2">
                  <label for="">Name: </label>
                    <input type="text" name="name" class="form-control" placeholder="Enter Your name">
                    <label for="review_content">Enter your Comment:</label><br>
                  <textarea name="comment" class="form-control " rows="2" ></textarea>
                  
                  <button type="submit" class="btn btn-primary mt-2 w-100" name="add_comment_btn">Submit</button>
									
                  
                </form>
                  </div>
                
              </div>
            </div>
          </div>
        </div>
      </div>

            </div>
        </div>
				
    </div>
</div>
																<?php include('includes/userfooter.php');
 include('includes/footer.php');?>