//=require jquery
//=require jquery.turbolinks
//=require jquery_ujs
//=require bootstrap
//=require_tree .

$(document).ready(function() {
  $(".cart-link").click(function(){
    $(this).closest("tr").next().next().toggleClass('hidden');
  });

  $(".details-link").click(function(){
    $(this).closest("tr").next().toggleClass('hidden');
  })
});

//=require turbolinks
