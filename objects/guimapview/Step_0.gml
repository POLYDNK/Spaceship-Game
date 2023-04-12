/// @desc Drag map around using the mouse

// Check if the left mouse button is pressed
if (mouse_check_button(mb_left) and interactable)
{
    // Check if this is the first frame the mouse button is pressed
    if (mouse_check_button_pressed(mb_left))
    {
        // Store the current mouse position as the previous mouse position
        prev_mouse_x = mouse_x;
        prev_mouse_y = mouse_y;
    }
    else
    {
        // Calculate the difference between the current mouse position and the previous mouse position
        var deltaX = mouse_x - prev_mouse_x;
        var deltaY = mouse_y - prev_mouse_y;
        
        // Update the mapX and mapY variables
        mapX -= deltaX;
        mapY -= deltaY;
        
        // Store the current mouse position as the previous mouse position
        prev_mouse_x = mouse_x;
        prev_mouse_y = mouse_y;
    }
}
