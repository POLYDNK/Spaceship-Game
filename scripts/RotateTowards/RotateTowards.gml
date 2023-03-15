///@desc RotateTowards(object, amount) Rotates the object's sprite towards another object
///@arg object - object to rotate towards
///@arg amount - Degrees in which to rotate towards target object

function RotateTowardsObject(argument0, argument1){
	
	// Check if target object exists
	if (instance_exists(argument0))
	{
		// Get the angle to target object
		var ang = point_direction(x,y,argument0.x,argument0.y);
	
		// Get the angle difference between the object's image angle and target object
		var dd = angle_difference(image_angle, ang);
	
		// If the angle difference is greater than the amount, then apply the amount.
		// In addition, rotate clockwise if the angle difference is positive and 
		// counter-clockwise if the angle difference is negative
		image_angle -= min(abs(dd), argument1) * sign(dd);
	}
}


///@desc RotateTowards(direction, amount) Rotates the object's sprite towards target direction
///@arg direction - Direction to rotate towards
///@arg amount    - Degrees in which to rotate towards target object

function RotateTowardsDirection(argument0, argument1){
	
	// Get the angle difference between the object's image angle and target object
	var dd = angle_difference(image_angle, argument0);

	// If the angle difference is greater than the amount, then apply the amount.
	// In addition, rotate clockwise if the angle difference is positive and 
	// counter-clockwise if the angle difference is negative
	image_angle -= min(abs(dd), argument1) * sign(dd);
}

