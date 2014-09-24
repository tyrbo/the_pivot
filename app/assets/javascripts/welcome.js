// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
var find_location = function(){
  if ("geolocation" in navigator) {
    navigator.geolocation.getCurrentPosition(function(position) {
      return (position.coords.latitude, position.coords.longitude);
    });
  } else {
    //something that generates random list of suppliers
    //message about not being able to find location
  };
};

$(document).ready(function () {

    $(".player").mb_YTPlayer();

});
