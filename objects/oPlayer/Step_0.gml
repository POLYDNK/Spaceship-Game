/// @desc Movement, Rotation, Firing, Item Collection

var new_max_speed = maxSpeed+(global.playerInventory.get_engine_power()/mass);

#region Get input from player
if (hascontrol) && (alive)
{
	// Movement
	key_moveLeft   = keyboard_check(ord("A"));
	key_moveRight  = keyboard_check(ord("D"));
	key_moveUp     = keyboard_check(ord("W"));
	key_moveDown   = keyboard_check(ord("S"));
	
	// Rotation and Firing
	key_shootLeft  = keyboard_check(vk_left);
	key_shootRight = keyboard_check(vk_right);
	key_shootUp    = keyboard_check(vk_up);
	key_shootDown  = keyboard_check(vk_down);
	
	// Actives
	key_space      = keyboard_check(vk_space);
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

#region Actives

if (key_space)
{
	// Just activate everything with space for now
	global.playerInventory.module_activate_all_type(TYPE.ACTIVE);
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
if (currentSpeed > new_max_speed)
{
	ratio = new_max_speed / currentSpeed;
	
	hsp *= ratio;
	vsp *= ratio;
}

#endregion

#region Firing

if (key_shootLeft || key_shootRight || key_shootUp || key_shootDown)
{
	shooting = true;
	
	hDir = key_shootRight - key_shootLeft;
	vDir = key_shootDown - key_shootUp;

	targetAngle = point_direction(x,y,x+hDir,y+vDir);
	
	if (image_angle != targetAngle)
	{
		RotateTowardsDirection(targetAngle, traverseSpeed);
		turning = true;
	}
	else
	{
		turning = false;
	}
	
	// Use this to fire all weapons
	global.playerInventory.module_activate_all_type(TYPE.WEAPON);
	
	followMovement = false;
	alarm_set(0, 45);
}
else
{
	shooting = false;
	
	if (followMovement and controlling)
	{	
		targetAngle = point_direction(0,0,hMove,vMove);
		
		if (image_angle != targetAngle)
		{
			RotateTowardsDirection(targetAngle, traverseSpeed);
			turning = true;
		}
		else
		{
			turning = false;
		}
	}
}

#endregion

#region Item Collection

// Get objects in radius
var _list = ds_list_create();
var _num = collision_circle_list(x, y, magnet_radius, oPickup, false, true, _list, false);

// Pull items towards ship
if (_num > 0)
{
	for (var i = 0; i < _num; i++)
	{
		// Get collision object from list
		co = _list[| i];
	
		// Do checks before pulling object
		if (co.sleeping == false and global.playerInventory.find_blank_slot() != -1)
		{
			// Move collision object towards player
			var ang = point_direction(co.x, co.ystart, x, y);
			co.x += lengthdir_x(magnet_speed, ang);
			co.ystart += lengthdir_y(magnet_speed, ang);
		}
	}
}

// Clear DS Map
ds_list_destroy(_list);

#endregion

#region Audio

audio_listener_set_position(0, x, y, 0);
audio_listener_set_velocity(0, hsp, vsp, 0);
audio_emitter_position(myAudioEmitter, x, y, 0);
audio_emitter_velocity(myAudioEmitter,hsp,vsp,0);

if (controlling or shooting)
{
	if (!audio_is_playing(enginePlayer))
	{
		enginePlayer = audio_play_sound_on(myAudioEmitter, engineSoundLoop, false, 1);
	}
}
else
{
	audio_stop_sound(enginePlayer);
}

#endregion

#region Booster Control

if (hascontrol) && (alive)
{
	var left = false;
	var right = false;
	var forward = false;
	//var backward = false;
	var dd = angle_difference(image_angle, targetAngle);
	
	if (controlling)
	{
		if (turning)
		{		
			if (dd < 0)
			{					 
				left = true;
			}
			else if (dd > 0)
			{					 
				right = true;
			}
			else
			{
				forward = true;	
			}
		}
		else
		{
			forward = true;	
		}
	}

	for (var i = 0; i < array_length(booster); i++)
	{
		switch (booster[i].facing)
		{
			case DIRECTION.LEFT:
				if (left)
				{
					booster[i].active = true;
				}
				else
				{
					booster[i].active = false;
				}
				break;
				
			case DIRECTION.RIGHT:
				if (right)
				{
					booster[i].active = true;
				}
				else
				{
					booster[i].active = false;
				}
				break;
				
			case DIRECTION.FORWARD:
				if (forward)
				{
					booster[i].active = true;
				}
				else
				{
					booster[i].active = false;
				}
				break;
				
			case DIRECTION.BACKWARD:
				break;
				
			case DIRECTION.LEFTFORWARD:
				if (forward or left)
				{
					booster[i].active = true;
				}
				else
				{
					booster[i].active = false;
				}
				break;
				
			case DIRECTION.RIGHTFORWARD:
			if (forward or right)
			{
				booster[i].active = true;
			}
			else
			{
				booster[i].active = false;
			}
			break;
				
			default:
				show_debug_message("oPlayer Draw: cannot get direction for booster");
				break;
		}
	}

	
}

#endregion