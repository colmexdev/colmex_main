  // accommodate Turbolinks
  // track page views and Descubre clicks
  $(document).on('ready page:change', function() {
    analytics.page();
		if(typeof descubres !== 'undefined'){
		  for(var i = 0; i < descubres.length; i++){
		    var titulo = "Click a Descubre: " + $("#tit-desc-"+i).text();
		    var link = $("#frame-"+i+" a").attr("href");
		    analytics.trackLink($("#frame-"+i+"-hov"), titulo, {liga: link});
		  }
		}
    //analytics.trackForm($('#new_visitor'), 'Signed Up');
    //analytics.trackForm($('#new_contact'), 'Contact Request');
 });
