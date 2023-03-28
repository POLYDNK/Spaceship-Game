/// @desc Detect Collisions

// Update Trail Pos
myTrail.x = x;
myTrail.y = y;

// Decrease Lifespan
lifespan--;

if (lifespan <= 0)
{
	instance_destroy();
}	

// Move Bullet
waveCounter += waveFrequency;
x += hsp + (waveAmplitude * dcos(waveCounter));
y += vsp - (waveAmplitude * dsin(waveCounter));
