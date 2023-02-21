/// @desc Create Particles

// Define Particles
tinyRocksCount = 5;

tinyRocks[4] = part_type_create();
tinyRocks[3] = part_type_create();
tinyRocks[2] = part_type_create();
tinyRocks[1] = part_type_create();
tinyRocks[0] = part_type_create();

part_type_sprite(tinyRocks[0], spr_smp_asteroid_tiny_1, true, true, false);
part_type_sprite(tinyRocks[1], spr_smp_asteroid_tiny_2, true, true, false);
part_type_sprite(tinyRocks[2], spr_smp_asteroid_tiny_3, true, true, false);
part_type_sprite(tinyRocks[3], spr_smp_asteroid_tiny_4, true, true, false);
part_type_sprite(tinyRocks[4], spr_smp_asteroid_tiny_5, true, true, false);

// Create Particles
for (var i = 0; i < tinyRocksCount; i++)
{
	part_type_life(tinyRocks[i], 22, maxLife);
	part_type_scale(tinyRocks[i], scale * 1.2, scale * 1.6);
	part_type_blend(tinyRocks[i], false);
	part_type_alpha1(tinyRocks[i], 0.5);
	part_type_speed(tinyRocks[i], minSpeed, maxSpeed, 0, 0);
	var pDirection = random_range(minDirection, maxDirection);
	part_type_direction(tinyRocks[i], pDirection, pDirection, 0, 0);
	part_type_orientation(tinyRocks[i], pDirection, pDirection, 0, 0, 0);
	part_particles_create(global.particleSystem, x, y, tinyRocks[i], 1);
}

// Emitter Duration
alarm_set(0, maxLife);
