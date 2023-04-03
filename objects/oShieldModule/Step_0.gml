/// @desc Activation

currentCooldown--;

// Activate if cooldown allows
if (keyboard_check(vk_space) and currentCooldown <= 0)
{
	with (instance_create_layer(wielder.x,wielder.y,"HeatHaze", bubbleToCreate))
	{
		sprite_index = other.wielder.sprite_index;
		wielder = other.wielder;
		team = other.wielder.team;
		hp = other.shieldStrength;
		duration = other.shieldDuration;
	}
	currentCooldown = cooldown;
	//activate = false;
}