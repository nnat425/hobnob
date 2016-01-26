$(document).ready(function(){

  $('#area_of_expertise').on("click",function(){
    $('#element_to_pop_up').show();
    $('.b-modal').show();
    console.log("WTF");
  });
  $('#element_to_pop_up').click(function(){
    $('#element_to_pop_up').hide();
    $('.b-modal').hide();
  });

  $('#locations').on("click",function(){
    $('#location_to_pop_up').show();
    $('.b-modal').show();
    console.log("WTF");
  });
  $('#location_to_pop_up').click(function(){
    $('#location_to_pop_up').hide();
    $('.b-modal').hide();
  });






});
