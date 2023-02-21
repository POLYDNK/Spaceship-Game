/// @desc Check Touch

if (mouse_check_button(mb_left))
{
	if (holding == true)
	{
		if (device_mouse_x_to_gui(0) >= startPos and device_mouse_x_to_gui(0) <= startPos+sliderWidth)
		{
			x = device_mouse_x_to_gui(0);
		}
	}
	else if (device_mouse_x_to_gui(0) > x - (sprite_width/2) and device_mouse_x_to_gui(0) < x + (sprite_width/2))
	{
		if (device_mouse_y_to_gui(0) > y - (sprite_height/2) and device_mouse_y_to_gui(0) < y + (sprite_height/2))
		{
			holding = true;
			
			if (device_mouse_x_to_gui(0) >= startPos and device_mouse_x_to_gui(0) <= startPos+sliderWidth)
			{
				x = device_mouse_x_to_gui(0);
			}
		}
	}
}
else
{
	holding = false;
}

sliderValue = (x - startPos) / 100;
