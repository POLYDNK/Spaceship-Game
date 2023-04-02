/// @desc Positioning and Firing Projectiles

if (instance_exists(wielder))
{
	if (!chargeInit && chargeBuildUpEffect != noone)
	{
		instance_create_layer(x,y,"Instances",chargeBuildUpEffect);
		chargeBuildUpEffect.shooter = self;
		chargeInit = true;
	}
	
	// Stay with Wielder
	image_angle = wielder.image_angle;
							 
	var ang = point_direction(0, 0, xOffset, yOffset) + image_angle;
	var dist = point_distance(0, 0, xOffset, yOffset);
							  
	x = wielder.x + lengthdir_x(dist, ang);
	y = wielder.y + lengthdir_y(dist, ang);
	
	// Update x scale
	image_xscale = gunScale;
	
	// Update audio emitter position
	audio_emitter_position(myAudioEmitter, x, y, 0);
	
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
	
	if (chargeBuildUp && !firing)
	{
		// Reset charge
		firingdelay = firerate;
	}
	else if (!global.pause)
	{
		firingdelay--;  // Decrement Firing Delay
	}
	
	charging = (firingdelay > 0);
	
	#endregion
	
	// Reload sound
	if (firingdelay == 0) && (reloadSound != noone)
	{
		audio_play_sound_on(myAudioEmitter, reloadSound, false, 1);
	}

	#region Firing
	if (firing == true) && (firingdelay <= 0) && (canShoot)
	{	
		// Animation
		if (recoilAnimation)
		{
			image_index = recoilStartFrame;
			image_speed = 1;
		}
			
		// Set # of Frames Gun Cannot be Fired
		firingdelay = firerate;

		// Play Sound
		audio_play_sound_on(myAudioEmitter, gunSound, false, 1);
		
		// Calculate Muzzle Offset
		var muzzleOffsetX = muzzleOffset * dcos(image_angle); 
		var muzzleOffsetY = muzzleOffset * dsin(image_angle); 
		
		// Calculate dispersion
		repeat (projectileCount)
		{
			bulletDirection = image_angle + random_range(-dispersion,dispersion);
		
			// Create Bullet
			with (instance_create_layer(x+muzzleOffsetX,
				                        y-muzzleOffsetY,
										"Instances", bulletType))
			{
				shooterTeam = other.wielder.team;
				shooter     = other;
				damage      = other.projectileDamage;
				color		= other.projectileColor;
				direction   = other.bulletDirection;
				image_angle = direction;			
				hsp         = lengthdir_x(other.projectileSpeed, direction) + (other.wielder.hsp * 0.8);
				vsp         = lengthdir_y(other.projectileSpeed, direction) + (other.wielder.vsp * 0.8);
			}
		}
	}
	#endregion
}
else
{
	instance_destroy(); // Destroy Self if Wielder no longer exists
}

isSetup = true; // weapon has setup
firing = false; // Reset firing for next step
