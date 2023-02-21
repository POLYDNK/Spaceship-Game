/// @desc Movement, Rotation, and Firing

#region Get input from player
if (hascontrol) && (alive)
{
	// Movement
	key_moveLeft   = keyboard_check(ord("A"))
	key_moveRight  = keyboard_check(ord("D"));
	key_moveUp     = keyboard_check(ord("W"));
	key_moveDown   = keyboard_check(ord("S"));
	
	// Rotation and Firing
	key_shootLeft  = keyboard_check(vk_left);
	key_shootRight = keyboard_check(vk_right);
	key_shootUp    = keyboard_check(vk_up);
	key_shootDown  = keyboard_check(vk_down);
}
else	
{
	// 0 out nonpressed keys
	key_moveRight  = 0;
	key_moveLeft   = 0;
	key_moveUp     = 0;
	key_moveDown   = 0;
	key_shootLeft  = 0;
	key_shootRight = 0;
	key_shootUp    = 0;
	key_shootDown  = 0;
}
#endregion

#region Movement
// Calculate Forces
var hMove = key_moveRight - key_moveLeft;
var vMove = key_moveDown - key_moveUp;

controlling = false;

if (hMove != 0 or vMove != 0)
{
	controlling = true;
}

hForce = hMove * acceleration;
vForce = vMove * acceleration;

// Apply Forces
hsp += hForce;
vsp += vForce;

// Drag
if (hForce == 0)
{
	hsp *= dragPercent;
}

if (vForce == 0)
{
	vsp *= dragPercent;
}

// Calculate Current Speed
currentSpeed = point_distance(x, y, x+hsp, y+vsp);

// Bound Current Speed to Max Speed
if (currentSpeed > maxSpeed)
{
	ratio = maxSpeed / currentSpeed;
	
	hsp *= ratio;
	vsp *= ratio;
}

// Go to Position Based on Calculations
x += hsp;
y += vsp;
#endregion

if (key_shootLeft || key_shootRight || key_shootUp || key_shootDown)
{
	hDir = key_shootRight - key_shootLeft;
	vDir = key_shootDown - key_shootUp;

	targetAngle = point_direction(x,y,x+hDir,y+vDir);
	RotateTowards(targetAngle, traverseSpeed);
	
	myGun.firing = true;
	
	followMovement = false;
	alarm_set(0, 45);
}
else
{
	if (followMovement and controlling)
	{	
		targetAngle = point_direction(0,0,hMove,vMove);
		RotateTowards(targetAngle, traverseSpeed/2);
	}
	
	myGun.firing = false;
}
