/// @desc Movement, Rotation, Firing, Item Collection

#region Get input from player
// Initialize all key variables to 0
key_moveLeft   = 0;
key_moveRight  = 0;
key_moveUp     = 0;
key_moveDown   = 0;
key_shootLeft  = 0;
key_shootRight = 0;
key_shootUp    = 0;
key_shootDown  = 0;
key_mouseLeft  = 0;

// If the player has control and is alive, update the key variables
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
	
	// Mouse
	key_mouseLeft = mouse_check_button(mb_left);
}

// Calculate horizontal and vertical movement input.
var hMove = key_moveRight - key_moveLeft;
var vMove = key_moveDown - key_moveUp;

// Determine if the player is controlling the spaceship.
controlling = hMove != 0 || vMove != 0;
#endregion

#region Actives
if (key_space)
{
    global.playerInventory.module_activate_all_type(TYPE.ACTIVE);
}
#endregion

#region Firing and rotation
// Determine if the player is shooting.
shooting = key_shootLeft || key_shootRight || key_shootUp || key_shootDown || key_mouseLeft;

// If the player is shooting, update the spaceship's direction and activate all weapons
if (shooting)
{
    hDir = key_shootRight - key_shootLeft;
    vDir = key_shootDown - key_shootUp;
	
	if (key_mouseLeft)
    {
        // Get the mouse position in the room
        var mouseX = window_view_mouse_get_x(0);
        var mouseY = window_view_mouse_get_y(0);
        
        // Calculate the target angle based on the mouse position
        targetAngle = point_direction(x, y, mouseX, mouseY);
    }
	else
	{
		// Rotate the spaceship towards the target angle
        targetAngle = point_direction(x, y, x + hDir, y + vDir);
	}
	
    // Rotate the spaceship towards the target angle.
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
// If the player is not shooting but is controlling the spaceship, rotate it towards the movement direction
else
{
    shooting = false;
    
    if (followMovement && controlling)
    {    
        targetAngle = point_direction(0, 0, hMove, vMove);
        
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

#region Movement
// Calculate Forces
hForce = hMove * acceleration;
vForce = vMove * acceleration;

// Apply Forces
hsp += hForce;
vsp += vForce;


// Apply Drag
if (hForce == 0)
{
    hsp *= dragPercent;
}

if (vForce == 0)
{
    vsp *= dragPercent;
}

// Get max speed
var new_max_speed = maxSpeed + (global.playerInventory.get_engine_power() / mass);
var angDiff = abs(angle_difference(image_angle, point_direction(x, y, x + hsp, y + vsp)));

// Apply the horizontal penalty for sideways movement
new_max_speed *= 1 - ((angDiff / 180) * horizontalPenalty);

// Calculate Current Speed
currentSpeed = point_distance(x, y, x + hsp, y + vsp);

// Bound Current Speed to Max Speed
if (currentSpeed > new_max_speed)
{
    ratio = new_max_speed / currentSpeed;
    
    hsp *= ratio;
    vsp *= ratio;
}
#endregion

#region Item Collection with a magnetic effect
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
        if (!co.sleeping && global.playerInventory.find_blank_slot() != -1)
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
audio_emitter_velocity(myAudioEmitter, hsp, vsp, 0);

if (controlling || shooting)
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
                booster[i].active = left;
                break;
                
            case DIRECTION.RIGHT:
                booster[i].active = right;
                break;
                
            case DIRECTION.FORWARD:
                booster[i].active = forward;
                break;
                
            case DIRECTION.BACKWARD:
                break;
                
            case DIRECTION.LEFTFORWARD:
                booster[i].active = forward || left;
                break;
                
            case DIRECTION.RIGHTFORWARD:
                booster[i].active = forward || right;
                break;
                
            default:
                show_debug_message("oPlayer Draw: cannot get direction for booster");
                break;
        }
    }
}

#endregion