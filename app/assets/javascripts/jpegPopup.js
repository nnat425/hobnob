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

});
