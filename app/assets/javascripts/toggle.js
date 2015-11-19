$(document).ready(function(){
  $("#user_program" ).hide();
  $("#grad_date").hide();
  $("#user_school").hide();

  $( "#yes-no" ).on('click', function() {
    $( "#user_program" ).slideToggle();
    $("#grad_date").slideToggle();
    $("#user_school").slideToggle();
  });


});

