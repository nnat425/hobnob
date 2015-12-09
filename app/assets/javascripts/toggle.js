$(document).ready(function(){
  $("#user_program" ).hide();
  $("#grad_date").hide();
  $("#user_school").hide();

  $( "#yes-no" ).on('click', function() {
    $( "#user_program" ).slideToggle();
    $("#grad_date").slideToggle();
    $("#user_school").slideToggle();
  });

  $(".learn-toggle").hide();

  $("#learn-more").on("click", "#home-learn-link", function(event) {
    event.preventDefault();
    $(".learn-toggle").fadeToggle();
  });

  $(".home-box-info").hide();

  $( ".home-subheader").hover(function() {
    var id = $(this).attr('id');
    $("#info" + id).fadeToggle();
  });




});

