$(document).ready(function(){
  $("#advisors-list").on("click", "#must-login", function(event) {
    event.preventDefault();

    $("#login-pop").bPopup();
  });

});