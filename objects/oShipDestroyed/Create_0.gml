/// @desc Explosion

// Movement
vsp = 0; // Vertical Speed
hsp = 0; // Horizontal Speed

// Audio
myAudioEmitter = audio_emitter_create();
audio_emitter_gain(myAudioEmitter, 0.5);
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_falloff(myAudioEmitter, 1000, 5000, 1);
audio_emitter_position(myAudioEmitter, x, y, 0);

explosionSound = choose(snExplosion1, snExplosion2);
audio_emitter_pitch(myAudioEmitter, random_range(0.8,1.2));
audio_play_sound_on(myAudioEmitter, explosionSound, false, 10, 1, 0.5);

// Explosion Sequence
myExplosionSq = layer_sequence_create("Items", x, y, sqExplosion);

// Set camera follow if it's player
if (isPlayer)
{
	cameraObj = instance_find(oCamera, 0);

	if (cameraObj != noone)
	{
		cameraObj.follow = self;
	}
}