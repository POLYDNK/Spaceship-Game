/// @desc Define Particle

// Define Particle
myParticle = part_type_create();
part_type_life(myParticle, 22, maxLife);
part_type_scale(myParticle, 1, 1);
part_type_blend(myParticle, false);

// Wait 1 frame to create particles so direction can be set with a "with" statement
alarm_set(1, 1);
