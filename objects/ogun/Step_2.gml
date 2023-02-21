/// @desc Positioning and Firing Projectiles

if (instance_exists(wielder))
{
	// Stay with Wielder
	image_angle = wielder.image_angle;
							 
	var ang = point_direction(0, 0, xOffset, yOffset) + image_angle;
	var dist = point_distance(0, 0, xOffset, yOffset);
							  
	x = wielder.x + lengthdir_x(dist, ang);
	y = wielder.y + lengthdir_y(dist, ang);
	
	// Movement Follow (Some guns tend to drift away from the player ship,
	// and I have no idea why. So, this option addresses the sympton of it.)
	if (movementFollow)
	{
		x += wielder.hsp;
		y += wielder.vsp;
	}
	
	// Adjust x scale
	image_xscale = gunScale;
	
	firingdelay--;  // Decrement Firing Delay
	
	#region Firing Control
	
	if (playerControlled)
	{
		if (mouse_check_button(mb_left))
		{
			firing = true;
		}
	}
	else
	{
		targetCurrent = FindNearestTargetInRange(targetType, wielder.attackRange);
		
		if (instance_exists(targetCurrent))
		{
			firing = true;
		}
	}
	
	#endregion

	if (firing == true) && (firingdelay < 0) && (canShoot)
	{
		#region Do This when Gun Fires  
		
		// Animation
		if (recoilAnimation)
		{
			image_index = recoilStartFrame;
			image_speed = 1;
		}
			
		// Calculate dispersion
		bulletDirection = image_angle + random_range(-dispersion,dispersion);
			
		// Set # of Frames Gun Cannot be Fired
		firingdelay = firerate;

		// Play Sound
		audio_emitter_position(myAudioEmitter, x, y, 0);
		audio_play_sound_on(myAudioEmitter, gunSound, false, 1);
		
		// Calculate Muzzle Offset
		var muzzleOffsetX = muzzleOffset * dcos(image_angle); 
		var muzzleOffsetY = muzzleOffset * dsin(image_angle); 
		
		// Create Bullet
		with (instance_create_layer(x+muzzleOffsetX,
			                        y-muzzleOffsetY,
									"Instances", bulletType))
		{
			shooter     = other;
			damage      = other.projectileDamage;
			direction   = other.bulletDirection;
			image_angle = direction;			
			hsp         = lengthdir_x(other.projectileSpeed, direction) + (other.wielder.hsp * 0.8);
			vsp         = lengthdir_y(other.projectileSpeed, direction) + (other.wielder.vsp * 0.8);
		}

		#endregion
	}
}
else
{
	instance_destroy(); // Destroy Self if Wielder no longer exists
}

isSetup = true; // weapon has setup
firing = false; // Reset firing for next step
