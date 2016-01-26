$(document).ready(function(){

  $('#area_of_expertise').on("click",function(){
    $('#blanket,#element_to_pop_up').show();
  });
  $('#element_to_pop_up,#blanket').click(function(){
    $('#element_to_pop_up,#blanket').hide();
  });

  $('#locations').on("click",function(){
    $('#blanket,#location_to_pop_up').show();
  });
  $('#location_to_pop_up,#blanket').click(function(){
    $('#location_to_pop_up,#blanket').hide();
  });

  $('#years').on("click",function(){
    $('#year_to_pop_up,#blanket').show();
  });
  $('#year_to_pop_up,#blanket').click(function(){
    $('#year_to_pop_up,#blanket').hide();
  });

  $('#questions').on("click",function(){
    $('#question_to_pop_up,#blanket').show();
  });
  $('#question_to_pop_up,#blanket').click(function(){
    $('#question_to_pop_up,#blanket').hide();
  });

  $('#fees').on("click",function(){
    $('#fee_to_pop_up,#blanket').show();
  });
  $('#fee_to_pop_up,#blanket').click(function(){
    $('#fee_to_pop_up,#blanket').hide();
  });
});
