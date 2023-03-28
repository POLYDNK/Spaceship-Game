/// @desc Stay with Weapon

if (instance_exists(shooter) == false)
{
	instance_destroy();
}	
else
{
	// Adjust Sprite
	image_xscale = laserDistance / 10;
	image_yscale = laserWidth / 10;
	image_angle = shooter.image_angle;

	// Stay with Shooter	 
	var ang = point_direction(0, 0, shooter.muzzleOffset, 0) + image_angle;
	var dist = point_distance(0, 0, shooter.muzzleOffset, 0);
							  
	x = shooter.x + lengthdir_x(dist, ang);
	y = shooter.y + lengthdir_y(dist, ang);
}
