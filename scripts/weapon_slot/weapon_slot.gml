// Weapon slot constructor

function weapon_slot(weapon_type = noone, xOffset = 0, yOffset = 0, weapon_object = noone) constructor
{
	_type = weapon_type;           // type of weapon equipped
	x_offset = xOffset;            // x offset on ship
	y_offset = yOffset;            // y offset on ship
	_object = weapon_object;       // instance id of the weapon object
};

