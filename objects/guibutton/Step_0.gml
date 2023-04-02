/// @desc Check clicked

var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);
mouseInBounds = (mouseX >= xPos and
				 mouseX <= xPos + width and 
				 mouseY >= yPos and 
				 mouseY <= yPos + height);
					 
// Check if holding button
holding = mouse_check_button(mb_left) && mouseInBounds;

// Clicked when released in bounds
if (holding && mouseInBounds)
{
    event_user(0);
}