/// @desc Stay with Weapon

// Decrease duration
duration--;

if (duration <= 0)
{
	instance_destroy();
}	

// Adjust Sprite
image_xscale = laserDistance / 10;
image_yscale = laserWidth / 10;
image_angle = shooter.image_angle;

// Stay with Shooter	 
var ang = point_direction(0, 0, shooter.muzzleOffset, 0) + image_angle;
var dist = point_distance(0, 0, shooter.muzzleOffset, 0);
							  
x = shooter.x + lengthdir_x(dist, ang) + shooter.wielder.hsp;
y = shooter.y + lengthdir_y(dist, ang) + shooter.wielder.vsp;

// Spawn Particles
with (instance_create_depth(x,y,depth,pSparkBurst))
{
	amount = 12;
	minDirection = other.image_angle-60;
	maxDirection = other.image_angle+60;
	maxSpeed = 15;
}

with (instance_create_depth(x+lengthdir_x(laserDistance, image_angle),
							y+lengthdir_y(laserDistance, image_angle),
							depth,pSparkBurst))
{
	amount = 12;
	minDirection = other.image_angle-90;
	maxDirection = other.image_angle+90;
	maxSpeed = 20;
}

