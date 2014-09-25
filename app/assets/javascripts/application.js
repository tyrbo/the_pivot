//=require jquery
//=require jquery.turbolinks
//=require jquery_ujs
//=require bootstrap
//=require_tree .

$(document).ready(function() {
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

    allCartButton.removeClass('btn-primary');
    nextCartButton.addClass('btn-primary');

    allCartButton.bind('click', false)
    nextCartButton.unbind('click', false);

    $(this).val('')
  })

  $(".add-cart-btn").bind('click', false);

  $(".add-cart-qty-box").focus(function() {

    var nextCartButton = $(this).closest('td').find('.add-cart-btn');
    var allCartButton = $(this).closest('div.align-to-sidebar').find(".add-cart-btn");

    allCartButton.removeClass('btn-primary');
    nextCartButton.addClass('btn-primary');

    allCartButton.bind('click', false)
    nextCartButton.unbind('click', false);

    $(this).val('')
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
