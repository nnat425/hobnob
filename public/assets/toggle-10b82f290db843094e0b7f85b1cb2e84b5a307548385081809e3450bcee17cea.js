$(document).ready(function(){$("#user_program").hide(),$("#grad_date").hide(),$("#user_school").hide(),$("#yes-no").on("click",function(){$("#user_program").slideToggle(),$("#grad_date").slideToggle(),$("#user_school").slideToggle()}),$("#learn-toggle").hide(),$("#learn-more").on("click","#home-learn-link",function(e){e.preventDefault(),$("#learn-toggle").fadeToggle()}),$(".home-box-toggle").hide(),$(".home-subheader").hover(function(){var e=$(this).attr("id");$(this).css("border","2px solid #87CEFF"),$(this).css("box-shadow","0 0 5px rgba(81, 203, 238, 1)"),$("#info-"+e).hide(),$("#info"+e).slideDown()},function(){var e=$(this).attr("id");$(this).css("border","1px solid #C0C0C0"),$(this).css("box-shadow","none"),$("#info"+e).hide(),$("#info-"+e).slideDown()}),$("#categories-toggle").hide(),$("#locations-toggle").hide(),$("#experience-toggle").hide(),$("#show-options-categories").on("click",function(e){e.preventDefault(),$("#categories-toggle").slideToggle()}),$("#show-options-locations").on("click",function(e){e.preventDefault(),$("#locations-toggle").slideToggle()}),$("#show-options-years").on("click",function(e){e.preventDefault(),$("#experience-toggle").slideToggle()}),$("#add-comment-btn").on("click",function(e){e.preventDefault(),$("#comments-form-holder").slideDown(),$("#add-comment-btn").hide()}),$("#close-comment-btn").on("click",function(e){e.preventDefault();var o=$(this).parent().parent().attr("id");$("#"+o).slideUp(),$("#add-comment-btn").show()})});