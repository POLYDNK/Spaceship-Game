/// @desc Check destruction, shield recharging

if (hp <= 0) && (destructable == true)
{
	// Spawn destruction object
	with (instance_create_depth(x, y, depth, oShipDestroyed))
	{
		sprite_index = other.sprite_index;
		direction = other.direction;
		image_angle = other.image_angle;
		shipColor = other.shipColor;
		hsp = other.hsp;
		vsp = other.vsp;
		if (other.team == TEAM.FRIENDLY)
		{
			isPlayer = true;
		}
	}
	
	// Destroy self
	instance_destroy();
}

// Shield Recharging
shieldRechargeTimer--;

if (shieldRechargeTimer <= 0 && shieldHP < shieldHPMax)
{
	shieldHP += shieldRechargeRate;
	
	if (shieldHP > shieldHPMax)
	{
		shieldHP = shieldHPMax;	
	}
}