$(document).ready(function(){$("#edit-panel").on("click","#add-previous-company-btn",function(n){n.preventDefault(),$.ajax({url:"/previous_companies/new",method:"get"}).done(function(n){$("#previous_companies_holder").append(n)}).fail(function(){console.log("did not ajax")})}),$("#edit-panel").on("click","#add-company-btn",function(n){n.preventDefault();var e=$(".new_previous_company").serialize();$.ajax({url:"/previous_companies",method:"post",data:e}).done(function(n){$("#previous_companies_holder").html(n),$(".new_previous_company").val("").hide()}).fail(function(n){console.log("did not ajax")})}),$("#edit-panel").on("click","#edit-previous-company-btn",function(n){n.preventDefault();var e=$(n.target).attr("href"),o=$(n.target).parent().attr("id");$.ajax({url:e,method:"get"}).done(function(n){$("#company-"+o).html(n)}).fail(function(n){console.log("did not ajax")})}),$("#edit-panel").on("click","#update-company-btn",function(n){n.preventDefault();var e=$(n.target).siblings().serialize(),o=$(n.target).parent().attr("id").split("-")[1],a="/previous_companies/"+o;$.ajax({url:a,type:"patch",data:e}).done(function(n){$("#previous_companies_holder").html(n)}).fail(function(n){console.log("did not ajax")})})});