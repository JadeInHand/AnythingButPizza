
$(document).ready(function() {

	var count = 0;

	$('.category-list ul li').hide();

	$('.category-list ul').on('click', function() {
		var items = $(this).find('li');

		for (var i = 0; i < items.length; i++) {
			if (count % 2 !== 0) {
				$(items[i]).hide();

			} else {
				$(items[i]).show();
			}
		}
		count++;
	});
});