tooltip_function = (function()
{
	// Call function on objects with class "inactive_link"
	$('.inactive_link')

	// When mouse over...
	.hover
	(
		// Function when mouse enters
		function()
		{
			// Append the message to the document body
			$('<p class="tooltip">This link is not available right now, come back later!</p>')
			.appendTo('body')
			.fadeIn('slow');
		},

		// Function when mouse exits
		function()
		{
			// Remove message
			$('.tooltip').remove();
		}
	)

	// When mouse moves...
	.mousemove
	(
		// Change message position
		function(e)
		{
			mousex = e.pageX + 20;
			mousey = e.pageY + 10;
			
			$('.tooltip').css({ top: mousey, left: mousex })
		}
	);
});

// Call function only after page load
$(document).ready(tooltip_function);
$(document).on('page:load', tooltip_function);