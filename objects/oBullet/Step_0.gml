/// @desc Detect Collisions

// Update Trail Pos
myTrail.x = x;
myTrail.y = y;

// Decrease Lifespan
lifespan--;

if (lifespan <= 0)
{
	instance_destroy();
}	

// Move Bullet
x += hsp;
y += vsp;

// Randomize Sound of Hit
hit_pitch = random_range(1.5, 2)

validTargetFound = false;

// Detect Collisions
if (place_meeting(x,y,pShootable))
{
	// Do this to the colliding object
	with (instance_place(x,y,pShootable))
	{
		if (destructable) and (team != other.shooterTeam)
		{
			hp -= other.damage;
			flash = 3;
			hitfrom = other.direction;
			other.validTargetFound = true;
		}
	}
	
	// Do this if target is valid
	if (validTargetFound == true)
	{
		var snBulletImact = choose(snHitSolid1, snHitSolid2, snHitSolid3);
	
		// Sound
		audio_sound_pitch(snBulletImact, hit_pitch);
		//audio_play_sound(snBulletImact, 0, 0);
		audio_play_sound_at(snBulletImact, x, y, 0, 500, 3000, 1, false, 0);
	
		// Effects
		with (instance_create_layer(x, y, layer, pSparkBurst))
		{
			minDirection = other.direction - 25;
			maxDirection = other.direction + 25;
			sprite = other.particleSprite;
		}
		ApplyScreenshake(0.8, 1, 30);
		instance_create_layer(x, y, layer, pTinyDebris);
	
		with (instance_create_layer(x, y, "Text", oDisplayDamage))
		{
			damageToDisplay = other.damage;
		
			#region Set Damage Text Display and Color
			if (damageToDisplay > 1000)
			{
				damageColor = c_maroon;
				damageFont = fDamage18;
			}
			else if (damageToDisplay > 100)
			{
				damageColor = c_red;
				damageFont = fDamage16;
			}
			else if (damageToDisplay > 10)
			{
				damageColor = c_orange;
				damageFont = fDamage14;
			}
			else if (damageToDisplay > 1)
			{
				damageColor = c_yellow;
				damageFont = fDamage12;
			}
			#endregion
		}
	
		instance_destroy();
	}
}
