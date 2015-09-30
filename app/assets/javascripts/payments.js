
$(document).ready(function() {

	var pickupUser = gon.pickupUser;
	console.log(pickupUser["name"]);

	var p = $("<p/>").append(pickupUser["name"]);

	$('#pickup-users').append(p);
});