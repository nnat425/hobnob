$(document).ready(function(){
  $("#user_program" ).hide();
  $("#grad_date").hide();
  $("#user_school").hide();

  $( "#yes-no" ).on('click', function() {
    $( "#user_program" ).slideToggle();
    $("#grad_date").slideToggle();
    $("#user_school").slideToggle();
  });

  $(".services-toggle").hide();
  $(".the-network-toggle").hide();
  $(".getting-connected-toggle").hide();

  $("#home-services-box").on("click", "#home-services-link", function(event) {
    event.preventDefault();
    $()
    $(".services-toggle").fadeIn();
  });

  $("#home-network-link").on("click", function(event) {
    event.preventDefault();
    $(".the-network-toggle").fadeIn();
    $(".getting-connected-toggle").hide();
    $(".services-toggle").hide();
  });

  $("#home-get-connected-link").on("click", function(event) {
    event.preventDefault();
    $(".the-network-toggle").hide();
    $(".getting-connected-toggle").fadeIn();
    $(".services-toggle").hide();
  });
});

