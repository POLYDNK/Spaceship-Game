/// @desc Create Bullet Hitspark and Play Zap Sound

// Create Particles
with(other)
{	
	with(instance_create_layer(x, y, layer, pSparkBurst))
	{
		minDirection = direction - 25;
		maxDirection = direction + 25;
		sprite = sSparkBlue;
	}
	
	instance_destroy();
}

// Play Zap Sound
audio_sound_pitch(snZap, random_range(0.9, 1.1));
audio_play_sound(snZap, 3, false);