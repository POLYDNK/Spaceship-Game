///@desc RotateTowards(direction, amount) Rotates the object's sprite towards a direction
///@arg direction - Direction to rotate towards
///@arg amount    - Degrees in which to rotate towards target direction

function RotateTowards(argument0, argument1){
	// Get the angle difference between the object's image angle and target direction
	var dd = angle_difference(image_angle, argument0);
	
	// If the angle difference is greater than the amount, then apply the amount.
	// In addition, rotate clockwise if the angle difference is positive and 
	// counter-clockwise if the angle difference is negative
	image_angle -= min(abs(dd), argument1) * sign(dd);
}