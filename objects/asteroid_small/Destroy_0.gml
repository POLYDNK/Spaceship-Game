/// @desc Play sound and Spawn Particles

var snDestroyed = choose(sfx_boulder_impact_small_1, sfx_boulder_impact_small_2, sfx_boulder_impact_small_3);
var hitPitch = random_range(0.8, 1.2);
	
audio_sound_pitch(snDestroyed, hitPitch);
//audio_play_sound(snDestroyed, 0, 0);
audio_play_sound_at(snDestroyed, x, y, 0, 500, 3000, 1, false, 0);

// Create particle effect
instance_create_layer(x, y, "Instances", pRockBurst);

// Loot
var spawnCount = irandom_range(1, 3);

repeat(spawnCount)
{
	instance_create_depth(x, y, depth, oIron);
}
