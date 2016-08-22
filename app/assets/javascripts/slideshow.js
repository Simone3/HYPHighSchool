slider_function = (function()
{
	// Stop timer if it's atill active (problem with Rails TurboLink...)
	if (window.sliderTimer) clearTimeout(window.sliderTimer);

	// Hide all divs inside the slideshow container except the first one
	$("#slideshow > div:gt(0)").hide();

	// Start timer
	window.sliderTimer = setInterval(function()
	{
		// Get first div in the container
		$('#slideshow > div:first')

		// Make it fade out
		.fadeOut(1000)

		// Get next div
		.next()

		// Make it fade in
		.fadeIn(1000)
		.end()

		// Make the current div the first one inside the container
		.appendTo('#slideshow');

	}, 3000);
});

// Call function only after page load
$(document).ready(slider_function);
$(document).on('page:load', slider_function);
