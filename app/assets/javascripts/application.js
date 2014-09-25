//=require jquery
//=require jquery.turbolinks
//=require jquery_ujs
//=require bootstrap
//=require_tree .

$(document).ready(function() {

  $('.expiration-date-info').focus(function() {
    $(this).val('');
  })

  function stripeResponseHandler(status, response) {
    var $form = $('#new_order');

    if (response.error) {
      // Show the errors on the form
      //$form.find('.payment-errors').text(response.error.message);
      alert(response.error.message);
      $form.find('button').prop('disabled', false);
    } else {
      // response contains id and card, which contains additional card details
      var token = response.id;
      // Insert the token into the form so it gets submitted to the server
      $form.append($('<input type="hidden" name="stripeToken" />').val(token));
      // and submit
      $form.get(0).submit();
    }
  };

  Stripe.setPublishableKey('pk_test_jx6ScMJZ77A8MeDxmDiwbuFM');

  $('#new_order').submit(function(event) {
    var $form = $(this);

    // Disable the submit button to prevent repeated clicks
    $form.find('button').prop('disabled', true);

    Stripe.card.createToken($form, stripeResponseHandler);

    // Prevent the form from submitting with the default action
    return false;
  });

  // debugger;
  $('.added_dropdown_container').delay(100).addClass('hidden');

  $('.admin-request-dropdown-link').click(function() {
    $('.admin-request-dropdown').toggleClass('hidden');
  })

  $('.description-link').click(function() {
    $('.description-dropdown').toggleClass('hidden');
  })

  $('.edit-user-link').bind('click', false);

  $('.update-order-item-btn').bind('click', false);

  $('.form-control').focus(function() {
    $('.edit-user-link').addClass('btn-primary')
    $('.edit-user-link').unbind('click', false)
    $('.edit-address-dropdown').addClass('hidden');
  })

  $(".cart-btn").bind('click', false);

  $(".qty-box").focus(function() {

    var nextCartButton = $(this).closest('td').next().find('.cart-btn');
    var allCartButton = $(this).closest('div.custom-box').find(".cart-btn");


    allCartButton.addClass('invisible');
    nextCartButton.removeClass('invisible');
    nextCartButton.addClass('btn-primary');

    allCartButton.bind('click', false)
    nextCartButton.unbind('click', false);

  })

  $(".add-cart-btn").bind('click', false);

  $(".add-cart-qty-box").focus(function() {

    var nextCartButton = $(this).closest('td').find('.add-cart-btn');
    var allCartButton = $(this).closest('div.align-to-sidebar').find(".add-cart-btn");

    allCartButton.removeClass('btn-primary');
    nextCartButton.addClass('btn-primary');

    allCartButton.bind('click', false)
    nextCartButton.unbind('click', false);

  })


  $(".cart-link").click(function(){
    var nextCartInfo = $(this).closest('tr').next().next();
    var allCartInfo = $(this).closest("div.align-to-sidebar").find(".cart-info");


    if (nextCartInfo.hasClass('hidden')) {
      allCartInfo.addClass('hidden');
      nextCartInfo.toggleClass('hidden');
    } else {
      allCartInfo.addClass('hidden');
    }
  });

  $(".details-link").click(function(){
    $(this).closest("tr").next().toggleClass('hidden');
  })

  $(".edit-link").click(function() {
    $(this).closest('div.edit-page').find('.edit-dropdown').toggleClass('hidden');
  })

  $(".edit-address-link").click(function() {
    var nextAddressInfo = $(this).closest('tr').next();
    var allAddressInfo = $(this).closest("div.edit-page").find(".edit-address-dropdown");

    $('.edit-user-link').removeClass('btn-primary')
    $('.edit-user-link').bind('click', false)

    if (!$(this).closest('div.edit-page').find('.edit-dropdown').hasClass('hidden')) {
      $(this).closest('div.edit-page').find('.edit-dropdown').addClass('hidden');
    }

  if (nextAddressInfo.hasClass('hidden')) {
    allAddressInfo.addClass('hidden');
    nextAddressInfo.toggleClass('hidden');
  } else {
    allAddressInfo.addClass('hidden');
  }

  })

  $('.edit-order-item-box').focus(function() {
    $('.update-order-item-btn').bind('click', false);
    $('.update-order-item-btn').removeClass('btn-primary');

    $(this).closest('tr').find('.update-order-item-btn').unbind('click', false);
    $(this).closest('tr').find('.update-order-item-btn').addClass('btn-primary');
  })

  $('.add-cart-btn').click(function() {
    $('.item-added').removeClass('hidden').delay(1000).addClass('hidden')
  })
});



//=require turbolinks
