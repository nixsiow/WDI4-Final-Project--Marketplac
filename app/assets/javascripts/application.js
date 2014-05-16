// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require bootstrap
//= require_tree .


$(document).ready(function() {

  // to let the dropdown autoshow without clicking
  $('.dropdown-toggle').click(function() {
      var location = $(this).attr('href');
      window.location.href = location;
      return false;
  });


  // Event listener for 'add to cart' button
  $('.addToCart').on('click', function(event) {
    event.preventDefault();
    var $quantity = $(this).prev().prev().val(); // FIX THIS. REFACTOR HTML
    var $productID = $(this).closest('.product_right_panel').data('productid');

    orderProduct.createOrderProduct($quantity, $productID);
  });


  var orderProduct = {
    createOrderProduct: function(quantity, productID) {
      // debugger;
      $.ajax({
        url: '/order_products',
        type: 'POST',
        dataType: 'json',
        data: {order_product: {product_id: productID, quantity: quantity }}
      }).done(function(data) {
        console.log(data);
          // $model.closest('.modal-body').prepend("<h3 class='status'>" + data.status + "</h3>");
      }).error(function() {
        // add jquery stuff to show error.
      });
    }
  }


});