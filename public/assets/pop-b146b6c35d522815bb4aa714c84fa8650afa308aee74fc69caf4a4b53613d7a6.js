!function(o){o.fn.bPopup=function(t,e){function n(){switch(w.contentContainer=o(w.contentContainer||D),w.content){case"iframe":var t=o('<iframe class="b-iframe" '+w.iframeAttr+"></iframe>");t.appendTo(w.contentContainer),x=D.outerHeight(!0),P=D.outerWidth(!0),i(),t.attr("src",w.loadUrl),f(w.loadCallback);break;case"image":i(),o("<img />").load(function(){f(w.loadCallback),s(o(this))}).attr("src",w.loadUrl).hide().appendTo(w.contentContainer);break;default:i(),o('<div class="b-ajax-wrapper"></div>').load(w.loadUrl,w.loadData,function(t,e,n){f(w.loadCallback,e),s(o(this))}).hide().appendTo(w.contentContainer)}}function i(){w.modal&&o('<div class="b-modal '+m+'"></div>').css({backgroundColor:w.modalColor,position:"fixed",top:0,right:0,bottom:0,left:0,opacity:0,zIndex:w.zIndex+W}).appendTo(w.appendTo).fadeTo(w.speed,w.opacity),h(),D.data("bPopup",w).data("id",m).css({left:"slideIn"==w.transition||"slideBack"==w.transition?"slideBack"==w.transition?I.scrollLeft()+B:-1*(T+P):r(!(!w.follow[0]&&k||y)),position:w.positionStyle||"absolute",top:"slideDown"==w.transition||"slideUp"==w.transition?"slideUp"==w.transition?I.scrollTop()+z:v+-1*x:p(!(!w.follow[1]&&C||y)),"z-index":w.zIndex+W+1}).each(function(){w.appending&&o(this).appendTo(w.appendTo)}),d(!0)}function a(){return w.modal&&o(".b-modal."+D.data("id")).fadeTo(w.speed,0,function(){o(this).remove()}),w.scrollBar||o("html").css("overflow","auto"),o(".b-modal."+m).unbind("click"),I.unbind("keydown."+m),S.unbind("."+m).data("bPopup",0<S.data("bPopup")-1?S.data("bPopup")-1:null),D.undelegate(".bClose, ."+w.closeClass,"click."+m,a).data("bPopup",null),clearTimeout(U),d(),!1}function l(t){z=S.height(),B=S.width(),g=b(),(g.x||g.y)&&(clearTimeout(_),_=setTimeout(function(){h(),t=t||w.followSpeed;var e={};g.x&&(e.left=w.follow[0]?r(!0):"auto"),g.y&&(e.top=w.follow[1]?p(!0):"auto"),D.dequeue().each(function(){y?o(this).css({left:T,top:v}):o(this).animate(e,t,w.followEasing)})},50))}function s(o){var t=o.width(),e=o.height(),n={};w.contentContainer.css({height:e,width:t}),e>=D.height()&&(n.height=D.height()),t>=D.width()&&(n.width=D.width()),x=D.outerHeight(!0),P=D.outerWidth(!0),h(),w.contentContainer.css({height:"auto",width:"auto"}),n.left=r(!(!w.follow[0]&&k||y)),n.top=p(!(!w.follow[1]&&C||y)),D.animate(n,250,function(){o.show(),g=b()})}function c(){S.data("bPopup",W),D.delegate(".bClose, ."+w.closeClass,"click."+m,a),w.modalClose&&o(".b-modal."+m).css("cursor","pointer").bind("click",a),H||!w.follow[0]&&!w.follow[1]||S.bind("scroll."+m,function(){if(g.x||g.y){var o={};g.x&&(o.left=w.follow[0]?r(!y):"auto"),g.y&&(o.top=w.follow[1]?p(!y):"auto"),D.dequeue().animate(o,w.followSpeed,w.followEasing)}}).bind("resize."+m,function(){l()}),w.escClose&&I.bind("keydown."+m,function(o){27==o.which&&a()})}function d(o){function t(t){D.css({display:"block",opacity:1}).animate(t,w.speed,w.easing,function(){u(o)})}switch(o?w.transition:w.transitionClose||w.transition){case"slideIn":t({left:o?r(!(!w.follow[0]&&k||y)):I.scrollLeft()-(P||D.outerWidth(!0))-200});break;case"slideBack":t({left:o?r(!(!w.follow[0]&&k||y)):I.scrollLeft()+B+200});break;case"slideDown":t({top:o?p(!(!w.follow[1]&&C||y)):I.scrollTop()-(x||D.outerHeight(!0))-200});break;case"slideUp":t({top:o?p(!(!w.follow[1]&&C||y)):I.scrollTop()+z+200});break;default:D.stop().fadeTo(w.speed,o?1:0,function(){u(o)})}}function u(o){o?(c(),f(e),w.autoClose&&(U=setTimeout(a,w.autoClose))):(D.hide(),f(w.onClose),w.loadUrl&&(w.contentContainer.empty(),D.css({height:"auto",width:"auto"})))}function r(o){return o?T+I.scrollLeft():T}function p(o){return o?v+I.scrollTop():v}function f(t,e){o.isFunction(t)&&t.call(D,e)}function h(){v=C?w.position[1]:Math.max(0,(z-D.outerHeight(!0))/2-w.amsl),T=k?w.position[0]:(B-D.outerWidth(!0))/2,g=b()}function b(){return{x:B>D.outerWidth(!0),y:z>D.outerHeight(!0)}}o.isFunction(t)&&(e=t,t=null);var w=o.extend({},o.fn.bPopup.defaults,t);w.scrollBar||o("html").css("overflow","hidden");var m,g,C,k,y,v,T,x,P,_,U,D=this,I=o(document),S=o(window),z=S.height(),B=S.width(),H=/OS 6(_\d)+/i.test(navigator.userAgent),W=0;return D.close=function(){a()},D.reposition=function(o){l(o)},D.each(function(){o(this).data("bPopup")||(f(w.onOpen),W=(S.data("bPopup")||0)+1,m="__b-popup"+W+"__",C="auto"!==w.position[1],k="auto"!==w.position[0],y="fixed"===w.positionStyle,x=D.outerHeight(!0),P=D.outerWidth(!0),w.loadUrl?n():i())})},o.fn.bPopup.defaults={amsl:50,appending:!0,appendTo:"body",autoClose:!1,closeClass:"b-close",content:"ajax",contentContainer:!1,easing:"swing",escClose:!0,follow:[!0,!0],followEasing:"swing",followSpeed:500,iframeAttr:'scrolling="no" frameborder="0"',loadCallback:!1,loadData:!1,loadUrl:!1,modal:!0,modalClose:!0,modalColor:"#000",onClose:!1,onOpen:!1,opacity:.7,position:["auto","auto"],positionStyle:"absolute",scrollBar:!0,speed:250,transition:"fadeIn",transitionClose:!1,zIndex:9997}}(jQuery),function(o){o(function(){o(".about_container_2").on("click","#my-button",function(t){t.preventDefault(),o("#element_to_pop_up").bPopup()}),o(".about_container_2").on("click","#levels-btn",function(t){t.preventDefault(),o("#popup-levels").bPopup()}),o(".menu").on("click",".mobile-header-dropdown",function(t){t.preventDefault(),o(".mobile-header-menu").bPopup()})})}(jQuery);