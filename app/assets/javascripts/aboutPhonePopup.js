$(document).ready(function(){
  $('#area_of_expertise_phone').on("click",function(){
    $('#category_pop_up_phone').show();
  });
  $('#close').on("click",function(){
    $('#category_pop_up_phone').hide();
  });
  $('#locations_phone').on("click",function(){
    $('#location_pop_up_phone').show();
  });
  $('#close_location').on("click",function(){
    $('#location_pop_up_phone').hide();
  });
  $('#years_phone').on("click",function(){
    $('#year_pop_up_phone').show();
  });
  $('#close_year').on("click",function(){
    $('#year_pop_up_phone').hide();
  });
});