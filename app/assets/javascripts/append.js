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
    var info = $(".new_previous_company").serialize();
    $.ajax({
      url:"/previous_companies",
      method: "post",
      data: info
    }).done(function(data) {
      $("#previous_companies_holder").html(data);
      $(".new_previous_company").val("").hide();
    }).fail(function(data) {
      console.log(data);
      console.log("did not ajax");
    })
  });

  $("#edit-panel").on("click", "#delete-previous-company-btn", function(event) {
    event.preventDefault();
    console.log("prevented default");
    var path = $(event.target).attr("href");
    $.ajax({
      url: path,
      method: "delete"
    }).done(function(data) {
      console.log(data);
      $("#previous_companies_holder").html(data);
    }).fail(function() {
      console.log("did not ajax");
    });
  });

});