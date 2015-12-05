$(document).ready(function(){
  $("#user_program" ).hide();
  $("#grad_date").hide();
  $("#user_school").hide();

  $( "#yes-no" ).on('click', function() {
    $( "#user_program" ).slideToggle();
    $("#grad_date").slideToggle();
    $("#user_school").slideToggle();
  });

  $(".search-toggle").hide();
  $(".schedule-toggle").hide();
  $(".connect-toggle").hide();

  $("#home-search-link").on("click", function(event) {
    event.preventDefault();
    $(".search-toggle").fadeIn();
    $(".schedule-toggle").hide();
    $(".connect-toggle").hide();
  });

  $("#home-schedule-link").on("click", function(event) {
    event.preventDefault();
    $(".search-toggle").hide();
    $(".schedule-toggle").fadeIn();
    $(".connect-toggle").hide();
  });

  $("#home-connect-link").on("click", function(event) {
    event.preventDefault();
    $(".search-toggle").hide();
    $(".schedule-toggle").hide();
    $(".connect-toggle").fadeIn();
  });
});

