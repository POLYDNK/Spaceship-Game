/// @desc Make wielder immune, expire when duration runs out

wielder.destructable = false;

duration--;

if (duration <= 0)
{
	instance_destroy();
}