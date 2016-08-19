/*$(document).on('page:change', function() {
  ga('send', 'pageview', window.location.pathname);
  $(window).trigger("resize");
});*/

  // Create a queue, but don't obliterate an existing one!
  window.analytics = window.analytics || [];

  // A list of the methods in Analytics.js to stub.
  window.analytics.methods = ['identify', 'group', 'track',
    'page', 'pageview', 'alias', 'ready', 'on', 'once', 'off',
    'trackLink', 'trackForm', 'trackClick', 'trackSubmit'];

  // Define a factory to create stubs. These are placeholders
  // for methods in Analytics.js so that you never have to wait
  // for it to load to actually record data. The `method` is
  // stored as the first argument, so we can replay the data.
  window.analytics.factory = function(method){
    return function(){
      var args = Array.prototype.slice.call(arguments);
      args.unshift(method);
      window.analytics.push(args);
      return window.analytics;
    };
  };

  // For each of our methods, generate a queueing stub.
  for (var i = 0; i < window.analytics.methods.length; i++) {
    var key = window.analytics.methods[i];
    window.analytics[key] = window.analytics.factory(key);
  }

  // Define a method to load Analytics.js from our CDN,
  // and that will be sure to only ever load it once.
  window.analytics.load = function(key){
    if (document.getElementById('analytics-js')) return;

    // Create an async script element based on your key.
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.id = 'analytics-js';
    script.async = true;
    script.src = ('https:' === document.location.protocol
      ? 'https://' : 'http://')
      + 'cdn.segment.io/analytics.js/v1/'
      + key + '/analytics.min.js';

    // Insert our script next to the first script element.
    var first = document.getElementsByTagName('script')[0];
    first.parentNode.insertBefore(script, first);
  };

  // Add a version to keep track of what's in the wild.
  window.analytics.SNIPPET_VERSION = '3.1.0';

  // Load Analytics.js with your key, which will automatically
  // load the tools you've enabled for your account. Boosh!
  window.analytics.load('CVDkY1UzgToDwWfJ2OArhXiCLv9CA9zC');

  // Make the first page call to load the integrations. If
  // you'd like to manually name or tag the page, edit or
  // move this call however you'd like.
  /*  */
  window.analytics.page();

  // accommodate Turbolinks
  // track page views and Descubre clicks
  $(document).on('ready page:change', function() {
    console.log('Página cargada: ' + window.location.href);
    analytics.page();
    if(document.getElementById("wrapper") != null){
      console.log("Tracking de links de Descubre");
      for(var i = 0; i < descubres.length; i++){
        var titulo = "Click a Descubre: " + $("#tit-desc-"+i).text();
        var link = $("#frame-"+i+" a").attr("href");
        console.log(titulo + " " + link);
        analytics.trackLink($("#frame-"+i+"-hov"), titulo, {liga: link});
      }
    }
    if(document.getElementById("forma_suscripcion") != null){
      console.log("Forma de suscripción a agenda cargada");
      analytics.trackForm($('#forma_suscripcion'), 'Registro a la Agenda');
    }
    if(document.getElementById("div_slider") != null){
      console.log("Slider rastreado");
      var ligas = document.getElementById("inner-slider").getElementsByTagName("a");
      for(var i = 0; i < ligas.length; i++){
        var link = ligas[i].getAttribute("href");
        var titulo = "Consultado el badge: " + link;
        console.log(titulo);
        analytics.trackLink($("#liga_slider-"+i), titulo, {liga: link});
      }
    }

 });
