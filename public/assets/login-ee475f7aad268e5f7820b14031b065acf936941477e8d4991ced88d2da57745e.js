$(document).ready(function(){$("#advisors-list").on("click","#must-login",function(o){o.preventDefault(),$("#login-pop").bPopup().on("click","#submit-login",function(o){o.preventDefault();var n=$("form#login").serialize();$.ajax({url:"/login",method:"post",data:n}).done(function(o){$("#login-pop").bPopup().close(),$("#nav-bar-holder").replaceWith(o),$("a.book-appt-btn").removeAttr("id")}).fail(function(){console.log("did not work")})}),$("#login-pop").on("click","#close-login",function(){$("#login-pop").bPopup().close()}),$("#signup-link-holder").on("click","#pop-signup-link",function(o){o.preventDefault(),$("#login-pop").bPopup().close(),$("#signup-pop").bPopup().on("click","#submit-signup",function(o){o.preventDefault();var n=$("#new-user-pop-form").serialize();$.ajax({url:"/users",method:"post",data:n}).done(function(o){$("#signup-pop").bPopup().close(),$("#nav-bar-holder").replaceWith(o),$("a.book-appt-btn").removeAttr("id")}).fail(function(){console.log("did not work")})})}),$("#close-btn-holder").on("click","#close-signup",function(){$("#signup-pop").bPopup().close()})})});