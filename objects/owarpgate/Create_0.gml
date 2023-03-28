/// @desc Initialize Destination

destination = ds_map_find_value(global.gate_map, id);

// Shuffle Away from other warp gates
cObj = collision_circle(x, y, 1000, oWarpGate, false ,true);
for (var i = 0; i < 100 && cObj != noone; i++)
{
	// Move away from other warp gate
	var ang = point_direction(x, y, cObj.x, cObj.y);
	x += lengthdir_x(400, -ang);
	y += lengthdir_y(400, -ang);
	
	// Test collision again to see if we have to move again
	cObj = collision_circle(x, y, 1000, oWarpGate, false ,true);
}

// Logic
colliding = false;
warpTimer = 0;

// Audio
myAudioEmitter = audio_emitter_create();
audio_emitter_gain(myAudioEmitter, 0.5);
audio_emitter_falloff(myAudioEmitter, 500, 3000, 1);
audio_emitter_position(myAudioEmitter, x, y, 0);
audio_emitter_velocity(myAudioEmitter, 0, 0, 0);
warpSoundPlayer = audio_play_sound_on(myAudioEmitter, warp_sound, false, 1);
audio_stop_sound(warpSoundPlayer);

// Warp Rings
myWarpEffect = instance_create_depth(x,y,depth,pWarpRings);