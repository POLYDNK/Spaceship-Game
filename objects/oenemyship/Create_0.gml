/// @description Setup

// Inheritance
event_inherited()

targetAngle = 0; // Target Angle
myState = AI.IDLE; // State

// Equip Weapon
if (weapon != noone)
{
	with (instance_create_layer(x, y, "Modules", weapon))
	{
		wielder = other.id;
		xOffset = other.weaponOffsetX;
		yOffset = other.weaponOffsetY;
	}
}

// Current Target
currentTarget = noone;