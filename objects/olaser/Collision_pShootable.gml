/// @desc Detect Collisions

validTargetFound = false;

// Do this to the colliding object
with (other)
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
	
	hit_pitch = random_range(1.5, 2)
	audio_sound_pitch(snBulletImact, hit_pitch);
	audio_play_sound_at(snBulletImact, x, y, 0, 500, 3000, 1, false, 0);
	
	with (instance_create_layer(other.x, other.y, layer, pSparkBurst))
	{
		sprite = other.particleSprite;
	}
	
	ApplyScreenshake(0.8, 1, 30);
	instance_create_layer(other.x, other.y, layer, pTinyDebris);
	
	with (instance_create_layer(other.x, other.y, "Text", oDisplayDamage))
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
}
