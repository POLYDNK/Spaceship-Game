/// @desc Warp player if touching

warpTimer--;

if (collision_circle(x, y, 400, oPlayer, false ,true))
{
	myWarpEffect.active = true;
	
	// Audio
	if (!audio_is_playing(warpSoundPlayer))
	{
		warpSoundPlayer = audio_play_sound_on(myAudioEmitter, warp_sound, false, 1);
	}
	
	// Reset warp time if the player wasn't colliding beforehand
	if (colliding == false)
	{
		warpTimer = warp_time;
	}
	// Warp when timer reaches 0
	else if (warpTimer <= 0)
	{
		// Get target solar system
		var target_solar_system = global.galaxy[destination];
		
		// Reverse Player Pos
		oPlayer.x = -oPlayer.x;
		oPlayer.y = -oPlayer.y;
		
		// Go to target solar system
		global.current_solar_system = destination;
		room_goto(target_solar_system.my_room);
	}
	
	colliding = true;
}
else
{
	// Audio
	audio_stop_sound(warpSoundPlayer);
	
	// Logic
	myWarpEffect.active = false;
	colliding = false;
}

