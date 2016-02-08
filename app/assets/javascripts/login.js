$(document).ready(function(){
  $("#advisors-list").on("click", "#must-login", function(event) {
    event.preventDefault();

    $("#login-pop").bPopup();
    $("#login-pop").on("submit", "#submit-login", function(event) {
      event.preventDefault();
      var data = $(event.target).serialize();
      $.ajax({
        url: '/sessions',
        method: 'post',
        data: data
      }).done(function() {
        $("#login-pop").bPopup().close();
      }).fail(function() {
        console.log("did not work");
      });
    });
    $("#close-btn-holder").on("click", "#close-login", function() {
      $("#login-pop").bPopup().close();
    })
  });

});