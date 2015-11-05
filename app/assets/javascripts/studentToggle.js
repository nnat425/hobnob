$(document).ready(function(){
  $( "#user_program" ).hide();
  $("#grad_date").hide();
  $("#user_school").hide();

  $( "#user_student_true" ).on('click',function() {
    $( "#user_program" ).show();
    $("#grad_date").show();
    $("#user_school").show();
  });

  $( "#user_student_false" ).on('click',function() {
   $( "#user_program" ).hide();
   $("#grad_date").hide();
    $("#user_school").hide();

 });

});

