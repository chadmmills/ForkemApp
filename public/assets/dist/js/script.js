(function($, window){


	var wb = {
		setup : {
			test : function() {
				return true;
			},
			run : function() {
				// var newUrl, pathArray, secondSegement;
				// newURL = window.location.protocol + "//" + window.location.host + "/" + window.location.pathname;
				// pathArray = window.location.pathname.split( '/' );
				// secondSegement = pathArray[1];
				// $('.'+secondSegement).addClass('active-page');
			}
		}
	};

	for (var key in wb){
		if (wb[key].test()){
			wb[key].run();
		}
	}

}(jQuery, window));
