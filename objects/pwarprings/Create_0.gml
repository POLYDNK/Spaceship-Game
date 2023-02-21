/// @desc Define Particle

// Define Particle System
mySystem = part_system_create();
part_system_depth(mySystem, 500);

// Define Particle
myParticle = part_type_create();
part_type_shape(myParticle, pt_shape_ring);
part_type_scale(myParticle, 1, 1);
part_type_size(myParticle, 1, 1, 0, 0);
part_type_speed(myParticle, 0, 0, 0, 0);
part_type_life(myParticle, 10, 10);
part_type_alpha3(myParticle, 0, 0.8, 1);

// Ring Timer
ringTimer = 0;