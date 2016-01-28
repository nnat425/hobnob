$(document).ready(function(){
  $("#edit-panel").on("click", "#add-previous-company-btn", function(event) {
    event.preventDefault();
    console.log("prevented default");

    $.ajax({
      url: "/previous_companies/new",
      method: "get"
    }).done(function(data) {
      console.log(data);
      $("#previous_companies_holder").append(data);
    }).fail(function() {
      console.log("did not ajax");
    });

 });

  $("#edit-previous-company-form-holder").on("submit", "#add-company-btn", function(event) {
    event.preventDefault();
  }

});