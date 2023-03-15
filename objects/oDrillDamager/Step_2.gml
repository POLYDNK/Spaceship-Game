/// @desc Stay with Weapon

// Decrease duration
duration--;

if (duration <= 0 || instance_exists(shooter.wielder) == false)
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
							  
	x = shooter.x + lengthdir_x(dist, ang) + shooter.wielder.hsp;
	y = shooter.y + lengthdir_y(dist, ang) + shooter.wielder.vsp;
}