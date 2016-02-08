$(document).ready(function(){
  $("#advisors-list").on("click", "#must-login", function(event) {
    event.preventDefault();

    $("#login-pop").bPopup().on("click", "#submit-login", function(event) {
      event.preventDefault();
      var data = $("form#login").serialize();

      $.ajax({
        url: '/login',
        method: 'post',
        data: data
      }).done(function(data) {
        console.log(data)
        $("#login-pop").bPopup().close();
        $("#advisors-index-container").append(data);
      }).fail(function() {
        console.log("did not work");
      });
    });
    $("#close-btn-holder").on("click", "#close-login", function() {
      $("#login-pop").bPopup().close();
    })
  });

});