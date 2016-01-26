$(document).ready(function(){

  $('#area_of_expertise').on("click",function(){
    $('#element_to_pop_up').show();
  });
  $('#element_to_pop_up').click(function(){
    $('#element_to_pop_up').hide();
    $('.b-modal').hide();
  });

  $('#locations').on("click",function(){
    $('#location_to_pop_up').show();
  });
  $('#location_to_pop_up').click(function(){
    $('#location_to_pop_up').hide();
    $('.b-modal').hide();
  });

  $('#years').on("click",function(){
    $('#year_to_pop_up').show();
  });
  $('#year_to_pop_up').click(function(){
    $('#year_to_pop_up').hide();
    $('.b-modal').hide();
  });

  $('#questions').on("click",function(){
    $('#question_to_pop_up').show();
  });
  $('#question_to_pop_up').click(function(){
    $('#question_to_pop_up').hide();
    $('.b-modal').hide();
  });

  $('#fees').on("click",function(){
    $('#fee_to_pop_up').show();
  });
  $('#fee_to_pop_up').click(function(){
    $('#fee_to_pop_up').hide();
    $('.b-modal').hide();
  });




});
