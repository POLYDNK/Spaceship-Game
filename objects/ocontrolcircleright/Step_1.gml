/// @desc Get Key Inputs

#region Get input

keyLeft  = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyUp    = keyboard_check(vk_up);
keyDown  = keyboard_check(vk_down);

#endregion

// Assign Values
xValue = keyRight - keyLeft;
yValue = keyUp - keyDown;