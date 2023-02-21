/// @desc weapon_spawn(weapon) Spawns a weapon into the room
/// @arg weapon - weapon to spawn (defined by a weapon_slot)

function weapon_spawn(weapon)
{
	if (weapon._type != noone)
	{
		weapon._object = instance_create_depth(x,y,layer_get_depth("Weapons"), weapon._type);
		weapon._object.xOffset = weapon.x_offset;
		weapon._object.yOffset = weapon.y_offset;
		weapon._object.wielder = self;
	}
}