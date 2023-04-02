/// @desc Check click and hover

var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);

if (mouse_check_button(mb_left))
{
	// Check if clicked in bounds
	if (mouseX >= x and mouseX <= x + sprite_width and mouseY >= y and mouseY <= y + sprite_height)
	{
		holding = true;
	}
}
else
{
	holding = false;
}

// Clicked when released in bounds
if (holding == true)
{
	if (mouseX >= x and mouseX <= x + sprite_width and mouseY >= y and mouseY <= y + sprite_height)
	{
		instance_activate_object(oPlayer);
		room_goto(global.galaxy[global.current_solar_system].my_room);
	}
}
