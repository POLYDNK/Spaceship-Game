/// @desc Get Key Inputs

#region Get input

keyLeft  = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp    = keyboard_check(ord("W"));
keyDown  = keyboard_check(ord("S"));

#endregion

// Assign Values
xValue = keyRight - keyLeft;
yValue = keyUp - keyDown;