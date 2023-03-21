/// @desc Check destruction, shield recharging

if (hp <= 0) && (destructable == true)
{
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