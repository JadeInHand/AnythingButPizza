
$(document).ready(function() {

	if ($('.map-canvas').length <= 0) {
		return;
	}

	var userAddress = gon.address;

	var mapCanvas = document.getElementsByClassName('map-canvas')[0];
	var geocoder = new google.maps.Geocoder();

	geocoder.geocode ({ 'address': userAddress }, function(results, status) {

		if (status === google.maps.GeocoderStatus.OK) {
			var latitude = results[0].geometry.location.lat();
			var longitude = results[0].geometry.location.lng();

			var mapOptions = {
				center: new google.maps.LatLng(latitude, longitude),
				zoom: 12,
				mapTypeId: google.maps.MapTypeId.ROADMAP
			};

			var map = new google.maps.Map(mapCanvas, mapOptions);

			var marker = new google.maps.Marker({
				position: {lat: latitude, lng: longitude},
				map: map,
				label: 'M'
			});

			var infowindow = new google.maps.InfoWindow({
				content: userAddress
			});

			marker.addListener('click', function() {
				infowindow.open(map, marker);
			});
		}
	});

});

 	
