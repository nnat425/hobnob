$(document).ready(function(){
  $( "#user_student_true" ).on('click',function() {
    $( "#user_program" ).show();
    $("#user_graduation_date").show();
  });

  $( "#user_student_false" ).on('click',function() {
    $( "#user_program" ).hide();
    $("#user_graduation_date").hide();
  });

});

