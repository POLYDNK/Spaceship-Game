/// @desc Activation

currentCooldown--;

// Activate if cooldown allows
if (keyboard_check(vk_space) and currentCooldown <= 0)
{
	with (instance_create_depth(x,y,layer_get_depth("Instances")-50, bubbleToCreate))
	{
		wielder = other.wielder;
		team = other.wielder.team;
	}
	currentCooldown = cooldown;
	//activate = false;
}