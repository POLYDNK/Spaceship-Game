/// @desc Positioning

if (instance_exists(wielder))
{
	// Stay with Wielder
	image_angle = wielder.image_angle;
							 
	var ang = point_direction(0, 0, xOffset, yOffset) + image_angle;
	var dist = point_distance(0, 0, xOffset, yOffset);
							  
	x = wielder.x + lengthdir_x(dist, ang);
	y = wielder.y + lengthdir_y(dist, ang);
}
else
{
	instance_destroy(); // Destroy Self if Wielder no longer exists
}