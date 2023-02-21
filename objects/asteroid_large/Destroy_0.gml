/// @desc Play sound and Create Smaller Asteroids

var randPitch = random_range(0.8, 1.2);
	
audio_sound_pitch(sfx_boulder_crash, randPitch);
//audio_play_sound(sfx_boulder_crash, 0, 0);
audio_play_sound_at(sfx_boulder_crash, x, y, 0, 500, 3000, 1, false, 0);


currentSpeed = point_distance(x, y, x+hsp, y+vsp);
currentDirection = point_direction(x, y, x+hsp, y-vsp);

// Create particle effect
with (instance_create_layer(x, y, "Instances", pRockBurst))
{
	amount = 12;
	maxLife = 80;
	scale = 4;
}

// Create smaller asteroids
with (instance_create_depth(x, y, depth, asteroid_medium))
{
	vsp = other.currentSpeed * dsin(other.currentDirection-30) * 2;
	hsp = other.currentSpeed * dcos(other.currentDirection-30) * 2;
}


with (instance_create_depth(x, y + 200, depth, asteroid_small))
{
	vsp = other.currentSpeed * dsin(other.currentDirection+30) * 2;
	hsp = other.currentSpeed * dcos(other.currentDirection+30) * 2;
}

