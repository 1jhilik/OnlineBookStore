<?php 

include('functions/userfunctions.php');
include('includes/header.php');
include('authenticate.php');

$cartItems = getCartItems();

if(mysqli_num_rows($cartItems) == 0)
{
  header('Location: index.php');
}
?>

<div class="py-3 bg-primary">
      <div class="container">
        <h6 class="text-white">
        <a class="text-white" href="index.php">
              Home / 
              </a>
              <a class="text-white" href="checkout.php">
              Checkout
              </a>
        </h6>
      </div>
</div>
<div class="py-5">
  <div class="container">
        <div class="card">
          <div class="card-body shadow">
            <form action="functions/placeorder.php" method="POST">
              <div class="row">
                <div class="col-md-7">
                    <h5>Basic Details</h5>
                    <hr>
                    <div class="row">
                      <div class="col-md-6 mb-3">
                        <label class="fw-bold">Name</label>
                        <input type="text" name="name" id="name" required placeholder="Enter your full name" class="form-control">
                        <small class="text-danger name"></small>
                      </div>
                      <div class="col-md-6 mb-3">
                        <label class="fw-bold">E-mail</label>
                        <input type="email" name="email" id="email" required placeholder="Enter your email" class="form-control">
                        <small class="text-danger email"></small>
                      </div>
                      <div class="col-md-6 mb-3">
                        <label class="fw-bold">Phone</label>
                        <input type="text" name="phone" id="phone" required placeholder="Enter your phone number" class="form-control">
                        <small class="text-danger phone"></small>
                      </div>
                      <div class="col-md-6 mb-3">
                        <label class="fw-bold">Pin Code</label>
                        <input type="text" name="pincode" id="pincode" required placeholder="Enter your pin code" class="form-control">
                        <small class="text-danger pincode"></small>
                      </div>
                      <div class="col-md-12 mb-3">
                        <label class="fw-bold">Address</label>
                        <textarea  name="address" id="address" required rows="10" class="form-control"></textarea>
                        <small class="text-danger address"></small>
                      </div>
                    </div>
                </div>
                <div class="col-md-5">
                  <h5>Order Details</h5>
                    <hr>
                        <?php $items = getCartItems();
                        $totalPrice = 0;

                        foreach ($items as $citem)
                        {
                          ?>
                          <div class="mb-1 border">
                            <div class="row align-items-center">
                              <div class="col-md-2">
                                <img src="uploads/<?=$citem['image'] ?>" alt="Image" width="40px" class="m-2 shadow">
                              </div>
                              <div class="col-md-5">
                                <h5><?=$citem['name'] ?></h5>
                              </div>
                              <div class="col-md-2">
                                <h5><?=$citem['prod_qty'] ?> X</h5>
                              </div>
                              <div class="col-md-3">
                                <h5>$ <?=$citem['selling_price'] ?></h5>
                              </div>
                              
                            </div>
                          </div>
                          <?php
                          $totalPrice += $citem['selling_price'] * $citem['prod_qty'];
                        }
                        ?>
                        <hr>
                    <h5>Total Price : <span class="float-start ms-5 ps-4 fw-bold">$ <?= $totalPrice?></span></h5>   
                    <div class="">
                      <input type="hidden" name="payment_mode" value="COD">
                      <button type="submit" name="placeOrderBtn" class="btn btn-success w-100">Confirmand place order | COD</button>
                      <div id="paypal-button-container" class="mt-3"></div>
                    </div> 
              </div>
            </form>
          </div>
        </div>
  </div>
</div>
</div>

<?php include('includes/footer.php');?>

<!-- Replace "test" with your own sandbox Business account app client ID -->
<script src="https://www.paypal.com/sdk/js?client-id=AUjiOztz5TneYGVprm0eQBKuPKZGyFl3FT2ev53Y1Ww_usQFYqP2dw7ewXY8i80F6hGSVmJ2706VonOU&currency=USD"></script>

<script>
 

      paypal.Buttons({
        onClick(){
          var name = $('#name').val();
          var email = $('#email').val();
          var phone = $('#phone').val();
          var pincode = $('#pincode').val();
          var address = $('#address').val();
          if(name.length == 0)
          {
            $('.name').text("*This field is required");
            
          }
          else{
            $('.name').text("");
          }
          if(email.length == 0)
          {
            $('.email').text("*This field is required");
            
          }
          else{
            $('.email').text("");
          }
          if(phone.length == 0)
          {
            $('.phone').text("*This field is required");
            
          }
          else{
            $('.phone').text("");
          }
          if(pincode.length == 0)
          {
            $('.pincode').text("*This field is required");
            
          }
          else{
            $('.pincode').text("");
          }
          if(address.length == 0)
          {
            $('.address').text("*This field is required");
            
          }
          else{
            $('.address').text("");
          }
          if(name.length == 0 || email.length == 0 || phone.length == 0 || pincode.length == 0 || address.length == 0)
          {
            return false;
          }

        },
        
        createOrder(data, actions) {
          return actions.order.create({
            purchase_units: [{
              amount: {
                value: '0.1'//'<?= $totalPrice ?>'
              }
            }]
            });
          },
          
        // Finalize the transaction on the server after payer approval
        onApprove(data, actions)  {
          return actions.order.capture().then(function(orderData){
            // Successful capture! For dev/demo purposes:
            const transaction = orderData.purchase_units[0].payments.captures[0];

            var name = $('#name').val();
            var email = $('#email').val();
            var phone = $('#phone').val();
            var pincode = $('#pincode').val();
            var address = $('#address').val();

            var data = {
              'name' : name,
              'email' : email,
              'phone' : phone,
              'pincode' : pincode,
              'address' : address, 
              'payment_mode' : "Paid by PayPal",
              'payment_id' : transaction.id,
              'placeOrderBtn' : true
            };

            $.ajax({
              method: "POST",
              url: "functions/placeorder.php",
              data: data,
              success: function (response){
                if(response == 201)
                {
                  alertify.success("Order Placed Successfully");
                  window.location.href = 'my-order.php';
                }
              }

            });
            // When ready to go live, remove the alert and show a success message within this page. For example:
            // const element = document.getElementById('paypal-button-container');
            // element.innerHTML = '<h3>Thank you for your payment!</h3>';
            // Or go to another URL:  window.location.href = 'thank_you.html';

          });
        }
      }).render('#paypal-button-container');
    </script>

