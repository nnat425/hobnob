$(document).ready(function(){$("#edit-panel").on("click","#add-previous-company-btn",function(a){a.preventDefault();var o=$("#add-previous-company-btn").attr("data-advisor-id");$.ajax({url:"/advisors/"+o+"/previous_companies/new",method:"get"}).done(function(a){$("#previous_companies_holder").append(a)}).fail(function(){console.log("did not ajax")})}),$("#edit-panel").on("click","#add-company-btn",function(a){a.preventDefault();var o=$(".new_previous_company").serialize(),n=$("#advisor-id").attr("data-advisor-id");$.ajax({url:"/advisors/"+n+"/previous_companies",method:"post",data:o}).done(function(a){$("#previous_companies_holder").html(a),$(".new_previous_company").val("").hide()}).fail(function(a){console.log("did not ajax")})}),$("#edit-panel").on("click","#edit-previous-company-btn",function(a){a.preventDefault();var o=$(a.target).attr("href"),n=$(a.target).parent().attr("id");$.ajax({url:o,method:"get"}).done(function(a){$("#company-"+n).html(a)}).fail(function(a){console.log("did not ajax")})}),$("#edit-panel").on("click","#update-company-btn",function(a){a.preventDefault();var o=$(a.target).siblings().serialize(),n=$(a.target).parent().attr("id").split("-")[1],t=$("#advisor-id").attr("data-advisor-id"),e="/advisors/"+t+"/previous_companies/"+n;$.ajax({url:e,type:"patch",data:o}).done(function(a){$("#previous_companies_holder").html(a)}).fail(function(a){console.log("did not ajax")})})});