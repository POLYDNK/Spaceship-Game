/// @desc Positioning

// Stay With Wielder
if (instance_exists(wielder))
{					 	  
	x = wielder.x;
	y = wielder.y;
	image_angle = wielder.image_angle;
}
else
{
	instance_destroy(); // Destroy Self if Wielder no longer exists
}