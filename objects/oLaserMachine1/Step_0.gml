/// @desc Positioning and Firing Projectiles

if (instance_exists(wielder))
{
	// Stay with Wielder
	image_angle = wielder.image_angle;
	x = wielder.x;
	y = wielder.y;
	
	// Adjust x scale
	image_xscale = gunScale;
	
	firingdelay--;                // Decrement Firing Delay

	if ((mouse_check_button(mb_left) || firing == true)) && (firingdelay < 0) && (canShoot)
	{
		#region Do This when Gun Fires
		
		// Animation
		image_index = 0;
		image_speed = 1;
			
		// Calculate dispersion
		bulletDirection = image_angle + random_range(-dispersion,dispersion);
			
		firingdelay = firerate;       // Set # of Frames Gun Cannot be Fired

		// Play Sound
		audio_play_sound(gunSound, 1, false);
		
		// Create Bullet
		with (instance_create_layer(x+lengthdir_x(muzzleOffset,image_angle),
			                        y+lengthdir_y(muzzleOffset,image_angle),
									"Instances", bulletType))
		{
			damage      = other.projectileDamage;
			direction   = other.bulletDirection;
			image_angle = direction;			
			hsp         = lengthdir_x(other.projectileSpeed, direction) + (other.wielder.hsp * 0.5);
			vsp         = lengthdir_y(other.projectileSpeed, direction) + (other.wielder.vsp * 0.5);
		}

		#endregion
	}
}
else
{
	instance_destroy(); // Destroy Self if Wielder no longer exists
}

isSetup = true; // weapon has setup
