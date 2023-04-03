/// @desc Detect collisions with shootable objects

validTargetFound = false;

// Do this to the colliding object
with (other)
{
	if (destructable) and (team != other.shooterTeam)
	{
		// Set shield recharge delay
		shieldRechargeTimer = shieldRechargeTime;
			
		// Deal shield damage first
		shieldHP -= other.damage;
		
		// Carry over remainder to hp reduction
		if (shieldHP < 0)
		{
			hp += shieldHP;
			shieldHP = 0
		}

		flash = 3;
		hitfrom = other.direction;
		other.validTargetFound = true;
	}
}
	
// Do this if target is valid
if (validTargetFound == true)
{
	// Audio
	var snBulletImact = choose(snHitSolid1, snHitSolid2, snHitSolid3);
	hit_pitch = random_range(1.5, 2)
	audio_sound_pitch(snBulletImact, hit_pitch);
	audio_play_sound_at(snBulletImact, x, y, 0, 500, 3000, 1, false, 0);
	
	// Particles
	with (instance_create_layer(x, y, layer, particleHitEffect))
	{
		minDirection = other.direction - 25;
		maxDirection = other.direction + 25;
		sprite = other.particleHitSprite;
	}
	instance_create_layer(other.x, other.y, layer, pTinyDebris);
	
	// Screen shake
	ApplyScreenshake(0.8, 1, 30);
	
	// Damage Numbers
	DrawDamage(damage, x, y);
	
	// Piercing
	if (!piercing)
	{
		instance_destroy();
	}
}
