$("[data-uk-nav]", context).each(function() {
	var nav = $(this);
	if (!nav.data("nav")) {
		var obj = UI.nav(nav, UI.Utils.options(nav.attr("data-uk-nav")));
	}
});
