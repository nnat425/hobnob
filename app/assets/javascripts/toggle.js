$(document).ready(function(){
  $("#user_program" ).hide();
  $("#grad_date").hide();
  $("#user_school").hide();

  $( "#yes-no" ).on('click', function() {
    $( "#user_program" ).slideToggle();
    $("#grad_date").slideToggle();
    $("#user_school").slideToggle();
  });

  $("#learn-toggle").hide();

  $("#learn-more").on("click", "#home-learn-link", function(event) {
    event.preventDefault();
    $("#learn-toggle").fadeToggle();

  });

  $(".home-box-toggle").hide();

  $( ".home-subheader").hover(function() {
    var id = $(this).attr('id');
    $(this).css('border','2px solid #87CEFF');
    $(this).css("box-shadow","0 0 5px rgba(81, 203, 238, 1)");

    $("#info-" + id).hide();
    $( "#info" + id).slideDown();
  },
  function() {
    var id = $(this).attr('id');
    $(this).css('border','1px solid #C0C0C0');
    $(this).css("box-shadow","none");
    $("#info" + id).hide();
    $( "#info-" + id).slideDown();

  });

  $("#categories-toggle").hide();
  $("#locations-toggle").hide();
  $("#experience-toggle").hide();

  $("#show-options-categories").on("click", function(event) {
    event.preventDefault();
    $("#categories-toggle").slideToggle();

  });

  $("#show-options-locations").on("click", function(event) {
    event.preventDefault();
    $("#locations-toggle").slideToggle();

  });
  $("#show-options-years").on("click", function(event) {
    event.preventDefault();
    $("#experience-toggle").slideToggle();
  });


  $("#add-comment-btn").on("click", function(event) {
    event.preventDefault();
    $("#comments-form-holder").slideDown();
    $("#add-comment-btn").hide();
  });

  $("#add-charity-btn").on("click", function(event) {
    event.preventDefault();
    $("#charities-form-holder").slideDown();
    $("#add-charity-btn").hide();
  });

  $("#close-comment-btn").on("click", function(event) {
    event.preventDefault();
    var id = $(this).parent().parent().attr("id");
    $("#"+id).slideUp();
    $("#add-comment-btn").show();

  });

  $("#close-charity-btn").on("click", function(event) {
    event.preventDefault();
    var id = $(this).parent().parent().attr("id");
    $("#"+id).slideUp();
    $("#add-charity-btn").show();
  });



});

