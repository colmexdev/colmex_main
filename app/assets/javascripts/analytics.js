$(document).on('page:change', function() {
  ga('send', 'pageview', window.location.pathname);
  $(window).trigger("resize");
});
