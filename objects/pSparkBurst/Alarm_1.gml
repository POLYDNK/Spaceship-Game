/// @desc Create Particles

// Update Sprite
part_type_sprite(myParticle, sprite, true, true, false);
part_type_speed(myParticle, minSpeed, maxSpeed, -0.3, 0);

// For every new particle: get a new random direction within range
for (var i = 0; i < amount; i++)
{
	var pDirection = random_range(minDirection, maxDirection);
	
	part_type_direction(myParticle, pDirection, pDirection, 0, 0);
	part_type_orientation(myParticle, pDirection, pDirection, 0, 0, 0);
	
	part_particles_create(global.particleSystem, x, y, myParticle, 1);
}


// Emitter Duration
alarm_set(0, maxLife);
