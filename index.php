<?php 
include('functions/userfunctions.php');
include('includes/header.php');
include('includes/slider.php');

?>
<div class="py-5">
  <div class="container">
      <div class="row">
        <div class="col-md-12 ">
        <h4 class="text-danger-emphasis fw-bold"><i class="fa fa-fire"></i> Trending Books</h4>
          <hr>
              <div class="owl-carousel">
                    <?php
                        $trendingProducts = getAllTrending();
                        if(mysqli_num_rows($trendingProducts) > 0)
                        {
                          foreach($trendingProducts as $item)
                          {                      
                            ?>
                              <div class="item  ms-2">
                                <a href="product-view.php?product=<?= $item['slug']; ?>">
                                  <div class="card shadow ">
                                    <div class="card-body">
                                      <img src="uploads/<?= $item['image']; ?>" alt="Product Image" class="w-100" id="card-img">
                                      <h6 class="text-center text-black py-2"><?= $item['name']; ?></h6>
                                    </div>
                                  </div>
                                </a>
                              </div>
                            <?php
                          }
                        }

                    ?>
              </div>
          </div>
        </div>
    </div>
</div>
<!-- 
<div class="card mb-3 py-5 bg-f2f2f2" style="max-width: 540px;">
  <div class="row g-0 container">
    <div class="col-md-4">
      <img src="assets/images/about-1.jpg" class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">About US</h5>
        <p class="card-text"><p>Since its fuse in 2005, Company Name has cut a specialty for itself in the youngsters' books section of the distributing business. We have some expertise in books implied for offspring of various ages.</p>
        <p>The wide scope of books offered by us incorporates fantasies, moral stories, showed storybooks, Adventure books, general learning books, Classic books, Thriller books, action books, and more. Every one of these books is accessible in English.</p>
          <br>
          <p>Our point is to give significant, charming, and animating substance to youngsters who go much past their normal course books. With this point of view, we treat each book as a work of adoration. Every one of our books is broadly examined, attentively composed, and delightfully planned.
        </p>
        <p>Development and experimentation are indispensable to our methodology toward books. Our broad gathering of books- picture books, sticker books, story and sticker books, 3D Books, spring-up books, innovative idea books, curiosity books, topic-based books, movement books, and so on - are a declaration of this methodology. This encourages us to make energizing and testing items for youngsters.</p>
        <p>We earnestly trust that books can be an extraordinary wellspring of motivation with the ability to impact and shape youthful personalities.
          <br>

        Our books do not simply go for building up the scholarly capacities of youngsters; rather, they are made with the aim of contributing towards their all-encompassing improvement.</p></p>
        
      </div>
    </div>
  </div>
</div> -->
<div class="py-5 bg-f2f2f2">
  <div class="container">
      <div>
        <h4 class="fw-bold">About US</h4>
          <div class="underline mb-2"></div>
        <div class="row">        
          <div class="col-md-4">
            <img src="assets/images/about-2.jpg" style="max-width: 400px;" class="img-fluid rounded-start" alt="about">
          </div>
          <div class="col-md-8 ">
            <p>Since its fuse in 2005, Company Name has cut a specialty for itself in the youngsters' books section of the distributing business. We have some expertise in books implied for offspring of various ages.</p>
            <p>The wide scope of books offered by us incorporates fantasies, moral stories, showed storybooks, Adventure books, general learning books, Classic books, Thriller books, action books, and more. Every one of these books is accessible in English.</p>
              <br>
              <p>Our point is to give significant, charming, and animating substance to youngsters who go much past their normal course books. With this point of view, we treat each book as a work of adoration. Every one of our books is broadly examined, attentively composed, and delightfully planned.
            </p>
            <p>Development and experimentation are indispensable to our methodology toward books. Our broad gathering of books- picture books, sticker books, story and sticker books, 3D Books, spring-up books, innovative idea books, curiosity books, topic-based books, movement books, and so on - are a declaration of this methodology. This encourages us to make energizing and testing items for youngsters.</p>
            <p>We earnestly trust that books can be an extraordinary wellspring of motivation with the ability to impact and shape youthful personalities.
              <br>

            Our books do not simply go for building up the scholarly capacities of youngsters; rather, they are made with the aim of contributing towards their all-encompassing improvement.</p>
        
          </div>   
        </div>
    </div>
  </div>
</div>



<?php include('includes/userfooter.php');
 include('includes/footer.php');?>
<script>
$(document).ready(function (){
    $('.owl-carousel').owlCarousel({
      loop:true,
      margin:10,
      nav:true,
      responsive:{
          0:{
              items:1
          },
          600:{
              items:3
          },
          1000:{
              items:5
          }
      }
})
});
</script>
    