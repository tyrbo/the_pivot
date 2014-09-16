//=require jquery
//=require jquery.turbolinks
//=require jquery_ujs
//=require bootstrap
//=require_tree .

$(document).ready(function() {
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
});

//=require turbolinks
