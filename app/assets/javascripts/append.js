$(document).ready(function(){
  $("#edit-panel").on("click", "#add-previous-company-btn", function(event) {
    event.preventDefault();

    $.ajax({
      url: "/previous_companies/new",
      method: "get"
    }).done(function(data) {
      $("#previous_companies_holder").append(data);
    }).fail(function() {
      console.log("did not ajax");
    });

  });

  $("#edit-panel").on("click", "#add-company-btn", function(event) {
    event.preventDefault();
    console.log("prevented default");
    var info = $(".new_previous_company").serialize();
    $.ajax({
      url:"/previous_companies",
      method: "post",
      data: info
    }).done(function(data) {
      $("#previous_companies_holder").append(data);
      $(".new_previous_company").val("").hide();
      console.log(data);
    }).fail(function(data) {
      console.log(data);
      console.log("did not ajax");
    })
  });

});