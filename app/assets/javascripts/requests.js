$(document).ready(function(){

  $("#form-holder").on("submit", ".submit-comment", function(event) {
    event.preventDefault();

    $.ajax({
      method: 'GET',
      url: "/advisors",
      data: $(event.target).serialize()
    }).done(function(data) {
      $("#advisors-list").html(data);
    }).fail(function(response){
      console.log(response);
    })
  }


});