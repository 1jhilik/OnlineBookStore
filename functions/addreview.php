<?php
session_start();
include('../config/dbcon.php');

?>

          <div >
            
              <a style="text-decoration: none; " href="../index.php">
              <h1 style="color: black;">BookLy  </h1></a> 
              
              
          </div>
      
      <hr>
      
<?php

if(isset($_SESSION['auth']))
{
    if (
        isset($_POST['prod_id']) &&
        isset($_POST['rating']) &&
        isset($_POST['title']) &&
        isset($_POST['review'])
    ) {
        $prod_id = mysqli_real_escape_string($con, $_POST['prod_id']);
        $user_id = $_SESSION['auth_user']['user_id'];
        $rating = mysqli_real_escape_string($con, $_POST['rating']);
        $title = mysqli_real_escape_string($con, $_POST['title']);
        $review = mysqli_real_escape_string($con, $_POST['review']);
        $added_on = date('Y-m-d H:s:i');
        
        $insert_query = "INSERT INTO product_review (prod_id, user_id, rating, title, review, added_on) VALUES ('$prod_id', '$user_id', '$rating', '$title', '$review', '$added_on')";
        if (mysqli_query($con, $insert_query)) {
            echo "Review added Successfully";
        } else {
            echo "No Review Added yet!";
        }
    } else {
        echo "No Review Added yet!";
    }
}


?>



