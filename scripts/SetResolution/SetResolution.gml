/// @desc SetResolution(width, height) Sets the resolution of the game window
/// @arg width Width of the window in pixels
/// @arg height Height of the window in pixels

function SetResolution(argument0, argument1) {

	var displayWidth  = argument0; //display_get_width(); - smartphone only
	var displayHeight = argument1; //display_get_height(); - smartphone only

	// Resize Game Window
	window_set_size(displayWidth, displayHeight);

	// Set the resolution we've programmed the game for
	var baseWidth = RES_W;
	var baseHeight = RES_H;

	// Determine the aspect ratio
	var aspect = baseWidth/baseHeight;

	// Calculate adjusted window width and height
	if (displayWidth >= displayHeight)
	{
		var height = min(baseHeight, displayHeight);
		var width = height * aspect;
	}

	// Resize application surface
	surface_resize(application_surface, width, height);
	
	// Resize GUI
	display_set_gui_maximise();
}
