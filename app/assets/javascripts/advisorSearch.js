$(document).ready(function(){
  $("#left-category-bar").on("submit","#advisors-filter-form",function(event){
    event.preventDefault();

    $.ajax({
      method: 'GET',
      url: '/FinNetwork',
      data: $(event.target).serialize()
    }).done(function(data) {
      $("#advisors-list").html(data);
    }).fail(function(response){
      console.log(response);
    })

  });

})