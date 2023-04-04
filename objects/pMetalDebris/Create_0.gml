/// @desc Create Particles

/// ------ Define Particles ------

tinyDebris = part_type_create();
part_type_sprite(tinyDebris, sMetalDebris, false, false, true);
part_type_alpha3(tinyDebris, 1, 0.59, 0);
part_type_life(tinyDebris, 80, maxLife);
part_type_scale(tinyDebris, 0.5, 0.5);
part_type_blend(tinyDebris, false);
part_type_speed(tinyDebris, minSpeed, maxSpeed, 0, 0);

/// ------ Create Particles ------

// For every new particle: get a new random direction within range
for (var i = 0; i < amount; i++)
{
	var pDirection = random_range(minDirection, maxDirection);
	var pRotation = random_range(-5, 5);
	
	part_type_direction(tinyDebris, pDirection, pDirection, 0, 0);
	part_type_orientation(tinyDebris, pDirection, pDirection, pRotation, 1, false);
	
	part_particles_create(global.particleSystem, x, y, tinyDebris, 1);
}

// Emitter Duration
alarm_set(0, maxLife);
