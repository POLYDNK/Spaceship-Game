/// @desc Check clicked

var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);

if (mouse_check_button(mb_left))
{
	// Check if clicked in bounds
	if (mouseX >= xPos and mouseX <= xPos + width and mouseY >= yPos and mouseY <= yPos + height)
	{
		target_menu.current_tab = target_tab;
		selected = true;
	}
}
