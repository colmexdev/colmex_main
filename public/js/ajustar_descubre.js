$( document ).ready(function() {
    			var cw = $('.frame-descubre').width();
					$('.frame-descubre').css({'height':cw+'px'});
				});

				window.onresize = function(){
					var cw = $('.frame-descubre').width();
					$('.frame-descubre').css({'height':cw+'px'});
				}
