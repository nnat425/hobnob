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
        $("#nav-bar-holder").replaceWith(data);
        $("a.book-appt-btn").removeAttr("id");
      }).fail(function() {
        console.log("did not work");
      });
    });
    $("#close-btn-holder").on("click", "#close-login", function() {
      $("#login-pop").bPopup().close();
    });

    $("#signup-link-holder").on("click", "#pop-signup-link", function(event) {

      event.preventDefault();

      $("#login-pop").bPopup().close();
      $("#signup-pop").bPopup();
    });
    $("#close-btn-holder").on("click", "#close-signup", function() {
      $("#signup-pop").bPopup().close();
    });
  });

});