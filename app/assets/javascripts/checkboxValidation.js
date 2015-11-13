$(document).ready(function(){
  $("#edit_signup").on('submit',function(event) {
   if(!$(('.category-checkbox')).is(':checked') == true) {
    event.preventDefault();
    alert("You must pick at least 1 area of experience")
  }
})
});