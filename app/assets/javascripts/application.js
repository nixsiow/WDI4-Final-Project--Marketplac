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

  // Event listener for 'add to cart' button
  $('.addToCart').on('click', function(event) {
    event.preventDefault();
    var $quantity = $(this).prev().prev().val(); // FIX THIS. REFACTOR HTML
    var $productID = $(this).closest('.product_right_panel').data('productid');

    orderProduct.createOrderProduct($quantity, $productID);
  });

  // Event listener for 'Remove' item from Cart
  $('.removeFromCart').on('click', function(event) {
    event.preventDefault();
    //get the productID of individual product from data-attribute
    var $productID = $(this).closest("tr").data().productid;

    orderProduct.deleteOrderProduct($productID);
  });


  var orderProduct = {
    // function to add item into cart via AJAX
    createOrderProduct: function(quantity, productID) {
      $.ajax({
        url: '/order_products',
        type: 'POST',
        dataType: 'json',
        data: {
          order_product: {
            product_id: productID,
            quantity: quantity
          }
        }

      }).done(function(data) {
        $('#myModal' + productID).modal('hide');
        $('.flash_msg').text(data.status).toggleClass('wobble-vertical');

      }).error(function() {
        console.log('add item failed');
      });
    },

    // function to remove item from cart via AJAX
    deleteOrderProduct: function(productID) {
      $.ajax({
        url: '/order_products/' + productID,
        type: 'DELETE',
        dataType: 'json',
        data: {
          order_product: {
            product_id: productID
          }
        }

      }).done(function(data) {
        $('body').find("[data-productID='" + productID + "']").fadeOut();
        $('.flash_msg').text(data.status).toggleClass('wobble-vertical');
        //redraw the total price on screen so that it will update instantly whenever item removed from cart
        $('.totalPrice').html('<b>$' + data.updatedPrice + '0 AUD</b>');

      }).error(function() {
        console.log('remove item failed');
      });
    }
  } // End of the object


  // trigger the 'see more' button when user click on the image
  $('.site_container').on('click', '.indi_product img', function() {
    $(this).closest('.indi_product').find('.btn-primary').trigger('click');
  });


  // ------------------------
  // For Jump to Top button
  // ------------------------

  //Check to see if the window is top if not then display button
  $(window).scroll(function() {
    if ($(this).scrollTop() > 200) {
      $('.scrollToTop').fadeIn();
    } else {
      $('.scrollToTop').fadeOut();
    }
  });

  //Click event to scroll to top
  $('.scrollToTop').click(function() {
    $('html, body').animate({
      scrollTop: 0
    }, 800);
    return false;
  });

}); // end of document.ready