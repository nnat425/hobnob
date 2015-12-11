$(document).ready(function(){
  $("#user_program" ).hide();
  $("#grad_date").hide();
  $("#user_school").hide();

  $( "#yes-no" ).on('click', function() {
    $( "#user_program" ).slideToggle();
    $("#grad_date").slideToggle();
    $("#user_school").slideToggle();
  });

  $(".learn-toggle").hide();

  $("#learn-more").on("click", "#home-learn-link", function(event) {
    event.preventDefault();
    $(".learn-toggle").fadeToggle();
  });

  $(".home-box-toggle").hide();

  $( ".home-subheader").hover(function() {
      var id = $(this).attr('id');
      $(this).css('background-color','#F0F8FF');
      $(this).css('border','1px solid #2996cc');
      $("#home-icon-" + id).css("background-color", "#fff");
      $("#home-icon-" + id).css("border", "1px solid #fff");
      $("#home-icon-" + id + " > h1").css("color", "#2996cc");
      $("#info-" + id).hide();
      $( "#info" + id).slideDown();
    },
    function() {
      var id = $(this).attr('id');
      $(this).css('background-color','#fff');
      $(this).css('border','1px solid #C0C0C0');
      $("#home-icon-" + id).css("background-color", "#2996cc");
      $("#home-icon-" + id + " > h1").css("color", "#fff");
      $("#info" + id).hide();
      $( "#info-" + id).slideDown();

    });





});

