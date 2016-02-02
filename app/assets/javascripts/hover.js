$(document).ready(function(){

// For phone view
$('#investment_banking_info_pop_network_phone').click(function(){
  $('#investment_banking_popup_network_phone').slideToggle();
});
$('#asset_management_info_pop_network_phone').click(function(){
  $('#asset_management_popup_network_phone').slideToggle();
});
$('#corporate_finance_info_pop_network_phone').click(function(){
  $('#corporate_finance_popup_network_phone').slideToggle();
});
$('#other_finance_info_pop_network_phone').click(function(){
  $('#other_finance_popup_network_phone').slideToggle();
});
$('#resume_interview_info_pop_network_phone').click(function(){
  $('#resume_interview_popup_network_phone').slideToggle();
});

//For desktop view
$("#investment_banking_info_pop_network" ).hover(
  function() {
    $('#investment_banking_popup_network').fadeIn(500);
  }, function() {
    $('#investment_banking_popup_network').fadeOut(500);
  }
  );

$("#asset_management_info_pop_network" ).hover(
  function() {
    $('#asset_management_popup_network').fadeIn(500);
  }, function() {
    $('#asset_management_popup_network').fadeOut(500);
  }
  );

$("#corporate_finance_info_pop_network" ).hover(
  function() {
    $('#corporate_finance_popup_network').fadeIn(500);
  }, function() {
    $('#corporate_finance_popup_network').fadeOut(500);
  }
  );

$("#other_finance_info_pop_network" ).hover(
  function() {
    $('#other_finance_popup_network').fadeIn(500);
  }, function() {
    $('#other_finance_popup_network').fadeOut(500);
  }
  );

$("#resume_interview_info_pop_network" ).hover(
  function() {
    $('#resume_interview_popup_network').fadeIn(500);
  }, function() {
    $('#resume_interview_popup_network').fadeOut(500);
  }
  );



});


