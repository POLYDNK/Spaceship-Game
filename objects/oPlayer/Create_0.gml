/// @desc Initialize Vars

vsp = 0; // Vertical Speed
hsp = 0; // Horizontal Speed

targetAngle = 0;

followMovement = true;

myGun = noone;

with (instance_create_depth(x,y,layer_get_depth("Instances")+1, oLaserMachine1))
{
	wielder = other;
	other.myGun = self;
}