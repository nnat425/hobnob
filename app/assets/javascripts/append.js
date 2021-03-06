$(document).ready(function(){
  $("#edit-panel").on("click", "#add-previous-company-btn", function(event) {
    event.preventDefault();

   var id = $('#add-previous-company-btn').attr("data-advisor-id");
    $.ajax({
      url: "/advisors/" + id + "/previous_companies/new",
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
    var id = $('#advisor-id').attr("data-advisor-id");
    $.ajax({
      url:"/advisors/" + id + "/previous_companies",
      method: "post",
      data: info
    }).done(function(data) {
      $("#previous_companies_holder").html(data);
      $(".new_previous_company").val("").hide();
    }).fail(function(data) {
      console.log("did not ajax");
    })
  });

  $("#edit-panel").on("click", "#edit-previous-company-btn", function(event) {
    event.preventDefault();

    var path = $(event.target).attr("href");
    var id = $(event.target).parent().attr("id");
    $.ajax({
      url: path,
      method: "get"
    }).done(function(data) {
      $("#company-" + id).html(data);
    }).fail(function(data) {
      console.log("did not ajax");
    })
  });


  $("#edit-panel").on("click", "#update-company-btn", function(event) {
    event.preventDefault();

    var info = $(event.target).siblings().serialize();
    var id = $(event.target).parent().attr("id").split("-")[1];
    var advisor_id = $('#advisor-id').attr("data-advisor-id");
    var path = "/advisors/" + advisor_id + "/previous_companies/" + id;

    $.ajax({
      url: path,
      type: "patch",
      data: info
    }).done(function(data) {
      $("#previous_companies_holder").html(data);
    }).fail(function(data) {
      console.log("did not ajax");
    })
  });

  // $("#edit-panel").on("click", "#delete-previous-company-btn", function(event) {
  //   event.preventDefault();
  //   console.log("prevented default");
  //   var path = $(event.target).attr("href");

  //   $.ajax({
  //     url: path,
  //     // type: "delete"
  //     type: "post",
  //     data: {_method: "delete"}
  //   }).done(function(data) {
  //     $("#previous_companies_holder").html(data);
  //   }).fail(function(data) {
  //     console.log("did not ajax");
  //   });
  // });

});