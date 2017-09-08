$(document).on('turbolinks:load', function() {
	//evento para restringir entrada  de datos
	$("#latitude,#longitud").on("keydown",function(e){
		if(e.keyCode != 8 && e.keyCode != 9 && e.keyCode != 13){
			if( (e.keyCode < 37 || e.keyCode>40)&& e.key.search(/[^\d\-.]/g) != -1)
				e.preventDefault();
		}
		
	})

	var handler = Gmaps.build('Google');
	handler.buildMap({ internal: {id: 'geolocation'} }, function(){
  if(navigator.geolocation)
  	navigator.geolocation.getCurrentPosition(displayOnMap);
});

	function displayOnMap(position){
		console.log(position)
		var marker = handler.addMarker({
			// se utilizan gon para entregar la data desde el backend
			lat: gon.latitude.replace(/,/g,"."),
			lng: gon.longitude.replace(/,/g,".")
		});
		handler.map.centerOn(marker);
	};
});