/// @desc Check clicked

var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);

if (mouse_check_button(mb_left))
{
	// Check if clicked in bounds
	if (mouseX >= xPos and mouseX <= xPos + width and mouseY >= yPos and mouseY <= yPos + height)
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
	if (mouseX >= xPos and mouseX <= xPos + width and mouseY >= yPos and mouseY <= yPos + height)
	{
		clicked = true;
	}
	else
	{
		clicked = false;
	}
}
else
{
	clicked = false;
}